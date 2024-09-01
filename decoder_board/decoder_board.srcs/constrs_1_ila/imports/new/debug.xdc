set_property MARK_DEBUG true [get_nets -hier spi_clk_iob]
set_property MARK_DEBUG true [get_nets -hier spi_cs_n_buffered]
#set_property MARK_DEBUG true [get_nets -hier spi_mosi -filter {name =~ "*decoder_top*/inst/*"}]
set_property MARK_DEBUG true [get_nets -hier spi_p_data -filter {name =~ "*decoder_top*/inst/*"}]
set_property MARK_DEBUG true [get_nets -hier spi_n_data -filter {name =~ "*decoder_top*/inst/*"}]
set_property MARK_DEBUG true [get_nets -hier distru_p -filter {name =~ "*decoder_top*/inst/*"}]
set_property MARK_DEBUG true [get_nets -hier distru_n -filter {name =~ "*decoder_top*/inst/*"}]
set_property MARK_DEBUG true [get_nets -hier merger_out -filter {name =~ "*decoder_top*/inst/*"}]
set_property MARK_DEBUG true [get_nets -hier merger_out_valid -filter {name =~ "*decoder_top*/inst/*"}]
#set_property MARK_DEBUG true [get_nets -hier mosi_to_in_buff]
set_property MARK_DEBUG true [get_nets -hier spi_data_out*]
set_property MARK_DEBUG true [get_nets -hier spi_wr_addr*]
set_property MARK_DEBUG true [get_nets -hier spi_write_en_stable -filter {name =~ "*decoder_top*/inst*"}]
set_property MARK_DEBUG true [get_nets -hier spi_read_en_stable -filter {name =~ "*decoder_top*/inst*"}]
#set_property MARK_DEBUG true [get_nets -hier new_bit_avail -filter {name =~ "*decoder_top*/inst*"}]
set_property MARK_DEBUG true [get_nets -of [get_pins -of [get_cells -hier in_shift_count_reg*] -filter {ref_pin_name == Q}]]
#set_property MARK_DEBUG true [get_nets -of [get_pins -of [get_cells -hier out_shft_cnt_reg*] -filter {ref_pin_name == Q}]]
#set_property MARK_DEBUG true [get_nets -of [get_pins -of [get_cells -hier out_mosi_reg_sel_reg*] -filter {ref_pin_name == Q}]]
#set_property MARK_DEBUG true [get_nets -of [get_pins -of [get_cells -hier in_mosi_reg_sel_reg*] -filter {ref_pin_name == Q}]]
#set_property MARK_DEBUG true [get_nets -of [get_pins -of [get_cells -hier mosi_reg_reg*] -filter {ref_pin_name == Q}]]
#set_property MARK_DEBUG true [get_nets -of [get_pins -of [get_cells -hier mosi_valid_reg*] -filter {ref_pin_name == Q}]]
#set_property MARK_DEBUG true [get_nets -of [get_pins -of [get_cells -hier prev_mosi_valid_reg*] -filter {ref_pin_name == Q}]]
set_property MARK_DEBUG true [get_nets -of [get_pins -of [get_cells -hier miso_reg_reg*] -filter {ref_pin_name == Q}]]

# Set cdc constraints for ila probes and nets
#set_max_delay -datapath_only -from [get_clocks spi_clk] -to [get_clocks -of [get_pins -hier * -filter {name =~ "*decoder_top*/inst/clk"}]] 10.000
#set_min_delay -from [get_clocks spi_clk] -to [get_clocks -of [get_pins -hier * -filter {name =~ "*decoder_top*/inst/clk"}]] 0.000
#set_clock_groups -async -group [get_clocks *ila*] -group [get_clocks decoder*]

create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 4 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER true [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list decoder_sys_i/clk_wiz_0/inst/decoder]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 4 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/spi_wr_addr[0]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/spi_wr_addr[1]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/spi_wr_addr[2]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/spi_wr_addr[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 32 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/miso_reg[0]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/miso_reg[1]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/miso_reg[2]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/miso_reg[3]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/miso_reg[4]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/miso_reg[5]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/miso_reg[6]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/miso_reg[7]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/miso_reg[8]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/miso_reg[9]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/miso_reg[10]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/miso_reg[11]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/miso_reg[12]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/miso_reg[13]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/miso_reg[14]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/miso_reg[15]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/miso_reg[16]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/miso_reg[17]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/miso_reg[18]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/miso_reg[19]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/miso_reg[20]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/miso_reg[21]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/miso_reg[22]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/miso_reg[23]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/miso_reg[24]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/miso_reg[25]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/miso_reg[26]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/miso_reg[27]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/miso_reg[28]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/miso_reg[29]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/miso_reg[30]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/miso_reg[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 4 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {decoder_sys_i/decoder_top_v3_0/inst/spi_wr_addr[0]} {decoder_sys_i/decoder_top_v3_0/inst/spi_wr_addr[1]} {decoder_sys_i/decoder_top_v3_0/inst/spi_wr_addr[2]} {decoder_sys_i/decoder_top_v3_0/inst/spi_wr_addr[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 32 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {decoder_sys_i/decoder_top_v3_0/inst/spi_data_out[0]} {decoder_sys_i/decoder_top_v3_0/inst/spi_data_out[1]} {decoder_sys_i/decoder_top_v3_0/inst/spi_data_out[2]} {decoder_sys_i/decoder_top_v3_0/inst/spi_data_out[3]} {decoder_sys_i/decoder_top_v3_0/inst/spi_data_out[4]} {decoder_sys_i/decoder_top_v3_0/inst/spi_data_out[5]} {decoder_sys_i/decoder_top_v3_0/inst/spi_data_out[6]} {decoder_sys_i/decoder_top_v3_0/inst/spi_data_out[7]} {decoder_sys_i/decoder_top_v3_0/inst/spi_data_out[8]} {decoder_sys_i/decoder_top_v3_0/inst/spi_data_out[9]} {decoder_sys_i/decoder_top_v3_0/inst/spi_data_out[10]} {decoder_sys_i/decoder_top_v3_0/inst/spi_data_out[11]} {decoder_sys_i/decoder_top_v3_0/inst/spi_data_out[12]} {decoder_sys_i/decoder_top_v3_0/inst/spi_data_out[13]} {decoder_sys_i/decoder_top_v3_0/inst/spi_data_out[14]} {decoder_sys_i/decoder_top_v3_0/inst/spi_data_out[15]} {decoder_sys_i/decoder_top_v3_0/inst/spi_data_out[16]} {decoder_sys_i/decoder_top_v3_0/inst/spi_data_out[17]} {decoder_sys_i/decoder_top_v3_0/inst/spi_data_out[18]} {decoder_sys_i/decoder_top_v3_0/inst/spi_data_out[19]} {decoder_sys_i/decoder_top_v3_0/inst/spi_data_out[20]} {decoder_sys_i/decoder_top_v3_0/inst/spi_data_out[21]} {decoder_sys_i/decoder_top_v3_0/inst/spi_data_out[22]} {decoder_sys_i/decoder_top_v3_0/inst/spi_data_out[23]} {decoder_sys_i/decoder_top_v3_0/inst/spi_data_out[24]} {decoder_sys_i/decoder_top_v3_0/inst/spi_data_out[25]} {decoder_sys_i/decoder_top_v3_0/inst/spi_data_out[26]} {decoder_sys_i/decoder_top_v3_0/inst/spi_data_out[27]} {decoder_sys_i/decoder_top_v3_0/inst/spi_data_out[28]} {decoder_sys_i/decoder_top_v3_0/inst/spi_data_out[29]} {decoder_sys_i/decoder_top_v3_0/inst/spi_data_out[30]} {decoder_sys_i/decoder_top_v3_0/inst/spi_data_out[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 6 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/in_shift_count_debug[0]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/in_shift_count_debug[1]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/in_shift_count_debug[2]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/in_shift_count_debug[3]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/in_shift_count_debug[4]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/in_shift_count_debug[5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 32 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[0]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[1]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[2]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[3]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[4]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[5]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[6]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[7]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[8]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[9]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[10]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[11]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[12]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[13]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[14]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[15]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[16]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[17]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[18]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[19]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[20]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[21]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[22]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[23]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[24]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[25]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[26]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[27]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[28]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[29]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[30]} {decoder_sys_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list decoder_sys_i/decoder_top_v3_0/inst/spi_interface/distru_n]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list decoder_sys_i/decoder_top_v3_0/inst/spi_interface/distru_p]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list decoder_sys_i/decoder_top_v3_0/inst/spi_interface/merger_out]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 1 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list decoder_sys_i/decoder_top_v3_0/inst/spi_interface/merger_out_valid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list decoder_sys_i/decoder_top_v3_0/inst/spi_interface/spi_clk_iob]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 1 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list decoder_sys_i/decoder_top_v3_0/inst/spi_cs_n_buffered]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 1 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list decoder_sys_i/decoder_top_v3_0/inst/spi_interface/spi_n_data]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 1 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list decoder_sys_i/decoder_top_v3_0/inst/spi_interface/spi_p_data]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 1 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list decoder_sys_i/decoder_top_v3_0/inst/spi_read_en_stable]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 1 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list decoder_sys_i/decoder_top_v3_0/inst/spi_write_en_stable]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets u_ila_0_decoder]
