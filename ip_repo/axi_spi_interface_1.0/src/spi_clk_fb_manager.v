`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/12/2023 03:31:28 PM
// Design Name: 
// Module Name: spi_clk_fb_manager
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


module spi_clk_fb_manager #(
        parameter integer SPI_CLK_SCALE = 2,                // Half period length of spi_clk
        parameter integer SPI_CLK_DELAY = 1,                // Number of half periods to delay the output spi_clk with respect to input spi_clk
        parameter integer SPI_CLK_DELAY_MAX = 3,
        parameter integer SPI_RD_ADDR_WIDTH = 4,
        parameter integer SPI_WR_ADDR_WIDTH = 4,
        parameter integer SPI_DATA_WIDTH = 32
    )
    (
        input                           sys_clk,
        input                           transfer_active,
        
        output                          spi_clk_fb
    );
    
    localparam integer FB_BUFFER_WIDTH = SPI_RD_ADDR_WIDTH + SPI_WR_ADDR_WIDTH + SPI_DATA_WIDTH;
    localparam integer FB_PART_LIMIT = (SPI_CLK_SCALE * 2 * FB_BUFFER_WIDTH);
    
    reg [$clog2(FB_PART_LIMIT+1)-1:0]       fb_part_count;
    reg [$clog2(SPI_CLK_DELAY_MAX+1)-1:0]   fb_delay_count;
    reg [$clog2(SPI_CLK_SCALE+1)-1:0]       fb_clk_count;
    reg                                     fb_spi_clk_reg;
    
    assign spi_clk_fb = fb_spi_clk_reg;
    
    always @(posedge sys_clk) begin
        if (!reset_n) fb_part_count <= PART_LIMIT;
        else if (transfer_active && fb_part_count == FB_PART_LIMIT) fb_part_count <= 0;
        else if (part_count != PART_LIMIT) part_count <= part_count + 1;
    end
        
    always @(posedge sys_clk) begin
        if (!transfer_active) fb_clk_count <= 0;
        else if (transfer_active) fb_clk_count <= (fb_clk_count == SPI_CLK_SCALE-1) ? 0 : fb_clk_count +1;
    end
    
    always @(posedge sys_clk) begin
        if (!transfer_active) fb_delay_count <= 0;
        else if (transfer_active && fb_clk_count == SPI_CLK_SCALE-1 && fb_delay_count != SPI_CLK_DELAY) fb_delay_count <= fb_delay_count + 1;
    end
    
    always @(posedge sys_clk) begin
        if (!transfer_active) fb_spi_clk_reg <= 0;
        else if (transfer_active && fb_clk_count == SPI_CLK_SCALE-1 && fb_delay_count == SPI_CLK_DELAY) fb_spi_clk_reg <= ~fb_spi_clk_reg;
    end
    
endmodule
