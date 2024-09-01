set_property SRC_FILE_INFO {cfile:c:/Users/91988/Documents/Amruth/Files/EAS/hls_accel/decoder_board/decoder_board.gen/sources_1/bd/decoder_sys/ip/decoder_sys_clk_wiz_0_0/decoder_sys_clk_wiz_0_0.xdc rfile:../../../decoder_board.gen/sources_1/bd/decoder_sys/ip/decoder_sys_clk_wiz_0_0/decoder_sys_clk_wiz_0_0.xdc id:1 order:EARLY scoped_inst:decoder_sys_i/clk_wiz_0/inst} [current_design]
set_property SRC_FILE_INFO {cfile:C:/Users/91988/Documents/Amruth/Files/EAS/hls_accel/decoder_board/decoder_board.srcs/constrs_1/new/timing.xdc rfile:../../../decoder_board.srcs/constrs_1/new/timing.xdc id:2} [current_design]
set_property SRC_FILE_INFO {cfile:C:/Users/91988/Documents/Amruth/Files/EAS/hls_accel/decoder_board/decoder_board.srcs/constrs_1/new/pin.xdc rfile:../../../decoder_board.srcs/constrs_1/new/pin.xdc id:3} [current_design]
set_property SRC_FILE_INFO {cfile:c:/Users/91988/Documents/Amruth/Files/EAS/hls_accel/decoder_board/decoder_board.gen/sources_1/bd/decoder_sys/ip/decoder_sys_decoder_top_v3_0_0/src/timing.xdc rfile:../../../decoder_board.gen/sources_1/bd/decoder_sys/ip/decoder_sys_decoder_top_v3_0_0/src/timing.xdc id:4 order:LATE scoped_inst:decoder_sys_i/decoder_top_v3_0/inst} [current_design]
current_instance decoder_sys_i/clk_wiz_0/inst
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.100
current_instance
set_property src_info {type:XDC file:2 line:53 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -datapath_only -from [get_pins -of [get_cells -hier spi_out_oddr -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == C}] -to [get_ports dec_miso] "4.5"
set_property src_info {type:XDC file:2 line:54 export:INPUT save:INPUT read:READ} [current_design]
set_min_delay -from [get_pins -of [get_cells -hier spi_out_oddr -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == C}] -to [get_ports dec_miso] "0"
set_property src_info {type:XDC file:3 line:2 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN Y9 IOSTANDARD LVCMOS33} [get_ports dec_sys_clk]
set_property src_info {type:XDC file:3 line:5 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN U14 IOSTANDARD LVCMOS33} [get_ports dec_clk_locked]
set_property src_info {type:XDC file:3 line:9 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN Y11 IOSTANDARD LVCMOS33} [get_ports dec_mosi]; #Pin 1
set_property src_info {type:XDC file:3 line:10 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN AA11 IOSTANDARD LVCMOS33} [get_ports dec_miso]; #Pin 2
set_property src_info {type:XDC file:3 line:11 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN Y10 IOSTANDARD LVCMOS33} [get_ports dec_spi_cs_n]; #Pin 3
set_property src_info {type:XDC file:3 line:12 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN AA9 IOSTANDARD LVCMOS33} [get_ports dec_spi_clk]; #Pin 4 (+ve SRCC pin)
set_property src_info {type:XDC file:3 line:13 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN AB11 IOSTANDARD LVCMOS33} [get_ports dec_reset_n]; #Pin 7
set_property src_info {type:XDC file:3 line:14 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN P16 IOSTANDARD LVCMOS18} [get_ports dec_sys_resetn];  # "BTNC"
set_property src_info {type:XDC file:3 line:17 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN T22 IOSTANDARD LVCMOS33} [get_ports {errors_corrected[0]}]
set_property src_info {type:XDC file:3 line:18 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN T21 IOSTANDARD LVCMOS33} [get_ports {errors_corrected[1]}]
set_property src_info {type:XDC file:3 line:19 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN U22 IOSTANDARD LVCMOS33} [get_ports {errors_corrected[2]}]
set_property src_info {type:XDC file:3 line:20 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN U21 IOSTANDARD LVCMOS33} [get_ports {errors_corrected[3]}]
current_instance decoder_sys_i/decoder_top_v3_0/inst
set_property src_info {type:SCOPED_XDC file:4 line:16 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -datapath_only -from [get_pins -of [get_cells -hier * -filter {name =~ "*spi_p_valid_reg"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*spi_p*_valid_metaguard_reg[0]"}] -filter {ref_pin_name == D}] 3.0
set_property src_info {type:SCOPED_XDC file:4 line:17 export:INPUT save:INPUT read:READ} [current_design]
set_min_delay -from [get_pins -of [get_cells -hier * -filter {name =~ "*spi_p_valid_reg"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*spi_p*_valid_metaguard_reg[0]"}] -filter {ref_pin_name == D}] 1.5
set_property src_info {type:SCOPED_XDC file:4 line:18 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -datapath_only -from [get_pins -of [get_cells -hier * -filter {name =~ "*spi_n_valid_reg"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*spi_n*_valid_metaguard_reg[0]"}] -filter {ref_pin_name == D}] 3.0
set_property src_info {type:SCOPED_XDC file:4 line:19 export:INPUT save:INPUT read:READ} [current_design]
set_min_delay -from [get_pins -of [get_cells -hier * -filter {name =~ "*spi_n_valid_reg"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*spi_n*_valid_metaguard_reg[0]"}] -filter {ref_pin_name == D}] 1.5
set_property src_info {type:SCOPED_XDC file:4 line:20 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -datapath_only -from [get_pins -of [get_cells -hier spi_in_iddr -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*spi_*_data_metaguard_reg[0]"}] -filter {ref_pin_name == D}] 3.0
set_property src_info {type:SCOPED_XDC file:4 line:21 export:INPUT save:INPUT read:READ} [current_design]
set_min_delay -from [get_pins -of [get_cells -hier spi_in_iddr -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier * -filter {name =~ "*spi_*_data_metaguard_reg[0]"}] -filter {ref_pin_name == D}] 1.5
set_property src_info {type:SCOPED_XDC file:4 line:24 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -datapath_only -from [get_pins -of [get_cells -hier * -filter {name =~ "*spi_io_regs_en_reg"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier [list "spi_out_oddr" "spi_in_iddr"] -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == CE}] 3.0
set_property src_info {type:SCOPED_XDC file:4 line:25 export:INPUT save:INPUT read:READ} [current_design]
set_min_delay -from [get_pins -of [get_cells -hier * -filter {name =~ "*spi_io_regs_en_reg"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier [list "spi_out_oddr" "spi_in_iddr"] -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == CE}] 1.5
set_property src_info {type:SCOPED_XDC file:4 line:26 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -datapath_only -from [get_pins -of [get_cells -hier * -filter {name =~ "*distru_p_reg"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier "spi_out_oddr" -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == D1}] 3.0
set_property src_info {type:SCOPED_XDC file:4 line:27 export:INPUT save:INPUT read:READ} [current_design]
set_min_delay -from [get_pins -of [get_cells -hier * -filter {name =~ "*distru_p_reg"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier "spi_out_oddr" -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == D1}] 1.5
set_property src_info {type:SCOPED_XDC file:4 line:28 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -datapath_only -from [get_pins -of [get_cells -hier * -filter {name =~ "*distru_n_reg"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier "spi_out_oddr" -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == D2}] 3.0
set_property src_info {type:SCOPED_XDC file:4 line:29 export:INPUT save:INPUT read:READ} [current_design]
set_min_delay -from [get_pins -of [get_cells -hier * -filter {name =~ "*distru_n_reg"}] -filter {ref_pin_name == C}] -to [get_pins -of [get_cells -hier "spi_out_oddr" -filter {name =~ "*decoder_top*/inst*"}] -filter {ref_pin_name == D2}] 1.5
set_property src_info {type:SCOPED_XDC file:4 line:32 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -datapath_only -from [get_pins -of [get_cells -hier * -filter {name =~ "*miso_disable_reg_reg"}] -filter {ref_pin_name == C}] -to [get_ports spi_miso] 20.0
set_property src_info {type:SCOPED_XDC file:4 line:33 export:INPUT save:INPUT read:READ} [current_design]
set_min_delay -from [get_pins -of [get_cells -hier * -filter {name =~ "*miso_disable_reg_reg"}] -filter {ref_pin_name == C}] -to [get_ports spi_miso] 1.5
