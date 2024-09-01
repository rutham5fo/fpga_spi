set div_clk_period 40.000
set div_clk_start [expr {"$div_clk_period" / 2}]

set dec_setup 1
set dec_hold 1.5

create_generated_clock -name enc_spiClk_out -source [get_pins -of [get_cells -hier ODDR_inst -filter {name =~ "*axi_spi_interface*/inst*"}] -filter {ref_pin_name == C}] -divide_by 1 [get_ports enc_spi_sclk]

set enc_sys_clk [get_clocks -of [get_pins -of [get_cells -hier * -filter {name =~ "*axi_spi_interface*/inst"}] -filter {ref_pin_name =~ "*aclk"}]]
set enc_gen_spi_clk_0 [get_clocks -of [get_pins -of [get_cells -hier * -filter {name =~ "*axi_spi_interface*/inst"}] -filter {name =~ "*gen_spi_clk_0"}]]
set enc_gen_spi_clk_180 [get_clocks -of [get_pins -of [get_cells -hier * -filter {name =~ "*axi_spi_interface*/inst"}] -filter {name =~ "*gen_spi_clk_180"}]]
set enc_gen_spi_clk_fb_0 [get_clocks -of [get_pins -of [get_cells -hier * -filter {name =~ "*axi_spi_interface*/inst"}] -filter {name =~ "*gen_spi_clk_fb_0"}]]

set enc_cdc_max [expr {[get_property PERIOD "$enc_sys_clk"] * 2}]
set enc_cdc_min [expr {[get_property PERIOD "$enc_sys_clk"] * 1}]
set enc_cdc_spi_max [expr {[get_property PERIOD "$enc_gen_spi_clk_0"] / 2}]
set enc_cdc_spi_min 0

set unit_interval [get_property PERIOD "$enc_gen_spi_clk_180"]
set half_unit_interval [expr {"$unit_interval" / 2}]

#set enc_clk_skew 3.387
#set enc_clk_skew 12.109
#set enc_clk_skew 23.109
set enc_in_dly_max 2.5
set enc_in_dly_min 0
set enc_tco_max 4.128
set enc_tco_min 3.901
set enc_hold_comp 4
#set dec_tco_max 7.919
#set dec_tco_min 2.276
set dec_tco_max 4.088
set dec_tco_min 1.581
set enc_data_valid_window [expr "$unit_interval - $enc_tco_max + $enc_tco_min"]
set enc_dv_half [expr "$enc_data_valid_window / 2"]
set dec_data_valid_window [expr "$unit_interval - $dec_tco_max + $dec_tco_min"]
set dec_dv_half [expr "$dec_data_valid_window / 2"]

set enc_clk_skew_shift 0
set dec_clk_skew_shift 0
set enc_clk_skew [expr "$enc_dv_half + $enc_tco_max + $enc_clk_skew_shift"]
set dec_skew_bre [expr "$dec_dv_half + $dec_clk_skew_shift"]
set dec_skew_are [expr "$dec_dv_half - $dec_clk_skew_shift"]

create_clock -period "$div_clk_period" -name enc_spiClk_fwd -waveform "$enc_clk_skew [expr $div_clk_start + $enc_clk_skew]"

# latch - launch = enc_clk_skew
# output_delay_max  = enc_clk_skew - dec_setup - enc_tco_max
#                   = enc_dv_half - dec_setup

# latch - launch = enc_clk_skew - unit_interval
# output_delay_min = enc_clk_skew - unit_interval + dec_hold - enc_tco_min
#                  = -enc_dv_half + dec_hold

#set_property PHASESHIFT_MODE LATENCY [get_cells -hier mmcm_adv_inst -filter {name =~ "*clk_wiz_0*"}]

# Encoder timing constraints
set_max_delay -datapath_only -from "$enc_sys_clk" -to "$enc_gen_spi_clk_0" $enc_cdc_max
set_min_delay -from "$enc_sys_clk" -to "$enc_gen_spi_clk_0" $enc_cdc_min

set_max_delay -datapath_only -from "$enc_sys_clk" -to "$enc_gen_spi_clk_180" $enc_cdc_max
set_min_delay -from "$enc_sys_clk" -to "$enc_gen_spi_clk_180" $enc_cdc_min

set_max_delay -datapath_only -from "$enc_sys_clk" -to "$enc_gen_spi_clk_fb_0" $enc_cdc_max
set_min_delay -from "$enc_sys_clk" -to "$enc_gen_spi_clk_fb_0" $enc_cdc_min

set_max_delay -datapath_only -from "$enc_gen_spi_clk_0" -to "$enc_sys_clk" $enc_cdc_max
set_min_delay -from "$enc_gen_spi_clk_0" -to "$enc_sys_clk" $enc_cdc_min

set_max_delay -datapath_only -from "$enc_gen_spi_clk_180" -to "$enc_sys_clk" $enc_cdc_max
set_min_delay -from "$enc_gen_spi_clk_180" -to "$enc_sys_clk" $enc_cdc_min

set_max_delay -datapath_only -from "$enc_gen_spi_clk_fb_0" -to "$enc_sys_clk" $enc_cdc_max
set_min_delay -from "$enc_gen_spi_clk_fb_0" -to "$enc_sys_clk" $enc_cdc_min

set_max_delay -datapath_only -from "$enc_gen_spi_clk_180" -to "$enc_gen_spi_clk_fb_0" $enc_cdc_spi_max
set_min_delay -from "$enc_gen_spi_clk_180" -to "$enc_gen_spi_clk_fb_0" $enc_cdc_spi_min

set_max_delay -datapath_only -from [get_pins -of [get_cells -hier spi_clk_en_reg_reg -filter {name =~ "*axi_spi_interface*/inst*"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier ODDR_inst -filter {name =~ "*axi_spi_interface*/inst*"}] -filter {ref_pin_name == CE}] 3
set_min_delay -from [get_pins -of [get_cells -hier spi_clk_en_reg_reg -filter {name =~ "*axi_spi_interface*/inst*"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier ODDR_inst -filter {name =~ "*axi_spi_interface*/inst*"}] -filter {ref_pin_name == CE}] 0
set_max_delay -datapath_only -from [get_pins -of [get_cells -hier spi_clk_en_reg_reg -filter {name =~ "*axi_spi_interface*/inst*"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier ODDR_inst -filter {name =~ "*axi_spi_interface*/inst*"}] -filter {ref_pin_name == R}] 3.5
set_min_delay -from [get_pins -of [get_cells -hier spi_clk_en_reg_reg -filter {name =~ "*axi_spi_interface*/inst*"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier ODDR_inst -filter {name =~ "*axi_spi_interface*/inst*"}] -filter {ref_pin_name == R}] 0

set_input_delay -clock "$enc_gen_spi_clk_fb_0" -max [expr "$unit_interval - $dec_skew_bre"] [get_ports enc_miso];
set_input_delay -clock "$enc_gen_spi_clk_fb_0" -min "$dec_skew_are" [get_ports enc_miso];

#set_output_delay -clock [get_clocks enc_spiClk_fwd] -max [expr "$enc_clk_skew - $enc_tco_max - $dec_setup"] [get_ports [list "enc_spi_cs_n" "enc_mosi"]]
#set_output_delay -clock [get_clocks enc_spiClk_fwd] -min [expr "$enc_clk_skew - $unit_interval - $enc_tco_min + $dec_hold + $enc_hold_comp"] [get_ports [list "enc_spi_cs_n" "enc_mosi"]]
set_output_delay -clock [get_clocks enc_spiClk_out] -max [expr "$enc_clk_skew - $enc_tco_max - $dec_setup"] [get_ports [list "enc_spi_cs_n" "enc_mosi"]]
set_output_delay -clock [get_clocks enc_spiClk_out] -min [expr "0 - $dec_hold"] [get_ports [list "enc_spi_cs_n" "enc_mosi"]]

set_false_path -to [get_ports spi_slave_reset_n]
