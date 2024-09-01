set div_clk_period 20.000
set div_clk_start [expr {"$div_clk_period" / 2}]

set enc_setup 1
set enc_hold 1.5
set dec_setup 1
set dec_hold 1.5
#set trace_delay_max 3
#set trace_delay_min 1
set spi_clk_offset 3.109
#set spi_clk_fb_offset 5.182
#set spi_clk_fb_offset 0

create_clock -period "$div_clk_period" -name spiClk [get_ports dec_spi_clk]
create_clock -period "$div_clk_period" -name enc_spiClk_fwd -waveform "$spi_clk_offset [expr $div_clk_start + $spi_clk_offset]"
#create_clock -period "$div_clk_period" -name enc_spiClk_latch -waveform "$spi_clk_fb_offset [expr $div_clk_start + $spi_clk_fb_offset]"
#create_clock -period "$div_clk_period" -name dec_spiClk_launch -waveform "[expr $div_clk_start + $spi_clk_offset] [expr $div_clk_period + $spi_clk_offset]"
create_generated_clock -name enc_spiClk_out -source [get_pins -of [get_cells -hier ODDR_inst -filter {name =~ "*axi_spi_interface*/inst*"}] -filter {ref_pin_name == C}] -divide_by 1 [get_ports axi_spi_clk]
create_generated_clock -name dec_spiClk_out -source [get_pins -of [get_cells -hier ODDR_inst -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == C}] -divide_by 1 [get_ports dec_spi_clk_fb]

set dec_sys_clk [get_clocks -of [get_pins -of [get_cells -hier * -filter {name =~ "*decoder_top*/inst"}] -filter {ref_pin_name == "clk"}]]
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

set enc_tco_max 3.492
set enc_tco_min 0.726
set enc_clk_skew 3.337
set enc_in_dly_max 3
set enc_in_dly_min 0
#set dec_tco_max 7.919
#set dec_tco_min 2.446
set dec_tco_max 4.5
set dec_tco_min 2.0
set dec_out_dly_max 4.5
set dec_out_dly_min 2.0
set dec_clk_skew 3.141
set enc_data_valid_window [expr "$unit_interval - $enc_tco_max + $enc_tco_min"]
set enc_dv_half [expr "$enc_data_valid_window / 2"]
set dec_data_valid_window [expr "$unit_interval - $dec_tco_max + $dec_tco_min"]
set dec_dv_half [expr "$dec_data_valid_window / 2"]

# Set physically exclusive clock groups going to BUFGMUX inside encoder
#set_clock_groups -physically_exclusive -group "$enc_gen_spi_clk_fb_0" -group "$enc_gen_spi_clk_fb_180"
#set_clock_groups -async -group [get_clocks spiClk] -group "$enc_gen_spi_clk_180"
#set_clock_groups -async -group [get_clocks dec_spiClk_out] -group "$dec_sys_clk"
set_clock_groups -async -group [get_clocks spiClk] -group "$dec_sys_clk"
#set_clock_groups -async -group [get_clocks dec_spiClk_launch] -group [list "$enc_gen_spi_clk_fb_0" "$enc_gen_spi_clk_fb_180"]
#set_clock_groups -async -group [get_clocks enc_spiClk_latch] -group "$enc_gen_spi_clk_fb_180"

# Ignore paths
set_false_path -to [get_ports ARESET_N]

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

set_max_delay -datapath_only -from [get_pins -of [get_cells -hier spi_clk_en_reg_reg -filter {name =~ "*axi_spi_interface*/inst*"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier ODDR_inst -filter {name =~ "*axi_spi_interface*/inst*"}] -filter {ref_pin_name == CE}] 2
set_min_delay -from [get_pins -of [get_cells -hier spi_clk_en_reg_reg -filter {name =~ "*axi_spi_interface*/inst*"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier ODDR_inst -filter {name =~ "*axi_spi_interface*/inst*"}] -filter {ref_pin_name == CE}] 0

#set_input_delay -clock [get_clocks dec_spiClk_launch] -max [expr "$unit_interval - $dec_dv_half"] [get_ports axi_spi_miso];
#set_input_delay -clock [get_clocks dec_spiClk_launch] -min "$dec_dv_half" [get_ports axi_spi_miso];
set_max_delay -datapath_only -from [get_ports axi_spi_miso] -to [get_pins -of [get_cells -hier in_buffer_reg_reg[0] -filter {name =~ "*axi_spi_interface*/inst*"}] -filter {ref_pin_name == D}] "$enc_in_dly_max"
set_min_delay -from [get_ports axi_spi_miso] -to [get_pins -of [get_cells -hier in_buffer_reg_reg[0] -filter {name =~ "*axi_spi_interface*/inst*"}] -filter {ref_pin_name == D}] "$enc_in_dly_min"
#set_input_delay -clock "$enc_gen_spi_clk_fb_0" -max [expr "$trace_delay_max - $dec_tco_max + $dec_clk_skew"] [get_ports axi_spi_miso];
#set_input_delay -clock "$enc_gen_spi_clk_fb_0" -min "$dec_tco_min" [get_ports axi_spi_miso];

#set_output_delay -clock [get_clocks enc_spiClk_out] 0.0 [get_ports [list "axi_spi_cs_n" "axi_spi_mosi"]]
set_output_delay -clock [get_clocks enc_spiClk_fwd] -max [expr "$half_unit_interval - $enc_clk_skew + $dec_setup"] [get_ports [list "axi_spi_cs_n" "axi_spi_mosi"]]
set_output_delay -clock [get_clocks enc_spiClk_fwd] -min [expr "$half_unit_interval + $enc_clk_skew - $dec_hold"] [get_ports [list "axi_spi_cs_n" "axi_spi_mosi"]]

set_false_path -to [get_ports spi_slave_reset_n]

# Decoder timing constraints
set_input_delay -clock [get_clocks spiClk] -max [expr "$unit_interval - $enc_dv_half"] [get_ports [list "dec_spi_mosi" "dec_spi_cs_n"]];
set_input_delay -clock [get_clocks spiClk] -min "$enc_dv_half" [get_ports [list "dec_spi_mosi" "dec_spi_cs_n"]];

#set_output_delay -clock [get_clocks dec_spiClk_out] 0.0 [get_ports dec_spi_miso]
#set_output_delay -clock [get_clocks enc_spiClk_latch] -max [expr "$half_unit_interval - $dec_clk_skew + $enc_setup"] [get_ports dec_spi_miso]
#set_output_delay -clock [get_clocks enc_spiClk_latch] -min [expr "$half_unit_interval + $dec_clk_skew - $enc_hold"] [get_ports dec_spi_miso]

#set_output_delay -clock [get_clocks enc_spiClk_latch] -max [expr "$trace_delay_max + $enc_setup"] [get_ports dec_spi_miso]
#set_output_delay -clock [get_clocks enc_spiClk_latch] -min [expr "$trace_delay_min - $enc_hold - $dec_clk_skew"] [get_ports dec_spi_miso]
#set_max_delay -datapath_only -from [get_pins -of [get_cells -hier spi_out_reg_reg -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == C}] -to [get_ports dec_spi_miso] "$dec_out_dly_max"
#set_min_delay -from [get_pins -of [get_cells -hier spi_out_reg_reg -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == C}] -to [get_ports dec_spi_miso] "$dec_out_dly_min"
set_max_delay -datapath_only -from [get_pins -of [get_cells -hier spi_out_oddr -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == C}] -to [get_ports dec_spi_miso] "$dec_out_dly_max"
set_min_delay -from [get_pins -of [get_cells -hier spi_out_oddr -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == C}] -to [get_ports dec_spi_miso] "$dec_out_dly_min"

# Ignore spi_cs_n signal since we assume this to be stable before data is transfered
#set_false_path -from [get_ports dec_spi_cs_n] -to [all_registers -clock spiClk]
set_false_path -from [get_ports dec_reset_n] -to [all_registers -clock spiClk]
set_false_path -to [get_ports errors_corrected]
#set_false_path -to [get_ports dec_spi_clk_fb]
