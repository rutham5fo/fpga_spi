//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
//Date        : Fri Jul 14 14:30:27 2023
//Host        : LAPTOP-SRGHD2GT running 64-bit major release  (build 9200)
//Command     : generate_target encoder_decoder_sim.bd
//Design      : encoder_decoder_sim
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "encoder_decoder_sim,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=encoder_decoder_sim,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=4,numReposBlks=4,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Global}" *) (* HW_HANDOFF = "encoder_decoder_sim.hwdef" *) 
module encoder_decoder_sim
   (errors_corrected,
    reset_n,
    sys_clk);
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ERRORS_CORRECTED DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ERRORS_CORRECTED, LAYERED_METADATA undef" *) output [3:0]errors_corrected;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET_N RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET_N, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input reset_n;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.SYS_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.SYS_CLK, CLK_DOMAIN encoder_decoder_sim_sys_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input sys_clk;

  wire axi_spi_interface_0_axi_spi_cs_n;
  wire axi_spi_interface_0_axi_spi_mosi;
  wire axi_spi_interface_0_axi_spi_sclk;
  wire axi_spi_interface_0_spi_slave_reset_n;
  wire [31:0]axi_vip_0_M_AXI_ARADDR;
  wire [2:0]axi_vip_0_M_AXI_ARPROT;
  wire axi_vip_0_M_AXI_ARREADY;
  wire axi_vip_0_M_AXI_ARVALID;
  wire [31:0]axi_vip_0_M_AXI_AWADDR;
  wire [2:0]axi_vip_0_M_AXI_AWPROT;
  wire axi_vip_0_M_AXI_AWREADY;
  wire axi_vip_0_M_AXI_AWVALID;
  wire axi_vip_0_M_AXI_BREADY;
  wire [1:0]axi_vip_0_M_AXI_BRESP;
  wire axi_vip_0_M_AXI_BVALID;
  wire [31:0]axi_vip_0_M_AXI_RDATA;
  wire axi_vip_0_M_AXI_RREADY;
  wire [1:0]axi_vip_0_M_AXI_RRESP;
  wire axi_vip_0_M_AXI_RVALID;
  wire [31:0]axi_vip_0_M_AXI_WDATA;
  wire axi_vip_0_M_AXI_WREADY;
  wire [3:0]axi_vip_0_M_AXI_WSTRB;
  wire axi_vip_0_M_AXI_WVALID;
  wire clk_wiz_0_clk_out3;
  wire clk_wiz_0_decoder;
  wire clk_wiz_0_locked;
  wire clk_wiz_0_master_0;
  wire clk_wiz_0_master_180;
  wire clk_wiz_0_master_fb;
  wire [3:0]decoder_top_v3_0_errors_corrected;
  wire decoder_top_v3_0_spi_miso;
  wire reset_n_1;
  wire sys_clk_1;

  assign errors_corrected[3:0] = decoder_top_v3_0_errors_corrected;
  assign reset_n_1 = reset_n;
  assign sys_clk_1 = sys_clk;
  encoder_decoder_sim_axi_spi_interface_0_0 axi_spi_interface_0
       (.axi_spi_cs_n(axi_spi_interface_0_axi_spi_cs_n),
        .axi_spi_miso(decoder_top_v3_0_spi_miso),
        .axi_spi_mosi(axi_spi_interface_0_axi_spi_mosi),
        .axi_spi_sclk(axi_spi_interface_0_axi_spi_sclk),
        .gen_spi_clk_0(clk_wiz_0_master_0),
        .gen_spi_clk_180(clk_wiz_0_master_180),
        .gen_spi_clk_fb_0(clk_wiz_0_master_fb),
        .gen_spi_clk_locked(clk_wiz_0_locked),
        .s00_axi_aclk(clk_wiz_0_clk_out3),
        .s00_axi_araddr(axi_vip_0_M_AXI_ARADDR[3:0]),
        .s00_axi_aresetn(reset_n_1),
        .s00_axi_arprot(axi_vip_0_M_AXI_ARPROT),
        .s00_axi_arready(axi_vip_0_M_AXI_ARREADY),
        .s00_axi_arvalid(axi_vip_0_M_AXI_ARVALID),
        .s00_axi_awaddr(axi_vip_0_M_AXI_AWADDR[3:0]),
        .s00_axi_awprot(axi_vip_0_M_AXI_AWPROT),
        .s00_axi_awready(axi_vip_0_M_AXI_AWREADY),
        .s00_axi_awvalid(axi_vip_0_M_AXI_AWVALID),
        .s00_axi_bready(axi_vip_0_M_AXI_BREADY),
        .s00_axi_bresp(axi_vip_0_M_AXI_BRESP),
        .s00_axi_bvalid(axi_vip_0_M_AXI_BVALID),
        .s00_axi_rdata(axi_vip_0_M_AXI_RDATA),
        .s00_axi_rready(axi_vip_0_M_AXI_RREADY),
        .s00_axi_rresp(axi_vip_0_M_AXI_RRESP),
        .s00_axi_rvalid(axi_vip_0_M_AXI_RVALID),
        .s00_axi_wdata(axi_vip_0_M_AXI_WDATA),
        .s00_axi_wready(axi_vip_0_M_AXI_WREADY),
        .s00_axi_wstrb(axi_vip_0_M_AXI_WSTRB),
        .s00_axi_wvalid(axi_vip_0_M_AXI_WVALID),
        .spi_slave_reset_n(axi_spi_interface_0_spi_slave_reset_n));
  encoder_decoder_sim_axi_vip_0_0 axi_vip_0
       (.aclk(clk_wiz_0_clk_out3),
        .aresetn(reset_n_1),
        .m_axi_araddr(axi_vip_0_M_AXI_ARADDR),
        .m_axi_arprot(axi_vip_0_M_AXI_ARPROT),
        .m_axi_arready(axi_vip_0_M_AXI_ARREADY),
        .m_axi_arvalid(axi_vip_0_M_AXI_ARVALID),
        .m_axi_awaddr(axi_vip_0_M_AXI_AWADDR),
        .m_axi_awprot(axi_vip_0_M_AXI_AWPROT),
        .m_axi_awready(axi_vip_0_M_AXI_AWREADY),
        .m_axi_awvalid(axi_vip_0_M_AXI_AWVALID),
        .m_axi_bready(axi_vip_0_M_AXI_BREADY),
        .m_axi_bresp(axi_vip_0_M_AXI_BRESP),
        .m_axi_bvalid(axi_vip_0_M_AXI_BVALID),
        .m_axi_rdata(axi_vip_0_M_AXI_RDATA),
        .m_axi_rready(axi_vip_0_M_AXI_RREADY),
        .m_axi_rresp(axi_vip_0_M_AXI_RRESP),
        .m_axi_rvalid(axi_vip_0_M_AXI_RVALID),
        .m_axi_wdata(axi_vip_0_M_AXI_WDATA),
        .m_axi_wready(axi_vip_0_M_AXI_WREADY),
        .m_axi_wstrb(axi_vip_0_M_AXI_WSTRB),
        .m_axi_wvalid(axi_vip_0_M_AXI_WVALID));
  encoder_decoder_sim_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(sys_clk_1),
        .decoder(clk_wiz_0_decoder),
        .encoder(clk_wiz_0_clk_out3),
        .locked(clk_wiz_0_locked),
        .master_0(clk_wiz_0_master_0),
        .master_180(clk_wiz_0_master_180),
        .master_fb(clk_wiz_0_master_fb),
        .resetn(reset_n_1));
  encoder_decoder_sim_decoder_top_v3_0_0 decoder_top_v3_0
       (.clk(clk_wiz_0_decoder),
        .errors_corrected(decoder_top_v3_0_errors_corrected),
        .reset_n(axi_spi_interface_0_spi_slave_reset_n),
        .spi_clk_ext(axi_spi_interface_0_axi_spi_sclk),
        .spi_cs_n(axi_spi_interface_0_axi_spi_cs_n),
        .spi_miso(decoder_top_v3_0_spi_miso),
        .spi_mosi(axi_spi_interface_0_axi_spi_mosi));
endmodule
