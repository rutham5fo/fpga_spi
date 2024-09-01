-makelib xcelium_lib/xilinx_vip -sv \
  "C:/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
  "C:/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
  "C:/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
  "C:/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
  "C:/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
  "C:/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
  "C:/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
  "C:/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
  "C:/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/rst_vip_if.sv" \
-endlib
-makelib xcelium_lib/xpm -sv \
  "C:/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "C:/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "C:/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/axi_infrastructure_v1_1_0 \
  "../../../../encoder_board.gen/sources_1/bd/encoder_decoder_sim/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/encoder_decoder_sim/ip/encoder_decoder_sim_axi_vip_0_0/sim/encoder_decoder_sim_axi_vip_0_0_pkg.sv" \
-endlib
-makelib xcelium_lib/axi_vip_v1_1_12 -sv \
  "../../../../encoder_board.gen/sources_1/bd/encoder_decoder_sim/ipshared/1033/hdl/axi_vip_v1_1_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/encoder_decoder_sim/ip/encoder_decoder_sim_axi_vip_0_0/sim/encoder_decoder_sim_axi_vip_0_0.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
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
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

