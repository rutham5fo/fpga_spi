# Decoder SPI PMOD A
set_property -dict {PACKAGE_PIN Y18 IOSTANDARD LVCMOS33} [get_ports spi_mosi]
set_property -dict {PACKAGE_PIN Y19 IOSTANDARD LVCMOS33} [get_ports spi_miso]
set_property -dict {PACKAGE_PIN Y16 IOSTANDARD LVCMOS33} [get_ports spi_cs_n]
set_property -dict {PACKAGE_PIN U18 IOSTANDARD LVCMOS33} [get_ports spi_clk]
set_property -dict {PACKAGE_PIN Y17 IOSTANDARD LVCMOS33} [get_ports reset_n]

#LEDs
set_property -dict {PACKAGE_PIN R14 IOSTANDARD LVCMOS33} [get_ports {errors_corrected[0]}]
set_property -dict {PACKAGE_PIN P14 IOSTANDARD LVCMOS33} [get_ports {errors_corrected[1]}]
set_property -dict {PACKAGE_PIN N16 IOSTANDARD LVCMOS33} [get_ports {errors_corrected[2]}]
set_property -dict {PACKAGE_PIN M14 IOSTANDARD LVCMOS33} [get_ports {errors_corrected[3]}]

# Clocks
create_clock -period 10.000 -waveform {0.000 5.000} -name sysClk [get_ports clk]
create_clock -period 20.000 -waveform {0.000 10.000} -name spiClk [get_ports spi_clk]
