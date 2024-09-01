//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
//Date        : Thu Jul  6 13:06:20 2023
//Host        : LAPTOP-SRGHD2GT running 64-bit major release  (build 9200)
//Command     : generate_target encoder_decoder_sim_wrapper.bd
//Design      : encoder_decoder_sim_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module encoder_decoder_sim_wrapper
   (decoder_clk,
    encoder_clk,
    encoder_reset,
    errors_corrected,
    locked,
    spi_clk_fb);
  input decoder_clk;
  input encoder_clk;
  input encoder_reset;
  output [3:0]errors_corrected;
  output locked;
  output spi_clk_fb;

  wire decoder_clk;
  wire encoder_clk;
  wire encoder_reset;
  wire [3:0]errors_corrected;
  wire locked;
  wire spi_clk_fb;

  encoder_decoder_sim encoder_decoder_sim_i
       (.decoder_clk(decoder_clk),
        .encoder_clk(encoder_clk),
        .encoder_reset(encoder_reset),
        .errors_corrected(errors_corrected),
        .locked(locked),
        .spi_clk_fb(spi_clk_fb));
endmodule
