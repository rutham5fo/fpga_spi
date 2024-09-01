vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xilinx_vip
vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/axi_infrastructure_v1_1_0
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/axi_vip_v1_1_12

vmap xilinx_vip modelsim_lib/msim/xilinx_vip
vmap xpm modelsim_lib/msim/xpm
vmap axi_infrastructure_v1_1_0 modelsim_lib/msim/axi_infrastructure_v1_1_0
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap axi_vip_v1_1_12 modelsim_lib/msim/axi_vip_v1_1_12

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

vlog -work xpm  -incr -mfcu -sv -L axi_vip_v1_1_12 -L processing_system7_vip_v1_0_14 -L xilinx_vip "+incdir+../../../../encoder_board.gen/sources_1/bd/encoder_decoder_sim/ipshared/ec67/hdl" "+incdir+../../../../encoder_board.gen/sources_1/bd/encoder_decoder_sim/ipshared/4e49" "+incdir+C:/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm  -93 \
"C:/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -incr -mfcu "+incdir+../../../../encoder_board.gen/sources_1/bd/encoder_decoder_sim/ipshared/ec67/hdl" "+incdir+../../../../encoder_board.gen/sources_1/bd/encoder_decoder_sim/ipshared/4e49" "+incdir+C:/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../encoder_board.gen/sources_1/bd/encoder_decoder_sim/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu -sv -L axi_vip_v1_1_12 -L processing_system7_vip_v1_0_14 -L xilinx_vip "+incdir+../../../../encoder_board.gen/sources_1/bd/encoder_decoder_sim/ipshared/ec67/hdl" "+incdir+../../../../encoder_board.gen/sources_1/bd/encoder_decoder_sim/ipshared/4e49" "+incdir+C:/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../bd/encoder_decoder_sim/ip/encoder_decoder_sim_axi_vip_0_0/sim/encoder_decoder_sim_axi_vip_0_0_pkg.sv" \

vlog -work axi_vip_v1_1_12  -incr -mfcu -sv -L axi_vip_v1_1_12 -L processing_system7_vip_v1_0_14 -L xilinx_vip "+incdir+../../../../encoder_board.gen/sources_1/bd/encoder_decoder_sim/ipshared/ec67/hdl" "+incdir+../../../../encoder_board.gen/sources_1/bd/encoder_decoder_sim/ipshared/4e49" "+incdir+C:/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../encoder_board.gen/sources_1/bd/encoder_decoder_sim/ipshared/1033/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu -sv -L axi_vip_v1_1_12 -L processing_system7_vip_v1_0_14 -L xilinx_vip "+incdir+../../../../encoder_board.gen/sources_1/bd/encoder_decoder_sim/ipshared/ec67/hdl" "+incdir+../../../../encoder_board.gen/sources_1/bd/encoder_decoder_sim/ipshared/4e49" "+incdir+C:/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../bd/encoder_decoder_sim/ip/encoder_decoder_sim_axi_vip_0_0/sim/encoder_decoder_sim_axi_vip_0_0.sv" \

vlog -work xil_defaultlib  -incr -mfcu "+incdir+../../../../encoder_board.gen/sources_1/bd/encoder_decoder_sim/ipshared/ec67/hdl" "+incdir+../../../../encoder_board.gen/sources_1/bd/encoder_decoder_sim/ipshared/4e49" "+incdir+C:/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../bd/encoder_decoder_sim/ip/encoder_decoder_sim_clk_wiz_0_0/encoder_decoder_sim_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/encoder_decoder_sim/ip/encoder_decoder_sim_clk_wiz_0_0/encoder_decoder_sim_clk_wiz_0_0.v" \
"../../../bd/encoder_decoder_sim/ipshared/9b9a/hdl/axi_spi_interface_v1_0_S00_AXI.v" \
"../../../bd/encoder_decoder_sim/ipshared/9b9a/src/spi_driver.v" \
"../../../bd/encoder_decoder_sim/ipshared/9b9a/hdl/axi_spi_interface_v1_0.v" \
"../../../bd/encoder_decoder_sim/ip/encoder_decoder_sim_axi_spi_interface_0_0/sim/encoder_decoder_sim_axi_spi_interface_0_0.v" \
"../../../bd/encoder_decoder_sim/ipshared/d147/src/control.v" \
"../../../bd/encoder_decoder_sim/ipshared/d147/src/hamming.v" \
"../../../bd/encoder_decoder_sim/ipshared/d147/src/reg_bank.v" \
"../../../bd/encoder_decoder_sim/ipshared/d147/src/spi_slave.v" \
"../../../bd/encoder_decoder_sim/ipshared/d147/src/decoder_top.v" \
"../../../bd/encoder_decoder_sim/ip/encoder_decoder_sim_decoder_top_v3_0_0/sim/encoder_decoder_sim_decoder_top_v3_0_0.v" \
"../../../bd/encoder_decoder_sim/sim/encoder_decoder_sim.v" \

vlog -work xil_defaultlib \
"glbl.v"

