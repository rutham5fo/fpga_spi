set_property MARK_DEBUG true [get_nets -hier spi_cs_n_buffered]
set_property MARK_DEBUG true [get_nets -of [get_pins -of [get_cells -hier spi_in_reg_reg -filter {name =~ "*decoder_top*/inst/*"}] -filter {ref_pin_name == Q}]]
set_property MARK_DEBUG true [get_nets -hier mosi_to_in_buff]
set_property MARK_DEBUG true [get_nets -hier spi_data_out*]
set_property MARK_DEBUG true [get_nets -hier spi_wr_addr*]
set_property MARK_DEBUG true [get_nets -hier spi_write_en_stable -filter {name =~ "*decoder_top*/inst*"}]
set_property MARK_DEBUG true [get_nets -hier spi_read_en_stable -filter {name =~ "*decoder_top*/inst*"}]
set_property MARK_DEBUG true [get_nets -of [get_pins -of [get_cells -hier in_shift_count_reg*] -filter {ref_pin_name == Q}]]
set_property MARK_DEBUG true [get_nets -of [get_pins -of [get_cells -hier out_shft_cnt_reg*] -filter {ref_pin_name == Q}]]
set_property MARK_DEBUG true [get_nets -of [get_pins -of [get_cells -hier out_mosi_reg_sel_reg*] -filter {ref_pin_name == Q}]]
set_property MARK_DEBUG true [get_nets -of [get_pins -of [get_cells -hier in_mosi_reg_sel_reg*] -filter {ref_pin_name == Q}]]
set_property MARK_DEBUG true [get_nets -of [get_pins -of [get_cells -hier mosi_reg_reg*] -filter {ref_pin_name == Q}]]
set_property MARK_DEBUG true [get_nets -of [get_pins -of [get_cells -hier mosi_valid_reg*] -filter {ref_pin_name == Q}]]
set_property MARK_DEBUG true [get_nets -of [get_pins -of [get_cells -hier prev_mosi_valid_reg*] -filter {ref_pin_name == Q}]]




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
connect_debug_port u_ila_0/clk [get_nets [list system_test_v3_i/clk_wiz_1/inst/clk_out3]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 32 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[0]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[1]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[2]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[3]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[4]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[5]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[6]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[7]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[8]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[9]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[10]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[11]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[12]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[13]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[14]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[15]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[16]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[17]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[18]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[19]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[20]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[21]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[22]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[23]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[24]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[25]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[26]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[27]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[28]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[29]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[30]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/driver_out_data[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 2 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/in_mosi_reg_sel[0]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/in_mosi_reg_sel[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 4 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/prev_mosi_valid_debug[0]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/prev_mosi_valid_debug[1]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/prev_mosi_valid_debug[2]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/prev_mosi_valid_debug[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 4 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/mosi_reg_debug[0]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/mosi_reg_debug[1]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/mosi_reg_debug[2]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/mosi_reg_debug[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 4 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/mosi_valid_debug[0]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/mosi_valid_debug[1]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/mosi_valid_debug[2]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/mosi_valid_debug[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 6 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/out_shft_cnt[0]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/out_shft_cnt[1]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/out_shft_cnt[2]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/out_shft_cnt[3]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/out_shft_cnt[4]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/out_shft_cnt[5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 6 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/in_shift_count_debug[0]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/in_shift_count_debug[1]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/in_shift_count_debug[2]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/in_shift_count_debug[3]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/in_shift_count_debug[4]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/in_shift_count_debug[5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 32 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {system_test_v3_i/decoder_top_v3_0/inst/spi_data_out[0]} {system_test_v3_i/decoder_top_v3_0/inst/spi_data_out[1]} {system_test_v3_i/decoder_top_v3_0/inst/spi_data_out[2]} {system_test_v3_i/decoder_top_v3_0/inst/spi_data_out[3]} {system_test_v3_i/decoder_top_v3_0/inst/spi_data_out[4]} {system_test_v3_i/decoder_top_v3_0/inst/spi_data_out[5]} {system_test_v3_i/decoder_top_v3_0/inst/spi_data_out[6]} {system_test_v3_i/decoder_top_v3_0/inst/spi_data_out[7]} {system_test_v3_i/decoder_top_v3_0/inst/spi_data_out[8]} {system_test_v3_i/decoder_top_v3_0/inst/spi_data_out[9]} {system_test_v3_i/decoder_top_v3_0/inst/spi_data_out[10]} {system_test_v3_i/decoder_top_v3_0/inst/spi_data_out[11]} {system_test_v3_i/decoder_top_v3_0/inst/spi_data_out[12]} {system_test_v3_i/decoder_top_v3_0/inst/spi_data_out[13]} {system_test_v3_i/decoder_top_v3_0/inst/spi_data_out[14]} {system_test_v3_i/decoder_top_v3_0/inst/spi_data_out[15]} {system_test_v3_i/decoder_top_v3_0/inst/spi_data_out[16]} {system_test_v3_i/decoder_top_v3_0/inst/spi_data_out[17]} {system_test_v3_i/decoder_top_v3_0/inst/spi_data_out[18]} {system_test_v3_i/decoder_top_v3_0/inst/spi_data_out[19]} {system_test_v3_i/decoder_top_v3_0/inst/spi_data_out[20]} {system_test_v3_i/decoder_top_v3_0/inst/spi_data_out[21]} {system_test_v3_i/decoder_top_v3_0/inst/spi_data_out[22]} {system_test_v3_i/decoder_top_v3_0/inst/spi_data_out[23]} {system_test_v3_i/decoder_top_v3_0/inst/spi_data_out[24]} {system_test_v3_i/decoder_top_v3_0/inst/spi_data_out[25]} {system_test_v3_i/decoder_top_v3_0/inst/spi_data_out[26]} {system_test_v3_i/decoder_top_v3_0/inst/spi_data_out[27]} {system_test_v3_i/decoder_top_v3_0/inst/spi_data_out[28]} {system_test_v3_i/decoder_top_v3_0/inst/spi_data_out[29]} {system_test_v3_i/decoder_top_v3_0/inst/spi_data_out[30]} {system_test_v3_i/decoder_top_v3_0/inst/spi_data_out[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 2 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/in_mosi_reg_sel_debug[0]} {system_test_v3_i/decoder_top_v3_0/inst/spi_interface/in_mosi_reg_sel_debug[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 4 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {system_test_v3_i/decoder_top_v3_0/inst/spi_wr_addr[0]} {system_test_v3_i/decoder_top_v3_0/inst/spi_wr_addr[1]} {system_test_v3_i/decoder_top_v3_0/inst/spi_wr_addr[2]} {system_test_v3_i/decoder_top_v3_0/inst/spi_wr_addr[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list system_test_v3_i/decoder_top_v3_0/inst/spi_interface/mosi_to_in_buff]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 1 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list system_test_v3_i/decoder_top_v3_0/inst/spi_interface/spi_in_reg]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 1 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list system_test_v3_i/decoder_top_v3_0/inst/spi_read_en_stable]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 1 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list system_test_v3_i/decoder_top_v3_0/inst/spi_write_en_stable]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets u_ila_0_clk_out3]
