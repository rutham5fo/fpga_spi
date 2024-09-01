set div_clk_period 40.000
set div_clk_start [expr {"$div_clk_period" / 2}]

set enc_setup 1
set enc_hold 1.5
set dec_setup 1
set dec_hold 1.5

# Comment the following line if a PLL is used.
create_clock -period "$div_clk_period" -name spiClk [get_ports dec_spi_clk]

set dec_sys_clk [get_clocks -of [get_pins -of [get_cells -hier * -filter {name =~ "*decoder_top*/inst"}] -filter {ref_pin_name == "clk"}]]

# Comment the following line if PLL is NOT used
#set dec_spi_clk [get_clocks -of [get_pins -of [get_cells -hier * -filter {name =~ "**decoder_top*/inst"}] -filter {ref_pin_name == "spi_clk_pll_0"}]]

set sys_clk_period [get_property PERIOD "$dec_sys_clk"]

# Comment the following line if PLL is NOT used
#set unit_interval [get_property PERIOD "$dec_spi_clk"]

# Comment the following line if PLL is used
set unit_interval [get_property PERIOD [get_clocks spiClk]]

set half_unit_interval [expr {"$unit_interval" / 2}]

set enc_tco_max 4.128
set enc_tco_min 3.901
set dec_tco_max 4.088
set dec_tco_min 1.494
set dec_out_dly_max 4.5
set dec_out_dly_min 0

set dec_data_valid_window [expr "$unit_interval - $dec_tco_max + $dec_tco_min"]
set dec_dv_half [expr "$dec_data_valid_window / 2"]
set enc_data_valid_window [expr "$unit_interval - $enc_tco_max + $enc_tco_min"]
set enc_dv_half [expr "$enc_data_valid_window / 2"]
set enc_clk_skew_shift 0
set enc_skew_bre [expr "$enc_dv_half + $enc_clk_skew_shift"]
set enc_skew_are [expr "$enc_dv_half - $enc_clk_skew_shift"]

# Decoder timing constraints

# Comment the following lines if PLL is used
set_input_delay -clock [get_clocks spiClk] -max [expr "$unit_interval - $enc_skew_bre"] [get_ports "dec_mosi"];
set_input_delay -clock [get_clocks spiClk] -min "$enc_skew_are" [get_ports "dec_mosi"];

# Comment the following lines if PLL is NOT used
#set_input_delay -clock "$dec_spi_clk" -max [expr "$unit_interval - $enc_skew_bre"] [get_ports "dec_mosi"];
#set_input_delay -clock "$dec_spi_clk" -min "$enc_skew_are" [get_ports "dec_mosi"];

#set_output_delay -clock [get_clocks enc_spiClk_latch] 0.0 [get_ports dec_miso]
set_max_delay -datapath_only -from [get_pins -of [get_cells -hier spi_out_oddr -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == C}] -to [get_ports dec_miso] "$dec_out_dly_max"
set_min_delay -from [get_pins -of [get_cells -hier spi_out_oddr -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == C}] -to [get_ports dec_miso] "$dec_out_dly_min"

# Ignore paths
set_false_path -from [get_ports [list "dec_reset_n" "dec_spi_cs_n"]] -to [get_cells -hier [list "reset_n_iddr" "spi_csn_iddr"] -filter {name =~ "*decoder_top*/inst*"}]
set_false_path -to [get_ports errors_corrected]