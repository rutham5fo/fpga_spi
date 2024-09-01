# Board/System Clock
set_property -dict {PACKAGE_PIN Y9 IOSTANDARD LVCMOS33} [get_ports dec_sys_clk]

# lock
set_property -dict {PACKAGE_PIN U14 IOSTANDARD LVCMOS33} [get_ports dec_clk_locked]
#set_property -dict {PACKAGE_PIN U19 IOSTANDARD LVCMOS33} [get_ports spi_clk_locked]; # Comment this line if PLL is NOT used

# Decoder SPI PMOD A
set_property -dict {PACKAGE_PIN Y11 IOSTANDARD LVCMOS33} [get_ports dec_mosi]; #Pin 1
set_property -dict {PACKAGE_PIN AA11 IOSTANDARD LVCMOS33} [get_ports dec_miso]; #Pin 2
set_property -dict {PACKAGE_PIN Y10 IOSTANDARD LVCMOS33} [get_ports dec_spi_cs_n]; #Pin 3
set_property -dict {PACKAGE_PIN AA9 IOSTANDARD LVCMOS33} [get_ports dec_spi_clk]; #Pin 4 (+ve SRCC pin)
set_property -dict {PACKAGE_PIN AB11 IOSTANDARD LVCMOS33} [get_ports dec_reset_n]; #Pin 7
set_property -dict {PACKAGE_PIN P16 IOSTANDARD LVCMOS18} [get_ports dec_sys_resetn];  # "BTNC"

#LEDs
set_property -dict {PACKAGE_PIN T22 IOSTANDARD LVCMOS33} [get_ports {errors_corrected[0]}]
set_property -dict {PACKAGE_PIN T21 IOSTANDARD LVCMOS33} [get_ports {errors_corrected[1]}]
set_property -dict {PACKAGE_PIN U22 IOSTANDARD LVCMOS33} [get_ports {errors_corrected[2]}]
set_property -dict {PACKAGE_PIN U21 IOSTANDARD LVCMOS33} [get_ports {errors_corrected[3]}]


