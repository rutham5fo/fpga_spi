vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xilinx_vip
vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/axi_infrastructure_v1_1_0
vlib modelsim_lib/msim/axi_vip_v1_1_12
vlib modelsim_lib/msim/processing_system7_vip_v1_0_14
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/lib_cdc_v1_0_2
vlib modelsim_lib/msim/proc_sys_reset_v5_0_13
vlib modelsim_lib/msim/generic_baseblocks_v2_1_0
vlib modelsim_lib/msim/fifo_generator_v13_2_7
vlib modelsim_lib/msim/axi_data_fifo_v2_1_25
vlib modelsim_lib/msim/axi_register_slice_v2_1_26
vlib modelsim_lib/msim/axi_protocol_converter_v2_1_26

vmap xilinx_vip modelsim_lib/msim/xilinx_vip
vmap xpm modelsim_lib/msim/xpm
vmap axi_infrastructure_v1_1_0 modelsim_lib/msim/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_12 modelsim_lib/msim/axi_vip_v1_1_12
vmap processing_system7_vip_v1_0_14 modelsim_lib/msim/processing_system7_vip_v1_0_14
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap lib_cdc_v1_0_2 modelsim_lib/msim/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 modelsim_lib/msim/proc_sys_reset_v5_0_13
vmap generic_baseblocks_v2_1_0 modelsim_lib/msim/generic_baseblocks_v2_1_0
vmap fifo_generator_v13_2_7 modelsim_lib/msim/fifo_generator_v13_2_7
vmap axi_data_fifo_v2_1_25 modelsim_lib/msim/axi_data_fifo_v2_1_25
vmap axi_register_slice_v2_1_26 modelsim_lib/msim/axi_register_slice_v2_1_26
vmap axi_protocol_converter_v2_1_26 modelsim_lib/msim/axi_protocol_converter_v2_1_26

vlog -work xilinx_vip  -incr -mfcu -sv -L axi_vip_v1_1_12 -L processing_system7_vip_v1_0_14 -L xilinx_vip "+incdir+C:/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"C:/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"C:/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"C:/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"C:/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"C:/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"C:/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
"C:/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
"C:/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -incr -mfcu -sv -L axi_vip_v1_1_12 -L processing_system7_vip_v1_0_14 -L xilinx_vip "+incdir+../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/ec67/hdl" "+incdir+../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/5765/hdl" "+incdir+../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/4e49" "+incdir+C:/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm  -93 \
"C:/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -incr -mfcu "+incdir+../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/ec67/hdl" "+incdir+../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/5765/hdl" "+incdir+../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/4e49" "+incdir+C:/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_12  -incr -mfcu -sv -L axi_vip_v1_1_12 -L processing_system7_vip_v1_0_14 -L xilinx_vip "+incdir+../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/ec67/hdl" "+incdir+../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/5765/hdl" "+incdir+../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/4e49" "+incdir+C:/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/1033/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_14  -incr -mfcu -sv -L axi_vip_v1_1_12 -L processing_system7_vip_v1_0_14 -L xilinx_vip "+incdir+../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/ec67/hdl" "+incdir+../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/5765/hdl" "+incdir+../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/4e49" "+incdir+C:/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/5765/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu "+incdir+../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/ec67/hdl" "+incdir+../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/5765/hdl" "+incdir+../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/4e49" "+incdir+C:/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../bd/encoder_system/ip/encoder_system_processing_system7_0_0/sim/encoder_system_processing_system7_0_0.v" \
"../../../bd/encoder_system/ipshared/e0d0/hdl/axi_spi_interface_v1_0_S00_AXI.v" \
"../../../bd/encoder_system/ipshared/e0d0/src/spi_driver.v" \
"../../../bd/encoder_system/ipshared/e0d0/hdl/axi_spi_interface_v1_0.v" \
"../../../bd/encoder_system/ip/encoder_system_axi_spi_interface_0_0/sim/encoder_system_axi_spi_interface_0_0.v" \
"../../../bd/encoder_system/ip/encoder_system_clk_wiz_0_0/encoder_system_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/encoder_system/ip/encoder_system_clk_wiz_0_0/encoder_system_clk_wiz_0_0.v" \

vcom -work lib_cdc_v1_0_2  -93 \
"../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13  -93 \
"../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93 \
"../../../bd/encoder_system/ip/encoder_system_rst_ps7_0_100M_0/sim/encoder_system_rst_ps7_0_100M_0.vhd" \

vlog -work xil_defaultlib  -incr -mfcu "+incdir+../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/ec67/hdl" "+incdir+../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/5765/hdl" "+incdir+../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/4e49" "+incdir+C:/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../bd/encoder_system/sim/encoder_system.v" \

vlog -work generic_baseblocks_v2_1_0  -incr -mfcu "+incdir+../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/ec67/hdl" "+incdir+../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/5765/hdl" "+incdir+../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/4e49" "+incdir+C:/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_7  -incr -mfcu "+incdir+../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/ec67/hdl" "+incdir+../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/5765/hdl" "+incdir+../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/4e49" "+incdir+C:/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/83df/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_7  -93 \
"../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/83df/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_7  -incr -mfcu "+incdir+../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/ec67/hdl" "+incdir+../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/5765/hdl" "+incdir+../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/4e49" "+incdir+C:/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/83df/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_25  -incr -mfcu "+incdir+../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/ec67/hdl" "+incdir+../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/5765/hdl" "+incdir+../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/4e49" "+incdir+C:/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/5390/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_26  -incr -mfcu "+incdir+../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/ec67/hdl" "+incdir+../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/5765/hdl" "+incdir+../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/4e49" "+incdir+C:/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/0a3f/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_protocol_converter_v2_1_26  -incr -mfcu "+incdir+../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/ec67/hdl" "+incdir+../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/5765/hdl" "+incdir+../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/4e49" "+incdir+C:/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/90c8/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu "+incdir+../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/ec67/hdl" "+incdir+../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/5765/hdl" "+incdir+../../../../encoder_board_zedtest.gen/sources_1/bd/encoder_system/ipshared/4e49" "+incdir+C:/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../bd/encoder_system/ip/encoder_system_auto_pc_0/sim/encoder_system_auto_pc_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

