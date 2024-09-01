-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
-- Date        : Tue Sep 26 13:23:02 2023
-- Host        : LAPTOP-SRGHD2GT running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/91988/Documents/Amruth/Files/EAS/hls_accel/encoder_board_zedtest/encoder_board_zedtest.gen/sources_1/bd/encoder_system/ip/encoder_system_axi_spi_interface_0_0/encoder_system_axi_spi_interface_0_0_sim_netlist.vhdl
-- Design      : encoder_system_axi_spi_interface_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity encoder_system_axi_spi_interface_0_0_axi_spi_interface_v1_0_S00_AXI is
  port (
    s00_axi_awready : out STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_rvalid : out STD_LOGIC;
    R0 : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 6 downto 0 );
    spi_slave_reset_n : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 39 downto 0 );
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_aclk : in STD_LOGIC;
    spi_clk_en_reg : in STD_LOGIC;
    \axi_rdata_reg[31]_0\ : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_rready : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    \slv_reg0_reg[31]_0\ : in STD_LOGIC;
    \slv_reg0_reg[31]_1\ : in STD_LOGIC;
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of encoder_system_axi_spi_interface_0_0_axi_spi_interface_v1_0_S00_AXI : entity is "axi_spi_interface_v1_0_S00_AXI";
end encoder_system_axi_spi_interface_0_0_axi_spi_interface_v1_0_S00_AXI;

architecture STRUCTURE of encoder_system_axi_spi_interface_0_0_axi_spi_interface_v1_0_S00_AXI is
  signal \^d\ : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal \^q\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal aw_en_i_1_n_0 : STD_LOGIC;
  signal aw_en_reg_n_0 : STD_LOGIC;
  signal axi_araddr : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \axi_araddr[2]_i_1_n_0\ : STD_LOGIC;
  signal \axi_araddr[3]_i_1_n_0\ : STD_LOGIC;
  signal axi_arready0 : STD_LOGIC;
  signal \axi_awaddr[2]_i_1_n_0\ : STD_LOGIC;
  signal \axi_awaddr[3]_i_1_n_0\ : STD_LOGIC;
  signal axi_awready0 : STD_LOGIC;
  signal axi_awready_i_1_n_0 : STD_LOGIC;
  signal axi_bvalid_i_1_n_0 : STD_LOGIC;
  signal axi_rvalid_i_1_n_0 : STD_LOGIC;
  signal axi_wready0 : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal p_1_in : STD_LOGIC_VECTOR ( 30 downto 0 );
  signal reg_data_out : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^s00_axi_arready\ : STD_LOGIC;
  signal \^s00_axi_awready\ : STD_LOGIC;
  signal \^s00_axi_bvalid\ : STD_LOGIC;
  signal \^s00_axi_rvalid\ : STD_LOGIC;
  signal \^s00_axi_wready\ : STD_LOGIC;
  signal \slv_reg0[31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg0[31]_i_3_n_0\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[10]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[11]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[12]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[13]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[14]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[15]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[16]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[17]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[18]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[19]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[20]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[21]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[22]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[23]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[24]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[25]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[26]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[27]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[28]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[29]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[30]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[31]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[7]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[8]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[9]\ : STD_LOGIC;
  signal slv_reg1 : STD_LOGIC_VECTOR ( 31 downto 8 );
  signal \slv_reg1[15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg1[23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg1[31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg1[7]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg2[15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg2[23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg2[31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg2[7]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg_rden__0\ : STD_LOGIC;
  signal \slv_reg_wren__0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of axi_arready_i_1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of axi_rvalid_i_1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of axi_wready_i_1 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \slv_reg0[30]_i_2\ : label is "soft_lutpair1";
begin
  D(39 downto 0) <= \^d\(39 downto 0);
  Q(6 downto 0) <= \^q\(6 downto 0);
  s00_axi_arready <= \^s00_axi_arready\;
  s00_axi_awready <= \^s00_axi_awready\;
  s00_axi_bvalid <= \^s00_axi_bvalid\;
  s00_axi_rvalid <= \^s00_axi_rvalid\;
  s00_axi_wready <= \^s00_axi_wready\;
ODDR_inst_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(2),
      I1 => spi_clk_en_reg,
      O => R0
    );
aw_en_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7FFC4CCC4CCC4CC"
    )
        port map (
      I0 => s00_axi_awvalid,
      I1 => aw_en_reg_n_0,
      I2 => \^s00_axi_awready\,
      I3 => s00_axi_wvalid,
      I4 => s00_axi_bready,
      I5 => \^s00_axi_bvalid\,
      O => aw_en_i_1_n_0
    );
aw_en_reg: unisim.vcomponents.FDSE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => aw_en_i_1_n_0,
      Q => aw_en_reg_n_0,
      S => axi_awready_i_1_n_0
    );
\axi_araddr[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => s00_axi_araddr(0),
      I1 => s00_axi_arvalid,
      I2 => \^s00_axi_arready\,
      I3 => axi_araddr(2),
      O => \axi_araddr[2]_i_1_n_0\
    );
\axi_araddr[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => s00_axi_araddr(1),
      I1 => s00_axi_arvalid,
      I2 => \^s00_axi_arready\,
      I3 => axi_araddr(3),
      O => \axi_araddr[3]_i_1_n_0\
    );
\axi_araddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_araddr[2]_i_1_n_0\,
      Q => axi_araddr(2),
      R => axi_awready_i_1_n_0
    );
\axi_araddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_araddr[3]_i_1_n_0\,
      Q => axi_araddr(3),
      R => axi_awready_i_1_n_0
    );
axi_arready_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => s00_axi_arvalid,
      I1 => \^s00_axi_arready\,
      O => axi_arready0
    );
axi_arready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_arready0,
      Q => \^s00_axi_arready\,
      R => axi_awready_i_1_n_0
    );
\axi_awaddr[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBFFFFFF08000000"
    )
        port map (
      I0 => s00_axi_awaddr(0),
      I1 => s00_axi_wvalid,
      I2 => \^s00_axi_awready\,
      I3 => aw_en_reg_n_0,
      I4 => s00_axi_awvalid,
      I5 => p_0_in(0),
      O => \axi_awaddr[2]_i_1_n_0\
    );
\axi_awaddr[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBFFFFFF08000000"
    )
        port map (
      I0 => s00_axi_awaddr(1),
      I1 => s00_axi_wvalid,
      I2 => \^s00_axi_awready\,
      I3 => aw_en_reg_n_0,
      I4 => s00_axi_awvalid,
      I5 => p_0_in(1),
      O => \axi_awaddr[3]_i_1_n_0\
    );
\axi_awaddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_awaddr[2]_i_1_n_0\,
      Q => p_0_in(0),
      R => axi_awready_i_1_n_0
    );
\axi_awaddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_awaddr[3]_i_1_n_0\,
      Q => p_0_in(1),
      R => axi_awready_i_1_n_0
    );
axi_awready_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s00_axi_aresetn,
      O => axi_awready_i_1_n_0
    );
axi_awready_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \^s00_axi_awready\,
      I2 => aw_en_reg_n_0,
      I3 => s00_axi_awvalid,
      O => axi_awready0
    );
axi_awready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_awready0,
      Q => \^s00_axi_awready\,
      R => axi_awready_i_1_n_0
    );
axi_bvalid_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFF80008000"
    )
        port map (
      I0 => s00_axi_awvalid,
      I1 => s00_axi_wvalid,
      I2 => \^s00_axi_awready\,
      I3 => \^s00_axi_wready\,
      I4 => s00_axi_bready,
      I5 => \^s00_axi_bvalid\,
      O => axi_bvalid_i_1_n_0
    );
axi_bvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_bvalid_i_1_n_0,
      Q => \^s00_axi_bvalid\,
      R => axi_awready_i_1_n_0
    );
\axi_rdata[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCAAF000CCAAF0"
    )
        port map (
      I0 => \^d\(32),
      I1 => \^d\(0),
      I2 => \^q\(0),
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => \axi_rdata_reg[31]_0\(0),
      O => reg_data_out(0)
    );
\axi_rdata[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => \slv_reg0_reg_n_0_[10]\,
      I1 => slv_reg1(10),
      I2 => \^d\(10),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \axi_rdata_reg[31]_0\(10),
      O => reg_data_out(10)
    );
\axi_rdata[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0FFCCAAF000CCAA"
    )
        port map (
      I0 => \slv_reg0_reg_n_0_[11]\,
      I1 => slv_reg1(11),
      I2 => \axi_rdata_reg[31]_0\(11),
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => \^d\(11),
      O => reg_data_out(11)
    );
\axi_rdata[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => slv_reg1(12),
      I1 => \axi_rdata_reg[31]_0\(12),
      I2 => \slv_reg0_reg_n_0_[12]\,
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => \^d\(12),
      O => reg_data_out(12)
    );
\axi_rdata[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => \slv_reg0_reg_n_0_[13]\,
      I1 => slv_reg1(13),
      I2 => \^d\(13),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \axi_rdata_reg[31]_0\(13),
      O => reg_data_out(13)
    );
\axi_rdata[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => \slv_reg0_reg_n_0_[14]\,
      I1 => slv_reg1(14),
      I2 => \^d\(14),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \axi_rdata_reg[31]_0\(14),
      O => reg_data_out(14)
    );
\axi_rdata[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0FFCCAAF000CCAA"
    )
        port map (
      I0 => \slv_reg0_reg_n_0_[15]\,
      I1 => slv_reg1(15),
      I2 => \axi_rdata_reg[31]_0\(15),
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => \^d\(15),
      O => reg_data_out(15)
    );
\axi_rdata[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCAAF000CCAAF0"
    )
        port map (
      I0 => slv_reg1(16),
      I1 => \^d\(16),
      I2 => \slv_reg0_reg_n_0_[16]\,
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => \axi_rdata_reg[31]_0\(16),
      O => reg_data_out(16)
    );
\axi_rdata[17]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => \slv_reg0_reg_n_0_[17]\,
      I1 => slv_reg1(17),
      I2 => \^d\(17),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \axi_rdata_reg[31]_0\(17),
      O => reg_data_out(17)
    );
\axi_rdata[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => \slv_reg0_reg_n_0_[18]\,
      I1 => slv_reg1(18),
      I2 => \^d\(18),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \axi_rdata_reg[31]_0\(18),
      O => reg_data_out(18)
    );
\axi_rdata[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0FFCCAAF000CCAA"
    )
        port map (
      I0 => \slv_reg0_reg_n_0_[19]\,
      I1 => slv_reg1(19),
      I2 => \axi_rdata_reg[31]_0\(19),
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => \^d\(19),
      O => reg_data_out(19)
    );
\axi_rdata[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^d\(33),
      I2 => \^d\(1),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \axi_rdata_reg[31]_0\(1),
      O => reg_data_out(1)
    );
\axi_rdata[20]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => slv_reg1(20),
      I1 => \axi_rdata_reg[31]_0\(20),
      I2 => \slv_reg0_reg_n_0_[20]\,
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => \^d\(20),
      O => reg_data_out(20)
    );
\axi_rdata[21]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => \slv_reg0_reg_n_0_[21]\,
      I1 => slv_reg1(21),
      I2 => \^d\(21),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \axi_rdata_reg[31]_0\(21),
      O => reg_data_out(21)
    );
\axi_rdata[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => \slv_reg0_reg_n_0_[22]\,
      I1 => slv_reg1(22),
      I2 => \^d\(22),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \axi_rdata_reg[31]_0\(22),
      O => reg_data_out(22)
    );
\axi_rdata[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0FFCCAAF000CCAA"
    )
        port map (
      I0 => \slv_reg0_reg_n_0_[23]\,
      I1 => slv_reg1(23),
      I2 => \axi_rdata_reg[31]_0\(23),
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => \^d\(23),
      O => reg_data_out(23)
    );
\axi_rdata[24]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCAAF000CCAAF0"
    )
        port map (
      I0 => slv_reg1(24),
      I1 => \^d\(24),
      I2 => \slv_reg0_reg_n_0_[24]\,
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => \axi_rdata_reg[31]_0\(24),
      O => reg_data_out(24)
    );
\axi_rdata[25]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => \slv_reg0_reg_n_0_[25]\,
      I1 => slv_reg1(25),
      I2 => \^d\(25),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \axi_rdata_reg[31]_0\(25),
      O => reg_data_out(25)
    );
\axi_rdata[26]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => \slv_reg0_reg_n_0_[26]\,
      I1 => slv_reg1(26),
      I2 => \^d\(26),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \axi_rdata_reg[31]_0\(26),
      O => reg_data_out(26)
    );
\axi_rdata[27]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0FFCCAAF000CCAA"
    )
        port map (
      I0 => \slv_reg0_reg_n_0_[27]\,
      I1 => slv_reg1(27),
      I2 => \axi_rdata_reg[31]_0\(27),
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => \^d\(27),
      O => reg_data_out(27)
    );
\axi_rdata[28]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => slv_reg1(28),
      I1 => \axi_rdata_reg[31]_0\(28),
      I2 => \slv_reg0_reg_n_0_[28]\,
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => \^d\(28),
      O => reg_data_out(28)
    );
\axi_rdata[29]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => \slv_reg0_reg_n_0_[29]\,
      I1 => slv_reg1(29),
      I2 => \^d\(29),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \axi_rdata_reg[31]_0\(29),
      O => reg_data_out(29)
    );
\axi_rdata[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^d\(34),
      I2 => \^d\(2),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \axi_rdata_reg[31]_0\(2),
      O => reg_data_out(2)
    );
\axi_rdata[30]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => \slv_reg0_reg_n_0_[30]\,
      I1 => slv_reg1(30),
      I2 => \^d\(30),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \axi_rdata_reg[31]_0\(30),
      O => reg_data_out(30)
    );
\axi_rdata[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => \slv_reg0_reg_n_0_[31]\,
      I1 => slv_reg1(31),
      I2 => \^d\(31),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \axi_rdata_reg[31]_0\(31),
      O => reg_data_out(31)
    );
\axi_rdata[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0FFCCAAF000CCAA"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^d\(35),
      I2 => \axi_rdata_reg[31]_0\(3),
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => \^d\(3),
      O => reg_data_out(3)
    );
\axi_rdata[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => \^d\(36),
      I1 => \axi_rdata_reg[31]_0\(4),
      I2 => \^q\(4),
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => \^d\(4),
      O => reg_data_out(4)
    );
\axi_rdata[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => \^q\(5),
      I1 => \^d\(37),
      I2 => \^d\(5),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \axi_rdata_reg[31]_0\(5),
      O => reg_data_out(5)
    );
\axi_rdata[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => \^q\(6),
      I1 => \^d\(38),
      I2 => \^d\(6),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \axi_rdata_reg[31]_0\(6),
      O => reg_data_out(6)
    );
\axi_rdata[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0FFCCAAF000CCAA"
    )
        port map (
      I0 => \slv_reg0_reg_n_0_[7]\,
      I1 => \^d\(39),
      I2 => \axi_rdata_reg[31]_0\(7),
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => \^d\(7),
      O => reg_data_out(7)
    );
\axi_rdata[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCAAF000CCAAF0"
    )
        port map (
      I0 => slv_reg1(8),
      I1 => \^d\(8),
      I2 => \slv_reg0_reg_n_0_[8]\,
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => \axi_rdata_reg[31]_0\(8),
      O => reg_data_out(8)
    );
\axi_rdata[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => \slv_reg0_reg_n_0_[9]\,
      I1 => slv_reg1(9),
      I2 => \^d\(9),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => \axi_rdata_reg[31]_0\(9),
      O => reg_data_out(9)
    );
\axi_rdata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(0),
      Q => s00_axi_rdata(0),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(10),
      Q => s00_axi_rdata(10),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(11),
      Q => s00_axi_rdata(11),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(12),
      Q => s00_axi_rdata(12),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(13),
      Q => s00_axi_rdata(13),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(14),
      Q => s00_axi_rdata(14),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(15),
      Q => s00_axi_rdata(15),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(16),
      Q => s00_axi_rdata(16),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(17),
      Q => s00_axi_rdata(17),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(18),
      Q => s00_axi_rdata(18),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(19),
      Q => s00_axi_rdata(19),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(1),
      Q => s00_axi_rdata(1),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(20),
      Q => s00_axi_rdata(20),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(21),
      Q => s00_axi_rdata(21),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(22),
      Q => s00_axi_rdata(22),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(23),
      Q => s00_axi_rdata(23),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(24),
      Q => s00_axi_rdata(24),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(25),
      Q => s00_axi_rdata(25),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(26),
      Q => s00_axi_rdata(26),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(27),
      Q => s00_axi_rdata(27),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(28),
      Q => s00_axi_rdata(28),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(29),
      Q => s00_axi_rdata(29),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(2),
      Q => s00_axi_rdata(2),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(30),
      Q => s00_axi_rdata(30),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(31),
      Q => s00_axi_rdata(31),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(3),
      Q => s00_axi_rdata(3),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(4),
      Q => s00_axi_rdata(4),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(5),
      Q => s00_axi_rdata(5),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(6),
      Q => s00_axi_rdata(6),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(7),
      Q => s00_axi_rdata(7),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(8),
      Q => s00_axi_rdata(8),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(9),
      Q => s00_axi_rdata(9),
      R => axi_awready_i_1_n_0
    );
axi_rvalid_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"08F8"
    )
        port map (
      I0 => \^s00_axi_arready\,
      I1 => s00_axi_arvalid,
      I2 => \^s00_axi_rvalid\,
      I3 => s00_axi_rready,
      O => axi_rvalid_i_1_n_0
    );
axi_rvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_rvalid_i_1_n_0,
      Q => \^s00_axi_rvalid\,
      R => axi_awready_i_1_n_0
    );
axi_wready_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => s00_axi_awvalid,
      I1 => s00_axi_wvalid,
      I2 => \^s00_axi_wready\,
      I3 => aw_en_reg_n_0,
      O => axi_wready0
    );
axi_wready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_wready0,
      Q => \^s00_axi_wready\,
      R => axi_awready_i_1_n_0
    );
\slv_reg0[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(1),
      I2 => p_0_in(0),
      I3 => s00_axi_wstrb(1),
      O => p_1_in(15)
    );
\slv_reg0[23]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(1),
      I2 => p_0_in(0),
      I3 => s00_axi_wstrb(2),
      O => p_1_in(23)
    );
\slv_reg0[30]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(1),
      I2 => p_0_in(0),
      I3 => s00_axi_wstrb(3),
      O => p_1_in(30)
    );
\slv_reg0[30]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \^s00_axi_wready\,
      I1 => \^s00_axi_awready\,
      I2 => s00_axi_awvalid,
      I3 => s00_axi_wvalid,
      O => \slv_reg_wren__0\
    );
\slv_reg0[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF777770007777"
    )
        port map (
      I0 => \slv_reg0_reg[31]_0\,
      I1 => \slv_reg0_reg[31]_1\,
      I2 => \slv_reg0[31]_i_3_n_0\,
      I3 => s00_axi_wstrb(3),
      I4 => \slv_reg_wren__0\,
      I5 => \slv_reg0_reg_n_0_[31]\,
      O => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg0[31]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_0_in(1),
      I1 => p_0_in(0),
      O => \slv_reg0[31]_i_3_n_0\
    );
\slv_reg0[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(1),
      I2 => p_0_in(0),
      I3 => s00_axi_wstrb(0),
      O => p_1_in(0)
    );
\slv_reg0_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(0),
      Q => \^q\(0),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(10),
      Q => \slv_reg0_reg_n_0_[10]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(11),
      Q => \slv_reg0_reg_n_0_[11]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(12),
      Q => \slv_reg0_reg_n_0_[12]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(13),
      Q => \slv_reg0_reg_n_0_[13]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(14),
      Q => \slv_reg0_reg_n_0_[14]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(15),
      Q => \slv_reg0_reg_n_0_[15]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(16),
      Q => \slv_reg0_reg_n_0_[16]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(17),
      Q => \slv_reg0_reg_n_0_[17]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(18),
      Q => \slv_reg0_reg_n_0_[18]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(19),
      Q => \slv_reg0_reg_n_0_[19]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(1),
      Q => \^q\(1),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(20),
      Q => \slv_reg0_reg_n_0_[20]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(21),
      Q => \slv_reg0_reg_n_0_[21]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(22),
      Q => \slv_reg0_reg_n_0_[22]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(23),
      Q => \slv_reg0_reg_n_0_[23]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(30),
      D => s00_axi_wdata(24),
      Q => \slv_reg0_reg_n_0_[24]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(30),
      D => s00_axi_wdata(25),
      Q => \slv_reg0_reg_n_0_[25]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(30),
      D => s00_axi_wdata(26),
      Q => \slv_reg0_reg_n_0_[26]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(30),
      D => s00_axi_wdata(27),
      Q => \slv_reg0_reg_n_0_[27]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(30),
      D => s00_axi_wdata(28),
      Q => \slv_reg0_reg_n_0_[28]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(30),
      D => s00_axi_wdata(29),
      Q => \slv_reg0_reg_n_0_[29]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(2),
      Q => \^q\(2),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(30),
      D => s00_axi_wdata(30),
      Q => \slv_reg0_reg_n_0_[30]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \slv_reg0[31]_i_1_n_0\,
      Q => \slv_reg0_reg_n_0_[31]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(3),
      Q => \^q\(3),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(4),
      Q => \^q\(4),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(5),
      Q => \^q\(5),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(6),
      Q => \^q\(6),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(7),
      Q => \slv_reg0_reg_n_0_[7]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(8),
      Q => \slv_reg0_reg_n_0_[8]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(9),
      Q => \slv_reg0_reg_n_0_[9]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => s00_axi_wstrb(1),
      I2 => p_0_in(0),
      I3 => p_0_in(1),
      O => \slv_reg1[15]_i_1_n_0\
    );
\slv_reg1[23]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => s00_axi_wstrb(2),
      I2 => p_0_in(0),
      I3 => p_0_in(1),
      O => \slv_reg1[23]_i_1_n_0\
    );
\slv_reg1[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => s00_axi_wstrb(3),
      I2 => p_0_in(0),
      I3 => p_0_in(1),
      O => \slv_reg1[31]_i_1_n_0\
    );
\slv_reg1[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => s00_axi_wstrb(0),
      I2 => p_0_in(0),
      I3 => p_0_in(1),
      O => \slv_reg1[7]_i_1_n_0\
    );
\slv_reg1_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => \^d\(32),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => slv_reg1(10),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => slv_reg1(11),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => slv_reg1(12),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => slv_reg1(13),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => slv_reg1(14),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => slv_reg1(15),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => slv_reg1(16),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => slv_reg1(17),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => slv_reg1(18),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => slv_reg1(19),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => \^d\(33),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => slv_reg1(20),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => slv_reg1(21),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => slv_reg1(22),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => slv_reg1(23),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => slv_reg1(24),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => slv_reg1(25),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => slv_reg1(26),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => slv_reg1(27),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => slv_reg1(28),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => slv_reg1(29),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => \^d\(34),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => slv_reg1(30),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => slv_reg1(31),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => \^d\(35),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => \^d\(36),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => \^d\(37),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => \^d\(38),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => \^d\(39),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => slv_reg1(8),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => slv_reg1(9),
      R => axi_awready_i_1_n_0
    );
\slv_reg2[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(1),
      I2 => s00_axi_wstrb(1),
      I3 => p_0_in(0),
      O => \slv_reg2[15]_i_1_n_0\
    );
\slv_reg2[23]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(1),
      I2 => s00_axi_wstrb(2),
      I3 => p_0_in(0),
      O => \slv_reg2[23]_i_1_n_0\
    );
\slv_reg2[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(1),
      I2 => s00_axi_wstrb(3),
      I3 => p_0_in(0),
      O => \slv_reg2[31]_i_1_n_0\
    );
\slv_reg2[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(1),
      I2 => s00_axi_wstrb(0),
      I3 => p_0_in(0),
      O => \slv_reg2[7]_i_1_n_0\
    );
\slv_reg2_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => \^d\(0),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => \^d\(10),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => \^d\(11),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => \^d\(12),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => \^d\(13),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => \^d\(14),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => \^d\(15),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => \^d\(16),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => \^d\(17),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => \^d\(18),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => \^d\(19),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => \^d\(1),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => \^d\(20),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => \^d\(21),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => \^d\(22),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => \^d\(23),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => \^d\(24),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => \^d\(25),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => \^d\(26),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => \^d\(27),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => \^d\(28),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => \^d\(29),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => \^d\(2),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => \^d\(30),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => \^d\(31),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => \^d\(3),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => \^d\(4),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => \^d\(5),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => \^d\(6),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => \^d\(7),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => \^d\(8),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => \^d\(9),
      R => axi_awready_i_1_n_0
    );
slv_reg_rden: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => s00_axi_arvalid,
      I1 => \^s00_axi_rvalid\,
      I2 => \^s00_axi_arready\,
      O => \slv_reg_rden__0\
    );
spi_slave_reset_n_INST_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(0),
      O => spi_slave_reset_n
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity encoder_system_axi_spi_interface_0_0_spi_driver is
  port (
    axi_spi_sclk : out STD_LOGIC;
    axi_spi_cs_n : out STD_LOGIC;
    \shift_out_count_reg[5]_0\ : out STD_LOGIC;
    axi_spi_mosi : out STD_LOGIC;
    spi_clk_en_reg : out STD_LOGIC;
    \start_edge_reg_reg[0]_0\ : out STD_LOGIC;
    \in_buffer_reg_reg[31]_0\ : out STD_LOGIC_VECTOR ( 31 downto 0 );
    gen_spi_clk_0 : in STD_LOGIC;
    R0 : in STD_LOGIC;
    gen_spi_clk_180 : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 6 downto 0 );
    gen_spi_clk_locked : in STD_LOGIC;
    gen_spi_clk_fb_0 : in STD_LOGIC;
    axi_spi_miso : in STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 39 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of encoder_system_axi_spi_interface_0_0_spi_driver : entity is "spi_driver";
end encoder_system_axi_spi_interface_0_0_spi_driver;

architecture STRUCTURE of encoder_system_axi_spi_interface_0_0_spi_driver is
  signal fb_delay_val_reg : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \in_buffer_reg[31]_i_2_n_0\ : STD_LOGIC;
  signal \in_buffer_reg[31]_i_3_n_0\ : STD_LOGIC;
  signal \in_buffer_reg[31]_i_4_n_0\ : STD_LOGIC;
  signal \in_buffer_reg[31]_i_5_n_0\ : STD_LOGIC;
  signal \in_buffer_reg[31]_i_6_n_0\ : STD_LOGIC;
  signal \in_buffer_reg[31]_i_7_n_0\ : STD_LOGIC;
  signal \^in_buffer_reg_reg[31]_0\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal out_buffer_reg : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal \out_buffer_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \out_buffer_reg[10]_i_1_n_0\ : STD_LOGIC;
  signal \out_buffer_reg[11]_i_1_n_0\ : STD_LOGIC;
  signal \out_buffer_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \out_buffer_reg[13]_i_1_n_0\ : STD_LOGIC;
  signal \out_buffer_reg[14]_i_1_n_0\ : STD_LOGIC;
  signal \out_buffer_reg[15]_i_1_n_0\ : STD_LOGIC;
  signal \out_buffer_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \out_buffer_reg[17]_i_1_n_0\ : STD_LOGIC;
  signal \out_buffer_reg[18]_i_1_n_0\ : STD_LOGIC;
  signal \out_buffer_reg[19]_i_1_n_0\ : STD_LOGIC;
  signal \out_buffer_reg[1]_i_1_n_0\ : STD_LOGIC;
  signal \out_buffer_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \out_buffer_reg[21]_i_1_n_0\ : STD_LOGIC;
  signal \out_buffer_reg[22]_i_1_n_0\ : STD_LOGIC;
  signal \out_buffer_reg[23]_i_1_n_0\ : STD_LOGIC;
  signal \out_buffer_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \out_buffer_reg[25]_i_1_n_0\ : STD_LOGIC;
  signal \out_buffer_reg[26]_i_1_n_0\ : STD_LOGIC;
  signal \out_buffer_reg[27]_i_1_n_0\ : STD_LOGIC;
  signal \out_buffer_reg[28]_i_1_n_0\ : STD_LOGIC;
  signal \out_buffer_reg[29]_i_1_n_0\ : STD_LOGIC;
  signal \out_buffer_reg[2]_i_1_n_0\ : STD_LOGIC;
  signal \out_buffer_reg[30]_i_1_n_0\ : STD_LOGIC;
  signal \out_buffer_reg[31]_i_1_n_0\ : STD_LOGIC;
  signal \out_buffer_reg[32]_i_1_n_0\ : STD_LOGIC;
  signal \out_buffer_reg[33]_i_1_n_0\ : STD_LOGIC;
  signal \out_buffer_reg[34]_i_1_n_0\ : STD_LOGIC;
  signal \out_buffer_reg[35]_i_1_n_0\ : STD_LOGIC;
  signal \out_buffer_reg[36]_i_1_n_0\ : STD_LOGIC;
  signal \out_buffer_reg[37]_i_1_n_0\ : STD_LOGIC;
  signal \out_buffer_reg[38]_i_1_n_0\ : STD_LOGIC;
  signal \out_buffer_reg[39]_i_1_n_0\ : STD_LOGIC;
  signal \out_buffer_reg[39]_i_2_n_0\ : STD_LOGIC;
  signal \out_buffer_reg[39]_i_3_n_0\ : STD_LOGIC;
  signal \out_buffer_reg[39]_i_4_n_0\ : STD_LOGIC;
  signal \out_buffer_reg[3]_i_1_n_0\ : STD_LOGIC;
  signal \out_buffer_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \out_buffer_reg[5]_i_1_n_0\ : STD_LOGIC;
  signal \out_buffer_reg[6]_i_1_n_0\ : STD_LOGIC;
  signal \out_buffer_reg[7]_i_1_n_0\ : STD_LOGIC;
  signal \out_buffer_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \out_buffer_reg[9]_i_1_n_0\ : STD_LOGIC;
  signal out_val_reg : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal \p_0_in__0\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \p_0_in__1\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \shift_in_count[2]_i_1_n_0\ : STD_LOGIC;
  signal \shift_in_count[3]_i_1_n_0\ : STD_LOGIC;
  signal \shift_in_count[4]_i_1_n_0\ : STD_LOGIC;
  signal \shift_in_count[5]_i_1_n_0\ : STD_LOGIC;
  signal \shift_in_count[5]_i_2_n_0\ : STD_LOGIC;
  signal \shift_in_count[5]_i_3_n_0\ : STD_LOGIC;
  signal shift_in_count_reg : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal shift_in_en : STD_LOGIC;
  signal \shift_out_count[3]_i_1_n_0\ : STD_LOGIC;
  signal \shift_out_count[4]_i_1_n_0\ : STD_LOGIC;
  signal \shift_out_count[5]_i_1_n_0\ : STD_LOGIC;
  signal \shift_out_count[5]_i_2_n_0\ : STD_LOGIC;
  signal \shift_out_count[5]_i_3_n_0\ : STD_LOGIC;
  signal shift_out_count_reg : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \^shift_out_count_reg[5]_0\ : STD_LOGIC;
  signal shift_out_en0 : STD_LOGIC;
  signal spi_clk_en : STD_LOGIC;
  signal \^spi_clk_en_reg\ : STD_LOGIC;
  signal start_edge_reg : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_ODDR_inst_S_UNCONNECTED : STD_LOGIC;
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of ODDR_inst : label is "PRIMITIVE";
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of ODDR_inst : label is "MLO";
  attribute \__SRVAL\ : string;
  attribute \__SRVAL\ of ODDR_inst : label is "FALSE";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \in_buffer_reg[31]_i_2\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \in_buffer_reg[31]_i_3\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \in_buffer_reg[31]_i_4\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \out_buffer_reg[0]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \out_buffer_reg[1]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \out_buffer_reg[2]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \out_buffer_reg[39]_i_3\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \out_buffer_reg[39]_i_4\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \shift_in_count[0]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \shift_in_count[1]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \shift_in_count[5]_i_2\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \shift_in_count[5]_i_3\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \shift_out_count[0]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \shift_out_count[1]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \shift_out_count[2]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \shift_out_count[5]_i_3\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \slv_reg0[31]_i_2\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of spi_clk_en_reg_i_1 : label is "soft_lutpair4";
begin
  \in_buffer_reg_reg[31]_0\(31 downto 0) <= \^in_buffer_reg_reg[31]_0\(31 downto 0);
  \shift_out_count_reg[5]_0\ <= \^shift_out_count_reg[5]_0\;
  spi_clk_en_reg <= \^spi_clk_en_reg\;
ODDR_inst: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "SYNC"
    )
        port map (
      C => gen_spi_clk_0,
      CE => spi_clk_en,
      D1 => '1',
      D2 => '0',
      Q => axi_spi_sclk,
      R => R0,
      S => NLW_ODDR_inst_S_UNCONNECTED
    );
ODDR_inst_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^spi_clk_en_reg\,
      I1 => Q(2),
      O => spi_clk_en
    );
\fb_delay_val_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => Q(1),
      D => Q(3),
      Q => fb_delay_val_reg(0),
      R => Q(0)
    );
\fb_delay_val_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => Q(1),
      D => Q(4),
      Q => fb_delay_val_reg(1),
      R => Q(0)
    );
\fb_delay_val_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => Q(1),
      D => Q(5),
      Q => fb_delay_val_reg(2),
      R => Q(0)
    );
\fb_delay_val_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => Q(1),
      D => Q(6),
      Q => fb_delay_val_reg(3),
      R => Q(0)
    );
\in_buffer_reg[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000AAAAEEAE"
    )
        port map (
      I0 => \in_buffer_reg[31]_i_2_n_0\,
      I1 => \in_buffer_reg[31]_i_3_n_0\,
      I2 => \in_buffer_reg[31]_i_4_n_0\,
      I3 => \in_buffer_reg[31]_i_5_n_0\,
      I4 => \in_buffer_reg[31]_i_6_n_0\,
      I5 => \in_buffer_reg[31]_i_7_n_0\,
      O => shift_in_en
    );
\in_buffer_reg[31]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"04FF"
    )
        port map (
      I0 => shift_in_count_reg(3),
      I1 => fb_delay_val_reg(3),
      I2 => shift_in_count_reg(4),
      I3 => shift_in_count_reg(5),
      O => \in_buffer_reg[31]_i_2_n_0\
    );
\in_buffer_reg[31]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"5D"
    )
        port map (
      I0 => shift_in_count_reg(4),
      I1 => fb_delay_val_reg(3),
      I2 => shift_in_count_reg(3),
      O => \in_buffer_reg[31]_i_3_n_0\
    );
\in_buffer_reg[31]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => shift_in_count_reg(3),
      I1 => fb_delay_val_reg(3),
      O => \in_buffer_reg[31]_i_4_n_0\
    );
\in_buffer_reg[31]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0004000000000000"
    )
        port map (
      I0 => shift_in_count_reg(2),
      I1 => fb_delay_val_reg(2),
      I2 => shift_in_count_reg(0),
      I3 => shift_in_count_reg(1),
      I4 => fb_delay_val_reg(0),
      I5 => fb_delay_val_reg(1),
      O => \in_buffer_reg[31]_i_5_n_0\
    );
\in_buffer_reg[31]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5010FFF700005010"
    )
        port map (
      I0 => fb_delay_val_reg(1),
      I1 => fb_delay_val_reg(0),
      I2 => shift_in_count_reg(1),
      I3 => shift_in_count_reg(0),
      I4 => fb_delay_val_reg(2),
      I5 => shift_in_count_reg(2),
      O => \in_buffer_reg[31]_i_6_n_0\
    );
\in_buffer_reg[31]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => shift_in_count_reg(1),
      I1 => shift_in_count_reg(0),
      I2 => shift_in_count_reg(2),
      I3 => shift_in_count_reg(4),
      I4 => shift_in_count_reg(3),
      I5 => shift_in_count_reg(5),
      O => \in_buffer_reg[31]_i_7_n_0\
    );
\in_buffer_reg_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_fb_0,
      CE => shift_in_en,
      CLR => Q(0),
      D => axi_spi_miso,
      Q => \^in_buffer_reg_reg[31]_0\(0)
    );
\in_buffer_reg_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_fb_0,
      CE => shift_in_en,
      CLR => Q(0),
      D => \^in_buffer_reg_reg[31]_0\(9),
      Q => \^in_buffer_reg_reg[31]_0\(10)
    );
\in_buffer_reg_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_fb_0,
      CE => shift_in_en,
      CLR => Q(0),
      D => \^in_buffer_reg_reg[31]_0\(10),
      Q => \^in_buffer_reg_reg[31]_0\(11)
    );
\in_buffer_reg_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_fb_0,
      CE => shift_in_en,
      CLR => Q(0),
      D => \^in_buffer_reg_reg[31]_0\(11),
      Q => \^in_buffer_reg_reg[31]_0\(12)
    );
\in_buffer_reg_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_fb_0,
      CE => shift_in_en,
      CLR => Q(0),
      D => \^in_buffer_reg_reg[31]_0\(12),
      Q => \^in_buffer_reg_reg[31]_0\(13)
    );
\in_buffer_reg_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_fb_0,
      CE => shift_in_en,
      CLR => Q(0),
      D => \^in_buffer_reg_reg[31]_0\(13),
      Q => \^in_buffer_reg_reg[31]_0\(14)
    );
\in_buffer_reg_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_fb_0,
      CE => shift_in_en,
      CLR => Q(0),
      D => \^in_buffer_reg_reg[31]_0\(14),
      Q => \^in_buffer_reg_reg[31]_0\(15)
    );
\in_buffer_reg_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_fb_0,
      CE => shift_in_en,
      CLR => Q(0),
      D => \^in_buffer_reg_reg[31]_0\(15),
      Q => \^in_buffer_reg_reg[31]_0\(16)
    );
\in_buffer_reg_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_fb_0,
      CE => shift_in_en,
      CLR => Q(0),
      D => \^in_buffer_reg_reg[31]_0\(16),
      Q => \^in_buffer_reg_reg[31]_0\(17)
    );
\in_buffer_reg_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_fb_0,
      CE => shift_in_en,
      CLR => Q(0),
      D => \^in_buffer_reg_reg[31]_0\(17),
      Q => \^in_buffer_reg_reg[31]_0\(18)
    );
\in_buffer_reg_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_fb_0,
      CE => shift_in_en,
      CLR => Q(0),
      D => \^in_buffer_reg_reg[31]_0\(18),
      Q => \^in_buffer_reg_reg[31]_0\(19)
    );
\in_buffer_reg_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_fb_0,
      CE => shift_in_en,
      CLR => Q(0),
      D => \^in_buffer_reg_reg[31]_0\(0),
      Q => \^in_buffer_reg_reg[31]_0\(1)
    );
\in_buffer_reg_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_fb_0,
      CE => shift_in_en,
      CLR => Q(0),
      D => \^in_buffer_reg_reg[31]_0\(19),
      Q => \^in_buffer_reg_reg[31]_0\(20)
    );
\in_buffer_reg_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_fb_0,
      CE => shift_in_en,
      CLR => Q(0),
      D => \^in_buffer_reg_reg[31]_0\(20),
      Q => \^in_buffer_reg_reg[31]_0\(21)
    );
\in_buffer_reg_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_fb_0,
      CE => shift_in_en,
      CLR => Q(0),
      D => \^in_buffer_reg_reg[31]_0\(21),
      Q => \^in_buffer_reg_reg[31]_0\(22)
    );
\in_buffer_reg_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_fb_0,
      CE => shift_in_en,
      CLR => Q(0),
      D => \^in_buffer_reg_reg[31]_0\(22),
      Q => \^in_buffer_reg_reg[31]_0\(23)
    );
\in_buffer_reg_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_fb_0,
      CE => shift_in_en,
      CLR => Q(0),
      D => \^in_buffer_reg_reg[31]_0\(23),
      Q => \^in_buffer_reg_reg[31]_0\(24)
    );
\in_buffer_reg_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_fb_0,
      CE => shift_in_en,
      CLR => Q(0),
      D => \^in_buffer_reg_reg[31]_0\(24),
      Q => \^in_buffer_reg_reg[31]_0\(25)
    );
\in_buffer_reg_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_fb_0,
      CE => shift_in_en,
      CLR => Q(0),
      D => \^in_buffer_reg_reg[31]_0\(25),
      Q => \^in_buffer_reg_reg[31]_0\(26)
    );
\in_buffer_reg_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_fb_0,
      CE => shift_in_en,
      CLR => Q(0),
      D => \^in_buffer_reg_reg[31]_0\(26),
      Q => \^in_buffer_reg_reg[31]_0\(27)
    );
\in_buffer_reg_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_fb_0,
      CE => shift_in_en,
      CLR => Q(0),
      D => \^in_buffer_reg_reg[31]_0\(27),
      Q => \^in_buffer_reg_reg[31]_0\(28)
    );
\in_buffer_reg_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_fb_0,
      CE => shift_in_en,
      CLR => Q(0),
      D => \^in_buffer_reg_reg[31]_0\(28),
      Q => \^in_buffer_reg_reg[31]_0\(29)
    );
\in_buffer_reg_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_fb_0,
      CE => shift_in_en,
      CLR => Q(0),
      D => \^in_buffer_reg_reg[31]_0\(1),
      Q => \^in_buffer_reg_reg[31]_0\(2)
    );
\in_buffer_reg_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_fb_0,
      CE => shift_in_en,
      CLR => Q(0),
      D => \^in_buffer_reg_reg[31]_0\(29),
      Q => \^in_buffer_reg_reg[31]_0\(30)
    );
\in_buffer_reg_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_fb_0,
      CE => shift_in_en,
      CLR => Q(0),
      D => \^in_buffer_reg_reg[31]_0\(30),
      Q => \^in_buffer_reg_reg[31]_0\(31)
    );
\in_buffer_reg_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_fb_0,
      CE => shift_in_en,
      CLR => Q(0),
      D => \^in_buffer_reg_reg[31]_0\(2),
      Q => \^in_buffer_reg_reg[31]_0\(3)
    );
\in_buffer_reg_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_fb_0,
      CE => shift_in_en,
      CLR => Q(0),
      D => \^in_buffer_reg_reg[31]_0\(3),
      Q => \^in_buffer_reg_reg[31]_0\(4)
    );
\in_buffer_reg_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_fb_0,
      CE => shift_in_en,
      CLR => Q(0),
      D => \^in_buffer_reg_reg[31]_0\(4),
      Q => \^in_buffer_reg_reg[31]_0\(5)
    );
\in_buffer_reg_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_fb_0,
      CE => shift_in_en,
      CLR => Q(0),
      D => \^in_buffer_reg_reg[31]_0\(5),
      Q => \^in_buffer_reg_reg[31]_0\(6)
    );
\in_buffer_reg_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_fb_0,
      CE => shift_in_en,
      CLR => Q(0),
      D => \^in_buffer_reg_reg[31]_0\(6),
      Q => \^in_buffer_reg_reg[31]_0\(7)
    );
\in_buffer_reg_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_fb_0,
      CE => shift_in_en,
      CLR => Q(0),
      D => \^in_buffer_reg_reg[31]_0\(7),
      Q => \^in_buffer_reg_reg[31]_0\(8)
    );
\in_buffer_reg_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_fb_0,
      CE => shift_in_en,
      CLR => Q(0),
      D => \^in_buffer_reg_reg[31]_0\(8),
      Q => \^in_buffer_reg_reg[31]_0\(9)
    );
mosi_reg_reg: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_180,
      CE => '1',
      CLR => Q(0),
      D => out_buffer_reg(39),
      Q => axi_spi_mosi
    );
\out_buffer_reg[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => out_val_reg(0),
      I1 => start_edge_reg(0),
      I2 => start_edge_reg(1),
      O => \out_buffer_reg[0]_i_1_n_0\
    );
\out_buffer_reg[10]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => out_val_reg(10),
      I1 => start_edge_reg(1),
      I2 => start_edge_reg(0),
      I3 => out_buffer_reg(9),
      O => \out_buffer_reg[10]_i_1_n_0\
    );
\out_buffer_reg[11]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => out_val_reg(11),
      I1 => start_edge_reg(1),
      I2 => start_edge_reg(0),
      I3 => out_buffer_reg(10),
      O => \out_buffer_reg[11]_i_1_n_0\
    );
\out_buffer_reg[12]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => out_val_reg(12),
      I1 => start_edge_reg(1),
      I2 => start_edge_reg(0),
      I3 => out_buffer_reg(11),
      O => \out_buffer_reg[12]_i_1_n_0\
    );
\out_buffer_reg[13]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => out_val_reg(13),
      I1 => start_edge_reg(1),
      I2 => start_edge_reg(0),
      I3 => out_buffer_reg(12),
      O => \out_buffer_reg[13]_i_1_n_0\
    );
\out_buffer_reg[14]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => out_val_reg(14),
      I1 => start_edge_reg(1),
      I2 => start_edge_reg(0),
      I3 => out_buffer_reg(13),
      O => \out_buffer_reg[14]_i_1_n_0\
    );
\out_buffer_reg[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => out_val_reg(15),
      I1 => start_edge_reg(1),
      I2 => start_edge_reg(0),
      I3 => out_buffer_reg(14),
      O => \out_buffer_reg[15]_i_1_n_0\
    );
\out_buffer_reg[16]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => out_val_reg(16),
      I1 => start_edge_reg(1),
      I2 => start_edge_reg(0),
      I3 => out_buffer_reg(15),
      O => \out_buffer_reg[16]_i_1_n_0\
    );
\out_buffer_reg[17]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => out_val_reg(17),
      I1 => start_edge_reg(1),
      I2 => start_edge_reg(0),
      I3 => out_buffer_reg(16),
      O => \out_buffer_reg[17]_i_1_n_0\
    );
\out_buffer_reg[18]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => out_val_reg(18),
      I1 => start_edge_reg(1),
      I2 => start_edge_reg(0),
      I3 => out_buffer_reg(17),
      O => \out_buffer_reg[18]_i_1_n_0\
    );
\out_buffer_reg[19]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => out_val_reg(19),
      I1 => start_edge_reg(1),
      I2 => start_edge_reg(0),
      I3 => out_buffer_reg(18),
      O => \out_buffer_reg[19]_i_1_n_0\
    );
\out_buffer_reg[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => out_val_reg(1),
      I1 => start_edge_reg(1),
      I2 => start_edge_reg(0),
      I3 => out_buffer_reg(0),
      O => \out_buffer_reg[1]_i_1_n_0\
    );
\out_buffer_reg[20]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => out_val_reg(20),
      I1 => start_edge_reg(1),
      I2 => start_edge_reg(0),
      I3 => out_buffer_reg(19),
      O => \out_buffer_reg[20]_i_1_n_0\
    );
\out_buffer_reg[21]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => out_val_reg(21),
      I1 => start_edge_reg(1),
      I2 => start_edge_reg(0),
      I3 => out_buffer_reg(20),
      O => \out_buffer_reg[21]_i_1_n_0\
    );
\out_buffer_reg[22]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => out_val_reg(22),
      I1 => start_edge_reg(1),
      I2 => start_edge_reg(0),
      I3 => out_buffer_reg(21),
      O => \out_buffer_reg[22]_i_1_n_0\
    );
\out_buffer_reg[23]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => out_val_reg(23),
      I1 => start_edge_reg(1),
      I2 => start_edge_reg(0),
      I3 => out_buffer_reg(22),
      O => \out_buffer_reg[23]_i_1_n_0\
    );
\out_buffer_reg[24]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => out_val_reg(24),
      I1 => start_edge_reg(1),
      I2 => start_edge_reg(0),
      I3 => out_buffer_reg(23),
      O => \out_buffer_reg[24]_i_1_n_0\
    );
\out_buffer_reg[25]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => out_val_reg(25),
      I1 => start_edge_reg(1),
      I2 => start_edge_reg(0),
      I3 => out_buffer_reg(24),
      O => \out_buffer_reg[25]_i_1_n_0\
    );
\out_buffer_reg[26]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => out_val_reg(26),
      I1 => start_edge_reg(1),
      I2 => start_edge_reg(0),
      I3 => out_buffer_reg(25),
      O => \out_buffer_reg[26]_i_1_n_0\
    );
\out_buffer_reg[27]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => out_val_reg(27),
      I1 => start_edge_reg(1),
      I2 => start_edge_reg(0),
      I3 => out_buffer_reg(26),
      O => \out_buffer_reg[27]_i_1_n_0\
    );
\out_buffer_reg[28]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => out_val_reg(28),
      I1 => start_edge_reg(1),
      I2 => start_edge_reg(0),
      I3 => out_buffer_reg(27),
      O => \out_buffer_reg[28]_i_1_n_0\
    );
\out_buffer_reg[29]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => out_val_reg(29),
      I1 => start_edge_reg(1),
      I2 => start_edge_reg(0),
      I3 => out_buffer_reg(28),
      O => \out_buffer_reg[29]_i_1_n_0\
    );
\out_buffer_reg[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => out_val_reg(2),
      I1 => start_edge_reg(1),
      I2 => start_edge_reg(0),
      I3 => out_buffer_reg(1),
      O => \out_buffer_reg[2]_i_1_n_0\
    );
\out_buffer_reg[30]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => out_val_reg(30),
      I1 => start_edge_reg(1),
      I2 => start_edge_reg(0),
      I3 => out_buffer_reg(29),
      O => \out_buffer_reg[30]_i_1_n_0\
    );
\out_buffer_reg[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => out_val_reg(31),
      I1 => start_edge_reg(1),
      I2 => start_edge_reg(0),
      I3 => out_buffer_reg(30),
      O => \out_buffer_reg[31]_i_1_n_0\
    );
\out_buffer_reg[32]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => out_val_reg(32),
      I1 => start_edge_reg(1),
      I2 => start_edge_reg(0),
      I3 => out_buffer_reg(31),
      O => \out_buffer_reg[32]_i_1_n_0\
    );
\out_buffer_reg[33]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => out_val_reg(33),
      I1 => start_edge_reg(1),
      I2 => start_edge_reg(0),
      I3 => out_buffer_reg(32),
      O => \out_buffer_reg[33]_i_1_n_0\
    );
\out_buffer_reg[34]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => out_val_reg(34),
      I1 => start_edge_reg(1),
      I2 => start_edge_reg(0),
      I3 => out_buffer_reg(33),
      O => \out_buffer_reg[34]_i_1_n_0\
    );
\out_buffer_reg[35]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => out_val_reg(35),
      I1 => start_edge_reg(1),
      I2 => start_edge_reg(0),
      I3 => out_buffer_reg(34),
      O => \out_buffer_reg[35]_i_1_n_0\
    );
\out_buffer_reg[36]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => out_val_reg(36),
      I1 => start_edge_reg(1),
      I2 => start_edge_reg(0),
      I3 => out_buffer_reg(35),
      O => \out_buffer_reg[36]_i_1_n_0\
    );
\out_buffer_reg[37]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => out_val_reg(37),
      I1 => start_edge_reg(1),
      I2 => start_edge_reg(0),
      I3 => out_buffer_reg(36),
      O => \out_buffer_reg[37]_i_1_n_0\
    );
\out_buffer_reg[38]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => out_val_reg(38),
      I1 => start_edge_reg(1),
      I2 => start_edge_reg(0),
      I3 => out_buffer_reg(37),
      O => \out_buffer_reg[38]_i_1_n_0\
    );
\out_buffer_reg[39]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"ABABFFFFBBBBFFFE"
    )
        port map (
      I0 => \out_buffer_reg[39]_i_3_n_0\,
      I1 => shift_out_count_reg(4),
      I2 => shift_out_count_reg(3),
      I3 => shift_out_count_reg(0),
      I4 => shift_out_count_reg(5),
      I5 => \out_buffer_reg[39]_i_4_n_0\,
      O => \out_buffer_reg[39]_i_1_n_0\
    );
\out_buffer_reg[39]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => out_val_reg(39),
      I1 => start_edge_reg(1),
      I2 => start_edge_reg(0),
      I3 => out_buffer_reg(38),
      O => \out_buffer_reg[39]_i_2_n_0\
    );
\out_buffer_reg[39]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => start_edge_reg(1),
      I1 => start_edge_reg(0),
      O => \out_buffer_reg[39]_i_3_n_0\
    );
\out_buffer_reg[39]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => shift_out_count_reg(1),
      I1 => shift_out_count_reg(2),
      O => \out_buffer_reg[39]_i_4_n_0\
    );
\out_buffer_reg[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => out_val_reg(3),
      I1 => start_edge_reg(1),
      I2 => start_edge_reg(0),
      I3 => out_buffer_reg(2),
      O => \out_buffer_reg[3]_i_1_n_0\
    );
\out_buffer_reg[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => out_val_reg(4),
      I1 => start_edge_reg(1),
      I2 => start_edge_reg(0),
      I3 => out_buffer_reg(3),
      O => \out_buffer_reg[4]_i_1_n_0\
    );
\out_buffer_reg[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => out_val_reg(5),
      I1 => start_edge_reg(1),
      I2 => start_edge_reg(0),
      I3 => out_buffer_reg(4),
      O => \out_buffer_reg[5]_i_1_n_0\
    );
\out_buffer_reg[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => out_val_reg(6),
      I1 => start_edge_reg(1),
      I2 => start_edge_reg(0),
      I3 => out_buffer_reg(5),
      O => \out_buffer_reg[6]_i_1_n_0\
    );
\out_buffer_reg[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => out_val_reg(7),
      I1 => start_edge_reg(1),
      I2 => start_edge_reg(0),
      I3 => out_buffer_reg(6),
      O => \out_buffer_reg[7]_i_1_n_0\
    );
\out_buffer_reg[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => out_val_reg(8),
      I1 => start_edge_reg(1),
      I2 => start_edge_reg(0),
      I3 => out_buffer_reg(7),
      O => \out_buffer_reg[8]_i_1_n_0\
    );
\out_buffer_reg[9]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => out_val_reg(9),
      I1 => start_edge_reg(1),
      I2 => start_edge_reg(0),
      I3 => out_buffer_reg(8),
      O => \out_buffer_reg[9]_i_1_n_0\
    );
\out_buffer_reg_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_180,
      CE => \out_buffer_reg[39]_i_1_n_0\,
      CLR => Q(0),
      D => \out_buffer_reg[0]_i_1_n_0\,
      Q => out_buffer_reg(0)
    );
\out_buffer_reg_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_180,
      CE => \out_buffer_reg[39]_i_1_n_0\,
      CLR => Q(0),
      D => \out_buffer_reg[10]_i_1_n_0\,
      Q => out_buffer_reg(10)
    );
\out_buffer_reg_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_180,
      CE => \out_buffer_reg[39]_i_1_n_0\,
      CLR => Q(0),
      D => \out_buffer_reg[11]_i_1_n_0\,
      Q => out_buffer_reg(11)
    );
\out_buffer_reg_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_180,
      CE => \out_buffer_reg[39]_i_1_n_0\,
      CLR => Q(0),
      D => \out_buffer_reg[12]_i_1_n_0\,
      Q => out_buffer_reg(12)
    );
\out_buffer_reg_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_180,
      CE => \out_buffer_reg[39]_i_1_n_0\,
      CLR => Q(0),
      D => \out_buffer_reg[13]_i_1_n_0\,
      Q => out_buffer_reg(13)
    );
\out_buffer_reg_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_180,
      CE => \out_buffer_reg[39]_i_1_n_0\,
      CLR => Q(0),
      D => \out_buffer_reg[14]_i_1_n_0\,
      Q => out_buffer_reg(14)
    );
\out_buffer_reg_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_180,
      CE => \out_buffer_reg[39]_i_1_n_0\,
      CLR => Q(0),
      D => \out_buffer_reg[15]_i_1_n_0\,
      Q => out_buffer_reg(15)
    );
\out_buffer_reg_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_180,
      CE => \out_buffer_reg[39]_i_1_n_0\,
      CLR => Q(0),
      D => \out_buffer_reg[16]_i_1_n_0\,
      Q => out_buffer_reg(16)
    );
\out_buffer_reg_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_180,
      CE => \out_buffer_reg[39]_i_1_n_0\,
      CLR => Q(0),
      D => \out_buffer_reg[17]_i_1_n_0\,
      Q => out_buffer_reg(17)
    );
\out_buffer_reg_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_180,
      CE => \out_buffer_reg[39]_i_1_n_0\,
      CLR => Q(0),
      D => \out_buffer_reg[18]_i_1_n_0\,
      Q => out_buffer_reg(18)
    );
\out_buffer_reg_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_180,
      CE => \out_buffer_reg[39]_i_1_n_0\,
      CLR => Q(0),
      D => \out_buffer_reg[19]_i_1_n_0\,
      Q => out_buffer_reg(19)
    );
\out_buffer_reg_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_180,
      CE => \out_buffer_reg[39]_i_1_n_0\,
      CLR => Q(0),
      D => \out_buffer_reg[1]_i_1_n_0\,
      Q => out_buffer_reg(1)
    );
\out_buffer_reg_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_180,
      CE => \out_buffer_reg[39]_i_1_n_0\,
      CLR => Q(0),
      D => \out_buffer_reg[20]_i_1_n_0\,
      Q => out_buffer_reg(20)
    );
\out_buffer_reg_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_180,
      CE => \out_buffer_reg[39]_i_1_n_0\,
      CLR => Q(0),
      D => \out_buffer_reg[21]_i_1_n_0\,
      Q => out_buffer_reg(21)
    );
\out_buffer_reg_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_180,
      CE => \out_buffer_reg[39]_i_1_n_0\,
      CLR => Q(0),
      D => \out_buffer_reg[22]_i_1_n_0\,
      Q => out_buffer_reg(22)
    );
\out_buffer_reg_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_180,
      CE => \out_buffer_reg[39]_i_1_n_0\,
      CLR => Q(0),
      D => \out_buffer_reg[23]_i_1_n_0\,
      Q => out_buffer_reg(23)
    );
\out_buffer_reg_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_180,
      CE => \out_buffer_reg[39]_i_1_n_0\,
      CLR => Q(0),
      D => \out_buffer_reg[24]_i_1_n_0\,
      Q => out_buffer_reg(24)
    );
\out_buffer_reg_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_180,
      CE => \out_buffer_reg[39]_i_1_n_0\,
      CLR => Q(0),
      D => \out_buffer_reg[25]_i_1_n_0\,
      Q => out_buffer_reg(25)
    );
\out_buffer_reg_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_180,
      CE => \out_buffer_reg[39]_i_1_n_0\,
      CLR => Q(0),
      D => \out_buffer_reg[26]_i_1_n_0\,
      Q => out_buffer_reg(26)
    );
\out_buffer_reg_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_180,
      CE => \out_buffer_reg[39]_i_1_n_0\,
      CLR => Q(0),
      D => \out_buffer_reg[27]_i_1_n_0\,
      Q => out_buffer_reg(27)
    );
\out_buffer_reg_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_180,
      CE => \out_buffer_reg[39]_i_1_n_0\,
      CLR => Q(0),
      D => \out_buffer_reg[28]_i_1_n_0\,
      Q => out_buffer_reg(28)
    );
\out_buffer_reg_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_180,
      CE => \out_buffer_reg[39]_i_1_n_0\,
      CLR => Q(0),
      D => \out_buffer_reg[29]_i_1_n_0\,
      Q => out_buffer_reg(29)
    );
\out_buffer_reg_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_180,
      CE => \out_buffer_reg[39]_i_1_n_0\,
      CLR => Q(0),
      D => \out_buffer_reg[2]_i_1_n_0\,
      Q => out_buffer_reg(2)
    );
\out_buffer_reg_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_180,
      CE => \out_buffer_reg[39]_i_1_n_0\,
      CLR => Q(0),
      D => \out_buffer_reg[30]_i_1_n_0\,
      Q => out_buffer_reg(30)
    );
\out_buffer_reg_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_180,
      CE => \out_buffer_reg[39]_i_1_n_0\,
      CLR => Q(0),
      D => \out_buffer_reg[31]_i_1_n_0\,
      Q => out_buffer_reg(31)
    );
\out_buffer_reg_reg[32]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_180,
      CE => \out_buffer_reg[39]_i_1_n_0\,
      CLR => Q(0),
      D => \out_buffer_reg[32]_i_1_n_0\,
      Q => out_buffer_reg(32)
    );
\out_buffer_reg_reg[33]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_180,
      CE => \out_buffer_reg[39]_i_1_n_0\,
      CLR => Q(0),
      D => \out_buffer_reg[33]_i_1_n_0\,
      Q => out_buffer_reg(33)
    );
\out_buffer_reg_reg[34]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_180,
      CE => \out_buffer_reg[39]_i_1_n_0\,
      CLR => Q(0),
      D => \out_buffer_reg[34]_i_1_n_0\,
      Q => out_buffer_reg(34)
    );
\out_buffer_reg_reg[35]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_180,
      CE => \out_buffer_reg[39]_i_1_n_0\,
      CLR => Q(0),
      D => \out_buffer_reg[35]_i_1_n_0\,
      Q => out_buffer_reg(35)
    );
\out_buffer_reg_reg[36]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_180,
      CE => \out_buffer_reg[39]_i_1_n_0\,
      CLR => Q(0),
      D => \out_buffer_reg[36]_i_1_n_0\,
      Q => out_buffer_reg(36)
    );
\out_buffer_reg_reg[37]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_180,
      CE => \out_buffer_reg[39]_i_1_n_0\,
      CLR => Q(0),
      D => \out_buffer_reg[37]_i_1_n_0\,
      Q => out_buffer_reg(37)
    );
\out_buffer_reg_reg[38]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_180,
      CE => \out_buffer_reg[39]_i_1_n_0\,
      CLR => Q(0),
      D => \out_buffer_reg[38]_i_1_n_0\,
      Q => out_buffer_reg(38)
    );
\out_buffer_reg_reg[39]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_180,
      CE => \out_buffer_reg[39]_i_1_n_0\,
      CLR => Q(0),
      D => \out_buffer_reg[39]_i_2_n_0\,
      Q => out_buffer_reg(39)
    );
\out_buffer_reg_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_180,
      CE => \out_buffer_reg[39]_i_1_n_0\,
      CLR => Q(0),
      D => \out_buffer_reg[3]_i_1_n_0\,
      Q => out_buffer_reg(3)
    );
\out_buffer_reg_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_180,
      CE => \out_buffer_reg[39]_i_1_n_0\,
      CLR => Q(0),
      D => \out_buffer_reg[4]_i_1_n_0\,
      Q => out_buffer_reg(4)
    );
\out_buffer_reg_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_180,
      CE => \out_buffer_reg[39]_i_1_n_0\,
      CLR => Q(0),
      D => \out_buffer_reg[5]_i_1_n_0\,
      Q => out_buffer_reg(5)
    );
\out_buffer_reg_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_180,
      CE => \out_buffer_reg[39]_i_1_n_0\,
      CLR => Q(0),
      D => \out_buffer_reg[6]_i_1_n_0\,
      Q => out_buffer_reg(6)
    );
\out_buffer_reg_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_180,
      CE => \out_buffer_reg[39]_i_1_n_0\,
      CLR => Q(0),
      D => \out_buffer_reg[7]_i_1_n_0\,
      Q => out_buffer_reg(7)
    );
\out_buffer_reg_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_180,
      CE => \out_buffer_reg[39]_i_1_n_0\,
      CLR => Q(0),
      D => \out_buffer_reg[8]_i_1_n_0\,
      Q => out_buffer_reg(8)
    );
\out_buffer_reg_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_180,
      CE => \out_buffer_reg[39]_i_1_n_0\,
      CLR => Q(0),
      D => \out_buffer_reg[9]_i_1_n_0\,
      Q => out_buffer_reg(9)
    );
\out_val_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => Q(1),
      D => D(0),
      Q => out_val_reg(0),
      R => Q(0)
    );
\out_val_reg_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => Q(1),
      D => D(10),
      Q => out_val_reg(10),
      R => Q(0)
    );
\out_val_reg_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => Q(1),
      D => D(11),
      Q => out_val_reg(11),
      R => Q(0)
    );
\out_val_reg_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => Q(1),
      D => D(12),
      Q => out_val_reg(12),
      R => Q(0)
    );
\out_val_reg_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => Q(1),
      D => D(13),
      Q => out_val_reg(13),
      R => Q(0)
    );
\out_val_reg_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => Q(1),
      D => D(14),
      Q => out_val_reg(14),
      R => Q(0)
    );
\out_val_reg_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => Q(1),
      D => D(15),
      Q => out_val_reg(15),
      R => Q(0)
    );
\out_val_reg_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => Q(1),
      D => D(16),
      Q => out_val_reg(16),
      R => Q(0)
    );
\out_val_reg_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => Q(1),
      D => D(17),
      Q => out_val_reg(17),
      R => Q(0)
    );
\out_val_reg_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => Q(1),
      D => D(18),
      Q => out_val_reg(18),
      R => Q(0)
    );
\out_val_reg_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => Q(1),
      D => D(19),
      Q => out_val_reg(19),
      R => Q(0)
    );
\out_val_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => Q(1),
      D => D(1),
      Q => out_val_reg(1),
      R => Q(0)
    );
\out_val_reg_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => Q(1),
      D => D(20),
      Q => out_val_reg(20),
      R => Q(0)
    );
\out_val_reg_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => Q(1),
      D => D(21),
      Q => out_val_reg(21),
      R => Q(0)
    );
\out_val_reg_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => Q(1),
      D => D(22),
      Q => out_val_reg(22),
      R => Q(0)
    );
\out_val_reg_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => Q(1),
      D => D(23),
      Q => out_val_reg(23),
      R => Q(0)
    );
\out_val_reg_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => Q(1),
      D => D(24),
      Q => out_val_reg(24),
      R => Q(0)
    );
\out_val_reg_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => Q(1),
      D => D(25),
      Q => out_val_reg(25),
      R => Q(0)
    );
\out_val_reg_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => Q(1),
      D => D(26),
      Q => out_val_reg(26),
      R => Q(0)
    );
\out_val_reg_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => Q(1),
      D => D(27),
      Q => out_val_reg(27),
      R => Q(0)
    );
\out_val_reg_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => Q(1),
      D => D(28),
      Q => out_val_reg(28),
      R => Q(0)
    );
\out_val_reg_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => Q(1),
      D => D(29),
      Q => out_val_reg(29),
      R => Q(0)
    );
\out_val_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => Q(1),
      D => D(2),
      Q => out_val_reg(2),
      R => Q(0)
    );
\out_val_reg_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => Q(1),
      D => D(30),
      Q => out_val_reg(30),
      R => Q(0)
    );
\out_val_reg_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => Q(1),
      D => D(31),
      Q => out_val_reg(31),
      R => Q(0)
    );
\out_val_reg_reg[32]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => Q(1),
      D => D(32),
      Q => out_val_reg(32),
      R => Q(0)
    );
\out_val_reg_reg[33]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => Q(1),
      D => D(33),
      Q => out_val_reg(33),
      R => Q(0)
    );
\out_val_reg_reg[34]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => Q(1),
      D => D(34),
      Q => out_val_reg(34),
      R => Q(0)
    );
\out_val_reg_reg[35]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => Q(1),
      D => D(35),
      Q => out_val_reg(35),
      R => Q(0)
    );
\out_val_reg_reg[36]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => Q(1),
      D => D(36),
      Q => out_val_reg(36),
      R => Q(0)
    );
\out_val_reg_reg[37]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => Q(1),
      D => D(37),
      Q => out_val_reg(37),
      R => Q(0)
    );
\out_val_reg_reg[38]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => Q(1),
      D => D(38),
      Q => out_val_reg(38),
      R => Q(0)
    );
\out_val_reg_reg[39]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => Q(1),
      D => D(39),
      Q => out_val_reg(39),
      R => Q(0)
    );
\out_val_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => Q(1),
      D => D(3),
      Q => out_val_reg(3),
      R => Q(0)
    );
\out_val_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => Q(1),
      D => D(4),
      Q => out_val_reg(4),
      R => Q(0)
    );
\out_val_reg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => Q(1),
      D => D(5),
      Q => out_val_reg(5),
      R => Q(0)
    );
\out_val_reg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => Q(1),
      D => D(6),
      Q => out_val_reg(6),
      R => Q(0)
    );
\out_val_reg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => Q(1),
      D => D(7),
      Q => out_val_reg(7),
      R => Q(0)
    );
\out_val_reg_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => Q(1),
      D => D(8),
      Q => out_val_reg(8),
      R => Q(0)
    );
\out_val_reg_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => Q(1),
      D => D(9),
      Q => out_val_reg(9),
      R => Q(0)
    );
\shift_in_count[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"45"
    )
        port map (
      I0 => shift_in_count_reg(0),
      I1 => start_edge_reg(0),
      I2 => start_edge_reg(1),
      O => \p_0_in__1\(0)
    );
\shift_in_count[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6066"
    )
        port map (
      I0 => shift_in_count_reg(1),
      I1 => shift_in_count_reg(0),
      I2 => start_edge_reg(0),
      I3 => start_edge_reg(1),
      O => \p_0_in__1\(1)
    );
\shift_in_count[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0BBBB000"
    )
        port map (
      I0 => start_edge_reg(0),
      I1 => start_edge_reg(1),
      I2 => shift_in_count_reg(0),
      I3 => shift_in_count_reg(1),
      I4 => shift_in_count_reg(2),
      O => \shift_in_count[2]_i_1_n_0\
    );
\shift_in_count[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0BBBBBBBB0000000"
    )
        port map (
      I0 => start_edge_reg(0),
      I1 => start_edge_reg(1),
      I2 => shift_in_count_reg(1),
      I3 => shift_in_count_reg(0),
      I4 => shift_in_count_reg(2),
      I5 => shift_in_count_reg(3),
      O => \shift_in_count[3]_i_1_n_0\
    );
\shift_in_count[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1555555540000000"
    )
        port map (
      I0 => \out_buffer_reg[39]_i_3_n_0\,
      I1 => shift_in_count_reg(3),
      I2 => shift_in_count_reg(2),
      I3 => shift_in_count_reg(0),
      I4 => shift_in_count_reg(1),
      I5 => shift_in_count_reg(4),
      O => \shift_in_count[4]_i_1_n_0\
    );
\shift_in_count[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEEEEEEFEFEEEFE"
    )
        port map (
      I0 => \out_buffer_reg[39]_i_3_n_0\,
      I1 => \in_buffer_reg[31]_i_2_n_0\,
      I2 => \in_buffer_reg[31]_i_3_n_0\,
      I3 => \in_buffer_reg[31]_i_4_n_0\,
      I4 => \in_buffer_reg[31]_i_5_n_0\,
      I5 => \in_buffer_reg[31]_i_6_n_0\,
      O => \shift_in_count[5]_i_1_n_0\
    );
\shift_in_count[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0BBBB000"
    )
        port map (
      I0 => start_edge_reg(0),
      I1 => start_edge_reg(1),
      I2 => \shift_in_count[5]_i_3_n_0\,
      I3 => shift_in_count_reg(4),
      I4 => shift_in_count_reg(5),
      O => \shift_in_count[5]_i_2_n_0\
    );
\shift_in_count[5]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => shift_in_count_reg(3),
      I1 => shift_in_count_reg(2),
      I2 => shift_in_count_reg(0),
      I3 => shift_in_count_reg(1),
      O => \shift_in_count[5]_i_3_n_0\
    );
\shift_in_count_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => gen_spi_clk_fb_0,
      CE => \shift_in_count[5]_i_1_n_0\,
      D => \p_0_in__1\(0),
      PRE => Q(0),
      Q => shift_in_count_reg(0)
    );
\shift_in_count_reg[1]\: unisim.vcomponents.FDPE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => gen_spi_clk_fb_0,
      CE => \shift_in_count[5]_i_1_n_0\,
      D => \p_0_in__1\(1),
      PRE => Q(0),
      Q => shift_in_count_reg(1)
    );
\shift_in_count_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => gen_spi_clk_fb_0,
      CE => \shift_in_count[5]_i_1_n_0\,
      CLR => Q(0),
      D => \shift_in_count[2]_i_1_n_0\,
      Q => shift_in_count_reg(2)
    );
\shift_in_count_reg[3]\: unisim.vcomponents.FDPE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => gen_spi_clk_fb_0,
      CE => \shift_in_count[5]_i_1_n_0\,
      D => \shift_in_count[3]_i_1_n_0\,
      PRE => Q(0),
      Q => shift_in_count_reg(3)
    );
\shift_in_count_reg[4]\: unisim.vcomponents.FDPE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => gen_spi_clk_fb_0,
      CE => \shift_in_count[5]_i_1_n_0\,
      D => \shift_in_count[4]_i_1_n_0\,
      PRE => Q(0),
      Q => shift_in_count_reg(4)
    );
\shift_in_count_reg[5]\: unisim.vcomponents.FDPE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => gen_spi_clk_fb_0,
      CE => \shift_in_count[5]_i_1_n_0\,
      D => \shift_in_count[5]_i_2_n_0\,
      PRE => Q(0),
      Q => shift_in_count_reg(5)
    );
\shift_out_count[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"45"
    )
        port map (
      I0 => shift_out_count_reg(0),
      I1 => start_edge_reg(0),
      I2 => start_edge_reg(1),
      O => \p_0_in__0\(0)
    );
\shift_out_count[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6066"
    )
        port map (
      I0 => shift_out_count_reg(1),
      I1 => shift_out_count_reg(0),
      I2 => start_edge_reg(0),
      I3 => start_edge_reg(1),
      O => \p_0_in__0\(1)
    );
\shift_out_count[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"78007878"
    )
        port map (
      I0 => shift_out_count_reg(0),
      I1 => shift_out_count_reg(1),
      I2 => shift_out_count_reg(2),
      I3 => start_edge_reg(0),
      I4 => start_edge_reg(1),
      O => \p_0_in__0\(2)
    );
\shift_out_count[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0BBBBBBBB0000000"
    )
        port map (
      I0 => start_edge_reg(0),
      I1 => start_edge_reg(1),
      I2 => shift_out_count_reg(2),
      I3 => shift_out_count_reg(1),
      I4 => shift_out_count_reg(0),
      I5 => shift_out_count_reg(3),
      O => \shift_out_count[3]_i_1_n_0\
    );
\shift_out_count[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1555555540000000"
    )
        port map (
      I0 => \out_buffer_reg[39]_i_3_n_0\,
      I1 => shift_out_count_reg(3),
      I2 => shift_out_count_reg(0),
      I3 => shift_out_count_reg(1),
      I4 => shift_out_count_reg(2),
      I5 => shift_out_count_reg(4),
      O => \shift_out_count[4]_i_1_n_0\
    );
\shift_out_count[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"557F557FFFFF557F"
    )
        port map (
      I0 => shift_out_count_reg(5),
      I1 => shift_out_count_reg(3),
      I2 => shift_out_count_reg(2),
      I3 => shift_out_count_reg(4),
      I4 => start_edge_reg(1),
      I5 => start_edge_reg(0),
      O => \shift_out_count[5]_i_1_n_0\
    );
\shift_out_count[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1555555540000000"
    )
        port map (
      I0 => \out_buffer_reg[39]_i_3_n_0\,
      I1 => shift_out_count_reg(2),
      I2 => \shift_out_count[5]_i_3_n_0\,
      I3 => shift_out_count_reg(3),
      I4 => shift_out_count_reg(4),
      I5 => shift_out_count_reg(5),
      O => \shift_out_count[5]_i_2_n_0\
    );
\shift_out_count[5]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => shift_out_count_reg(0),
      I1 => shift_out_count_reg(1),
      O => \shift_out_count[5]_i_3_n_0\
    );
\shift_out_count_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_180,
      CE => \shift_out_count[5]_i_1_n_0\,
      CLR => Q(0),
      D => \p_0_in__0\(0),
      Q => shift_out_count_reg(0)
    );
\shift_out_count_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_180,
      CE => \shift_out_count[5]_i_1_n_0\,
      CLR => Q(0),
      D => \p_0_in__0\(1),
      Q => shift_out_count_reg(1)
    );
\shift_out_count_reg[2]\: unisim.vcomponents.FDPE
     port map (
      C => gen_spi_clk_180,
      CE => \shift_out_count[5]_i_1_n_0\,
      D => \p_0_in__0\(2),
      PRE => Q(0),
      Q => shift_out_count_reg(2)
    );
\shift_out_count_reg[3]\: unisim.vcomponents.FDPE
     port map (
      C => gen_spi_clk_180,
      CE => \shift_out_count[5]_i_1_n_0\,
      D => \shift_out_count[3]_i_1_n_0\,
      PRE => Q(0),
      Q => shift_out_count_reg(3)
    );
\shift_out_count_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_180,
      CE => \shift_out_count[5]_i_1_n_0\,
      CLR => Q(0),
      D => \shift_out_count[4]_i_1_n_0\,
      Q => shift_out_count_reg(4)
    );
\shift_out_count_reg[5]\: unisim.vcomponents.FDPE
     port map (
      C => gen_spi_clk_180,
      CE => \shift_out_count[5]_i_1_n_0\,
      D => \shift_out_count[5]_i_2_n_0\,
      PRE => Q(0),
      Q => shift_out_count_reg(5)
    );
\slv_reg0[31]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => start_edge_reg(0),
      I1 => gen_spi_clk_locked,
      I2 => start_edge_reg(1),
      O => \start_edge_reg_reg[0]_0\
    );
spi_clk_en_reg_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5555777F"
    )
        port map (
      I0 => shift_out_count_reg(5),
      I1 => shift_out_count_reg(3),
      I2 => shift_out_count_reg(1),
      I3 => shift_out_count_reg(2),
      I4 => shift_out_count_reg(4),
      O => shift_out_en0
    );
spi_clk_en_reg_reg: unisim.vcomponents.FDRE
     port map (
      C => gen_spi_clk_180,
      CE => '1',
      D => shift_out_en0,
      Q => \^spi_clk_en_reg\,
      R => '0'
    );
spi_csn_reg_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAA88808080"
    )
        port map (
      I0 => shift_out_count_reg(5),
      I1 => shift_out_count_reg(3),
      I2 => shift_out_count_reg(2),
      I3 => shift_out_count_reg(1),
      I4 => shift_out_count_reg(0),
      I5 => shift_out_count_reg(4),
      O => \^shift_out_count_reg[5]_0\
    );
spi_csn_reg_reg: unisim.vcomponents.FDPE
     port map (
      C => gen_spi_clk_180,
      CE => '1',
      D => \^shift_out_count_reg[5]_0\,
      PRE => Q(0),
      Q => axi_spi_cs_n
    );
\start_edge_reg_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_180,
      CE => '1',
      CLR => Q(0),
      D => Q(1),
      Q => start_edge_reg(0)
    );
\start_edge_reg_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => gen_spi_clk_180,
      CE => '1',
      CLR => Q(0),
      D => start_edge_reg(0),
      Q => start_edge_reg(1)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity encoder_system_axi_spi_interface_0_0_axi_spi_interface_v1_0 is
  port (
    axi_spi_sclk : out STD_LOGIC;
    s00_axi_awready : out STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axi_spi_cs_n : out STD_LOGIC;
    axi_spi_mosi : out STD_LOGIC;
    s00_axi_rvalid : out STD_LOGIC;
    spi_slave_reset_n : out STD_LOGIC;
    s00_axi_bvalid : out STD_LOGIC;
    gen_spi_clk_0 : in STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    gen_spi_clk_fb_0 : in STD_LOGIC;
    axi_spi_miso : in STD_LOGIC;
    gen_spi_clk_180 : in STD_LOGIC;
    gen_spi_clk_locked : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_rready : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of encoder_system_axi_spi_interface_0_0_axi_spi_interface_v1_0 : entity is "axi_spi_interface_v1_0";
end encoder_system_axi_spi_interface_0_0_axi_spi_interface_v1_0;

architecture STRUCTURE of encoder_system_axi_spi_interface_0_0_axi_spi_interface_v1_0 is
  signal R0 : STD_LOGIC;
  signal axi_spi_interface_v1_0_S00_AXI_inst_n_12 : STD_LOGIC;
  signal fb_sclk_delay_val : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal free_spi_clk : STD_LOGIC;
  signal in_buffer_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slv_reg1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal slv_reg2 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal spi_clk_en_reg : STD_LOGIC;
  signal spi_driver_i_n_2 : STD_LOGIC;
  signal spi_driver_i_n_5 : STD_LOGIC;
  signal start : STD_LOGIC;
begin
axi_spi_interface_v1_0_S00_AXI_inst: entity work.encoder_system_axi_spi_interface_0_0_axi_spi_interface_v1_0_S00_AXI
     port map (
      D(39 downto 32) => slv_reg1(7 downto 0),
      D(31 downto 0) => slv_reg2(31 downto 0),
      Q(6 downto 3) => fb_sclk_delay_val(3 downto 0),
      Q(2) => free_spi_clk,
      Q(1) => start,
      Q(0) => axi_spi_interface_v1_0_S00_AXI_inst_n_12,
      R0 => R0,
      \axi_rdata_reg[31]_0\(31 downto 0) => in_buffer_reg(31 downto 0),
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_araddr(1 downto 0) => s00_axi_araddr(1 downto 0),
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_arready => s00_axi_arready,
      s00_axi_arvalid => s00_axi_arvalid,
      s00_axi_awaddr(1 downto 0) => s00_axi_awaddr(1 downto 0),
      s00_axi_awready => s00_axi_awready,
      s00_axi_awvalid => s00_axi_awvalid,
      s00_axi_bready => s00_axi_bready,
      s00_axi_bvalid => s00_axi_bvalid,
      s00_axi_rdata(31 downto 0) => s00_axi_rdata(31 downto 0),
      s00_axi_rready => s00_axi_rready,
      s00_axi_rvalid => s00_axi_rvalid,
      s00_axi_wdata(31 downto 0) => s00_axi_wdata(31 downto 0),
      s00_axi_wready => s00_axi_wready,
      s00_axi_wstrb(3 downto 0) => s00_axi_wstrb(3 downto 0),
      s00_axi_wvalid => s00_axi_wvalid,
      \slv_reg0_reg[31]_0\ => spi_driver_i_n_2,
      \slv_reg0_reg[31]_1\ => spi_driver_i_n_5,
      spi_clk_en_reg => spi_clk_en_reg,
      spi_slave_reset_n => spi_slave_reset_n
    );
spi_driver_i: entity work.encoder_system_axi_spi_interface_0_0_spi_driver
     port map (
      D(39 downto 32) => slv_reg1(7 downto 0),
      D(31 downto 0) => slv_reg2(31 downto 0),
      Q(6 downto 3) => fb_sclk_delay_val(3 downto 0),
      Q(2) => free_spi_clk,
      Q(1) => start,
      Q(0) => axi_spi_interface_v1_0_S00_AXI_inst_n_12,
      R0 => R0,
      axi_spi_cs_n => axi_spi_cs_n,
      axi_spi_miso => axi_spi_miso,
      axi_spi_mosi => axi_spi_mosi,
      axi_spi_sclk => axi_spi_sclk,
      gen_spi_clk_0 => gen_spi_clk_0,
      gen_spi_clk_180 => gen_spi_clk_180,
      gen_spi_clk_fb_0 => gen_spi_clk_fb_0,
      gen_spi_clk_locked => gen_spi_clk_locked,
      \in_buffer_reg_reg[31]_0\(31 downto 0) => in_buffer_reg(31 downto 0),
      s00_axi_aclk => s00_axi_aclk,
      \shift_out_count_reg[5]_0\ => spi_driver_i_n_2,
      spi_clk_en_reg => spi_clk_en_reg,
      \start_edge_reg_reg[0]_0\ => spi_driver_i_n_5
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity encoder_system_axi_spi_interface_0_0 is
  port (
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of encoder_system_axi_spi_interface_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of encoder_system_axi_spi_interface_0_0 : entity is "encoder_system_axi_spi_interface_0_0,axi_spi_interface_v1_0,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of encoder_system_axi_spi_interface_0_0 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of encoder_system_axi_spi_interface_0_0 : entity is "axi_spi_interface_v1_0,Vivado 2022.1";
end encoder_system_axi_spi_interface_0_0;

architecture STRUCTURE of encoder_system_axi_spi_interface_0_0 is
  signal \<const0>\ : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of s00_axi_aclk : signal is "xilinx.com:signal:clock:1.0 S00_AXI_CLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of s00_axi_aclk : signal is "XIL_INTERFACENAME S00_AXI_CLK, ASSOCIATED_BUSIF S00_AXI, ASSOCIATED_RESET s00_axi_aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN encoder_system_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axi_aresetn : signal is "xilinx.com:signal:reset:1.0 S00_AXI_RST RST";
  attribute X_INTERFACE_PARAMETER of s00_axi_aresetn : signal is "XIL_INTERFACENAME S00_AXI_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axi_arready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARREADY";
  attribute X_INTERFACE_INFO of s00_axi_arvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARVALID";
  attribute X_INTERFACE_INFO of s00_axi_awready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWREADY";
  attribute X_INTERFACE_INFO of s00_axi_awvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWVALID";
  attribute X_INTERFACE_INFO of s00_axi_bready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI BREADY";
  attribute X_INTERFACE_INFO of s00_axi_bvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI BVALID";
  attribute X_INTERFACE_INFO of s00_axi_rready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RREADY";
  attribute X_INTERFACE_PARAMETER of s00_axi_rready : signal is "XIL_INTERFACENAME S00_AXI, WIZ_DATA_WIDTH 32, WIZ_NUM_REG 4, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 4, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 8, NUM_WRITE_OUTSTANDING 8, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN encoder_system_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axi_rvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RVALID";
  attribute X_INTERFACE_INFO of s00_axi_wready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WREADY";
  attribute X_INTERFACE_INFO of s00_axi_wvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WVALID";
  attribute X_INTERFACE_INFO of s00_axi_araddr : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARADDR";
  attribute X_INTERFACE_INFO of s00_axi_arprot : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARPROT";
  attribute X_INTERFACE_INFO of s00_axi_awaddr : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWADDR";
  attribute X_INTERFACE_INFO of s00_axi_awprot : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWPROT";
  attribute X_INTERFACE_INFO of s00_axi_bresp : signal is "xilinx.com:interface:aximm:1.0 S00_AXI BRESP";
  attribute X_INTERFACE_INFO of s00_axi_rdata : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RDATA";
  attribute X_INTERFACE_INFO of s00_axi_rresp : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RRESP";
  attribute X_INTERFACE_INFO of s00_axi_wdata : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WDATA";
  attribute X_INTERFACE_INFO of s00_axi_wstrb : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WSTRB";
begin
  s00_axi_bresp(1) <= \<const0>\;
  s00_axi_bresp(0) <= \<const0>\;
  s00_axi_rresp(1) <= \<const0>\;
  s00_axi_rresp(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst: entity work.encoder_system_axi_spi_interface_0_0_axi_spi_interface_v1_0
     port map (
      axi_spi_cs_n => axi_spi_cs_n,
      axi_spi_miso => axi_spi_miso,
      axi_spi_mosi => axi_spi_mosi,
      axi_spi_sclk => axi_spi_sclk,
      gen_spi_clk_0 => gen_spi_clk_0,
      gen_spi_clk_180 => gen_spi_clk_180,
      gen_spi_clk_fb_0 => gen_spi_clk_fb_0,
      gen_spi_clk_locked => gen_spi_clk_locked,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_araddr(1 downto 0) => s00_axi_araddr(3 downto 2),
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_arready => s00_axi_arready,
      s00_axi_arvalid => s00_axi_arvalid,
      s00_axi_awaddr(1 downto 0) => s00_axi_awaddr(3 downto 2),
      s00_axi_awready => s00_axi_awready,
      s00_axi_awvalid => s00_axi_awvalid,
      s00_axi_bready => s00_axi_bready,
      s00_axi_bvalid => s00_axi_bvalid,
      s00_axi_rdata(31 downto 0) => s00_axi_rdata(31 downto 0),
      s00_axi_rready => s00_axi_rready,
      s00_axi_rvalid => s00_axi_rvalid,
      s00_axi_wdata(31 downto 0) => s00_axi_wdata(31 downto 0),
      s00_axi_wready => s00_axi_wready,
      s00_axi_wstrb(3 downto 0) => s00_axi_wstrb(3 downto 0),
      s00_axi_wvalid => s00_axi_wvalid,
      spi_slave_reset_n => spi_slave_reset_n
    );
end STRUCTURE;
