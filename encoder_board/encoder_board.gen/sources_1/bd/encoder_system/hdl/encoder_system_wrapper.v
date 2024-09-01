//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
//Date        : Mon Jul 17 13:51:57 2023
//Host        : LAPTOP-SRGHD2GT running 64-bit major release  (build 9200)
//Command     : generate_target encoder_system_wrapper.bd
//Design      : encoder_system_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module encoder_system_wrapper
   (FIXED_IO_0_mio,
    FIXED_IO_0_ps_clk,
    FIXED_IO_0_ps_porb,
    FIXED_IO_0_ps_srstb,
    enc_clk_locked,
    enc_miso,
    enc_mosi,
    enc_spi_cs_n,
    enc_spi_sclk,
    enc_sys_clk,
    spi_slave_reset_n);
  inout [53:0]FIXED_IO_0_mio;
  inout FIXED_IO_0_ps_clk;
  inout FIXED_IO_0_ps_porb;
  inout FIXED_IO_0_ps_srstb;
  output enc_clk_locked;
  input enc_miso;
  output enc_mosi;
  output enc_spi_cs_n;
  output enc_spi_sclk;
  input enc_sys_clk;
  output spi_slave_reset_n;

  wire [53:0]FIXED_IO_0_mio;
  wire FIXED_IO_0_ps_clk;
  wire FIXED_IO_0_ps_porb;
  wire FIXED_IO_0_ps_srstb;
  wire enc_clk_locked;
  wire enc_miso;
  wire enc_mosi;
  wire enc_spi_cs_n;
  wire enc_spi_sclk;
  wire enc_sys_clk;
  wire spi_slave_reset_n;

  encoder_system encoder_system_i
       (.FIXED_IO_0_mio(FIXED_IO_0_mio),
        .FIXED_IO_0_ps_clk(FIXED_IO_0_ps_clk),
        .FIXED_IO_0_ps_porb(FIXED_IO_0_ps_porb),
        .FIXED_IO_0_ps_srstb(FIXED_IO_0_ps_srstb),
        .enc_clk_locked(enc_clk_locked),
        .enc_miso(enc_miso),
        .enc_mosi(enc_mosi),
        .enc_spi_cs_n(enc_spi_cs_n),
        .enc_spi_sclk(enc_spi_sclk),
        .enc_sys_clk(enc_sys_clk),
        .spi_slave_reset_n(spi_slave_reset_n));
endmodule
