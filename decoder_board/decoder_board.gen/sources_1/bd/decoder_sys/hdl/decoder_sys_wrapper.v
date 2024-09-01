//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
//Date        : Mon Jul 17 13:37:24 2023
//Host        : LAPTOP-SRGHD2GT running 64-bit major release  (build 9200)
//Command     : generate_target decoder_sys_wrapper.bd
//Design      : decoder_sys_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decoder_sys_wrapper
   (dec_clk_locked,
    dec_miso,
    dec_mosi,
    dec_reset_n,
    dec_spi_clk,
    dec_spi_cs_n,
    dec_sys_clk,
    dec_sys_resetn,
    errors_corrected);
  output dec_clk_locked;
  output dec_miso;
  input dec_mosi;
  input dec_reset_n;
  input dec_spi_clk;
  input dec_spi_cs_n;
  input dec_sys_clk;
  input dec_sys_resetn;
  output [3:0]errors_corrected;

  wire dec_clk_locked;
  wire dec_miso;
  wire dec_mosi;
  wire dec_reset_n;
  wire dec_spi_clk;
  wire dec_spi_cs_n;
  wire dec_sys_clk;
  wire dec_sys_resetn;
  wire [3:0]errors_corrected;

  decoder_sys decoder_sys_i
       (.dec_clk_locked(dec_clk_locked),
        .dec_miso(dec_miso),
        .dec_mosi(dec_mosi),
        .dec_reset_n(dec_reset_n),
        .dec_spi_clk(dec_spi_clk),
        .dec_spi_cs_n(dec_spi_cs_n),
        .dec_sys_clk(dec_sys_clk),
        .dec_sys_resetn(dec_sys_resetn),
        .errors_corrected(errors_corrected));
endmodule
