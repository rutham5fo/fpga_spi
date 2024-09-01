`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2023 12:55:50 PM
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
        parameter integer SPI_ADDR_WIDTH = 8,               // Address width of SPI transaction
        parameter integer REG_BANK_ADDR_WIDTH = 4           // Number of registers per bank
    )
    (
        input                               clk,
        input                               reset_n,
        input                               spi_cs_n,
        input                               spi_read_en_in,
        input   [DATA_WIDTH-1:0]            ctrl_reg,
        input   [SPI_ADDR_WIDTH-1:0]        spi_addr,
        
        //output                              spi_read_done_out,
        output                              spi_read_en_out,
        output                              spi_write_en_out,
        output  [REG_BANK_ADDR_WIDTH-1:0]   dec_in_addr,                // Address pointing to the register from where decoder gets its input
        output  [REG_BANK_ADDR_WIDTH-1:0]   dec_out_addr,               // Address pointing to the register where decoder stores its output
        output  [REG_BANK_ADDR_WIDTH-1:0]   spi_addr_trunc
    );
    
    (* ASYNC_REG = "TRUE" *) reg                                 spi_read_en_metaguard_0;          // spiCLK to sysCLK CDC reg
    (* ASYNC_REG = "TRUE" *) reg                                 spi_read_en_metaguard_1;
    reg                                 read_done_logic;
    reg                                 spi_read_done;
    reg [1:0]                           spi_cs_n_reg;
    
    assign dec_in_addr = ctrl_reg[0 +: REG_BANK_ADDR_WIDTH];
    assign dec_out_addr = ctrl_reg[REG_BANK_ADDR_WIDTH +: REG_BANK_ADDR_WIDTH];
    assign spi_addr_trunc = spi_addr[0 +: REG_BANK_ADDR_WIDTH];
    assign spi_write_en_out = (spi_cs_n_reg == 2'b01 && !spi_read_done) ? 1'b1 : 1'b0;
    assign spi_read_en_out = spi_read_en_metaguard_1;
    //assign spi_read_done_out = spi_read_done;
    
    always @* begin
        case ({spi_cs_n_reg[0], spi_read_en_metaguard_1})
            2'b00: read_done_logic = spi_read_done;
            2'b01: read_done_logic = 1'b1;
            default: read_done_logic = 1'b0;
        endcase
    end
    
    // Register spi_read_en twice to avoid potential metastability issues due to CDC from spiCLK to sysCLK
    always @(posedge clk, negedge reset_n) begin
        if (!reset_n) begin
            spi_read_en_metaguard_0 <= 0;
            spi_read_en_metaguard_1 <= 0;
        end
        else begin
            spi_read_en_metaguard_0 <= spi_read_en_in;
            spi_read_en_metaguard_1 <= spi_read_en_metaguard_0;
        end
    end
    
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            spi_cs_n_reg[0] <= 1'b1;
            spi_cs_n_reg[1] <= 1'b1;
        end
        else begin
            spi_cs_n_reg[0] <= spi_cs_n;
            spi_cs_n_reg[1] <= spi_cs_n_reg[0];
        end
    end
    
    always @(posedge clk, negedge reset_n) begin
        if (!reset_n) spi_read_done <= 1'b0;
        else spi_read_done <= read_done_logic;
    end
    
endmodule
