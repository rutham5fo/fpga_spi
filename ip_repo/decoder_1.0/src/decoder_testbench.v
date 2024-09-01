`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2023 03:58:30 PM
// Design Name: 
// Module Name: decoder_testbench
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


module decoder_testbench;
    parameter integer DATA_WIDTH = 32;
    parameter integer SPI_ADDR_WIDTH = 8;
    parameter integer NUM_REGS_PER_BANK = 16;
    parameter integer CTRL_REG_NUM = 0;
    parameter integer STAT_REG_NUM = 1;
    parameter integer SPI_CLK_SCALE = 2;
    parameter integer SYS_CLK_PERIOD = 10;
    parameter integer SPI_CLK_PERIOD = SPI_CLK_SCALE * SYS_CLK_PERIOD;
    parameter integer MAX_ERROR_COUNT = 15;
    parameter integer ERROR_COUNT_WIDTH = $clog2(MAX_ERROR_COUNT);
    
    parameter integer SPI_CTRL_WIDTH = 8;
    parameter integer SPI_COMMAND_WIDTH = SPI_CTRL_WIDTH + SPI_ADDR_WIDTH;
    parameter integer SPI_BUFFER_WIDTH = SPI_COMMAND_WIDTH + DATA_WIDTH;
    
    parameter integer SAMPLE_LIMIT = 8;
    parameter integer RUN_LIMIT = 8;
    
    reg                             clk;
    reg                             reset_n;
    reg                             spi_clk;
    reg                             spi_miso_reg;
    reg                             spi_cs_n;
    reg [DATA_WIDTH-1:0]            dummy;
    reg [DATA_WIDTH-1:0]            enc_data    [0:SAMPLE_LIMIT];
    reg [DATA_WIDTH-1:0]            dec_data    [0:SAMPLE_LIMIT];
    reg [DATA_WIDTH-1:0]            valid_data  [0:SAMPLE_LIMIT];
    reg [SPI_BUFFER_WIDTH-1:0]      buffer;
    
    wire                            spi_miso;
    wire                            spi_mosi;
    wire    [ERROR_COUNT_WIDTH-1:0] errors_corrected;
    
    integer i = 0;
    integer j = 0;
    integer loop_limit = SPI_BUFFER_WIDTH;
    real spi_clk_delay = 0.0;
    real spi_clk_delay_step = 2.5;
    
    assign spi_mosi = buffer[SPI_BUFFER_WIDTH-1];
    
    decoder_top #(
        .DATA_WIDTH(DATA_WIDTH),
        .SPI_ADDR_WIDTH(SPI_ADDR_WIDTH),
        .NUM_REGS_PER_BANK(NUM_REGS_PER_BANK),
        .CTRL_REG_NUM(CTRL_REG_NUM),
        .STAT_REG_NUM(STAT_REG_NUM)
    ) decoder_inst (
        .reset_n(reset_n),
        .clk(clk),
        .spi_clk(spi_clk),
        .spi_cs_n(spi_cs_n),
        .spi_mosi(spi_mosi),
        
        .spi_miso(spi_miso),
        .errors_corrected(errors_corrected)
    );
    
    task spi_interface (
            input                           read,
            input   [SPI_ADDR_WIDTH-1:0]    address,
            input   [DATA_WIDTH-1:0]        write_data,
            input   real                    spiClk_delay,
            
            output  [DATA_WIDTH-1:0]        read_data
        );
        begin
            loop_limit = (read) ? SPI_BUFFER_WIDTH+1 : SPI_BUFFER_WIDTH;
            
            @(negedge clk);
            buffer = {{SPI_CTRL_WIDTH-1{1'b0}}, read, address, write_data};
            spi_cs_n = 1'b0;
            
            if (read) $display("time: %t | Starting SPI read at address %h | buffer = %h | Loop_limit = %d", $time, address, buffer, loop_limit);
            else $display("time: %t | Starting SPI write at address %h, with data %h | buffer = %h | Loop_limit = %d", $time, address, write_data, buffer, loop_limit);
            
            @(posedge clk);
            #spiClk_delay;
            for (i = 0; i < loop_limit; i = i+1) begin
                spi_clk = 1'b1;
                spi_miso_reg = spi_miso;
                #(SPI_CLK_PERIOD/2);
                spi_clk = 1'b0;
                if (!(i == SPI_COMMAND_WIDTH-1 && read)) begin
                    buffer = {buffer[0 +: SPI_BUFFER_WIDTH-1], spi_miso_reg};
                    //$display("time: %t | MOSI = %b | MISO = %b | buffer = %h | i = %d", $time, spi_mosi, spi_miso_reg, buffer, i);
                end
                else $display("time: %t | Stalling buffer operation | i = %d", $time, i);
                #(SPI_CLK_PERIOD/2);
            end
            
            read_data = buffer[0 +: DATA_WIDTH];
            spi_cs_n = 1'b1;
        end
    endtask
    
    initial begin
        clk = 1'b1;
        reset_n = 1'b1;
        dummy = 0;
        // Set enc_data
        enc_data[0] = 32'd15;
        enc_data[1] = 32'd51;
        enc_data[2] = 32'd60;
        enc_data[3] = 32'd85;
        enc_data[4] = 32'd7;
        enc_data[5] = 32'd179;
        enc_data[6] = 32'd124;
        enc_data[7] = 32'd117;
        
        // Set valid_data
        valid_data[0] = 32'd1;
        valid_data[1] = 32'd2;
        valid_data[2] = 32'd3;
        valid_data[3] = 32'd4;
        valid_data[4] = 32'd1;
        valid_data[5] = 32'd2;
        valid_data[6] = 32'd3;
        valid_data[7] = 32'd4;
        
        // Set dec_data
        for (j = 0; j < SAMPLE_LIMIT; j = j+1) begin
            dec_data[j] = 0;
        end
        
        // Assert reset
        @(negedge clk);
        reset_n = 1'b0;
        #(SYS_CLK_PERIOD);
        reset_n = 1'b1;
    end
    
    always #(SYS_CLK_PERIOD/2) clk = ~clk;
    
    initial begin
        repeat (4) begin
            spi_clk = 1'b1;
            #(SPI_CLK_PERIOD/2);
            spi_clk = 1'b0;
            #(SPI_CLK_PERIOD/2);
        end
        
        repeat (2) #(SYS_CLK_PERIOD);
        
        // Set control register
        spi_interface(1'b0, 32'd0, 32'h00000032, spi_clk_delay, dummy);
        #(SYS_CLK_PERIOD*2);
        for (j = 0; j < RUN_LIMIT; j = j+1) begin
            // Write to decoder input reg
            spi_interface(1'b0, 32'd2, enc_data[j], spi_clk_delay, dummy);
            #(SYS_CLK_PERIOD*2);
            //repeat (2) @(posedge clk);
            // Read from decoder output reg
            spi_interface(1'b1, 32'd3, dummy, spi_clk_delay, dec_data[j]);
            $display("time: %t | Read_data = %h", $time, dec_data[j]);
            // Validate results
            if (dec_data[j] != valid_data[j]) begin
                $display("time: %t | Sample %d result failed | expected = %h ; got = %h", $time, j, valid_data[j], dec_data[j]);
            end
            spi_clk_delay = spi_clk_delay + spi_clk_delay_step;
            if (spi_clk_delay >= SYS_CLK_PERIOD) spi_clk_delay = 0.0;
            #(SYS_CLK_PERIOD*2);
            //repeat (2) @(posedge clk);
        end
        
        #(SYS_CLK_PERIOD*4);
        $finish;
    end
    
endmodule
