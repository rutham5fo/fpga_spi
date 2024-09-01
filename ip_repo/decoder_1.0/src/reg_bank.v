`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2023 12:52:53 PM
// Design Name: 
// Module Name: reg_bank
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


module reg_bank #(
        parameter DATA_WIDTH = 32,
        parameter NUM_REGS = 16
    )
    (
        input                           reset_n,
        input                           clk,
        input                           dec_wr_en,
        input                           spi_wr_en,
        input                           spi_rd_en,
        input   [DATA_WIDTH-1:0]        data_wr_dec,
        input   [DATA_WIDTH-1:0]        data_wr_spi,
        input   [$clog2(NUM_REGS)-1:0]  dec_addr_wr,
        input   [$clog2(NUM_REGS)-1:0]  spi_addr_wr,
        input   [$clog2(NUM_REGS)-1:0]  dec_addr_rd,
        input   [$clog2(NUM_REGS)-1:0]  spi_addr_rd,
        input   [$clog2(NUM_REGS)-1:0]  ctrl_reg_addr,
        input   [$clog2(NUM_REGS)-1:0]  stat_reg_addr,
        
        output  [DATA_WIDTH-1:0]        data_rd_dec,
        output  [DATA_WIDTH-1:0]        data_rd_spi,
        output  [DATA_WIDTH-1:0]        ctrl_out,
        output  [DATA_WIDTH-1:0]        stat_out
    );
    
    reg [DATA_WIDTH-1:0]                registers [0:NUM_REGS];
    
    wire                                wr_en;
    wire    [DATA_WIDTH-1:0]            write_data;
    wire    [$clog2(NUM_REGS)-1:0]      write_addr;
    
    integer i;
    
    assign wr_en = spi_wr_en | dec_wr_en;
    assign write_data = (spi_wr_en) ? data_wr_spi : data_wr_dec;
    assign write_addr = (spi_wr_en) ? spi_addr_wr : dec_addr_wr;
    assign data_rd_dec = registers[dec_addr_rd];
    assign data_rd_spi = (spi_rd_en) ? registers[spi_addr_rd] : {DATA_WIDTH{1'b0}};
    assign ctrl_out = registers[ctrl_reg_addr];
    assign stat_out = registers[stat_reg_addr];
    
    always @(posedge clk, negedge reset_n) begin
        if (!reset_n) begin
            for (i = 0; i < NUM_REGS; i = i+1) registers[i] <= 0;
        end
        else if (wr_en) registers[write_addr] <= write_data;
    end
    
endmodule
