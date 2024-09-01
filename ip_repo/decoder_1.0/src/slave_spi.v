`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2023 12:50:40 PM
// Design Name: 
// Module Name: slave_spi
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


module slave_spi #(
        parameter SPI_DATA_WIDTH = 32,
        parameter SPI_ADDR_WIDTH = 8,
        parameter SPI_CTRL_WIDTH = 8
    )
    (
        input                           reset_n,
        input                           spi_clk,
        input                           spi_cs_n,
        input                           spi_mosi,
        //input                           spi_read_done,
        input   [SPI_DATA_WIDTH-1:0]    spi_in_data,
        
        // Debug signals
        output  [5:0]                   dec_shft_cnt,
        /*
        output                          spi_negedge_detect,
        */
        
        output                          spi_read_en,
        output                          spi_miso,
        output  [SPI_ADDR_WIDTH-1:0]    spi_address,
        output  [SPI_DATA_WIDTH-1:0]    spi_out_data
    );
    
    localparam SPI_COMMAND_WIDTH = SPI_CTRL_WIDTH + SPI_ADDR_WIDTH;
    localparam SPI_BUFFER_WIDTH = SPI_COMMAND_WIDTH + SPI_DATA_WIDTH;
    
    reg                                     mosi_reg;
    reg                                     spi_stall;
    reg [$clog2(SPI_BUFFER_WIDTH)-1:0]      shift_count;
    reg [SPI_BUFFER_WIDTH-1:0]              buffer_reg;
    
    /*
    reg                                     negedge_detect;
    */
    
    wire                                    read_en;
    wire                                    spi_stall_in;
    wire    [$clog2(SPI_BUFFER_WIDTH)-1:0]  shift_in;
    wire    [SPI_BUFFER_WIDTH-1:0]          buffer_in;
    
    assign spi_miso = (spi_cs_n) ? 1'bz : buffer_reg[SPI_BUFFER_WIDTH-1];
    assign read_en = (shift_count == SPI_COMMAND_WIDTH-1 && buffer_reg[SPI_ADDR_WIDTH-1]) ? 1'b1 : 1'b0;
    assign spi_address = (read_en) ? {buffer_reg[0 +: SPI_ADDR_WIDTH-1], mosi_reg} : buffer_reg[SPI_DATA_WIDTH +: SPI_ADDR_WIDTH];
    assign spi_read_en = read_en;
    assign spi_out_data = buffer_reg[0 +: SPI_DATA_WIDTH];
    
    assign shift_in = (shift_count == SPI_BUFFER_WIDTH-1) ? 0 : shift_count + 1;
    assign buffer_in = (read_en) ? {spi_in_data, {(SPI_BUFFER_WIDTH-SPI_DATA_WIDTH){1'b0}}} : {buffer_reg[0 +: SPI_BUFFER_WIDTH-1], mosi_reg};
    // Use the spi_read_done instead of spi_stall in the below conditional
    // to extend the spi_stall signal, if a dynamic(multi-cycle) approach
    // is required for generating the spi_stall signal.
    // Ex: (shift_count == SPI_COMMAND_WIDTH-1 && read_en && !spi_read_done)
    assign spi_stall_in = (shift_count == SPI_COMMAND_WIDTH-1 && read_en && !spi_stall) ? 1'b1 : 1'b0;
    
    // Debug signals
    assign dec_shft_cnt = shift_count;
    
    always @(posedge spi_clk, negedge reset_n) begin
        if (!reset_n) spi_stall <= 1'b0;
        else spi_stall <= spi_stall_in;
    end
    
    always @(posedge spi_clk) begin
        if (!spi_stall) mosi_reg <= spi_mosi;
    end
    
    always @(negedge spi_clk, negedge reset_n) begin
        if (!reset_n) begin
            buffer_reg <= 0;
            shift_count <= 0;
        end
        else if (!spi_cs_n && !spi_stall) begin
            buffer_reg <= buffer_in;
            shift_count <= shift_in;
        end
    end
    
endmodule
