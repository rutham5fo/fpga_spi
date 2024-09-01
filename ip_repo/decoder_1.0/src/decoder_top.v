`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2023 12:50:40 PM
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


//(* DONT_TOUCH = "yes" *)
module decoder_top #(
        parameter integer DATA_WIDTH = 32,                  // Data width
        parameter integer SPI_ADDR_WIDTH = 8,               // Address width of SPI transaction
        parameter integer NUM_REGS_PER_BANK = 16,           // Number of registers per bank
        parameter integer CTRL_REG_NUM = 0,                 // Control register index in each bank
        parameter integer STAT_REG_NUM = 1,                 // Status register index in each bank
        parameter integer MAX_ERROR_COUNT = 15,             // Decoder can log upto 15 errors beffore overflowing
        parameter integer ERROR_COUNT_WIDTH = $clog2(MAX_ERROR_COUNT),
        parameter integer REG_BANK_ADDR_WIDTH = $clog2(NUM_REGS_PER_BANK)
    )
    (
        (* mark_debug = "true" *) input   wire                              reset_n,
        (* mark_debug = "true" *) input   wire                              clk,
        (* mark_debug = "true" *) input   wire                              spi_clk,
        (* mark_debug = "true" *) input   wire                              spi_cs_n,
        (* mark_debug = "true" *) input   wire                              spi_mosi,
        
        (* mark_debug = "true" *) output  wire                              spi_miso,
        // Feedback signals
        (* mark_debug = "true" *) output  wire    [ERROR_COUNT_WIDTH-1:0]   errors_corrected
    );
    
    //localparam integer REG_BANK_ADDR_WIDTH = $clog2(NUM_REGS_PER_BANK);
    //localparam integer ERROR_COUNT_WIDTH = $clog2(MAX_ERROR_COUNT);
    
    wire    [DATA_WIDTH-1:0]            spi_data_in;                // Data going into spi module
    wire    [DATA_WIDTH-1:0]            spi_data_out;               // Data coming out of spi module
    wire    [DATA_WIDTH-1:0]            dec_data_in;                // Data going into decoder module
    wire    [DATA_WIDTH-1:0]            dec_data_out;               // Data coming out of decoder module
    wire    [DATA_WIDTH-1:0]            ctrl_out;
    wire    [DATA_WIDTH-1:0]            stat_out;
    wire    [REG_BANK_ADDR_WIDTH-1:0]   dec_in_addr;                // Address pointing to the register from where decoder gets its input
    wire    [REG_BANK_ADDR_WIDTH-1:0]   dec_out_addr;               // Address pointing to the register where decoder stores its output
    wire    [REG_BANK_ADDR_WIDTH-1:0]   dec_write_addr;             // Reg bank address decoder is pointing to for write operation
    wire    [REG_BANK_ADDR_WIDTH-1:0]   spi_addr_trunc;
    wire    [REG_BANK_ADDR_WIDTH-1:0]   ctrl_reg_addr;
    wire    [REG_BANK_ADDR_WIDTH-1:0]   stat_reg_addr;
    wire    [SPI_ADDR_WIDTH-1:0]        spi_addr;
    wire                                spi_read_en;
    wire                                spi_read_en_stable;
    wire                                spi_write_en_stable;
    //wire                                spi_read_done;
    wire                                dec_write_en;
    
    // Debug signals
    (* mark_debug = "true" *) wire    [5:0]                       dec_shft_cnt;
    
    assign ctrl_reg_addr = CTRL_REG_NUM[0 +: REG_BANK_ADDR_WIDTH];
    assign stat_reg_addr = STAT_REG_NUM[0 +: REG_BANK_ADDR_WIDTH];
    assign errors_corrected = stat_out;
    
    hamming #(
        .DATA_WIDTH(32),
        .REG_BANK_ADDR_WIDTH(REG_BANK_ADDR_WIDTH),
        .ERROR_COUNTER_WIDTH(ERROR_COUNT_WIDTH)
    ) ham_inst(
        .clk(clk),
        .reset_n(reset_n),
        .data_in(dec_data_in),
        .write_address(dec_out_addr),
        .status_address(STAT_REG_NUM),
        
        .wr_en(dec_write_en),
        .data_out(dec_data_out),
        .out_address(dec_write_addr)
    );

    reg_bank #(
        .DATA_WIDTH(DATA_WIDTH),
        .NUM_REGS(NUM_REGS_PER_BANK)
    ) bank_1(
        .reset_n(reset_n),
        .clk(clk),
        .dec_wr_en(dec_write_en),
        .spi_wr_en(spi_write_en_stable),
        .spi_rd_en(spi_read_en_stable),
        .data_wr_dec(dec_data_out),
        .data_wr_spi(spi_data_out),
        .dec_addr_wr(dec_write_addr),
        .spi_addr_wr(spi_addr_trunc),
        .dec_addr_rd(dec_in_addr),
        .spi_addr_rd(spi_addr_trunc),
        .ctrl_reg_addr(CTRL_REG_NUM),
        .stat_reg_addr(STAT_REG_NUM),
        
        .data_rd_dec(dec_data_in),
        .data_rd_spi(spi_data_in),
        .ctrl_out(ctrl_out),
        .stat_out(stat_out)
    );
    
    slave_spi #(
        .SPI_DATA_WIDTH(32),
        .SPI_CTRL_WIDTH(8),
        .SPI_ADDR_WIDTH(8)
    ) spi_interface(
        .reset_n(reset_n),
        .spi_clk(spi_clk),
        .spi_mosi(spi_mosi),
        .spi_cs_n(spi_cs_n),
        .spi_in_data(spi_data_in),
        //.spi_read_done(spi_read_done),
        
        // Debug signals
        .dec_shft_cnt(dec_shft_cnt),
        
        .spi_read_en(spi_read_en),
        .spi_miso(spi_miso),
        .spi_address(spi_addr),
        .spi_out_data(spi_data_out)
    );
    
    control #(
        .DATA_WIDTH(DATA_WIDTH),
        .SPI_ADDR_WIDTH(SPI_ADDR_WIDTH),
        .REG_BANK_ADDR_WIDTH(REG_BANK_ADDR_WIDTH)
    ) controller (
        .clk(clk),
        .reset_n(reset_n),
        .spi_cs_n(spi_cs_n),
        .spi_read_en_in(spi_read_en),
        .ctrl_reg(ctrl_out),
        .spi_addr(spi_addr),
        
        //.spi_read_done_out(spi_read_done),
        .spi_read_en_out(spi_read_en_stable),
        .spi_write_en_out(spi_write_en_stable),
        .dec_in_addr(dec_in_addr),
        .dec_out_addr(dec_out_addr),
        .spi_addr_trunc(spi_addr_trunc)
    );
    
endmodule
