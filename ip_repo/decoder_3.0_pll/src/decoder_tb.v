`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 09:17:41 PM
// Design Name: 
// Module Name: decoder_tb
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


module decoder_tb();
    parameter integer DATA_WIDTH = 32;
    parameter integer SPI_RD_ADDR_WIDTH = 4;
    parameter integer SPI_WR_ADDR_WIDTH = 4;
    parameter integer NUM_REGS_PER_BANK = 16;
    parameter integer CTRL_REG_NUM = 1;
    parameter integer STAT_REG_NUM = 0;
    parameter integer SPI_CLK_SCALE = 1;
    parameter integer SYS_CLK_PERIOD = 10;
    parameter integer SPI_CLK_PERIOD = (SPI_CLK_SCALE*2) * SYS_CLK_PERIOD;
    parameter integer MAX_ERROR_COUNT = 15;
    parameter integer ERROR_COUNT_WIDTH = $clog2(MAX_ERROR_COUNT);
    parameter integer REG_BANK_ADDR_WIDTH = $clog2(NUM_REGS_PER_BANK);
    
    parameter integer SPI_BUFFER_WIDTH = SPI_RD_ADDR_WIDTH + SPI_WR_ADDR_WIDTH + DATA_WIDTH;
    
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
        .SPI_RD_ADDR_WIDTH(SPI_RD_ADDR_WIDTH),
        .SPI_WR_ADDR_WIDTH(SPI_WR_ADDR_WIDTH),
        .NUM_REGS_PER_BANK(NUM_REGS_PER_BANK),
        .CTRL_REG_NUM(CTRL_REG_NUM),
        .STAT_REG_NUM(STAT_REG_NUM),
        .MAX_ERROR_COUNT(MAX_ERROR_COUNT)
    ) decoder_inst (
        .reset_n(reset_n),
        .clk(clk),
        .spi_clk(spi_clk),
        .spi_cs_n(spi_cs_n),
        .spi_mosi(spi_mosi),
        
        .spi_miso(spi_miso),
        .errors_corrected(errors_corrected)
    );
    
    task master_spi (
            input   [SPI_RD_ADDR_WIDTH-1:0] rd_address,
            input   [SPI_WR_ADDR_WIDTH-1:0] wr_address,
            input   [DATA_WIDTH-1:0]        write_data,
            input   real                    spiClk_delay,
            
            output  [DATA_WIDTH-1:0]        read_data
        );
        begin
            loop_limit = SPI_BUFFER_WIDTH;
            
            @(posedge clk);
            buffer = {rd_address, wr_address, write_data};
            spi_cs_n = 1'b0;
            #(SPI_CLK_PERIOD/2);
            
            $display("time: %t | Starting SPI read at address %h, write at address %h, with data %h | buffer = %h | Loop_limit = %d", $time, rd_address, wr_address, write_data, buffer, loop_limit);
            
            @(posedge clk);
            #spiClk_delay;
            for (i = 0; i < loop_limit; i = i+1) begin
                spi_clk = 1'b1;
                spi_miso_reg = spi_miso;
                #(SPI_CLK_PERIOD/2);
                spi_clk = 1'b0;
                buffer = {buffer[0 +: SPI_BUFFER_WIDTH-1], spi_miso_reg};
                //$display("time: %t | MOSI = %b | MISO = %b | buffer = %h | i = %d", $time, spi_mosi, spi_miso_reg, buffer, i);
                #(SPI_CLK_PERIOD/2);
            end
            
            read_data = buffer[0 +: DATA_WIDTH];
            spi_cs_n = 1'b1;
        end
    endtask
    
    initial begin
        clk = 1'b1;
        reset_n = 1'b1;
        spi_cs_n = 1'b1;
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
        master_spi(4'd0, 4'd1, 32'h00000032, spi_clk_delay, dummy);
        #(SYS_CLK_PERIOD*2);
        master_spi(4'd1, 4'd0, 32'h0, spi_clk_delay, dummy);
        #(SYS_CLK_PERIOD*2);
        $display("time: %t | Read_data = %h", $time, dummy);
        /*
        for (j = 0; j <= RUN_LIMIT; j = j+1) begin
            // Writes and Reads happen simultaneously
            if (j == 0) master_spi(4'd3, 4'd2, enc_data[j], spi_clk_delay, dummy);
            else if (j == RUN_LIMIT) master_spi(4'd3, 4'd2, dummy, spi_clk_delay, dec_data[j-1]);
            else master_spi(4'd3, 4'd2, enc_data[j], spi_clk_delay, dec_data[j-1]);
            #(SYS_CLK_PERIOD*2);
            $display("time: %t | Read_data = %h", $time, (j == 0) ? dummy : dec_data[j-1]);
            // Validate results
            if (j != 0 && dec_data[j-1] != valid_data[j-1]) begin
                $display("time: %t | Sample %d result failed | expected = %h ; got = %h", $time, j, valid_data[j], dec_data[j]);
            end
            spi_clk_delay = spi_clk_delay + spi_clk_delay_step;
            if (spi_clk_delay >= SYS_CLK_PERIOD) spi_clk_delay = 0.0;
            #(SYS_CLK_PERIOD*2);
        end
        */
        #(SYS_CLK_PERIOD*4);
        $finish;
    end
    
endmodule
