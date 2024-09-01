`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 09:12:06 PM
// Design Name: 
// Module Name: decoder_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module decoder_top #(
        parameter integer DATA_WIDTH = 32,                  // Data width
        parameter integer SPI_RD_ADDR_WIDTH = 4,            // Read address width of SPI transaction
        parameter integer SPI_WR_ADDR_WIDTH = 4,            // Write address width of SPI transaction
        parameter integer NUM_REGS_PER_BANK = 16,           // Number of registers per bank
        parameter integer CTRL_REG_NUM = 1,                 // Control register index in each bank
        parameter integer STAT_REG_NUM = 0,                 // Status register index in each bank
        parameter integer MAX_ERROR_COUNT = 15,             // Decoder can log upto 15 errors beffore overflowing
        parameter integer ERROR_COUNT_WIDTH = $clog2(MAX_ERROR_COUNT),
        parameter integer REG_BANK_ADDR_WIDTH = $clog2(NUM_REGS_PER_BANK),
        parameter integer LEDS_REG_NUM = 15,
        parameter         COMMS_DEBUG = 0,
        parameter integer SHIFT_IN_COMP = 0,
        parameter integer SHIFT_OUT_COMP = 0
    )
    (
        input   wire                              reset_n,
        input   wire                              clk,
        input   wire                              spi_clk_ext,
        //input   wire                              spi_clk_pll_0,
        //input   wire                              spi_clk_pll_180,
        input   wire                              spi_cs_n,
        input   wire                              spi_mosi,
        
        output  wire                              spi_miso,
        // Feedback signals
        output  wire    [ERROR_COUNT_WIDTH-1:0]   errors_corrected
    );
    
    localparam SAMPLER_SIZE = 2;
    localparam SHIFT_MAX = SPI_RD_ADDR_WIDTH + SPI_WR_ADDR_WIDTH + DATA_WIDTH;
    
    
    (* ASYNC_REG = "TRUE" *) reg [SAMPLER_SIZE-1:0]                  reset_n_metaguard;
        
    // IO buffer wires
    //wire                                spi_clk_buf;
    //wire                                spi_clk_iob;
    wire                                spi_clk_buffered;
    wire                                spi_clk_inv_buffered;
    wire                                spi_cs_n_buffered;
    wire                                spi_miso_buffered;
    wire                                reset_n_buffered;
    
    wire    [DATA_WIDTH-1:0]            ctrl_out;
    wire    [DATA_WIDTH-1:0]            stat_out;
    wire    [DATA_WIDTH-1:0]            dec_data_in;                // Data going into decoder module
    wire    [DATA_WIDTH-1:0]            dec_data_out;               // Data coming out of decoder module
    wire    [REG_BANK_ADDR_WIDTH-1:0]   dec_in_addr;                // Address pointing to the register from where decoder gets its input
    wire    [REG_BANK_ADDR_WIDTH-1:0]   dec_out_addr;               // Address pointing to the register where decoder stores its output
    wire    [REG_BANK_ADDR_WIDTH-1:0]   dec_write_addr;             // Reg bank address decoder is pointing to for write operation
    wire                                dec_write_en;
    wire    [DATA_WIDTH-1:0]            spi_data_in;                // Data going into spi module
    wire    [DATA_WIDTH-1:0]            spi_data_out;               // Data coming out of spi module
    wire    [REG_BANK_ADDR_WIDTH-1:0]   spi_rd_addr_trunc;
    wire    [REG_BANK_ADDR_WIDTH-1:0]   spi_wr_addr_trunc;
    wire    [SPI_RD_ADDR_WIDTH-1:0]     spi_rd_addr;
    wire    [SPI_WR_ADDR_WIDTH-1:0]     spi_wr_addr;
    wire                                spi_read_en;
    wire                                spi_write_en;
    wire                                spi_read_en_stable;
    wire                                spi_write_en_stable;
    wire                                spi_miso_disable;
    wire                                spi_write_en_fb;
    
    // Debug signals
    wire  [$clog2(SHIFT_MAX)-1:0]               in_shift_count_debug;
    //(* mark_debug = "true" *) wire  [DATA_WIDTH-1:0]                      miso_reg_debug;
        
    //assign errors_corrected = stat_out;
    
    // --- Instantiate port buffers ---
    //assign spi_clk_to_pll = spi_clk_buf;
    
    /*
    BUFG spi_clk_bufg_inst (
        .O(spi_clk_to_pll), // 1-bit output: Clock output
        .I(spi_clk_buf)  // 1-bit input: Clock input
    );
    */
    /*
    // Since the data is source-synchronous, we want to have minimum delay between spi_clk
    // data sampling regs on the IOB. So we use the BUFIO/BUFR (depending on the design scenario)
    // to provide this clk to IOB regs.
    BUFIO spi_clk_iobuf_inst (
        .O(spi_clk_iob), // 1-bit output: Clock output (connect to I/O clock loads).
        //.I(spi_clk_buf)  // 1-bit input: Clock input (connect to an IBUF or BUFMR).
        .I(spi_clk_ext)  // 1-bit input: Clock input (connect to an IBUF or BUFMR).
    );
    */
    /*
        Using BUFG to route the spi_clk introduces ZHOLD_DELAY when packing IO regs into IOB.
        This can be avoided in two ways: (1) use an MMCM to regenerate the spi_clk
                                         (2) use BUFR instead of BUFG
        We implement the second method for the following reasons:
            (1) MMCM cannot be expected to get a lock fast enough since the master does not have
                a free running spi_clk (mmcm takes around 100 us to lock)
            (2) SPI is a SDR protocol with data switches happening on negedges, hence hold times
                are ensured (if not, master must ensure hold times for this to work).
    */
    BUFR #(
        .BUFR_DIVIDE("2"),     // Values: "BYPASS, 1, 2, 3, 4, 5, 6, 7, 8"
        .SIM_DEVICE("7SERIES")      // Must be set to "7SERIES"
    )
    spi_clk_bufr_inst (
        .O(spi_clk_buffered),       // 1-bit output: Clock output port
        .CE(~spi_cs_n),                  // 1-bit input: Active high, clock enable (Divided modes only)
        .CLR(spi_cs_n),                 // 1-bit input: Active high, asynchronous clear (Divided modes only)
        //.I(spi_clk_buf)            // 1-bit input: Clock buffer input driven by an IBUF, MMCM or local interconnect
        .I(spi_clk_ext)            // 1-bit input: Clock buffer input driven by an IBUF, MMCM or local interconnect
    );
    // Second BUFR exist solely for the purpose of placing the negated spi_clk on the clock tree for ODDR.
    // Directly negating the input of the ODDR clock ends up placing a LUT1 (inverter) on the clock line,
    // removing the clock from the clock tree and routing it throught the normal path. This second BUFR
    // is introduced as a workaround.
    BUFR #(
        .BUFR_DIVIDE("2"),     // Values: "BYPASS, 1, 2, 3, 4, 5, 6, 7, 8"
        .SIM_DEVICE("7SERIES")      // Must be set to "7SERIES"
    )
    spi_clk_inv_bufr_inst (
        .O(spi_clk_inv_buffered),       // 1-bit output: Clock output port
        .CE(~spi_cs_n),                  // 1-bit input: Active high, clock enable (Divided modes only)
        .CLR(spi_cs_n),                 // 1-bit input: Active high, asynchronous clear (Divided modes only)
        .I(~spi_clk_ext)            // 1-bit input: Clock buffer input driven by an IBUF, MMCM or local interconnect
    );
    
    // Tri-state buffer for spi_miso output controlled by spi_cs_n signal
    OBUFT spi_miso_obuf_inst(
        .T(spi_miso_disable),
        .I(spi_miso_buffered),
        .O(spi_miso)
    );
    
    // IDDRs are used to sample async signals at the ports
    IDDR #(
        .DDR_CLK_EDGE("SAME_EDGE_PIPELINED"), // "OPPOSITE_EDGE", "SAME_EDGE" or "SAME_EDGE_PIPELINED"
        .INIT_Q1(1'b1), // Initial value of Q1: 1'b0 or 1'b1
        .INIT_Q2(1'b1), // Initial value of Q2: 1'b0 or 1'b1
        .SRTYPE("ASYNC") // Set/Reset type: "SYNC" or "ASYNC"
    ) spi_csn_iddr (
        .Q1(), // 1-bit output for positive edge of clock
        .Q2(spi_cs_n_buffered), // 1-bit output for negative edge of clock
        .C(clk),   // 1-bit clock input
        .CE(1'b1), // 1-bit clock enable input
        .D(spi_cs_n),   // 1-bit DDR data input
        .R(1'b0),   // 1-bit reset
        .S(1'b0)    // 1-bit set
    );
    
    IDDR #(
        .DDR_CLK_EDGE("SAME_EDGE_PIPELINED"), // "OPPOSITE_EDGE", "SAME_EDGE" or "SAME_EDGE_PIPELINED"
        .INIT_Q1(1'b1), // Initial value of Q1: 1'b0 or 1'b1
        .INIT_Q2(1'b1), // Initial value of Q2: 1'b0 or 1'b1
        .SRTYPE("ASYNC") // Set/Reset type: "SYNC" or "ASYNC"
    ) reset_n_iddr (
        .Q1(), // 1-bit output for positive edge of clock
        .Q2(reset_n_buffered), // 1-bit output for negative edge of clock
        .C(clk),   // 1-bit clock input
        .CE(1'b1), // 1-bit clock enable input
        .D(reset_n),   // 1-bit DDR data input
        .R(1'b0),   // 1-bit reset
        .S(1'b0)    // 1-bit set
    );
    
    hamming #(
        .DATA_WIDTH(32),
        .REG_BANK_ADDR_WIDTH(REG_BANK_ADDR_WIDTH),
        .ERROR_COUNTER_WIDTH(ERROR_COUNT_WIDTH)
    ) ham_inst(
        .clk(clk),
        .reset_n(reset_n_buffered),
        .data_in(dec_data_in),
        .write_address(dec_out_addr),
        .status_address(STAT_REG_NUM),
        .comms_debug(COMMS_DEBUG),
        
        .wr_en(dec_write_en),
        .data_out(dec_data_out),
        .out_address(dec_write_addr)
    );

    reg_bank #(
        .DATA_WIDTH(DATA_WIDTH),
        .NUM_REGS(NUM_REGS_PER_BANK)
    ) bank_1(
        .reset_n(reset_n_buffered),
        .clk(clk),
        .dec_wr_en(dec_write_en),
        .spi_wr_en(spi_write_en_stable),
        .spi_rd_en(spi_read_en_stable),
        .data_wr_dec(dec_data_out),
        .data_wr_spi(spi_data_out),
        .dec_addr_wr(dec_write_addr),
        .spi_addr_wr(spi_wr_addr_trunc),
        .dec_addr_rd(dec_in_addr),
        .spi_addr_rd(spi_rd_addr_trunc),
        .ctrl_reg_addr(CTRL_REG_NUM),
        .stat_reg_addr(STAT_REG_NUM),
        .leds_reg_addr(LEDS_REG_NUM),
        
        .data_rd_dec(dec_data_in),
        .data_rd_spi(spi_data_in),
        .ctrl_out(ctrl_out),
        .stat_out(stat_out),
        .leds_out(errors_corrected)
    );
    
    spi_slave #(
        .SPI_DATA_WIDTH(DATA_WIDTH),
        .SPI_RD_ADDR_WIDTH(SPI_RD_ADDR_WIDTH),
        .SPI_WR_ADDR_WIDTH(SPI_WR_ADDR_WIDTH),
        .SHIFT_IN_COMP(SHIFT_IN_COMP),
        .SHIFT_OUT_COMP(SHIFT_OUT_COMP)
    ) spi_interface(
        .clk(clk),
        .reset_n(reset_n_buffered),
        .spi_clk_iob(spi_clk_buffered),
        .spi_clk_inv_iob(spi_clk_inv_buffered),
        .spi_mosi(spi_mosi),
        .spi_cs_n(spi_cs_n_buffered),
        .driver_in_data(spi_data_in),
        .spi_read_en_in(spi_read_en_stable),
        .spi_write_en_in(spi_write_en_fb),
        
        // Debug signals
        .in_shift_count_debug(in_shift_count_debug),
        
        .spi_miso_disable(spi_miso_disable),
        .spi_read_en_out(spi_read_en),
        .spi_write_en_out(spi_write_en),
        .spi_miso(spi_miso_buffered),
        .spi_rd_addr(spi_rd_addr),
        .spi_wr_addr(spi_wr_addr),
        .driver_out_data(spi_data_out)
    );
    
    control #(
        .DATA_WIDTH(DATA_WIDTH),
        .SPI_RD_ADDR_WIDTH(SPI_RD_ADDR_WIDTH),
        .SPI_WR_ADDR_WIDTH(SPI_WR_ADDR_WIDTH),
        .REG_BANK_ADDR_WIDTH(REG_BANK_ADDR_WIDTH)
    ) controller (
        .clk(clk),
        .reset_n(reset_n_buffered),
        .spi_read_en_in(spi_read_en),
        .spi_write_en_in(spi_write_en),
        .ctrl_reg(ctrl_out),
        .spi_rd_addr(spi_rd_addr),
        .spi_wr_addr(spi_wr_addr),
        .status_reg_mask(STAT_REG_NUM),
        .comms_debug(COMMS_DEBUG),
        
        .spi_read_en_out(spi_read_en_stable),
        .spi_write_en_out(spi_write_en_stable),
        .spi_write_en_fb(spi_write_en_fb),
        .dec_in_addr(dec_in_addr),
        .dec_out_addr(dec_out_addr),
        .spi_rd_addr_trunc(spi_rd_addr_trunc),
        .spi_wr_addr_trunc(spi_wr_addr_trunc)
    );
    
endmodule
