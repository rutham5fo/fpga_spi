// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
// Date        : Fri Jun 23 20:06:44 2023
// Host        : LAPTOP-SRGHD2GT running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ u_ila_0_stub.v
// Design      : u_ila_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ila,Vivado 2022.1" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(clk, probe0, probe1, probe2, probe3, probe4, probe5, 
  probe6, probe7, probe8, probe9, probe10, probe11, probe12, probe13, probe14, probe15, probe16)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[3:0],probe1[31:0],probe2[1:0],probe3[1:0],probe4[31:0],probe5[3:0],probe6[3:0],probe7[3:0],probe8[3:0],probe9[3:0],probe10[5:0],probe11[3:0],probe12[0:0],probe13[0:0],probe14[0:0],probe15[0:0],probe16[0:0]" */;
  input clk;
  input [3:0]probe0;
  input [31:0]probe1;
  input [1:0]probe2;
  input [1:0]probe3;
  input [31:0]probe4;
  input [3:0]probe5;
  input [3:0]probe6;
  input [3:0]probe7;
  input [3:0]probe8;
  input [3:0]probe9;
  input [5:0]probe10;
  input [3:0]probe11;
  input [0:0]probe12;
  input [0:0]probe13;
  input [0:0]probe14;
  input [0:0]probe15;
  input [0:0]probe16;
endmodule
