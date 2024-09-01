set div_clk_period 20.000

create_clock -period "$div_clk_period" -name dec_spiClk [get_ports dec_spi_clk]
create_clock -period "$div_clk_period" -name enc_spiClk_fb
create_generated_clock -name enc_spiClk_out -source [get_pins -of [get_cells -hier ODDR_inst] -filter {ref_pin_name == C}] -divide_by 1 [get_ports axi_spi_clk]

set enc_sys_clk [get_clocks -of [get_pins -of [get_cells -hier * -filter {name =~ "*axi_spi_interface*/inst"}] -filter {ref_pin_name =~ "*aclk"}]]
set enc_gen_spi_clk_0 [get_clocks -of [get_pins -of [get_cells -hier * -filter {name =~ "*axi_spi_interface*/inst"}] -filter {name =~ "*gen_spi_clk_0"}]]
#set enc_gen_spi_clk_90 [get_clocks -of [get_pins -of [get_cells -hier * -filter {name =~ "*axi_spi_interface*/inst"}] -filter {name =~ "*gen_spi_clk_90"}]]
set enc_gen_spi_clk_180 [get_clocks -of [get_pins -of [get_cells -hier * -filter {name =~ "*axi_spi_interface*/inst"}] -filter {name =~ "*gen_spi_clk_180"}]]
#set enc_gen_spi_clk_270 [get_clocks -of [get_pins -of [get_cells -hier * -filter {name =~ "*axi_spi_interface*/inst"}] -filter {name =~ "*gen_spi_clk_270"}]]


set enc_cdc_max [get_property PERIOD "$enc_gen_spi_clk_0"]
set enc_cdc_min [expr {[get_property PERIOD "$enc_gen_spi_clk_0"] / 2}]

#set enc_spi_csn_delay_max 4.5
#set enc_spi_csn_delay_min 0
set enc_io_delay_max 3
set enc_io_delay_min 0
set dec_io_delay_max 3
set dec_io_delay_min 0

set half_unit_interval "$enc_cdc_min"
set enc_setup 1
set enc_hold 1
set dec_setup 1
set dec_hold 1
set trace_delay_max 3
set trace_delay_min 2
set spiClk_delay_max 3
set spiClk_delay_min 2

# Set physically exclusive clock groups going to BUFGMUX inside encoder
#set_clock_groups -physically_exclusive -group "$enc_gen_spi_clk_0" -group "$enc_gen_spi_clk_90" -group "$enc_gen_spi_clk_180" -group "$enc_gen_spi_clk_270"
set_clock_groups -physically_exclusive -group "$enc_gen_spi_clk_0" -group "$enc_gen_spi_clk_180"

# Ignore paths
set_false_path -to [get_ports ARESET_N]

# Encoder timing constraints
set_clock_latency -source -max "$spiClk_delay_max" [get_clocks enc_spiClk_fb]
set_clock_latency -source -min "$spiClk_delay_min" [get_clocks enc_spiClk_fb]

set_max_delay -datapath_only -from "$enc_sys_clk" -to "$enc_gen_spi_clk_0" $enc_cdc_max
set_min_delay -from "$enc_sys_clk" -to "$enc_gen_spi_clk_0" $enc_cdc_min

set_max_delay -datapath_only -from "$enc_sys_clk" -to "$enc_gen_spi_clk_180" $enc_cdc_max
set_min_delay -from "$enc_sys_clk" -to "$enc_gen_spi_clk_0" $enc_cdc_min

set_max_delay -datapath_only -from "$enc_gen_spi_clk_0" -to "$enc_sys_clk" $enc_cdc_max
set_min_delay -from "$enc_gen_spi_clk_0" -to "$enc_sys_clk" $enc_cdc_min

set_max_delay -datapath_only -from "$enc_gen_spi_clk_180" -to "$enc_sys_clk" $enc_cdc_max
set_min_delay -from "$enc_gen_spi_clk_180" -to "$enc_sys_clk" $enc_cdc_min

#set_max_delay -datapath_only -from [get_ports axi_spi_miso] -to [get_pins -of [get_cells -hier * -filter {name =~ "*spi_driver*/*in_buffer_reg_reg[0]"}] -filter {ref_pin_name == D}] $enc_io_delay_max
#set_min_delay -from [get_ports axi_spi_miso] -to [get_pins -of [get_cells -hier * -filter {name =~ "*spi_driver*/*in_buffer_reg_reg[0]"}] -filter {ref_pin_name == D}] $enc_io_delay_min

set_input_delay -clock [get_clocks enc_spiClk_fb] -max -source_latency_included "$enc_setup" [get_ports axi_spi_miso]
set_input_delay -clock [get_clocks enc_spiClk_fb] -min -source_latency_included "$enc_hold" [get_ports axi_spi_miso]

set_false_path -setup -rise_from [get_clocks enc_spiClk_fb] -rise_to [get_clocks -of [get_pins -of [get_cells -hier miso_reg_reg -filter {name =~ "*axi_spi_interface*/inst*"}] -filter {ref_pin_name == C}]]
set_false_path -setup -fall_from [get_clocks enc_spiClk_fb] -fall_to [get_clocks -of [get_pins -of [get_cells -hier miso_reg_reg -filter {name =~ "*axi_spi_interface*/inst*"}] -filter {ref_pin_name == C}]]
set_false_path -hold -rise_from [get_clocks enc_spiClk_fb] -rise_to [get_clocks -of [get_pins -of [get_cells -hier miso_reg_reg -filter {name =~ "*axi_spi_interface*/inst*"}] -filter {ref_pin_name == C}]]
set_false_path -hold -fall_from [get_clocks enc_spiClk_fb] -fall_to [get_clocks -of [get_pins -of [get_cells -hier miso_reg_reg -filter {name =~ "*axi_spi_interface*/inst*"}] -filter {ref_pin_name == C}]]

set_output_delay -clock [get_clocks enc_spiClk_out] -max [expr {"$dec_setup" + "$trace_delay_max"}] [get_ports [list "axi_spi_cs_n" "axi_spi_mosi"]]
set_output_delay -clock [get_clocks enc_spiClk_out] -min [expr {"$trace_delay_min" - "$dec_hold"}] [get_ports [list "axi_spi_cs_n" "axi_spi_mosi"]]

#set_max_delay -datapath_only -from [get_pins -of [get_cells -hier * -filter {name =~ "*spi_driver*/*spi_csn_reg_reg"}] -filter {ref_pin_name == C}] -to [get_ports axi_spi_cs_n] $enc_spi_csn_delay_max
#set_min_delay -from [get_pins -of [get_cells -hier * -filter {name =~ "*spi_driver*/*spi_csn_reg_reg"}] -filter {ref_pin_name == C}] -to [get_ports axi_spi_cs_n] $enc_spi_csn_delay_min

#set_max_delay -datapath_only -from [get_pins -of [get_cells -hier * -filter {name =~ "*spi_driver*/*out_buffer_reg_reg[39]"}] -filter {ref_pin_name == C}] -to [get_ports axi_spi_mosi] $enc_io_delay_max
#set_min_delay -from [get_pins -of [get_cells -hier * -filter {name =~ "*spi_driver*/*buffer_reg_reg[39]"}] -filter {ref_pin_name == C}] -to [get_ports axi_spi_mosi] $enc_io_delay_min

set_false_path -setup -rise_from "$enc_gen_spi_clk_0" -rise_to [get_clocks enc_spiClk_out]
set_false_path -setup -fall_from "$enc_gen_spi_clk_0" -fall_to [get_clocks enc_spiClk_out]
set_false_path -hold -rise_from "$enc_gen_spi_clk_0" -rise_to [get_clocks enc_spiClk_out]
set_false_path -hold -fall_from "$enc_gen_spi_clk_0" -fall_to [get_clocks enc_spiClk_out]

set_false_path -to [get_ports spi_slave_reset_n]

# Decoder timing constraints
set_clock_latency -source -max "$spiClk_delay_max" [get_clocks -of [get_ports dec_spi_clk]]
set_clock_latency -source -min "$spiClk_delay_min" [get_clocks -of [get_ports dec_spi_clk]]

set_input_delay -clock [get_clocks -of [get_ports dec_spi_clk]] -max -source_latency_included "$dec_setup" [get_ports dec_spi_mosi]
set_input_delay -clock [get_clocks -of [get_ports dec_spi_clk]] -min -source_latency_included "$dec_hold" [get_ports dec_spi_mosi]

set_false_path -setup -rise_from [get_clocks -of [get_ports dec_spi_clk]] -rise_to [get_clocks -of [get_pins -of [get_cells -hier spi_in_reg_reg -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == C}]]
set_false_path -setup -fall_from [get_clocks -of [get_ports dec_spi_clk]] -fall_to [get_clocks -of [get_pins -of [get_cells -hier spi_in_reg_reg -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == C}]]
set_false_path -hold -rise_from [get_clocks -of [get_ports dec_spi_clk]] -rise_to [get_clocks -of [get_pins -of [get_cells -hier spi_in_reg_reg -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == C}]]
set_false_path -hold -fall_from [get_clocks -of [get_ports dec_spi_clk]] -fall_to [get_clocks -of [get_pins -of [get_cells -hier spi_in_reg_reg -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == C}]]

#set_max_delay -datapath_only -from [get_ports dec_spi_mosi] -to [get_pins -of [get_cells -hier * -filter {name =~ "*decoder_top*/*spi_in_reg_reg"}] -filter {ref_pin_name == D}] $dec_io_delay_max
#set_min_delay -from [get_ports dec_spi_mosi] -to [get_pins -of [get_cells -hier * -filter {name =~ "*decoder_top*/*spi_in_reg_reg"}] -filter {ref_pin_name == D}] $dec_io_delay_min

#set_max_delay -datapath_only -from [get_ports dec_spi_cs_n] -to [get_pins -of [get_cells -hier * -filter {name =~ "*decoder_top*/*spi_in_reg_reg"}] -filter {ref_pin_name == CE}] 4;#$dec_io_delay_max
#set_min_delay -from [get_ports dec_spi_cs_n] -to [get_pins -of [get_cells -hier * -filter {name =~ "*decoder_top*/*spi_in_reg_reg"}] -filter {ref_pin_name == CE}] $dec_io_delay_min

#set_max_delay -datapath_only -from [get_ports dec_spi_cs_n] -to [get_pins -of [get_cells -hier * -filter {name =~ "*decoder_top*/*out_shft_cnt_reg*"}] -filter {ref_pin_name == CE}] $dec_io_delay_max
#set_min_delay -from [get_ports dec_spi_cs_n] -to [get_pins -of [get_cells -hier * -filter {name =~ "*decoder_top*/*out_shft_cnt_reg*"}] -filter {ref_pin_name == CE}] $dec_io_delay_min

#set_max_delay -datapath_only -from [get_pins -of [get_cells -hier * -filter {name =~ "*decoder_top*/*miso_reg_reg[31]"}] -filter {ref_pin_name == C}] -through [get_cells -hier spi_out_reg_reg -filter {name =~ "*decoder_top*/inst/*"}] -to [get_ports dec_spi_miso] $dec_io_delay_max
#set_min_delay -from [get_pins -of [get_cells -hier * -filter {name =~ "*decoder_top*/*miso_reg_reg[31]"}] -filter {ref_pin_name == C}] -through [get_cells -hier spi_out_reg_reg -filter {name =~ "*decoder_top*/inst/*"}] -to [get_ports dec_spi_miso] $dec_io_delay_min
set_output_delay -clock [get_clocks -of [get_ports dec_spi_clk]] -max [expr {"$enc_setup" + "$trace_delay_max"}] [get_ports dec_spi_miso]
set_output_delay -clock [get_clocks -of [get_ports dec_spi_clk]] -min [expr {"$trace_delay_min" - "$enc_hold"}] [get_ports dec_spi_miso]

set_false_path -setup -rise_from [get_clocks -of [get_pins -of [get_cells -hier spi_out_reg_reg -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == C}]] -rise_to [get_clocks -of [get_ports dec_spi_clk]]
set_false_path -setup -fall_from [get_clocks -of [get_pins -of [get_cells -hier spi_out_reg_reg -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == C}]] -fall_to [get_clocks -of [get_ports dec_spi_clk]]
set_false_path -hold -rise_from [get_clocks -of [get_pins -of [get_cells -hier spi_out_reg_reg -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == C}]] -rise_to [get_clocks -of [get_ports dec_spi_clk]]
set_false_path -hold -fall_from [get_clocks -of [get_pins -of [get_cells -hier spi_out_reg_reg -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == C}]] -fall_to [get_clocks -of [get_ports dec_spi_clk]]

#set_max_delay -datapath_only -from [get_cells -hier spi_out_reg_reg -filter {name =~ "*decoder_top*/inst/*"}] -to [get_ports dec_spi_miso] $dec_io_delay_max
#set_min_delay -from [get_cells -hier spi_out_reg_reg -filter {name =~ "*decoder_top*/inst/*"}] -to [get_ports dec_spi_miso] $dec_io_delay_min

# Ignore spi_cs_n signal since we assume this to be stable before data is transfered
set_false_path -from [get_ports dec_spi_cs_n] -to [all_registers -clock dec_spiClk]
set_false_path -from [get_ports dec_reset_n] -to [all_registers -clock dec_spiClk]
set_false_path -to [get_ports errors_corrected]
