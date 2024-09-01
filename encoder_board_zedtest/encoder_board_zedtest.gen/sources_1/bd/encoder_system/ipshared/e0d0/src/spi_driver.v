`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/12/2023 11:21:49 AM
// Design Name: 
// Module Name: spi_driver
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


module spi_driver #(
        parameter integer SPI_DATA_WIDTH = 32,
        parameter integer SPI_RD_ADDR_WIDTH = 4,
        parameter integer SPI_WR_ADDR_WIDTH = 4,
        parameter integer SPI_INIT_INTERVAL_VAL = 2,
        parameter integer SPI_EXIT_INTERVAL_VAL = 1,
        parameter integer SPI_CLK_FB_DELAY_WIDTH = 3,
        parameter integer SPI_DUMMY_BITS_BEG = 0,
        parameter integer SPI_DUMMY_BITS_END = 0,
        parameter integer SPI_SHIFT_IN_COMP = 0
    ) 
    (
        input wire reset_n,
        input wire clk,
        input wire gen_spi_clk_0,
        input wire gen_spi_clk_180,
        input wire gen_spi_clk_fb_0,
        input wire gen_spi_clk_locked,
        input wire free_spi_clk_en,
        input wire start,
        input wire [SPI_CLK_FB_DELAY_WIDTH-1:0] fb_sclk_delay_val,
        input wire [SPI_RD_ADDR_WIDTH-1:0] rd_address,
        input wire [SPI_WR_ADDR_WIDTH-1:0] wr_address,
        input wire [SPI_DATA_WIDTH-1:0] write_data,
        input wire spi_miso,
        
        output wire busy,
        output wire [SPI_DATA_WIDTH-1:0] read_data,
        output wire spi_clk,
        output wire spi_cs_n,
        output wire spi_mosi
    );
    
    localparam integer BUFFER_WIDTH = SPI_RD_ADDR_WIDTH + SPI_WR_ADDR_WIDTH + SPI_DATA_WIDTH;
    localparam integer SHIFT_COUNT_LIMIT = BUFFER_WIDTH + SPI_INIT_INTERVAL_VAL + SPI_DUMMY_BITS_BEG + SPI_DUMMY_BITS_END;
    localparam integer MAX_SHIFT_IN_COUNT = SHIFT_COUNT_LIMIT + SPI_SHIFT_IN_COMP + (2**SPI_CLK_FB_DELAY_WIDTH);
    localparam integer SPI_EXIT_INTERVAL = SPI_EXIT_INTERVAL_VAL;
    
    reg [1:0]                                                       start_edge_reg;
    reg                                                             mosi_reg;
    reg [SPI_DATA_WIDTH-1:0]                                        in_buffer_reg;
    reg [BUFFER_WIDTH-1:0]                                          out_val_reg;
    reg [BUFFER_WIDTH-1:0]                                          out_buffer_reg;
    reg [$clog2(SHIFT_COUNT_LIMIT + SPI_EXIT_INTERVAL)-1:0]         shift_out_count;
    reg [$clog2(MAX_SHIFT_IN_COUNT + 1)-1:0]                        shift_in_count;
    reg                                                             spi_csn_reg;
    reg                                                             spi_clk_en_reg;
    reg [SPI_CLK_FB_DELAY_WIDTH-1:0]                                fb_delay_val_reg;
    
    wire                                                            shift_out_en;
    wire                                                            shift_in_en;
    wire                                                            fb_spi_clk;
    wire                                                            start_en;
    wire                                                            spi_clk_en;
    
    // Debug signals
    wire    [$clog2(SHIFT_COUNT_LIMIT + SPI_EXIT_INTERVAL)-1:0] enc_shift_out_count;
    wire    [$clog2(MAX_SHIFT_IN_COUNT + 1)-1:0] enc_shift_in_count;
    
    assign spi_clk_en = (spi_clk_en_reg || free_spi_clk_en) ? 1'b1 : 1'b0;
    assign start_en = (start_edge_reg == 2'b10) ? 1'b1 : 1'b0;
    assign fb_spi_clk = gen_spi_clk_fb_0;
    assign shift_out_en = (shift_out_count >= SPI_INIT_INTERVAL_VAL + SPI_DUMMY_BITS_BEG -1 && shift_out_count < SHIFT_COUNT_LIMIT-1) ? 1'b1 : 1'b0;
    
    assign shift_in_en = (shift_in_count > SPI_INIT_INTERVAL_VAL-1 && shift_in_count < (SPI_DATA_WIDTH + SPI_INIT_INTERVAL_VAL + SPI_SHIFT_IN_COMP + fb_delay_val_reg + 1)) ? 1'b1 : 1'b0;
    assign busy = (!gen_spi_clk_locked || start_edge_reg != 0 || shift_out_count < (SHIFT_COUNT_LIMIT + SPI_EXIT_INTERVAL - 1)) ? 1'b1 : 1'b0;
    
    assign spi_cs_n = spi_csn_reg;
    assign spi_mosi = mosi_reg;
    assign read_data = in_buffer_reg;
    
    // Debug signals
    assign shift_out_count_debug = shift_out_count;
    assign shift_in_count_debug = shift_in_count;
    
    // Route the generated spi_clk through ODDR
    // ODDR keeps the duty cycle and provides the best possible path.
    // No routing of clock on any interconnect, clock remains on the
    // global clock resources where they belong.
    
    ODDR #(
        .DDR_CLK_EDGE("OPPOSITE_EDGE"),     // "OPPOSITE_EDGE" or "SAME_EDGE"
        .INIT(1'b0),                        // Initial value of Q: 1'b0 or 1'b1
        .SRTYPE("SYNC")                     // Set/Reset type: "SYNC" or "ASYNC"
    ) ODDR_inst (
        .Q(spi_clk),                        // 1-bit DDR output
        .C(gen_spi_clk_0),                    // 1-bit clock input
        .CE(spi_clk_en),                    // 1-bit clock enable input
        .D1(1'b1),                          // 1-bit data input (positive edge)
        .D2(1'b0),                          // 1-bit data input (negative edge)
        .R(~spi_clk_en),                       // 1-bit reset
        .S(1'b0)                            // 1-bit set
    );
    
    // CDC regs
    always @(posedge clk) begin
        if (!reset_n) begin
            fb_delay_val_reg <= 0;
            out_val_reg <= 0;
        end
        else if (start) begin
            fb_delay_val_reg <= fb_sclk_delay_val;
            out_val_reg <= {rd_address, wr_address, write_data};
        end
    end
    
    // Counters
    always @(posedge gen_spi_clk_180, negedge reset_n) begin
        if (!reset_n) start_edge_reg <= 0;
        else start_edge_reg <= {start_edge_reg[0], start};
    end
    
    always @(posedge gen_spi_clk_180, negedge reset_n) begin
        if (!reset_n) shift_out_count <= SHIFT_COUNT_LIMIT + SPI_EXIT_INTERVAL;
        else if (start_en) shift_out_count <= 0;
        else if (shift_out_count < (SHIFT_COUNT_LIMIT + SPI_EXIT_INTERVAL)) shift_out_count <= shift_out_count + 1;
    end
    
    always @(negedge fb_spi_clk, negedge reset_n) begin
        if (!reset_n) shift_in_count <= MAX_SHIFT_IN_COUNT;
        else if (start_en) shift_in_count <= 0;
        // Start sampling miso line after one cycle ( + 1), to compensate for miso_reg load cycle in slave
        else if (shift_in_count < (SPI_DATA_WIDTH + SPI_SHIFT_IN_COMP + SPI_INIT_INTERVAL_VAL + fb_delay_val_reg + 1)) shift_in_count <= shift_in_count + 1;
    end
    
    // IOB REGS
    always @(posedge gen_spi_clk_180, negedge reset_n) begin
        if (!reset_n) mosi_reg <= 1'b0;
        else mosi_reg <= out_buffer_reg[BUFFER_WIDTH-1];
    end
    
    always @(posedge gen_spi_clk_180, negedge reset_n) begin
        if (!reset_n) spi_csn_reg <= 1'b1;
        else if (shift_out_count < SHIFT_COUNT_LIMIT + SPI_EXIT_INTERVAL - 1) spi_csn_reg <= 1'b0;
        else spi_csn_reg <= 1'b1;
    end
    
    // IO Buffers
    always @(posedge gen_spi_clk_180, negedge reset_n) begin
        if (!reset_n) out_buffer_reg <= 0;
        else if (start_en) out_buffer_reg <= out_val_reg;
        else if (shift_out_en) out_buffer_reg <= {out_buffer_reg[0 +: BUFFER_WIDTH-1], 1'b0};
    end
    
    always @(posedge fb_spi_clk, negedge reset_n) begin
        if (!reset_n) in_buffer_reg <= 0;
        else if (shift_in_en) in_buffer_reg <= {in_buffer_reg[0 +: SPI_DATA_WIDTH-1], spi_miso};
    end
    
    // Spi clock drive control regs
    always @(posedge gen_spi_clk_180) begin
        if (shift_out_count >= SPI_INIT_INTERVAL_VAL-1 && shift_out_count < SHIFT_COUNT_LIMIT-1) spi_clk_en_reg <= 1'b1;
        else spi_clk_en_reg <= 1'b0;
    end
    
endmodule
