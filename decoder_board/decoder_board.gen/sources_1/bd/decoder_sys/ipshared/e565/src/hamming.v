`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 09:12:30 PM
// Design Name: 
// Module Name: hamming
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


module hamming #(
        parameter DATA_WIDTH = 32,
        parameter REG_BANK_ADDR_WIDTH = 4,
        parameter ERROR_COUNTER_WIDTH = 4
    )(
        input                               clk,
        input                               reset_n,
        input   [DATA_WIDTH-1:0]            data_in,
        input   [REG_BANK_ADDR_WIDTH-1:0]   write_address,
        input   [REG_BANK_ADDR_WIDTH-1:0]   status_address,
        input                               comms_debug,
        
        output                              wr_en,
        output  [DATA_WIDTH-1:0]            data_out,
        output  [REG_BANK_ADDR_WIDTH-1:0]   out_address
    );
    
    reg [3:0]                           dec_data;
    reg [3:0]                           dec_data_prev;
    reg [3:0]                           syndrome_reg;
    reg [ERROR_COUNTER_WIDTH-1:0]       error_counter;
    reg [1:0]                           error_count_change;             // Reg to detect error counter value change
    reg                                 error_corrected;
    
    wire    [3:0]   syndrome;
    wire    [7:0]   in;
    
    assign in = data_in[0 +: 8];
    assign data_out = (dec_data != dec_data_prev) ? {{DATA_WIDTH-4{1'b0}}, dec_data} : {{DATA_WIDTH-ERROR_COUNTER_WIDTH{1'b0}}, error_counter};
    assign out_address = (dec_data != dec_data_prev) ? write_address : status_address;
    assign wr_en = ((dec_data != dec_data_prev || error_count_change[1] != error_counter[0]) && !comms_debug) ? 1'b1 : 1'b0;
    assign errors_corrected = error_counter;
    
    assign syndrome[0] = in[1] ^ in[3] ^ in[5] ^ in[7];
    assign syndrome[1] = in[2] ^ in[3] ^ in[6] ^ in[7];
    assign syndrome[2] = in[4] ^ in[5] ^ in[6] ^ in[7];
    assign syndrome[3] = ^in; 
    
    always @* begin
        error_corrected = 1'b1;
        case (syndrome)
            4'b1011: dec_data = {in[7], in[6], in[5], ~in[3]};
            4'b1101: dec_data = {in[7], in[6], ~in[5], in[3]};
            4'b1110: dec_data = {in[7], ~in[6], in[5], in[3]};
            4'b1111: dec_data = {~in[7], in[6], in[5], in[3]};
            default: begin
                dec_data = {in[7], in[6], in[5], in[3]};
                error_corrected = 1'b0;
            end
        endcase
    end
    
    always @(posedge clk, negedge reset_n) begin
        if (!reset_n) syndrome_reg <= 0;
        else syndrome_reg <= syndrome;
    end
    
    always @(posedge clk, negedge reset_n) begin
        if (!reset_n) error_counter <= 0;
        else if (syndrome_reg != syndrome && error_corrected) error_counter <= error_counter + 1;
    end
    
    always @(posedge clk) begin
        error_count_change[0] <= error_counter[0];
        error_count_change[1] <= error_count_change[0];
    end
    
    always @(posedge clk) begin
        dec_data_prev <= dec_data;
    end
    
endmodule
