// (c) Copyright 1995-2023 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:user:decoder_top_v3:3.0
// IP Revision: 84

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "package_project" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module encoder_decoder_sim_decoder_top_v3_0_0 (
  reset_n,
  clk,
  spi_clk,
  spi_cs_n,
  spi_mosi,
  spi_miso,
  spi_clk_fb,
  errors_corrected
);

input wire reset_n;
input wire clk;
input wire spi_clk;
input wire spi_cs_n;
input wire spi_mosi;
output wire spi_miso;
output wire spi_clk_fb;
output wire [3 : 0] errors_corrected;

  decoder_top #(
    .DATA_WIDTH(32),
    .SPI_RD_ADDR_WIDTH(5),
    .SPI_WR_ADDR_WIDTH(4),
    .NUM_REGS_PER_BANK(16),
    .CTRL_REG_NUM(1),
    .STAT_REG_NUM(0),
    .MAX_ERROR_COUNT(15),
    .ERROR_COUNT_WIDTH(4),
    .REG_BANK_ADDR_WIDTH(4),
    .SPI_PING_PONG_SIZE(4),
    .SPI_SAMPLER_SIZE(2),
    .LEDS_REG_NUM(15),
    .COMMS_DEBUG(1'B1),
    .SHIFT_OUT_COMP(0)
  ) inst (
    .reset_n(reset_n),
    .clk(clk),
    .spi_clk(spi_clk),
    .spi_cs_n(spi_cs_n),
    .spi_mosi(spi_mosi),
    .spi_miso(spi_miso),
    .spi_clk_fb(spi_clk_fb),
    .errors_corrected(errors_corrected)
  );
endmodule
