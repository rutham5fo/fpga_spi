`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 09:13:12 PM
// Design Name: 
// Module Name: spi_slave
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


module spi_slave #(
        parameter integer SPI_DATA_WIDTH = 32,
        parameter integer SPI_RD_ADDR_WIDTH = 4,
        parameter integer SPI_WR_ADDR_WIDTH = 4,
        parameter integer SHIFT_MAX = SPI_RD_ADDR_WIDTH + SPI_WR_ADDR_WIDTH + SPI_DATA_WIDTH,
        parameter integer SHIFT_IN_COMP = 0,
        parameter integer SHIFT_OUT_COMP = 0
    )
    (
        input                           clk,
        input                           reset_n,
        input                           spi_clk_iob,
        input                           spi_clk_inv_iob,
        input                           spi_cs_n,
        input                           spi_mosi,
        input   [SPI_DATA_WIDTH-1:0]    driver_in_data,
        input                           spi_read_en_in,
        input                           spi_write_en_in,
        
        output                          spi_miso_disable,
        output                          spi_read_en_out,
        output                          spi_write_en_out,
        output                          spi_miso,
        output  [SPI_RD_ADDR_WIDTH-1:0] spi_rd_addr,
        output  [SPI_WR_ADDR_WIDTH-1:0] spi_wr_addr,
        output  [SPI_DATA_WIDTH-1:0]    driver_out_data
    );
    
    localparam SAMPLER_SIZE = 2;
    localparam SPI_BUFFER_WIDTH = SPI_WR_ADDR_WIDTH + SPI_DATA_WIDTH;
    localparam SPI_ADDR_WIDTH = SPI_RD_ADDR_WIDTH + SPI_WR_ADDR_WIDTH;
    localparam READ_AT = SPI_RD_ADDR_WIDTH;    
    
    reg                                             spi_active;
    reg [SPI_DATA_WIDTH-1:0]                        miso_reg;
    reg [$clog2(SHIFT_MAX+1)-1:0]                   in_shift_count;
    reg [SPI_BUFFER_WIDTH-1:0]                      in_buffer_reg;
    reg [SPI_DATA_WIDTH-1:0]                        out_buffer_reg;
    reg                                             miso_disable_reg;
    reg                                             spi_io_regs_en;
    reg                                             spi_p_valid;
    reg                                             spi_n_valid;
    reg                                             merger_out;
    reg                                             merger_out_valid;
    reg                                             merger_out_prev_valid;
    reg                                             merger_prev_p_valid;
    reg                                             merger_prev_n_valid;
    reg                                             distru_p;
    reg                                             distru_n;
    reg [1:0]                                       spi_active_en;
    
    // Metastable Guard regs and sampler regs
    (* ASYNC_REG = "TRUE" *) reg [SAMPLER_SIZE-1:0]                  spi_pp_valid_metaguard;
    (* ASYNC_REG = "TRUE" *) reg [SAMPLER_SIZE-1:0]                  spi_np_valid_metaguard;
    (* ASYNC_REG = "TRUE" *) reg [SAMPLER_SIZE-1:0]                  spi_pp_data_metaguard;
    (* ASYNC_REG = "TRUE" *) reg [SAMPLER_SIZE-1:0]                  spi_pn_data_metaguard;
    (* ASYNC_REG = "TRUE" *) reg [SAMPLER_SIZE-1:0]                  spi_np_data_metaguard;
    (* ASYNC_REG = "TRUE" *) reg [SAMPLER_SIZE-1:0]                  spi_nn_data_metaguard;
    
    wire                                                             spi_write_en_val;
    wire                                                             read_merger_p_in;
    wire                                                             read_merger_n_in;
    wire                                                             read_merger_out;
    wire                                                             spi_p_data;
    wire                                                             spi_n_data;
    
    // Debug signals
    assign in_shift_count_debug = in_shift_count;
    assign read_merger_p_in = (merger_prev_p_valid ^ spi_pp_valid_metaguard[SAMPLER_SIZE-1]) & ~(spi_pp_data_metaguard[SAMPLER_SIZE-1] ^ spi_pn_data_metaguard[SAMPLER_SIZE-1]);
    assign read_merger_n_in = (merger_prev_n_valid ^ spi_np_valid_metaguard[SAMPLER_SIZE-1]) & ~(spi_np_data_metaguard[SAMPLER_SIZE-1] ^ spi_nn_data_metaguard[SAMPLER_SIZE-1]);
    assign read_merger_out = merger_out_valid ^ merger_out_prev_valid;
    assign spi_miso_disable = miso_disable_reg;
    assign spi_rd_addr = in_buffer_reg[0 +: SPI_RD_ADDR_WIDTH];
    assign spi_wr_addr = in_buffer_reg[SPI_DATA_WIDTH +: SPI_WR_ADDR_WIDTH];
    assign spi_read_en_out = (in_shift_count == READ_AT + SHIFT_IN_COMP) ? 1'b1 : 1'b0;
    assign spi_write_en_out = spi_write_en_val;
    assign driver_out_data = in_buffer_reg[0 +: SPI_DATA_WIDTH];
    assign spi_write_en_val = (in_shift_count == (SHIFT_MAX + SHIFT_IN_COMP) || !reset_n) ? 1'b1 : 1'b0;
    
    // --- IO regs and control ---
    IDDR #(
        .DDR_CLK_EDGE("OPPOSITE_EDGE"), // "OPPOSITE_EDGE", "SAME_EDGE" or "SAME_EDGE_PIPELINED"
        .INIT_Q1(1'b0), // Initial value of Q1: 1'b0 or 1'b1
        .INIT_Q2(1'b0), // Initial value of Q2: 1'b0 or 1'b1
        .SRTYPE("ASYNC") // Set/Reset type: "SYNC" or "ASYNC"
    ) spi_in_iddr (
        .Q1(spi_p_data), // 1-bit output for positive edge of clock
        .Q2(spi_n_data), // 1-bit output for negative edge of clock
        .C(spi_clk_iob),   // 1-bit clock input
        .CE(spi_io_regs_en), // 1-bit clock enable input
        .D(spi_mosi),   // 1-bit DDR data input
        .R(spi_write_en_in),   // 1-bit reset
        .S(1'b0)    // 1-bit set
    );
    
    ODDR #(
        .DDR_CLK_EDGE("OPPOSITE_EDGE"), // "OPPOSITE_EDGE" or "SAME_EDGE"
        .INIT(1'b0),    // Initial value of Q: 1'b0 or 1'b1
        .SRTYPE("ASYNC") // Set/Reset type: "SYNC" or "ASYNC"
    ) spi_out_oddr (
        .Q(spi_miso),   // 1-bit DDR output
        .C(spi_clk_inv_iob),   // 1-bit clock input
        .CE(spi_io_regs_en), // 1-bit clock enable input
        .D1(distru_p), // 1-bit data input (positive edge)
        .D2(distru_n), // 1-bit data input (negative edge)
        .R(spi_write_en_in),   // 1-bit reset
        .S(1'b0)    // 1-bit set
    );
    
    always @(posedge spi_clk_iob, posedge spi_write_en_in) begin
        if (spi_write_en_in) spi_p_valid <= 1'b0;
        else spi_p_valid <= ~spi_p_valid;
    end

    always @(negedge spi_clk_iob, posedge spi_write_en_in) begin
        if (spi_write_en_in) spi_n_valid <= 1'b0;
        else spi_n_valid <= ~spi_n_valid;
    end
    
    always @(negedge clk) begin
        if (spi_write_en_in) begin
            spi_pn_data_metaguard <= 0;
            spi_nn_data_metaguard <= 0;
        end
        else begin
            spi_pn_data_metaguard <= {spi_pn_data_metaguard[0 +: SAMPLER_SIZE-1], spi_p_data};
            spi_nn_data_metaguard <= {spi_nn_data_metaguard[0 +: SAMPLER_SIZE-1], spi_n_data};
        end
    end
    
    always @(posedge clk) begin
        if (spi_write_en_in) begin
            spi_pp_valid_metaguard <= 0;
            spi_np_valid_metaguard <= 0;
            spi_pp_data_metaguard <= 0;
            spi_np_data_metaguard <= 0;
            merger_out <= 1'b0;
            merger_out_valid <= 1'b0;
            merger_out_prev_valid <= 1'b0;
            merger_prev_p_valid <= 1'b0;
            merger_prev_n_valid <= 1'b0;
            distru_p <= 1'b0;
            distru_n <= 1'b0;
            
            in_shift_count <= 0;
            spi_active <= 1'b0;
            in_buffer_reg <= 0;
        end
        else begin
            spi_active <= (spi_active_en == 2'b01) ? 1'b1 : spi_active;
            in_shift_count <= (spi_active && read_merger_out) ? in_shift_count + 1 : in_shift_count;
            in_buffer_reg <= (in_shift_count < SHIFT_MAX + SHIFT_IN_COMP && spi_active && read_merger_out) ? {in_buffer_reg[0 +: SPI_BUFFER_WIDTH-1], merger_out} : in_buffer_reg;
            merger_out_prev_valid <= (read_merger_out) ? merger_out_valid : merger_out_prev_valid;
            
            spi_pp_valid_metaguard <= {spi_pp_valid_metaguard[0 +: SAMPLER_SIZE-1], spi_p_valid};
            spi_np_valid_metaguard <= {spi_np_valid_metaguard[0 +: SAMPLER_SIZE-1], spi_n_valid};
            spi_pp_data_metaguard <= {spi_pp_data_metaguard[0 +: SAMPLER_SIZE-1], spi_p_data};
            spi_np_data_metaguard <= {spi_np_data_metaguard[0 +: SAMPLER_SIZE-1], spi_n_data};
            if (read_merger_p_in) begin
                merger_out <= spi_pp_data_metaguard[SAMPLER_SIZE-1];
                merger_prev_p_valid <= spi_pp_valid_metaguard[SAMPLER_SIZE-1];
                merger_out_valid <= ~merger_out_valid;
                distru_p <= miso_reg[SPI_DATA_WIDTH-1];
            end
            else if (read_merger_n_in) begin
                merger_out <= spi_np_data_metaguard[SAMPLER_SIZE-1];
                merger_prev_n_valid <= spi_np_valid_metaguard[SAMPLER_SIZE-1];
                merger_out_valid <= ~merger_out_valid;
                distru_n <= miso_reg[SPI_DATA_WIDTH-1];
            end
        end
    end
    
    always @(posedge clk) begin
        miso_disable_reg <= spi_cs_n;
        spi_io_regs_en <= ~spi_cs_n;
        spi_active_en <= {spi_active_en[0], ~spi_cs_n};
        if (!reset_n) begin
            out_buffer_reg <= 0;
            miso_reg <= 0;
        end
        else begin
            out_buffer_reg <= (spi_read_en_in) ? driver_in_data : out_buffer_reg;
            if (read_merger_p_in || read_merger_n_in) miso_reg <= {miso_reg[0 +: SPI_DATA_WIDTH], 1'b0};
            else if (spi_write_en_in) miso_reg <= out_buffer_reg;
        end
    end
    
endmodule
