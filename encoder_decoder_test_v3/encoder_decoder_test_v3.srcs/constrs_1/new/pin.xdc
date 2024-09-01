# BUFGCTRL loc
#set_property LOC BUFGCTRL_X0Y24 [get_cells -hier clkout1_buf -filter {name =~ "*clk_wiz*/inst*"}]
#set_property LOC BUFGCTRL_X0Y26 [get_cells -hier clkout2_buf -filter {name =~ "*clk_wiz*/inst*"}]
#set_property LOC BUFGCTRL_X0Y25 [get_cells -hier BUFGMUX_inst_0 -filter {name =~ "*axi_spi_interface*/inst/spi_driver*"}]

#set_property LOC BUFGCTRL_X0Y28 [get_cells -hier clkout3_buf -filter {name =~ "*clk_wiz*/inst*"}]
#set_property LOC BUFGCTRL_X0Y30 [get_cells -hier clkout4_buf -filter {name =~ "*clk_wiz*/inst*"}]
#set_property LOC BUFGCTRL_X0Y29 [get_cells -hier BUFGMUX_inst_1 -filter {name =~ "*axi_spi_interface*/inst/spi_driver*"}]

#set_property LOC BUFGCTRL_X0Y27 [get_cells -hier BUFGMUX_inst_2 -filter {name =~ "*axi_spi_interface*/inst/spi_driver*"}]

#set_property CLOCK_DEDICATED_ROUTE ANY_CMT_COLUMN [get_nets system_test_v3_i/axi_spi_interface_0/inst/spi_driver_i/fb_spi_clk_mux_0]
#set_property CLOCK_DEDICATED_ROUTE ANY_CMT_COLUMN [get_nets system_test_v3_i/axi_spi_interface_0/inst/spi_driver_i/fb_spi_clk_mux_1]

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

