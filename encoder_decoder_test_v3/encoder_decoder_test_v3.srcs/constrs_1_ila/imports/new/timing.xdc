set div_clk_period 15.000
set div_clk_start [expr {"$div_clk_period" / 2}]

create_clock -period "$div_clk_period" -name spiClk [get_ports dec_spi_clk]
create_clock -period "$div_clk_period" -name enc_spiClk_launch -waveform "$div_clk_start $div_clk_period"
create_clock -period "$div_clk_period" -name enc_spiClk_latch
create_clock -period "$div_clk_period" -name dec_spiClk_launch -waveform "$div_clk_start $div_clk_period"
create_generated_clock -name enc_spiClk_out -source [get_pins -of [get_cells -hier ODDR_inst] -filter {ref_pin_name == C}] -divide_by 1 [get_ports axi_spi_clk]

set enc_sys_clk [get_clocks -of [get_pins -of [get_cells -hier * -filter {name =~ "*axi_spi_interface*/inst"}] -filter {ref_pin_name =~ "*aclk"}]]
set enc_gen_spi_clk_0 [get_clocks -of [get_pins -of [get_cells -hier * -filter {name =~ "*axi_spi_interface*/inst"}] -filter {name =~ "*gen_spi_clk_0"}]]
set enc_gen_spi_clk_180 [get_clocks -of [get_pins -of [get_cells -hier * -filter {name =~ "*axi_spi_interface*/inst"}] -filter {name =~ "*gen_spi_clk_180"}]]
set enc_gen_spi_clk_fb_0 [get_clocks -of [get_pins -of [get_cells -hier * -filter {name =~ "*axi_spi_interface*/inst"}] -filter {name =~ "*gen_spi_clk_fb_0"}]]
set enc_gen_spi_clk_fb_180 [get_clocks -of [get_pins -of [get_cells -hier * -filter {name =~ "*axi_spi_interface*/inst"}] -filter {name =~ "*gen_spi_clk_fb_180"}]]


set enc_cdc_max [get_property PERIOD "$enc_gen_spi_clk_0"]
set enc_cdc_min [expr {[get_property PERIOD "$enc_gen_spi_clk_0"] / 2}]

set enc_io_delay_max 2
set enc_io_delay_min 0
set dec_io_delay_max 2
set dec_io_delay_min 0

set data_skew_max 0.128
set data_skew_min 0.074
set dec_data_skew_max 4.555
set dec_data_skew_min 1.794
#set dec_data_skew_max 7.929
#set dec_data_skew_min 2.435
set unit_interval "$enc_cdc_max"
set half_unit_interval "$enc_cdc_min"
set enc_setup 1
set enc_hold 1
set dec_setup 1
set dec_hold 1
set trace_delay_max 3
set trace_delay_min 2
set enc_spiClk_delay_max 4
set enc_spiClk_delay_min 2
set dec_spiClk_delay_max 4
set dec_spiClk_delay_min 2

# Set physically exclusive clock groups going to BUFGMUX inside encoder
#set_clock_groups -physically_exclusive -group "$enc_gen_spi_clk_0" -group "$enc_gen_spi_clk_180"
set_clock_groups -physically_exclusive -group "$enc_gen_spi_clk_fb_0" -group "$enc_gen_spi_clk_fb_180"
set_clock_groups -async -group [get_clocks spiClk] -group "$enc_gen_spi_clk_180"
set_clock_groups -async -group [get_clocks dec_spiClk_launch] -group [list "$enc_gen_spi_clk_fb_0" "$enc_gen_spi_clk_fb_180"]
set_max_delay -datapath_only -from [get_clocks -of [get_ports dec_spi_clk]] -to [get_clocks -of [get_pins -of [get_cells -hier * -filter {name =~ "*decoder_top*/inst"}] -filter {ref_pin_name == clk}]] "$enc_cdc_min"

# Ignore paths
set_false_path -to [get_ports ARESET_N]

# Encoder timing constraints
set_clock_latency -source -max "$dec_spiClk_delay_max" [get_clocks dec_spiClk_launch]
set_clock_latency -source -min "$dec_spiClk_delay_min" [get_clocks dec_spiClk_launch]

set_max_delay -rise_from [get_pins -of [get_cells -hier miso_reg_reg -filter {name =~ "*axi_spi_interface*/inst*"}] -filter {ref_pin_name == C}] -fall_to [get_pins -of [get_cells -hier in_buffer_reg_reg* -filter {name =~ "*axi_spi_interface*/inst*"}] -filter {ref_pin_name == D}] $half_unit_interval
set_min_delay -rise_from [get_pins -of [get_cells -hier miso_reg_reg -filter {name =~ "*axi_spi_interface*/inst*"}] -filter {ref_pin_name == C}] -fall_to [get_pins -of [get_cells -hier in_buffer_reg_reg* -filter {name =~ "*axi_spi_interface*/inst*"}] -filter {ref_pin_name == D}] 0

set_max_delay -datapath_only -from "$enc_sys_clk" -to "$enc_gen_spi_clk_0" $enc_cdc_max
set_min_delay -from "$enc_sys_clk" -to "$enc_gen_spi_clk_0" $enc_cdc_min

set_max_delay -datapath_only -from "$enc_sys_clk" -to "$enc_gen_spi_clk_180" $enc_cdc_max
set_min_delay -from "$enc_sys_clk" -to "$enc_gen_spi_clk_180" $enc_cdc_min

set_max_delay -datapath_only -from "$enc_sys_clk" -to "$enc_gen_spi_clk_fb_0" $enc_cdc_max
set_min_delay -from "$enc_sys_clk" -to "$enc_gen_spi_clk_fb_0" $enc_cdc_min

set_max_delay -datapath_only -from "$enc_sys_clk" -to "$enc_gen_spi_clk_fb_180" $enc_cdc_max
set_min_delay -from "$enc_sys_clk" -to "$enc_gen_spi_clk_fb_180" $enc_cdc_min

set_max_delay -datapath_only -from "$enc_gen_spi_clk_0" -to "$enc_sys_clk" $enc_cdc_max
set_min_delay -from "$enc_gen_spi_clk_0" -to "$enc_sys_clk" $enc_cdc_min

set_max_delay -datapath_only -from "$enc_gen_spi_clk_180" -to "$enc_sys_clk" $enc_cdc_max
set_min_delay -from "$enc_gen_spi_clk_180" -to "$enc_sys_clk" $enc_cdc_min

set_max_delay -datapath_only -from "$enc_gen_spi_clk_fb_0" -to "$enc_sys_clk" $enc_cdc_max
set_min_delay -from "$enc_gen_spi_clk_fb_0" -to "$enc_sys_clk" $enc_cdc_min

set_max_delay -datapath_only -from "$enc_gen_spi_clk_fb_180" -to "$enc_sys_clk" $enc_cdc_max
set_min_delay -from "$enc_gen_spi_clk_fb_180" -to "$enc_sys_clk" $enc_cdc_min

set_input_delay -clock [get_clocks dec_spiClk_launch] -max -source_latency_included [expr {"$dec_data_skew_max" + "$dec_setup"}] [get_ports axi_spi_miso]
set_input_delay -clock [get_clocks dec_spiClk_launch] -min -source_latency_included [expr {"$dec_data_skew_max" * -1 + "$dec_hold"}] [get_ports axi_spi_miso]

set_false_path -setup -rise_from [get_clocks dec_spiClk_launch] -fall_to "$enc_gen_spi_clk_fb_0"
set_false_path -setup -fall_from [get_clocks dec_spiClk_launch] -rise_to "$enc_gen_spi_clk_fb_0"
set_false_path -hold -rise_from [get_clocks dec_spiClk_launch] -fall_to "$enc_gen_spi_clk_fb_0"
set_false_path -hold -fall_from [get_clocks dec_spiClk_launch] -rise_to "$enc_gen_spi_clk_fb_0"

set_output_delay -clock [get_clocks spiClk] -max [expr {"$half_unit_interval" - "$data_skew_max" + "$dec_setup"}] [get_ports [list "axi_spi_cs_n" "axi_spi_mosi"]]
set_output_delay -clock [get_clocks spiClk] -min [expr {"$half_unit_interval" + "$data_skew_max" - "$dec_hold"}] [get_ports [list "axi_spi_cs_n" "axi_spi_mosi"]]
#set_output_delay -clock [get_clocks spiClk] 0.0 [get_ports [list "axi_spi_cs_n" "axi_spi_mosi"]]

set_false_path -setup -rise_from "$enc_gen_spi_clk_180" -fall_to [get_clocks spiClk]
set_false_path -setup -fall_from "$enc_gen_spi_clk_180" -rise_to [get_clocks spiClk]
set_false_path -hold -rise_from "$enc_gen_spi_clk_180" -fall_to [get_clocks spiClk]
set_false_path -hold -fall_from "$enc_gen_spi_clk_180" -rise_to [get_clocks spiClk]

set_false_path -to [get_ports spi_slave_reset_n]

# Decoder timing constraints
set_clock_latency -source -max "$enc_spiClk_delay_max" [get_clocks enc_spiClk_launch]
set_clock_latency -source -min "$enc_spiClk_delay_min" [get_clocks enc_spiClk_launch]

set_input_delay -clock [get_clocks enc_spiClk_launch] -max -source_latency_included [expr {"$data_skew_max" + "$dec_setup"}] [get_ports dec_spi_mosi]
set_input_delay -clock [get_clocks enc_spiClk_launch] -min -source_latency_included [expr {"$data_skew_max" * -1 + "$dec_hold"}] [get_ports dec_spi_mosi]

set_false_path -setup -rise_from [get_clocks enc_spiClk_launch] -fall_to [get_clocks -of [get_ports dec_spi_clk]]
set_false_path -setup -fall_from [get_clocks enc_spiClk_launch] -rise_to [get_clocks -of [get_ports dec_spi_clk]]
set_false_path -hold -rise_from [get_clocks enc_spiClk_launch] -fall_to [get_clocks -of [get_ports dec_spi_clk]]
set_false_path -hold -fall_from [get_clocks enc_spiClk_launch] -rise_to [get_clocks -of [get_ports dec_spi_clk]]

set_max_delay -datapath_only -from [get_pins -of [get_cells -hier * -filter {name =~ "*decoder_top*/*miso_reg_reg[31]"}] -filter {ref_pin_name == C}] -through [get_cells -hier spi_out_reg_reg -filter {name =~ "*decoder_top*/inst/*"}] -to [get_ports dec_spi_miso] $dec_io_delay_max
set_min_delay -from [get_pins -of [get_cells -hier * -filter {name =~ "*decoder_top*/*miso_reg_reg[31]"}] -filter {ref_pin_name == C}] -through [get_cells -hier spi_out_reg_reg -filter {name =~ "*decoder_top*/inst/*"}] -to [get_ports dec_spi_miso] $dec_io_delay_min
#set_output_delay -clock [get_clocks enc_spiClk_latch] 0.0 [get_ports dec_spi_miso]

#set_output_delay -clock [get_clocks spiClk] -max [expr {"$half_unit_interval" + "$enc_setup" - "$dec_data_skew_max"}] [get_ports dec_spi_miso]
#set_output_delay -clock [get_clocks spiClk] -min [expr {"$half_unit_interval" + "$dec_data_skew_max" - "$enc_hold"}] [get_ports dec_spi_miso]

#set_false_path -setup -rise_from [get_clocks spiClk] -rise_to [get_clocks enc_spiClk_latch]
#set_false_path -setup -fall_from [get_clocks spiClk] -fall_to [get_clocks enc_spiClk_latch]
#set_false_path -hold -rise_from [get_clocks spiClk] -rise_to [get_clocks enc_spiClk_latch]
#set_false_path -hold -fall_from [get_clocks spiClk] -fall_to [get_clocks enc_spiClk_latch]

# Ignore spi_cs_n signal since we assume this to be stable before data is transfered
set_false_path -from [get_ports dec_spi_cs_n] -to [all_registers -clock spiClk]
set_false_path -from [get_ports dec_reset_n] -to [all_registers -clock spiClk]
set_false_path -to [get_ports errors_corrected]
