-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
-- Date        : Tue Sep 26 13:23:02 2023
-- Host        : LAPTOP-SRGHD2GT running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/91988/Documents/Amruth/Files/EAS/hls_accel/encoder_board_zedtest/encoder_board_zedtest.gen/sources_1/bd/encoder_system/ip/encoder_system_axi_spi_interface_0_0/encoder_system_axi_spi_interface_0_0_stub.vhdl
-- Design      : encoder_system_axi_spi_interface_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity encoder_system_axi_spi_interface_0_0 is
  Port ( 
    gen_spi_clk_0 : in STD_LOGIC;
    gen_spi_clk_180 : in STD_LOGIC;
    gen_spi_clk_fb_0 : in STD_LOGIC;
    gen_spi_clk_locked : in STD_LOGIC;
    axi_spi_miso : in STD_LOGIC;
    axi_spi_mosi : out STD_LOGIC;
    axi_spi_sclk : out STD_LOGIC;
    axi_spi_cs_n : out STD_LOGIC;
    spi_slave_reset_n : out STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_awready : out STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_rready : in STD_LOGIC
  );

end encoder_system_axi_spi_interface_0_0;

architecture stub of encoder_system_axi_spi_interface_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "gen_spi_clk_0,gen_spi_clk_180,gen_spi_clk_fb_0,gen_spi_clk_locked,axi_spi_miso,axi_spi_mosi,axi_spi_sclk,axi_spi_cs_n,spi_slave_reset_n,s00_axi_aclk,s00_axi_aresetn,s00_axi_awaddr[3:0],s00_axi_awprot[2:0],s00_axi_awvalid,s00_axi_awready,s00_axi_wdata[31:0],s00_axi_wstrb[3:0],s00_axi_wvalid,s00_axi_wready,s00_axi_bresp[1:0],s00_axi_bvalid,s00_axi_bready,s00_axi_araddr[3:0],s00_axi_arprot[2:0],s00_axi_arvalid,s00_axi_arready,s00_axi_rdata[31:0],s00_axi_rresp[1:0],s00_axi_rvalid,s00_axi_rready";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "axi_spi_interface_v1_0,Vivado 2022.1";
begin
end;
