
# -----------------------------------------------------------------------------------------------

set dec_sysClk_period [get_property PERIOD [get_clocks -of [get_ports clk]]]
set dec_spiClk_period [get_property PERIOD [get_clocks -of [get_ports spi_clk_ext]]]

set dec_setup 1
set dec_hold 1.5
#set dec_io_delay_max 6.000
#set dec_io_delay_min 5.000
#set dec_cdc_delay_max [expr { $dec_sysClk_period * 2 }]
#set dec_cdc_delay_min [expr { $dec_sysClk_period * 1 }]
set dec_cdc_delay_max [expr "($dec_sysClk_period / 2) - 2"]
set dec_cdc_delay_min "$dec_hold"
set dec_half_unit_interval [expr {"$dec_spiClk_period" / 2}]

set_property ASYNC_REG true [get_cells -hierarchical -filter {name =~ "*_metaguard*reg*"}]
#set_property ASYNC_REG true [get_cells -hierarchical -filter {name =~ "*spi_io_regs_en_reg"}]
#set_property ASYNC_REG true [get_cells -hierarchical -filter {name =~ "*miso_disable_reg_reg"}]

# CDC spiClk to sysClk
set_max_delay -datapath_only -from [get_pins -of [get_cells -hier * -filter {name =~ "*spi_p_valid_reg"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*spi_p*_valid_metaguard_reg[0]"}] -filter {ref_pin_name == D}] $dec_cdc_delay_max
set_min_delay -from [get_pins -of [get_cells -hier * -filter {name =~ "*spi_p_valid_reg"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*spi_p*_valid_metaguard_reg[0]"}] -filter {ref_pin_name == D}] $dec_cdc_delay_min
set_max_delay -datapath_only -from [get_pins -of [get_cells -hier * -filter {name =~ "*spi_n_valid_reg"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*spi_n*_valid_metaguard_reg[0]"}] -filter {ref_pin_name == D}] $dec_cdc_delay_max
set_min_delay -from [get_pins -of [get_cells -hier * -filter {name =~ "*spi_n_valid_reg"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*spi_n*_valid_metaguard_reg[0]"}] -filter {ref_pin_name == D}] $dec_cdc_delay_min
set_max_delay -datapath_only -from [get_pins -of [get_cells -hier * -filter {name =~ "*spi_in_iddr"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*spi_*_data_metaguard_reg[0]"}] -filter {ref_pin_name == D}] $dec_cdc_delay_max
set_min_delay -from [get_pins -of [get_cells -hier * -filter {name =~ "*spi_in_iddr"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*spi_*_data_metaguard_reg[0]"}] -filter {ref_pin_name == D}] $dec_cdc_delay_min

#set_max_delay -datapath_only -from [get_pins -of [get_cells -hier * -filter {name =~ "*in_mosi_reg_sel_reg*"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*mosi_valid_metaguard_reg*"}] -filter {ref_pin_name == D}] $dec_cdc_delay_max
#set_min_delay -from [get_pins -of [get_cells -hier * -filter {name =~ "*in_mosi_reg_sel_reg*"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*mosi_valid_metaguard_reg*"}] -filter {ref_pin_name == D}] $dec_cdc_delay_min
#set_max_delay -datapath_only -from [get_pins -of [get_cells -hier * -filter {name =~ "*mosi_valid_reg*"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*mosi_valid_metaguard_reg*"}] -filter {ref_pin_name == D}] $dec_cdc_delay_max
#set_min_delay -from [get_pins -of [get_cells -hier * -filter {name =~ "*mosi_valid_reg*"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*mosi_valid_metaguard_reg*"}] -filter {ref_pin_name == D}] $dec_cdc_delay_min
#set_max_delay -datapath_only -from [get_pins -of [get_cells -hier * -filter {name =~ "*mosi_reg_reg*"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*in_buffer_reg_reg[0]"}] -filter {ref_pin_name == D}] $dec_cdc_delay_max
#set_min_delay -from [get_pins -of [get_cells -hier * -filter {name =~ "*mosi_reg_reg*"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*in_buffer_reg_reg[0]"}] -filter {ref_pin_name == D}] $dec_cdc_delay_min

# CDC sysClk to spiClk
#set_max_delay -datapath_only -from [get_pins -of [get_cells -hier * -filter {name =~ "*out_buffer_reg_reg*"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*miso_reg_reg*"}] -filter {ref_pin_name == D}] $dec_cdc_delay_max
#set_min_delay -from [get_pins -of [get_cells -hier * -filter {name =~ "*out_buffer_reg_reg*"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*miso_reg_reg*"}] -filter {ref_pin_name == D}] $dec_cdc_delay_min
#set_max_delay -datapath_only -from [get_pins -of [get_cells -hier spi_wr_en_reg_reg -filter {name =~ "*decoder_top*/inst*/controller*"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*local_spi_clk_en_reg"}] -filter {ref_pin_name !~ "*Q*" && ref_pin_name !~ "*C*"}] $dec_cdc_delay_max
#set_min_delay -from [get_pins -of [get_cells -hier spi_wr_en_reg_reg -filter {name =~ "*decoder_top*/inst*/controller*"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*local_spi_clk_en_reg"}] -filter {ref_pin_name !~ "*Q*" && ref_pin_name !~ "*C*"}] $dec_cdc_delay_min
#set_max_delay -datapath_only -from [get_pins -of [get_cells -hier * -filter {name =~ "*load_miso_reg_reg"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*miso_reg_reg*"}] -filter {ref_pin_name !~ "*Q*" && ref_pin_name !~ "*C*"}] $dec_cdc_delay_max
#set_min_delay -from [get_pins -of [get_cells -hier * -filter {name =~ "*load_miso_reg_reg"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*miso_reg_reg*"}] -filter {ref_pin_name !~ "*Q*" && ref_pin_name !~ "*C*"}] $dec_cdc_delay_min
set_max_delay -datapath_only -from [get_pins -of [get_cells -hier * -filter {name =~ "*spi_io_regs_en_reg"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier [list "spi_out_oddr" "spi_in_iddr"] -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == CE}] $dec_cdc_delay_max
set_min_delay -from [get_pins -of [get_cells -hier * -filter {name =~ "*spi_io_regs_en_reg"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier [list "spi_out_oddr" "spi_in_iddr"] -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == CE}] $dec_cdc_delay_min
set_max_delay -datapath_only -from [get_pins -of [get_cells -hier * -filter {name =~ "*distru_p_reg"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier "spi_out_oddr" -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == D1}] $dec_cdc_delay_max
set_min_delay -from [get_pins -of [get_cells -hier * -filter {name =~ "*distru_p_reg"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier "spi_out_oddr" -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == D1}] $dec_cdc_delay_min
set_max_delay -datapath_only -from [get_pins -of [get_cells -hier * -filter {name =~ "*distru_n_reg"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier "spi_out_oddr" -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == D2}] $dec_cdc_delay_max
set_min_delay -from [get_pins -of [get_cells -hier * -filter {name =~ "*distru_n_reg"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier "spi_out_oddr" -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == D2}] $dec_cdc_delay_min
#set_max_delay -datapath_only -from [get_pins -of [get_cells -hier * -filter {name =~ "*bufgce_en_reg_reg"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*out_shft_cnt_reg*"}] -filter {ref_pin_name == CE}] $dec_cdc_delay_max
#set_min_delay -from [get_pins -of [get_cells -hier * -filter {name =~ "*bufgce_en_reg_reg"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*out_shft_cnt_reg*"}] -filter {ref_pin_name == CE}] $dec_cdc_delay_min
#set_max_delay -datapath_only -from [get_pins -of [get_cells -hier * -filter {name =~ "*bufgce_en_reg_reg"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*spi_clk_pll_0_bufgce*"}] -filter {ref_pin_name == CE0}] $dec_cdc_delay_max
#set_min_delay -from [get_pins -of [get_cells -hier * -filter {name =~ "*bufgce_en_reg_reg"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*spi_clk_pll_0_bufgce*"}] -filter {ref_pin_name == CE0}] $dec_cdc_delay_min
#set_max_delay -datapath_only -from [get_pins -of [get_cells -hier * -filter {name =~ "*bufgce_en_reg_reg"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*spi_clk_pll_180_bufgce*"}] -filter {ref_pin_name == CE0}] $dec_cdc_delay_max
#set_min_delay -from [get_pins -of [get_cells -hier * -filter {name =~ "*bufgce_en_reg_reg"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*spi_clk_pll_180_bufgce*"}] -filter {ref_pin_name == CE0}] $dec_cdc_delay_min
#set_max_delay -datapath_only -from [get_pins -of [get_cells -hier spi_wr_en_reg_reg -filter {name =~ "*decoder_top*/inst*/controller*"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*local_spi_clk_en"}] -filter {ref_pin_name !~ "*Q*" && ref_pin_name !~ "*C*"}] [expr "$dec_cdc_delay_max * 2"]
#set_min_delay -from [get_pins -of [get_cells -hier spi_wr_en_reg_reg -filter {name =~ "*decoder_top*/inst*/controller*"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*local_spi_clk_en"}] -filter {ref_pin_name !~ "*Q*" && ref_pin_name !~ "*C*"}] $dec_cdc_delay_min

#set_max_delay -datapath_only -from [get_pins -of [get_cells -hier spi_wr_en_reg_reg -filter {name =~ "*decoder_top*/inst*/controller*"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*spi_in_ready_reg"}] -filter {ref_pin_name == CLR}] [expr "$dec_cdc_delay_max * 2"]
#set_min_delay -from [get_pins -of [get_cells -hier spi_wr_en_reg_reg -filter {name =~ "*decoder_top*/inst*/controller*"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*spi_in_ready_reg"}] -filter {ref_pin_name == CLR}] $dec_cdc_delay_min
#set_max_delay -datapath_only -from [get_pins -of [get_cells -hier spi_wr_en_reg_reg -filter {name =~ "*decoder_top*/inst*/controller*"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*spi_out_ready_reg"}] -filter {ref_pin_name == CLR}] [expr "$dec_cdc_delay_max * 2"]
#set_min_delay -from [get_pins -of [get_cells -hier spi_wr_en_reg_reg -filter {name =~ "*decoder_top*/inst*/controller*"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*spi_out_ready_reg"}] -filter {ref_pin_name == CLR}] $dec_cdc_delay_min

#set_max_delay -datapath_only -from [get_pins -of [get_cells -hier spi_wr_en_reg_reg -filter {name =~ "*decoder_top*/inst*/controller*"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*spi_in_valid_reg"}] -filter {ref_pin_name !~ "*Q*" && ref_pin_name !~ "*C*"}] [expr "$dec_cdc_delay_max * 2"]
#set_min_delay -from [get_pins -of [get_cells -hier spi_wr_en_reg_reg -filter {name =~ "*decoder_top*/inst*/controller*"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*spi_in_valid_reg"}] -filter {ref_pin_name !~ "*Q*" && ref_pin_name !~ "*C*"}] $dec_cdc_delay_min
#set_max_delay -datapath_only -from [get_pins -of [get_cells -hier spi_wr_en_reg_reg -filter {name =~ "*decoder_top*/inst*/controller*"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*prev_spi_in_valid_reg"}] -filter {ref_pin_name !~ "*Q*" && ref_pin_name !~ "*C*"}] [expr "$dec_cdc_delay_max * 2"]
#set_min_delay -from [get_pins -of [get_cells -hier spi_wr_en_reg_reg -filter {name =~ "*decoder_top*/inst*/controller*"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*prev_spi_in_valid_reg"}] -filter {ref_pin_name !~ "*Q*" && ref_pin_name !~ "*C*"}] $dec_cdc_delay_min

#set_max_delay -datapath_only -from [get_clocks -of [get_ports clk]] -to [get_clocks -of [get_ports spi_clk]] $dec_cdc_delay_max
#set_min_delay -from [get_clocks -of [get_ports clk]] -to [get_clocks -of [get_ports spi_clk]] $dec_cdc_delay_min

# CDC spiClk to spiClk
#set_max_delay -datapath_only -from [get_pins -of [get_cells -hier spi_in_ready_reg -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*spi_in_ready_metaguard_reg[0]"}] -filter {ref_pin_name == D}] $dec_cdc_delay_max
#set_min_delay -from [get_pins -of [get_cells -hier spi_in_ready_reg -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*spi_in_ready_metaguard_reg[0]"}] -filter {ref_pin_name == D}] $dec_cdc_delay_min
#set_max_delay -datapath_only -from [get_pins -of [get_cells -hier spi_in_ready_reg -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*spi_in_ready_metaguard_reg[0]"}] -filter {ref_pin_name == D}] $dec_cdc_delay_max
#set_min_delay -from [get_pins -of [get_cells -hier spi_in_ready_reg -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*spi_in_ready_metaguard_reg[0]"}] -filter {ref_pin_name == D}] $dec_cdc_delay_min

#set_max_delay -datapath_only -from [get_pins -of [get_cells -hier spi_in_reg -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*in_mosi_reg_sel_reg*"}] -filter {ref_pin_name == CE}] $dec_cdc_delay_max
#set_min_delay -from [get_pins -of [get_cells -hier spi_in_reg -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*in_mosi_reg_sel_reg*"}] -filter {ref_pin_name == CE}] $dec_cdc_delay_min

#set_max_delay -datapath_only -from [get_pins -of [get_cells -hier spi_in_reg_reg -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*spi_in_data_metaguard_reg[0]"}] -filter {ref_pin_name == D}] $dec_cdc_delay_max
#set_min_delay -from [get_pins -of [get_cells -hier spi_in_reg_reg -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*spi_in_data_metaguard_reg[0]"}] -filter {ref_pin_name == D}] $dec_cdc_delay_min

#set_max_delay -datapath_only -rise_from [get_pins -of [get_cells -hier ext_clk_sync_reg -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == C}] -fall_to [get_pins -of [get_cells -hier * -filter {name =~ "*spi_dont_ignore_reg"}] -filter {ref_pin_name == D}] $dec_cdc_delay_max
#set_min_delay -rise_from [get_pins -of [get_cells -hier ext_clk_sync_reg -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == C}] -fall_to [get_pins -of [get_cells -hier * -filter {name =~ "*spi_dont_ignore_reg"}] -filter {ref_pin_name == D}] $dec_cdc_delay_min
#set_max_delay -datapath_only -from [get_pins -of [get_cells -hier spi_out_ready_reg -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*spi_out_ready_metaguard_reg[0]"}] -filter {ref_pin_name == D}] $dec_cdc_delay_max
#set_min_delay -from [get_pins -of [get_cells -hier spi_out_ready_reg -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*spi_out_ready_metaguard_reg[0]"}] -filter {ref_pin_name == D}] $dec_cdc_delay_min

#set_max_delay -datapath_only -from [get_pins -of [get_cells -hier miso_reg_reg* -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*spi_out_reg_reg"}] -filter {ref_pin_name == D}] [expr "$dec_half_unit_interval - $dec_setup"]
#set_min_delay -from [get_pins -of [get_cells -hier miso_reg_reg* -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*spi_out_reg_reg"}] -filter {ref_pin_name == D}] [expr "$dec_half_unit_interval - $dec_setup - 1"]

#set_max_delay -datapath_only -from [get_pins -of [get_cells -hier spi_samples_ready_reg -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*spi_in_valid_reg"}] -filter {ref_pin_name !~ "*Q*" && ref_pin_name !~ "*C*"}] $dec_cdc_delay_max
#set_min_delay -from [get_pins -of [get_cells -hier spi_samples_ready_reg -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*spi_in_valid_reg"}] -filter {ref_pin_name !~ "*Q*" && ref_pin_name !~ "*C*"}] $dec_cdc_delay_min

# CDC sysClk to output port
set_max_delay -datapath_only -from [get_pins -of [get_cells -hier * -filter {name =~ "*miso_disable_reg_reg"}] -filter {ref_pin_name == C}] -to [get_ports spi_miso] $dec_half_unit_interval
set_min_delay -from [get_pins -of [get_cells -hier * -filter {name =~ "*miso_disable_reg_reg"}] -filter {ref_pin_name == C}] -to [get_ports spi_miso] $dec_cdc_delay_min

# CDC sysClk to sysClk
#set_max_delay -datapath_only -from [get_pins -of [get_cells -hier * -filter {name =~ "*spi_csn_metaguard_reg"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*miso_disable_reg_reg"}] -filter {ref_pin_name == D}] $dec_cdc_delay_max
#set_min_delay -from [get_pins -of [get_cells -hier * -filter {name =~ "*spi_csn_metaguard_reg"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*miso_disable_reg_reg"}] -filter {ref_pin_name == D}] $dec_cdc_delay_min
#set_max_delay -datapath_only -from [get_pins -of [get_cells -hier * -filter {name =~ "*spi_csn_metaguard_reg"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*bufgce_en_reg_reg"}] -filter {ref_pin_name !~ "*Q*" && ref_pin_name !~ "*C*"}] $dec_cdc_delay_max
#set_min_delay -from [get_pins -of [get_cells -hier * -filter {name =~ "*spi_csn_metaguard_reg"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*bufgce_en_reg_reg"}] -filter {ref_pin_name !~ "*Q*" && ref_pin_name !~ "*C*"}] $dec_cdc_delay_min

# CDC input port to sysClk
#set_max_delay -datapath_only -from [get_ports spi_cs_n] -to [get_pins -of [get_cells -hier * -filter {name =~ "*spi_csn_metaguard_reg[0]"}] -filter {ref_pin_name == D}] $dec_cdc_delay_min
#set_min_delay -from [get_ports spi_cs_n] -to [get_pins -of [get_cells -hier * -filter {name =~ "*spi_csn_metaguard_reg[0]"}] -filter {ref_pin_name == D}] 0
#set_false_path -from [get_ports spi_cs_n] -to [get_pins -of [get_cells -hier * -filter {name =~ "*spi_csn_metaguard_reg[0]"}] -filter {ref_pin_name == D}]
#set_max_delay -datapath_only -from [get_ports spi_cs_n] -to [get_pins -of [get_cells -hier * -filter {name =~ "*spi_csn_metaguard_reg"}] -filter {ref_pin_name == D}] $dec_cdc_delay_max
#set_min_delay -from [get_ports spi_cs_n] -to [get_pins -of [get_cells -hier * -filter {name =~ "*spi_csn_metaguard_reg"}] -filter {ref_pin_name == D}] $dec_cdc_delay_min
#set_max_delay -datapath_only -from [get_ports reset_n] -to [get_pins -of [get_cells -hier * -filter {name =~ "*reset_n_metaguard_reg[0]"}] -filter {ref_pin_name == D}] $dec_cdc_delay_max
#set_min_delay -from [get_ports reset_n] -to [get_pins -of [get_cells -hier * -filter {name =~ "*reset_n_metaguard_reg[0]"}] -filter {ref_pin_name == D}] $dec_cdc_delay_min

# Ignore Async paths
set_false_path -to [get_pins -of [get_cells -hier [list "spi_p_valid_reg" "spi_n_valid_reg"]] -filter {ref_pin_name == CLR}]
set_false_path -to [get_pins -of [get_cells -hier [list "spi_in_iddr" "spi_out_oddr"] -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == R}]
#set_false_path -to [get_pins -of [get_cells -hier spi_out_reg_reg -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == CLR}]
#set_max_delay -datapath_only -from [get_cells -hier * -filter {name =~ "*reset_n_metaguard_reg[1]"}] -to [all_registers] $dec_cdc_delay_max
#set_min_delay -from [get_cells -hier * -filter {name =~ "*reset_n_metaguard_reg[1]"}] -to [all_registers] $dec_cdc_delay_min

# -----------------------------------------------------------------------------------------------
