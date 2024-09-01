set div_clk_period 40.000
set div_clk_start [expr {"$div_clk_period" / 2}]
#set enc_fb_clk_skew_shift 0
#set enc_fb_clk_skew [expr "10.000 + $enc_fb_clk_skew_shift"]

set enc_setup 1
set enc_hold 1.5
set dec_setup 1
set dec_hold 1.5

create_clock -period "$div_clk_period" -name spiClk [get_ports dec_spi_clk]
#create_clock -period "$div_clk_period" -name enc_spiClk_latch -waveform "$enc_fb_clk_skew [expr $div_clk_start + $enc_fb_clk_skew]"
#create_generated_clock -name dec_spiClk_out -source [get_pins -of [get_cells -hier ODDR_inst -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == C}] -divide_by 1 [get_ports dec_spi_clk_fb]

set dec_sys_clk [get_clocks -of [get_pins -of [get_cells -hier * -filter {name =~ "*decoder_top*/inst"}] -filter {ref_pin_name == "clk"}]]

set sys_clk_period [get_property PERIOD "$dec_sys_clk"]
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

#set_clock_groups -async -group [get_clocks dec_spiClk_out] -group "$dec_sys_clk"
#set_clock_groups -async -group [get_clocks spiClk] -group "$dec_sys_clk"
#set_clock_groups -async -group "$dec_spi_clk_pll_0" -group "$dec_sys_clk"

#set_property PHASESHIFT_MODE LATENCY [get_cells -hier mmcm_adv_inst -filter {name =~ "*clk_wiz_1*"}]

# Decoder timing constraints
set_input_delay -clock [get_clocks spiClk] -max [expr "$unit_interval - $enc_skew_bre"] [get_ports "dec_mosi"];
set_input_delay -clock [get_clocks spiClk] -min "$enc_skew_are" [get_ports "dec_mosi"];
#set_input_delay -clock "$dec_sys_clk" -clock_fall -max [expr "$sys_clk_period - $dec_setup - 1"] [get_ports [list "dec_reset_n" "dec_spi_cs_n"]]
#set_input_delay -clock "$dec_sys_clk" -clock_fall -min "$dec_hold" [get_ports [list "dec_reset_n" "dec_spi_cs_n"]]

#set_output_delay -clock [get_clocks enc_spiClk_latch] 0.0 [get_ports dec_miso]
#set_output_delay -clock [get_clocks enc_spiClk_latch] -clock_fall -max [expr "$enc_fb_clk_skew - $dec_tco_max - $enc_setup"] [get_ports dec_miso]
#set_output_delay -clock [get_clocks enc_spiClk_latch] -clock_fall -min [expr "$enc_fb_clk_skew - $unit_interval - $dec_tco_min + $enc_hold"] [get_ports dec_miso]

set_max_delay -datapath_only -from [get_pins -of [get_cells -hier spi_out_oddr -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == C}] -to [get_ports dec_miso] "$dec_out_dly_max"
set_min_delay -from [get_pins -of [get_cells -hier spi_out_oddr -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == C}] -to [get_ports dec_miso] "$dec_out_dly_min"

# Ignore paths
#set_false_path -from [get_ports dec_reset_n] -to [all_registers]
set_false_path -from [get_ports [list "dec_reset_n" "dec_spi_cs_n"]] -to [get_cells -hier [list "reset_n_iddr" "spi_csn_iddr"] -filter {name =~ "*decoder_top*/inst*"}]
set_false_path -to [get_ports errors_corrected]