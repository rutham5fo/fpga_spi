#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets -hier spi_clk_buf -filter {name =~ "*decoder_top*/inst*"}]

# IOB regs
#set_property IOB TRUE [get_cells -hier * -filter {name =~ "*decoder_top*/inst/*spi_out_reg_reg"}]
#set_property IOB TRUE [get_cells -hier * -filter {name =~ "*decoder_top*/inst/*spi_in_reg_reg"}]

# Board/System Clock
set_property -dict {PACKAGE_PIN Y9 IOSTANDARD LVCMOS33} [get_ports dec_sys_clk]

# lock
set_property -dict {PACKAGE_PIN U14 IOSTANDARD LVCMOS33} [get_ports dec_clk_locked]
#set_property -dict {PACKAGE_PIN U19 IOSTANDARD LVCMOS33} [get_ports spi_clk_locked]

# Decoder SPI PMOD A
set_property -dict {PACKAGE_PIN Y11 IOSTANDARD LVCMOS33} [get_ports dec_mosi]
set_property -dict {PACKAGE_PIN AA11 IOSTANDARD LVCMOS33} [get_ports dec_miso]
set_property -dict {PACKAGE_PIN Y10 IOSTANDARD LVCMOS33} [get_ports dec_spi_cs_n]
set_property -dict {PACKAGE_PIN AA9 IOSTANDARD LVCMOS33} [get_ports dec_spi_clk]
#set_property -dict {PACKAGE_PIN AB9 IOSTANDARD LVCMOS33} [get_ports dec_spi_clk]
set_property -dict {PACKAGE_PIN AB11 IOSTANDARD LVCMOS33} [get_ports dec_reset_n]
#set_property -dict {PACKAGE_PIN AB9 IOSTANDARD LVCMOS33} [get_ports dec_spi_clk_fb]
#set_property -dict {PACKAGE_PIN AA8 IOSTANDARD LVCMOS33} [get_ports dec_spi_clk_fb]
set_property -dict {PACKAGE_PIN AB10 IOSTANDARD LVCMOS33} [get_ports dec_sys_resetn]

#LEDs
set_property -dict {PACKAGE_PIN T22 IOSTANDARD LVCMOS33} [get_ports {errors_corrected[0]}]
set_property -dict {PACKAGE_PIN T21 IOSTANDARD LVCMOS33} [get_ports {errors_corrected[1]}]
set_property -dict {PACKAGE_PIN U22 IOSTANDARD LVCMOS33} [get_ports {errors_corrected[2]}]
set_property -dict {PACKAGE_PIN U21 IOSTANDARD LVCMOS33} [get_ports {errors_corrected[3]}]


