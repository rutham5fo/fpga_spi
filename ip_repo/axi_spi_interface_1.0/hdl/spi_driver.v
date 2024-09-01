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
    parameter integer SPI_CLK_PERIOD = 100,
    parameter integer SPI_DATA_WIDTH = 32,
    localparam integer SPI_CLK_HALF_PERIOD = SPI_CLK_PERIOD/2,
    localparam integer SPI_ADDR_WIDTH = 8,
    localparam integer SPI_MAX_BYTES = 4
    ) 
    (
    input wire reset,
    input wire clk,
    input wire start,
    input wire read,
    input wire [$clog2(SPI_MAX_BYTES)-1:0] nbytes,
    input wire [SPI_ADDR_WIDTH-1:0] address,
    input wire [SPI_DATA_WIDTH-1:0] write_data,
    input wire spi_miso,
    
    output wire busy,
    output wire [SPI_DATA_WIDTH-1:0] read_data,
    output wire spi_clk,
    output wire spi_cs_n,
    output wire spi_mosi
    );
    
    localparam integer WRITE_SHIFT_LIMIT = 8*SPI_MAX_BYTES+SPI_ADDR_WIDTH+8;
    localparam integer READ_SHIFT_LIMIT = WRITE_SHIFT_LIMIT+32;
    
    reg [(8*SPI_MAX_BYTES+SPI_ADDR_WIDTH+8)-1:0] buffer_reg;
    reg [$clog2(SPI_CLK_HALF_PERIOD)-1:0] clk_count;
    reg                      spi_clk_reg;
    reg                      transfer_active;
    
    wire                     spi_clk_rise;
    wire                     spi_clk_fall;
    
    integer shift_count;
    
    assign spi_clk_rise = (clk_count == 0) ? 1'b1 : 1'b0;
    assign spi_clk_fall = (clk_count == SPI_CLK_HALF_PERIOD) ? 1'b1 : 1'b0;
    assign spi_clk = spi_clk_reg;
    assign busy = transfer_active;
    assign spi_cs_n = ~(start || transfer_active);
    assign spi_mosi = buffer_reg[(8*SPI_MAX_BYTES+SPI_ADDR_WIDTH+8)-1];
    assign spi_miso = buffer_reg[0 +: 8*SPI_MAX_BYTES];
    
    // Counter to generate the SPI_CLK signal
    always @(posedge clk) begin
        if (reset || (start && !transfer_active)) clk_count <= 0;
        else if (transfer_active && !reset) begin
            clk_count <= (clk_count == SPI_CLK_PERIOD-1) ? 0 : clk_count+1;
        end
    end
    // Generate SPI_CLK signal
    always @(posedge clk) begin
        if (reset || !transfer_active) spi_clk_reg <= 1'b0;
        else if (spi_clk_rise && transfer_active) spi_clk_reg <= 1'b1;
        else if (spi_clk_fall && transfer_active) spi_clk_reg <= 1'b0;
    end
    
    always @(posedge clk) begin
        if (reset) begin
            transfer_active <= 1'b0;
        end
        else if (start && !transfer_active) begin
            transfer_active <= 1'b1;
            buffer_reg <= {{7{1'b0}}, read, address, write_data};
            shift_count <= 0;
        end
        else if (transfer_active) begin
            if (spi_clk_rise) begin
                shift_count <= shift_count+1;
            end
            else if (spi_clk_fall) begin
                buffer_reg <= {shift_reg, miso_reg};
                if (!read && shift_count == WRITE_SHIFT_LIMIT) begin
                    transfer_active <= 1'b0;
                end
                else if (read && shift_count == READ_SHIFT_LIMIT) begin
                    transfer_active <= 1'b0;
                end
            end
        end
    end
    
endmodule
