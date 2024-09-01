
`timescale 1 ns / 1 ps

	module axi_spi_interface_v1_0 #
	(
		// Users to add parameters here
        parameter integer SPI_RD_ADDR_WIDTH = 4,
        parameter integer SPI_WR_ADDR_WIDTH = 4,
        parameter integer SPI_INIT_INTERVAL = 2,
        parameter integer SPI_EXIT_INTERVAL = 1,
        parameter integer SPI_CLK_FB_DELAY_WIDTH = 3,
        parameter integer SPI_DUMMY_BITS = 0,
        parameter integer SPI_SHIFT_IN_COMP = 0,
		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S00_AXI
		parameter integer C_S00_AXI_DATA_WIDTH	= 32,
		parameter integer C_S00_AXI_ADDR_WIDTH	= 4
	)
	(
		// Users to add ports here
		                            input wire gen_spi_clk_0,
		                            input wire gen_spi_clk_180,
		                            input wire gen_spi_clk_fb_0,
		                            //input wire gen_spi_clk_fb_180,
		                            input wire gen_spi_clk_locked,
                                    input wire axi_spi_miso,
                                    output wire axi_spi_mosi,
                                    output wire axi_spi_sclk,
                                    output wire axi_spi_cs_n,
                                    output wire spi_slave_reset_n,
                                    output wire spi_clk_en_ext,
		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface S00_AXI
		input wire  s00_axi_aclk,
		input wire  s00_axi_aresetn,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_awaddr,
		input wire [2 : 0] s00_axi_awprot,
		input wire  s00_axi_awvalid,
		output wire  s00_axi_awready,
		input wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_wdata,
		input wire [(C_S00_AXI_DATA_WIDTH/8)-1 : 0] s00_axi_wstrb,
		input wire  s00_axi_wvalid,
		output wire  s00_axi_wready,
		output wire [1 : 0] s00_axi_bresp,
		output wire  s00_axi_bvalid,
		input wire  s00_axi_bready,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_araddr,
		input wire [2 : 0] s00_axi_arprot,
		input wire  s00_axi_arvalid,
		output wire  s00_axi_arready,
		output wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_rdata,
		output wire [1 : 0] s00_axi_rresp,
		output wire  s00_axi_rvalid,
		input wire  s00_axi_rready
	);
	
	wire busy;
    wire [C_S00_AXI_DATA_WIDTH-1 : 0] read_data;
    wire reset_n;
    wire start;
    wire free_spi_clk;
    wire [SPI_RD_ADDR_WIDTH-1 : 0] rd_address;
    wire [SPI_WR_ADDR_WIDTH-1 : 0] wr_address;
    wire [C_S00_AXI_DATA_WIDTH-1 : 0] write_data;
    wire [SPI_CLK_FB_DELAY_WIDTH-1:0] fb_sclk_delay_val;
        
    assign spi_slave_reset_n = reset_n;
        
// Instantiation of Axi Bus Interface S00_AXI
	axi_spi_interface_v1_0_S00_AXI # ( 
	    .SPI_RD_ADDR_WIDTH(SPI_RD_ADDR_WIDTH),
	    .SPI_WR_ADDR_WIDTH(SPI_WR_ADDR_WIDTH),
	    .SPI_CLK_FB_DELAY_WIDTH(SPI_CLK_FB_DELAY_WIDTH),
		.C_S_AXI_DATA_WIDTH(C_S00_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S00_AXI_ADDR_WIDTH)
	) axi_spi_interface_v1_0_S00_AXI_inst (
	    .busy(busy),
	    .fb_sclk_delay_val(fb_sclk_delay_val),
        .read_data(read_data),
        .reset_n(reset_n),
        .start(start),
        .free_spi_clk(free_spi_clk),
        .rd_address(rd_address),
        .wr_address(wr_address),
        .write_data(write_data),
		.S_AXI_ACLK(s00_axi_aclk),
		.S_AXI_ARESETN(s00_axi_aresetn),
		.S_AXI_AWADDR(s00_axi_awaddr),
		.S_AXI_AWPROT(s00_axi_awprot),
		.S_AXI_AWVALID(s00_axi_awvalid),
		.S_AXI_AWREADY(s00_axi_awready),
		.S_AXI_WDATA(s00_axi_wdata),
		.S_AXI_WSTRB(s00_axi_wstrb),
		.S_AXI_WVALID(s00_axi_wvalid),
		.S_AXI_WREADY(s00_axi_wready),
		.S_AXI_BRESP(s00_axi_bresp),
		.S_AXI_BVALID(s00_axi_bvalid),
		.S_AXI_BREADY(s00_axi_bready),
		.S_AXI_ARADDR(s00_axi_araddr),
		.S_AXI_ARPROT(s00_axi_arprot),
		.S_AXI_ARVALID(s00_axi_arvalid),
		.S_AXI_ARREADY(s00_axi_arready),
		.S_AXI_RDATA(s00_axi_rdata),
		.S_AXI_RRESP(s00_axi_rresp),
		.S_AXI_RVALID(s00_axi_rvalid),
		.S_AXI_RREADY(s00_axi_rready)
	);

	// Add user logic here
    spi_driver #(
        .SPI_DATA_WIDTH(C_S00_AXI_DATA_WIDTH),
        .SPI_RD_ADDR_WIDTH(SPI_RD_ADDR_WIDTH),
        .SPI_WR_ADDR_WIDTH(SPI_WR_ADDR_WIDTH),
        .SPI_INIT_INTERVAL_VAL(SPI_INIT_INTERVAL),
        .SPI_EXIT_INTERVAL_VAL(SPI_EXIT_INTERVAL),
        .SPI_CLK_FB_DELAY_WIDTH(SPI_CLK_FB_DELAY_WIDTH),
        .SPI_DUMMY_BITS(SPI_DUMMY_BITS),
        .SPI_SHIFT_IN_COMP(SPI_SHIFT_IN_COMP)
    ) spi_driver_i(
        .reset_n(reset_n),
        .clk(s00_axi_aclk),
        .gen_spi_clk_0(gen_spi_clk_0),
        .gen_spi_clk_180(gen_spi_clk_180),
        .gen_spi_clk_fb_0(gen_spi_clk_fb_0),
        //.gen_spi_clk_fb_180(gen_spi_clk_fb_180),
        .gen_spi_clk_locked(gen_spi_clk_locked),
        .free_spi_clk_en(free_spi_clk),
        .start(start),
        .fb_sclk_delay_val(fb_sclk_delay_val),
        .rd_address(rd_address),
        .wr_address(wr_address),
        .write_data(write_data),
        .spi_miso(axi_spi_miso),
                
        .busy(busy),
        .read_data(read_data),
        .spi_clk_en_ext(spi_clk_en_ext),
        .spi_clk(axi_spi_sclk),
        .spi_cs_n(axi_spi_cs_n),
        .spi_mosi(axi_spi_mosi)
    );
	// User logic ends

	endmodule
