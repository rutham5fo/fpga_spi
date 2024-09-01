//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
//Date        : Mon Jul 17 13:42:31 2023
//Host        : LAPTOP-SRGHD2GT running 64-bit major release  (build 9200)
//Command     : generate_target encoder_decoder_sim_wrapper.bd
//Design      : encoder_decoder_sim_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module encoder_decoder_sim_wrapper
   (errors_corrected,
    reset_n,
    sys_clk);
  output [3:0]errors_corrected;
  input reset_n;
  input sys_clk;

  wire [3:0]errors_corrected;
  wire reset_n;
  wire sys_clk;

  encoder_decoder_sim encoder_decoder_sim_i
       (.errors_corrected(errors_corrected),
        .reset_n(reset_n),
        .sys_clk(sys_clk));
endmodule
