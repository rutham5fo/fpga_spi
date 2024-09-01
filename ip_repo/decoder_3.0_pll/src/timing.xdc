
# -----------------------------------------------------------------------------------------------

set dec_sysClk_period [get_property PERIOD [get_clocks -of [get_ports clk]]]
set dec_spiClk_period [get_property PERIOD [get_clocks -of [get_ports spi_clk_pll_0]]]

set dec_setup 1
set dec_hold 1.5
set dec_cdc_delay_max [expr "($dec_sysClk_period / 2) - 2"]
set dec_cdc_delay_min "$dec_hold"
set dec_half_unit_interval [expr {"$dec_spiClk_period" / 2}]

set_property ASYNC_REG true [get_cells -hierarchical -filter {name =~ "*_metaguard*reg*"}]

# CDC spiClk to sysClk
set_max_delay -datapath_only -from [get_pins -of [get_cells -hier * -filter {name =~ "*spi_p_valid_reg"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*spi_p*_valid_metaguard_reg[0]"}] -filter {ref_pin_name == D}] $dec_cdc_delay_max
set_min_delay -from [get_pins -of [get_cells -hier * -filter {name =~ "*spi_p_valid_reg"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*spi_p*_valid_metaguard_reg[0]"}] -filter {ref_pin_name == D}] $dec_cdc_delay_min
set_max_delay -datapath_only -from [get_pins -of [get_cells -hier * -filter {name =~ "*spi_n_valid_reg"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*spi_n*_valid_metaguard_reg[0]"}] -filter {ref_pin_name == D}] $dec_cdc_delay_max
set_min_delay -from [get_pins -of [get_cells -hier * -filter {name =~ "*spi_n_valid_reg"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*spi_n*_valid_metaguard_reg[0]"}] -filter {ref_pin_name == D}] $dec_cdc_delay_min
set_max_delay -datapath_only -from [get_pins -of [get_cells -hier spi_in_iddr -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*spi_*_data_metaguard_reg[0]"}] -filter {ref_pin_name == D}] $dec_cdc_delay_max
set_min_delay -from [get_pins -of [get_cells -hier spi_in_iddr -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*spi_*_data_metaguard_reg[0]"}] -filter {ref_pin_name == D}] $dec_cdc_delay_min

# CDC sysClk to spiClk
set_max_delay -datapath_only -from [get_pins -of [get_cells -hier * -filter {name =~ "*spi_io_regs_en_reg"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier [list "spi_out_oddr" "spi_in_iddr"] -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == CE}] $dec_cdc_delay_max
set_min_delay -from [get_pins -of [get_cells -hier * -filter {name =~ "*spi_io_regs_en_reg"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier [list "spi_out_oddr" "spi_in_iddr"] -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == CE}] $dec_cdc_delay_min
set_max_delay -datapath_only -from [get_pins -of [get_cells -hier * -filter {name =~ "*distru_p_reg"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier "spi_out_oddr" -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == D1}] $dec_cdc_delay_max
set_min_delay -from [get_pins -of [get_cells -hier * -filter {name =~ "*distru_p_reg"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier "spi_out_oddr" -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == D1}] $dec_cdc_delay_min
set_max_delay -datapath_only -from [get_pins -of [get_cells -hier * -filter {name =~ "*distru_n_reg"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier "spi_out_oddr" -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == D2}] $dec_cdc_delay_max
set_min_delay -from [get_pins -of [get_cells -hier * -filter {name =~ "*distru_n_reg"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier "spi_out_oddr" -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == D2}] $dec_cdc_delay_min

# CDC sysClk to output port
set_max_delay -datapath_only -from [get_pins -of [get_cells -hier * -filter {name =~ "*miso_disable_reg_reg"}] -filter {ref_pin_name == C}] -to [get_ports spi_miso] $dec_half_unit_interval
set_min_delay -from [get_pins -of [get_cells -hier * -filter {name =~ "*miso_disable_reg_reg"}] -filter {ref_pin_name == C}] -to [get_ports spi_miso] $dec_cdc_delay_min

# Ignore Async paths
set_false_path -to [get_pins -of [get_cells -hier [list "spi_p_valid_reg" "spi_n_valid_reg"] -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == CLR}]
set_false_path -to [get_pins -of [get_cells -hier [list "spi_in_iddr" "spi_out_oddr"] -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == R}]

# -----------------------------------------------------------------------------------------------
