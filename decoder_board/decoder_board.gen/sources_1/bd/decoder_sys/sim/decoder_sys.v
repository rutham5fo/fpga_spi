//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
//Date        : Mon Jul 17 13:37:24 2023
//Host        : LAPTOP-SRGHD2GT running 64-bit major release  (build 9200)
//Command     : generate_target decoder_sys.bd
//Design      : decoder_sys
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "decoder_sys,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=decoder_sys,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=2,numReposBlks=2,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Global}" *) (* HW_HANDOFF = "decoder_sys.hwdef" *) 
module decoder_sys
   (dec_clk_locked,
    dec_miso,
    dec_mosi,
    dec_reset_n,
    dec_spi_clk,
    dec_spi_cs_n,
    dec_sys_clk,
    dec_sys_resetn,
    errors_corrected);
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.DEC_CLK_LOCKED DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.DEC_CLK_LOCKED, LAYERED_METADATA undef" *) output dec_clk_locked;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.DEC_MISO DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.DEC_MISO, LAYERED_METADATA undef" *) output dec_miso;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.DEC_MOSI DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.DEC_MOSI, LAYERED_METADATA undef" *) input dec_mosi;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.DEC_RESET_N RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.DEC_RESET_N, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input dec_reset_n;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.DEC_SPI_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.DEC_SPI_CLK, CLK_DOMAIN decoder_sys_dec_spi_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input dec_spi_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.DEC_SPI_CS_N DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.DEC_SPI_CS_N, LAYERED_METADATA undef" *) input dec_spi_cs_n;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.DEC_SYS_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.DEC_SYS_CLK, CLK_DOMAIN decoder_sys_dec_sys_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input dec_sys_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.DEC_SYS_RESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.DEC_SYS_RESETN, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input dec_sys_resetn;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ERRORS_CORRECTED DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ERRORS_CORRECTED, LAYERED_METADATA undef" *) output [3:0]errors_corrected;

  wire Net;
  wire clk_wiz_0_decoder;
  wire clk_wiz_0_locked;
  wire dec_mosi_1;
  wire dec_spi_clk_1;
  wire dec_spi_cs_n_1;
  wire dec_sys_clk_1;
  wire dec_sys_resetn_1;
  wire [3:0]decoder_top_v3_0_errors_corrected;
  wire decoder_top_v3_0_spi_miso;

  assign Net = dec_reset_n;
  assign dec_clk_locked = clk_wiz_0_locked;
  assign dec_miso = decoder_top_v3_0_spi_miso;
  assign dec_mosi_1 = dec_mosi;
  assign dec_spi_clk_1 = dec_spi_clk;
  assign dec_spi_cs_n_1 = dec_spi_cs_n;
  assign dec_sys_clk_1 = dec_sys_clk;
  assign dec_sys_resetn_1 = dec_sys_resetn;
  assign errors_corrected[3:0] = decoder_top_v3_0_errors_corrected;
  decoder_sys_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(dec_sys_clk_1),
        .decoder(clk_wiz_0_decoder),
        .locked(clk_wiz_0_locked),
        .reset(dec_sys_resetn_1));
  decoder_sys_decoder_top_v3_0_0 decoder_top_v3_0
       (.clk(clk_wiz_0_decoder),
        .errors_corrected(decoder_top_v3_0_errors_corrected),
        .reset_n(Net),
        .spi_clk_ext(dec_spi_clk_1),
        .spi_cs_n(dec_spi_cs_n_1),
        .spi_miso(decoder_top_v3_0_spi_miso),
        .spi_mosi(dec_mosi_1));
endmodule
