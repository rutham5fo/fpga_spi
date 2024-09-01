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

create_clock -period 10.000 -name sysClk [get_ports clk]
create_clock -period 20.000 -name spiClk [get_ports spi_clk]

# -----------------------------------------------------------------------------------------------
set dec_sysClk_period_ooc [get_property PERIOD [get_clocks -of [get_ports clk]]]
set dec_io_delay_max_ooc 6.000
set dec_io_delay_min_ooc 5.000
set dec_cdc_delay_max_ooc [expr { $dec_sysClk_period_ooc * 2 }]
set dec_cdc_delay_min_ooc [expr { $dec_sysClk_period_ooc * 1 }]

set_max_delay -datapath_only -from [get_pins -of [get_cells -hier * -filter {name =~ "*miso_reg_reg[31]"}] -filter {ref_pin_name == C}] -to [get_ports spi_miso] $dec_io_delay_max_ooc
set_min_delay -from [get_pins -of [get_cells -hier * -filter {name =~ "*miso_reg_reg[31]"}] -filter {ref_pin_name == C}] -to [get_ports spi_miso] $dec_io_delay_min_ooc
set_max_delay -datapath_only -from [get_ports spi_cs_n] -to [get_pins -of [get_cells -hier * -filter {name =~ "*out_shft_cnt_reg*"}] -filter {ref_pin_name == CLR}] $dec_io_delay_max_ooc
set_min_delay -from [get_ports spi_cs_n] -to [get_pins -of [get_cells -hier * -filter {name =~ "*out_shft_cnt_reg*"}] -filter {ref_pin_name == CLR}] $dec_io_delay_min_ooc
set_max_delay -datapath_only -from [get_ports spi_mosi] -to [get_pins -of [get_cells -hier * -filter {name =~ "*mosi_reg_reg*"}] -filter {ref_pin_name == D}] $dec_io_delay_max_ooc
set_min_delay -from [get_ports spi_mosi] -to [get_pins -of [get_cells -hier * -filter {name =~ "*mosi_reg_reg*"}] -filter {ref_pin_name == D}] $dec_io_delay_min_ooc

# Remove async_reset from STA
set_false_path -from [get_ports reset_n] -to [all_registers]
set_false_path -from [get_clocks -of_objects [get_ports clk]] -to [get_ports errors_corrected]