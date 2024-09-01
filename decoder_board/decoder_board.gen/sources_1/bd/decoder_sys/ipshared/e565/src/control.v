`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 09:13:31 PM
// Design Name: 
// Module Name: control
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


module control #(
        parameter integer DATA_WIDTH = 32,                  // Data width
        parameter integer SPI_RD_ADDR_WIDTH = 4,            // Read address width of SPI transaction
        parameter integer SPI_WR_ADDR_WIDTH = 4,            // Write address width of SPI transaction
        parameter integer REG_BANK_ADDR_WIDTH = 4           // Number of registers per bank
    )
    (
        input                               reset_n,
        input                               clk,
        input                               spi_read_en_in,
        input                               spi_write_en_in,
        input   [DATA_WIDTH-1:0]            ctrl_reg,
        input   [SPI_RD_ADDR_WIDTH-1:0]     spi_rd_addr,
        input   [SPI_WR_ADDR_WIDTH-1:0]     spi_wr_addr,
        input   [REG_BANK_ADDR_WIDTH-1:0]   status_reg_mask,
        input                               comms_debug,
        
        output                              spi_read_en_out,
        output                              spi_write_en_out,
        output                              spi_write_en_fb,
        output  [REG_BANK_ADDR_WIDTH-1:0]   dec_in_addr,                // Address pointing to the register from where decoder gets its input
        output  [REG_BANK_ADDR_WIDTH-1:0]   dec_out_addr,               // Address pointing to the register where decoder stores its output
        output  [REG_BANK_ADDR_WIDTH-1:0]   spi_rd_addr_trunc,
        output  [REG_BANK_ADDR_WIDTH-1:0]   spi_wr_addr_trunc
    );
    
    reg                                     spi_rd_en_reg;
    reg                                     spi_wr_en_reg;
    reg [SPI_RD_ADDR_WIDTH-1:0]             spi_rd_addr_reg;
    reg [SPI_WR_ADDR_WIDTH-1:0]             spi_wr_addr_reg;
    
    assign dec_in_addr = ctrl_reg[0 +: REG_BANK_ADDR_WIDTH];
    assign dec_out_addr = ctrl_reg[REG_BANK_ADDR_WIDTH +: REG_BANK_ADDR_WIDTH];
    assign spi_rd_addr_trunc = spi_rd_addr_reg[0 +: REG_BANK_ADDR_WIDTH];
    assign spi_wr_addr_trunc = spi_wr_addr_reg[0 +: REG_BANK_ADDR_WIDTH];
    assign spi_write_en_out = (spi_wr_en_reg && (spi_wr_addr_trunc != status_reg_mask || comms_debug)) ? 1'b1 : 1'b0;
    assign spi_read_en_out = spi_rd_en_reg;
    assign spi_write_en_fb = spi_wr_en_reg;
    
    always @(posedge clk) begin
        spi_rd_en_reg <= spi_read_en_in;
        spi_wr_en_reg <= spi_write_en_in;
    end
    
    always @(posedge clk) begin
        if (!reset_n) begin
            spi_rd_addr_reg <= 0;
            spi_wr_addr_reg <= 0;
        end
        else begin
            spi_rd_addr_reg <= (spi_read_en_in) ? spi_rd_addr : spi_rd_addr_reg;
            spi_wr_addr_reg <= (spi_write_en_in) ? spi_wr_addr : spi_wr_addr_reg;
        end
    end
    
endmodule
