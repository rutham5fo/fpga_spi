`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/16/2023 05:58:19 PM
// Design Name: 
// Module Name: axi_spi_tb_v3
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
import axi_vip_pkg::*;
import encoder_decoder_sim_axi_vip_0_0_pkg::*;

parameter SYS_CLK_PERIOD = 10;
parameter SPI_CLK_PERIOD = 80;
parameter AXI_DATA_WIDTH = 32;
parameter SPI_DATA_WIDTH = 32;
parameter SPI_RD_ADDR_WIDTH = 4;
parameter SPI_WR_ADDR_WIDTH = 4;
parameter SPI_CLK_FB_DELAY_WIDTH = 4;
parameter SAMPLE_LIMIT = 8;
parameter RUN_LIMIT = 8;

//AXI4-Lite signals
xil_axi_resp_t 	resp;
bit[AXI_DATA_WIDTH-1:0]   addr;
bit[AXI_DATA_WIDTH-1:0]   data;
bit[AXI_DATA_WIDTH-1:0]   base_addr = 32'h44a0_0000;

// -------------------------------------------------------------------------
//   AXI_SPI interface register config
// -------------------------------------------------------------------------
//      reset_n = ~slv_reg0[0];
//      start = slv_reg0[1];
//      free_spi_clk = slv_reg0[2];
//      fb_clk_delay = slv_reg0[3 +: SPI_CLK_FB_DELAY_WIDTH];
//      wr_address = slv_reg1[0 +: SPI_WR_ADDR_WIDTH];
//      rd_address = slv_reg1[SPI_WR_ADDR_WIDTH +: SPI_RD_ADDR_WIDTH];
//      write_data = slv_reg2;
//      slv_reg3 = read_data;
//      slv_reg0[32] = busy;
// --------------------------------------------------------------------------

module axi_spi_tb_v3;
    
    // Testbench signals
    reg                             sys_clk;
    reg                             reset_n;
    reg                             busy;
    reg [SPI_DATA_WIDTH-1:0]        dec_data;
    reg [SPI_DATA_WIDTH-1:0]        enc_data [0:SAMPLE_LIMIT-1];    // Buffer to hold data read from decoder
    reg [SPI_DATA_WIDTH-1:0]        valid_data [0:SAMPLE_LIMIT-1];  // Test reg_bank to keep track of decoder reg_bank changes and validate at end

    wire    [3:0]                   errors_corrected;
    wire    [SPI_RD_ADDR_WIDTH-1:0] rd_addr;
    wire    [SPI_WR_ADDR_WIDTH-1:0] wr_addr;
    
    integer                         i;
    real                            dec_clk_delay;                  // The delay between decoder and encoder system clocks
    real                            dec_clk_delay_step;             // Step size to increase decoder system clock delay (with respect to encoder sys clk).
    
    assign wr_addr = data[0 +: SPI_WR_ADDR_WIDTH];
    assign rd_addr = data[SPI_WR_ADDR_WIDTH +: SPI_RD_ADDR_WIDTH];
    
    task spi_reset ();
        begin
            // Send 0x1 to address 0x1 (slv_reg0) to reset slave_spi_interface (enc_spi_slave_reset_n is active low, so this should pull it low)
            master_agent.AXI4LITE_READ_BURST(base_addr + addr, 0, data, resp);
            addr = 32'h00;
            data = data & 32'h00000004;
            data = data | 32'h01;
            master_agent.AXI4LITE_WRITE_BURST(base_addr + addr, 0, data, resp);
            #(SPI_CLK_PERIOD);
            // Send 0x1 to address 0x0 (slv_reg0) to de-assert reset (enc_spi_slave_reset_n is active low, so this should pull it high)
            addr = 32'h00;
            data = data & 32'hfffffffe;
            master_agent.AXI4LITE_WRITE_BURST(base_addr + addr, 0, data, resp);
        end
    endtask;
    
    task spi_free_run_enable ();
        begin
            // Send 0x4 to address 0x1 (slv_reg0) to start free running spi_clk
            addr = 32'h00;
            data = 32'h04;
            master_agent.AXI4LITE_WRITE_BURST(base_addr + addr, 0, data, resp);
            // Wait for 100us to let decoder pll obtain lock on free running spi_clk
            #(1000*100);
        end
    endtask;
    
    task spi_set_fbclk_delay (
        input integer delay
    );
        begin
            addr = 32'h00;
            master_agent.AXI4LITE_READ_BURST(base_addr + addr, 0, data, resp);
            $display("time: %t | Old ctrl_reg = %h | delay_val = %d", $time, data, delay[0 +: SPI_CLK_FB_DELAY_WIDTH]);
            data = data & {{(29-SPI_CLK_FB_DELAY_WIDTH){1'b1}}, {SPI_CLK_FB_DELAY_WIDTH{1'b0}}, {3{1'b1}}};
            data = data | {{(29-SPI_CLK_FB_DELAY_WIDTH){1'b0}}, delay[0 +: SPI_CLK_FB_DELAY_WIDTH], {3{1'b0}}};
            $display("time: %t | new ctrl_reg = %h", $time, data);
            master_agent.AXI4LITE_WRITE_BURST(base_addr + addr, 0, data, resp);
        end    
    endtask
    
    task spi_transfer (
        input   [SPI_RD_ADDR_WIDTH-1:0] read_addr,
        input   [SPI_WR_ADDR_WIDTH-1:0] write_addr,
        input   [SPI_DATA_WIDTH-1:0]    write_buffer,
        //input   [SPI_DATA_WIDTH-1:0]    expected_read_data,
        
        output  [SPI_DATA_WIDTH-1:0]    read_buffer
    );
        begin
            addr = 32'h04;                                  // Write slave spi control register address to axi_spi interface slv_reg1
            data = {{16{1'b0}}, read_addr, write_addr};     // Address of control reg on spi_slave = 0x01
            master_agent.AXI4LITE_WRITE_BURST(base_addr + addr, 0, data, resp);
            addr = 32'h08;                                  // Write to write_data reg at axi slave interface (slv_reg2)
            data = write_buffer;                            // data to write through spi interface to decoder
            master_agent.AXI4LITE_WRITE_BURST(base_addr + addr, 0, data, resp);
            // Setup SPI transaction by setting start = 1 and read = 0 in axi interface control reg (slv_reg0)
            addr = 32'h00;                      // Write to axi_spi interface control reg (slv_reg0)
            master_agent.AXI4LITE_READ_BURST(base_addr + addr, 0, data, resp);
            data = data | {{30{1'b0}}, 2'b10};    // Set reset = 0, start = 1
            //data = 32'h02;                      // Set reset = 0, start = 1
            master_agent.AXI4LITE_WRITE_BURST(base_addr + addr, 0, data, resp);
            // Reset start = 0 to start SPI transaction
            addr = 32'h00;                      // Write to axi_spi interface control reg (slv_reg0)
            //master_agent.AXI4LITE_READ_BURST(base_addr + addr, 0, data, resp);
            data = data & {{30{1'b1}}, 2'b00};  // Set reset = 0, start = 0
            //data = 32'h00;                      // Set reset = 0, start = 0
            master_agent.AXI4LITE_WRITE_BURST(base_addr + addr, 0, data, resp);
            // Check busy signal by reading slv_reg0[32]
            do begin
                master_agent.AXI4LITE_READ_BURST(base_addr + addr, 0, data, resp);
                busy = data[AXI_DATA_WIDTH-1];
                //$display("time: %t | busy = %b", $time, busy);
                #(SYS_CLK_PERIOD);
            end while(busy);
            // Read data from slv_reg3 and place it on read_buffer
            addr = 32'h0c;
            master_agent.AXI4LITE_READ_BURST(base_addr + addr, 0, data, resp);
            read_buffer = data;
            // Update corresponding testbench reg_bank for validation later
            //valid_data[write_addr] = write_data;
            //valid_data[read_addr] = expected_read_data;
        end
    endtask;
    
    encoder_decoder_sim_wrapper DUT
    (
        .sys_clk(sys_clk),
        .reset_n(reset_n),
    
        .errors_corrected(errors_corrected)
    );
    
    // Declare the agent for the master VIP
    encoder_decoder_sim_axi_vip_0_0_mst_t master_agent;
    
    // Generate system clock : 100 MHz    
    always #(SYS_CLK_PERIOD/2) sys_clk = ~sys_clk;

    initial begin
        //dec_clk_delay = 0;
        //dec_clk_delay_step = 2.5;
        sys_clk = 1'b1;
        busy = 1'b0;
        
        enc_data[0] = 15;
        enc_data[1] = 51;
        enc_data[2] = 60;
        enc_data[3] = 85;
        enc_data[4] = 7;
        enc_data[5] = 179;
        enc_data[6] = 124;
        enc_data[7] = 117;
        
        // Fill up valid_data array for result validation | Data in decoder reg_bank should reflect this array
        valid_data[0] = 1;
        valid_data[1] = 2;
        valid_data[2] = 3;
        valid_data[3] = 4;
        valid_data[4] = 1;
        valid_data[5] = 2;
        valid_data[6] = 3;
        valid_data[7] = 4;
        
        //Assert and release reset
        reset_n = 1'b0;
        #(SYS_CLK_PERIOD*16)            // AXI_VIP reset is recommended to be at-least 16 cycles of the slowst system clock
        reset_n = 1'b1;
    end

    initial begin
        // Create a new agent
        master_agent = new("master VIP agent", DUT.encoder_decoder_sim_i.axi_vip_0.inst.IF);
        
        // Start the agent
        master_agent.start_master();
    
        //Wait for the reset to be released
        wait (reset_n == 1'b1);
	    #(SYS_CLK_PERIOD*2);
	    
	    //spi_reset();
	    //spi_free_run_enable();
        spi_reset();
        #(SYS_CLK_PERIOD*2);
        
        // Set spi_clk feedback delay
        //spi_set_fbclk_delay(1);
        #(SYS_CLK_PERIOD*2);
        // Setup decoder control reg by writing 0x32 -> Specifies the reg decoder read its inputs (reg 2) and writes its outputs (reg 3)
        spi_transfer(15, 15, 32'h85a5a5a5, dec_data);
        $display("time: %t | Read val = %h, from register %d", $time, dec_data, 0);
        #(SYS_CLK_PERIOD*2);
        // Set spi_clk feedback delay
        //spi_set_fbclk_delay(2);
        #(SYS_CLK_PERIOD*2);
        spi_transfer(15, 15, 32'h8c3c3c3c, dec_data);
        $display("time: %t | Read val = %h, from register %d", $time, dec_data, 1);
        #(SYS_CLK_PERIOD*2);
        if (dec_data != 32'h32) begin
            $display("time: %t | Read validation for register %d failed | read_data = %h ; valid_data = %h", $time, 1, dec_data, 32'h32);
        end
        /*
        for (i = 0; i < RUN_LIMIT+1; i = i+1) begin
            if (i == RUN_LIMIT) spi_transfer(4'd3, 4'd2, 32'd0, dec_data);
            else spi_transfer(4'd3, 4'd2, enc_data[i], dec_data);
            $display("time: %t | SAMPLE_RUN: Read val = %h, from register %d", $time, dec_data, 3);
            #(DEC_CLK_PERIOD*2);
            if (i != 0 && dec_data != valid_data[i-1]) begin
                $display("time: %t | Read validation for sample %d failed | read_data = %h ; valid_data = %h", $time, i, dec_data, valid_data[i-1]);
            end
        end
        */
        spi_transfer(4'd15, 4'd15, 32'h0, dec_data);
        $display("time: %t | Read val = %h, from register %d", $time, dec_data, 0);
        #(SYS_CLK_PERIOD*2);
        spi_transfer(4'd15, 4'd15, 32'h0, dec_data);
        $display("time: %t | Read val = %h, from register %d", $time, dec_data, 0);
        
        #(SYS_CLK_PERIOD*2);
        $finish;
    end
    
endmodule
