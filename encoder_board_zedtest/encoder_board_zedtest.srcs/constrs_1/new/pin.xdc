set_property IOB TRUE [get_cells -hier * -filter {name =~ "*axi_spi_interface*/inst/*mosi_reg_reg"}]
set_property IOB TRUE [get_cells -hier * -filter {name =~ "*axi_spi_interface*/inst/*spi_csn_reg_reg"}]

# -------------------------------- PYNQ_Z2 Board Config ----------------------------------------------------

# Board/System Clock
#set_property -dict {PACKAGE_PIN H16 IOSTANDARD LVCMOS33} [get_ports enc_sys_clk]

# RESET and lock
#set_property -dict {PACKAGE_PIN L15 IOSTANDARD LVCMOS33} [get_ports enc_clk_locked]

#set_property -dict {PACKAGE_PIN W14 IOSTANDARD LVCMOS33} [get_ports enc_spi_sclk]; # JA1
#set_property -dict {PACKAGE_PIN Y14 IOSTANDARD LVCMOS33} [get_ports enc_spi_cs_n]; # JA2
#set_property -dict {PACKAGE_PIN T11 IOSTANDARD LVCMOS33} [get_ports enc_miso]; # JA3
#set_property -dict {PACKAGE_PIN T10 IOSTANDARD LVCMOS33} [get_ports enc_mosi]; # JA4
#set_property -dict {PACKAGE_PIN W13 IOSTANDARD LVCMOS33} [get_ports spi_slave_reset_n]; # JA10

# --------------------------------------- ZEDBOARD_CONFIG ---------------------------------------

# 100 Mhz Clock (Must be set appropriately in MMCM)
set_property -dict {PACKAGE_PIN Y9 IOSTANDARD LVCMOS33} [get_ports enc_sys_clk]

# RESET and lock
set_property -dict {PACKAGE_PIN T22 IOSTANDARD LVCMOS33} [get_ports enc_clk_locked]

# Encoder SPI PMOD A
set_property -dict {PACKAGE_PIN Y11 IOSTANDARD LVCMOS33} [get_ports enc_spi_sclk];  # "JA1"
set_property -dict {PACKAGE_PIN AA11 IOSTANDARD LVCMOS33} [get_ports enc_spi_cs_n];  # "JA2"
set_property -dict {PACKAGE_PIN Y10 IOSTANDARD LVCMOS33} [get_ports enc_miso];  # "JA3"
set_property -dict {PACKAGE_PIN AA9 IOSTANDARD LVCMOS33} [get_ports enc_mosi];  # "JA4"
set_property -dict {PACKAGE_PIN AB11 IOSTANDARD LVCMOS33} [get_ports spi_slave_reset_n];  # "JA7"
