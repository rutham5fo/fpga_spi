set_property IOB TRUE [get_cells -hier * -filter {name =~ "*decoder_top*/inst/*spi_in_reg_reg"}]
set_property IOB TRUE [get_cells -hier * -filter {name =~ "*decoder_top*/inst/*spi_out_reg_reg"}]
set_property IOB TRUE [get_cells -hier * -filter {name =~ "*axi_spi_interface*/inst/*mosi_reg_reg"}]
set_property IOB TRUE [get_cells -hier * -filter {name =~ "*axi_spi_interface*/inst/*miso_reg_reg"}]
set_property IOB TRUE [get_cells -hier * -filter {name =~ "*axi_spi_interface*/inst/*spi_csn_reg_reg"}]

# 125 Mhz Clock
set_property -dict {PACKAGE_PIN H16 IOSTANDARD LVCMOS33} [get_ports dec_sys_clk]

# RESET and lock
set_property -dict {PACKAGE_PIN L15 IOSTANDARD LVCMOS33} [get_ports locked]
set_property -dict {PACKAGE_PIN L14 IOSTANDARD LVCMOS33} [get_ports ARESET_N]

# Encoder SPI PMOD B
set_property -dict {PACKAGE_PIN W14 IOSTANDARD LVCMOS33} [get_ports axi_spi_mosi]
set_property -dict {PACKAGE_PIN Y14 IOSTANDARD LVCMOS33} [get_ports axi_spi_miso]
set_property -dict {PACKAGE_PIN T11 IOSTANDARD LVCMOS33} [get_ports axi_spi_cs_n]
set_property -dict {PACKAGE_PIN V16 IOSTANDARD LVCMOS33} [get_ports axi_spi_clk]
set_property -dict {PACKAGE_PIN T10 IOSTANDARD LVCMOS33} [get_ports spi_slave_reset_n]

# Decoder SPI PMOD A
set_property -dict {PACKAGE_PIN Y18 IOSTANDARD LVCMOS33} [get_ports dec_spi_mosi]
set_property -dict {PACKAGE_PIN Y19 IOSTANDARD LVCMOS33} [get_ports dec_spi_miso]
set_property -dict {PACKAGE_PIN Y16 IOSTANDARD LVCMOS33} [get_ports dec_spi_cs_n]
set_property -dict {PACKAGE_PIN U18 IOSTANDARD LVCMOS33} [get_ports dec_spi_clk]
set_property -dict {PACKAGE_PIN Y17 IOSTANDARD LVCMOS33} [get_ports dec_reset_n]

#LEDs
set_property -dict {PACKAGE_PIN R14 IOSTANDARD LVCMOS33} [get_ports {errors_corrected[0]}]
set_property -dict {PACKAGE_PIN P14 IOSTANDARD LVCMOS33} [get_ports {errors_corrected[1]}]
set_property -dict {PACKAGE_PIN N16 IOSTANDARD LVCMOS33} [get_ports {errors_corrected[2]}]
set_property -dict {PACKAGE_PIN M14 IOSTANDARD LVCMOS33} [get_ports {errors_corrected[3]}]
