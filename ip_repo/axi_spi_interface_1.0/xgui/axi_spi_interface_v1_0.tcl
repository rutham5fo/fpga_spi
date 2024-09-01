# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "C_S00_AXI_DATA_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S00_AXI_ADDR_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S00_AXI_BASEADDR" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S00_AXI_HIGHADDR" -parent ${Page_0}

  ipgui::add_param $IPINST -name "SPI_RD_ADDR_WIDTH"
  set SPI_WR_ADDR_WIDTH [ipgui::add_param $IPINST -name "SPI_WR_ADDR_WIDTH"]
  set_property tooltip {Spi Write Address Width} ${SPI_WR_ADDR_WIDTH}
  ipgui::add_param $IPINST -name "SPI_INIT_INTERVAL"
  ipgui::add_param $IPINST -name "SPI_CLK_FB_DELAY_WIDTH"
  ipgui::add_param $IPINST -name "SPI_EXIT_INTERVAL"
  ipgui::add_param $IPINST -name "SPI_SHIFT_IN_COMP"
  ipgui::add_param $IPINST -name "SPI_DUMMY_BITS_END"
  ipgui::add_param $IPINST -name "SPI_DUMMY_BITS_BEG"

}

proc update_PARAM_VALUE.SPI_CLK_FB_DELAY_WIDTH { PARAM_VALUE.SPI_CLK_FB_DELAY_WIDTH } {
	# Procedure called to update SPI_CLK_FB_DELAY_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SPI_CLK_FB_DELAY_WIDTH { PARAM_VALUE.SPI_CLK_FB_DELAY_WIDTH } {
	# Procedure called to validate SPI_CLK_FB_DELAY_WIDTH
	return true
}

proc update_PARAM_VALUE.SPI_DUMMY_BITS_BEG { PARAM_VALUE.SPI_DUMMY_BITS_BEG } {
	# Procedure called to update SPI_DUMMY_BITS_BEG when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SPI_DUMMY_BITS_BEG { PARAM_VALUE.SPI_DUMMY_BITS_BEG } {
	# Procedure called to validate SPI_DUMMY_BITS_BEG
	return true
}

proc update_PARAM_VALUE.SPI_DUMMY_BITS_END { PARAM_VALUE.SPI_DUMMY_BITS_END } {
	# Procedure called to update SPI_DUMMY_BITS_END when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SPI_DUMMY_BITS_END { PARAM_VALUE.SPI_DUMMY_BITS_END } {
	# Procedure called to validate SPI_DUMMY_BITS_END
	return true
}

proc update_PARAM_VALUE.SPI_EXIT_INTERVAL { PARAM_VALUE.SPI_EXIT_INTERVAL } {
	# Procedure called to update SPI_EXIT_INTERVAL when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SPI_EXIT_INTERVAL { PARAM_VALUE.SPI_EXIT_INTERVAL } {
	# Procedure called to validate SPI_EXIT_INTERVAL
	return true
}

proc update_PARAM_VALUE.SPI_INIT_INTERVAL { PARAM_VALUE.SPI_INIT_INTERVAL } {
	# Procedure called to update SPI_INIT_INTERVAL when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SPI_INIT_INTERVAL { PARAM_VALUE.SPI_INIT_INTERVAL } {
	# Procedure called to validate SPI_INIT_INTERVAL
	return true
}

proc update_PARAM_VALUE.SPI_RD_ADDR_WIDTH { PARAM_VALUE.SPI_RD_ADDR_WIDTH } {
	# Procedure called to update SPI_RD_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SPI_RD_ADDR_WIDTH { PARAM_VALUE.SPI_RD_ADDR_WIDTH } {
	# Procedure called to validate SPI_RD_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.SPI_SHIFT_IN_COMP { PARAM_VALUE.SPI_SHIFT_IN_COMP } {
	# Procedure called to update SPI_SHIFT_IN_COMP when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SPI_SHIFT_IN_COMP { PARAM_VALUE.SPI_SHIFT_IN_COMP } {
	# Procedure called to validate SPI_SHIFT_IN_COMP
	return true
}

proc update_PARAM_VALUE.SPI_WR_ADDR_WIDTH { PARAM_VALUE.SPI_WR_ADDR_WIDTH } {
	# Procedure called to update SPI_WR_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SPI_WR_ADDR_WIDTH { PARAM_VALUE.SPI_WR_ADDR_WIDTH } {
	# Procedure called to validate SPI_WR_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_DATA_WIDTH { PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to update C_S00_AXI_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_DATA_WIDTH { PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to validate C_S00_AXI_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_ADDR_WIDTH { PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to update C_S00_AXI_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_ADDR_WIDTH { PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to validate C_S00_AXI_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_BASEADDR { PARAM_VALUE.C_S00_AXI_BASEADDR } {
	# Procedure called to update C_S00_AXI_BASEADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_BASEADDR { PARAM_VALUE.C_S00_AXI_BASEADDR } {
	# Procedure called to validate C_S00_AXI_BASEADDR
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_HIGHADDR { PARAM_VALUE.C_S00_AXI_HIGHADDR } {
	# Procedure called to update C_S00_AXI_HIGHADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_HIGHADDR { PARAM_VALUE.C_S00_AXI_HIGHADDR } {
	# Procedure called to validate C_S00_AXI_HIGHADDR
	return true
}


proc update_MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH { MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_DATA_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH { MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.SPI_RD_ADDR_WIDTH { MODELPARAM_VALUE.SPI_RD_ADDR_WIDTH PARAM_VALUE.SPI_RD_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SPI_RD_ADDR_WIDTH}] ${MODELPARAM_VALUE.SPI_RD_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.SPI_WR_ADDR_WIDTH { MODELPARAM_VALUE.SPI_WR_ADDR_WIDTH PARAM_VALUE.SPI_WR_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SPI_WR_ADDR_WIDTH}] ${MODELPARAM_VALUE.SPI_WR_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.SPI_INIT_INTERVAL { MODELPARAM_VALUE.SPI_INIT_INTERVAL PARAM_VALUE.SPI_INIT_INTERVAL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SPI_INIT_INTERVAL}] ${MODELPARAM_VALUE.SPI_INIT_INTERVAL}
}

proc update_MODELPARAM_VALUE.SPI_CLK_FB_DELAY_WIDTH { MODELPARAM_VALUE.SPI_CLK_FB_DELAY_WIDTH PARAM_VALUE.SPI_CLK_FB_DELAY_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SPI_CLK_FB_DELAY_WIDTH}] ${MODELPARAM_VALUE.SPI_CLK_FB_DELAY_WIDTH}
}

proc update_MODELPARAM_VALUE.SPI_EXIT_INTERVAL { MODELPARAM_VALUE.SPI_EXIT_INTERVAL PARAM_VALUE.SPI_EXIT_INTERVAL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SPI_EXIT_INTERVAL}] ${MODELPARAM_VALUE.SPI_EXIT_INTERVAL}
}

proc update_MODELPARAM_VALUE.SPI_SHIFT_IN_COMP { MODELPARAM_VALUE.SPI_SHIFT_IN_COMP PARAM_VALUE.SPI_SHIFT_IN_COMP } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SPI_SHIFT_IN_COMP}] ${MODELPARAM_VALUE.SPI_SHIFT_IN_COMP}
}

proc update_MODELPARAM_VALUE.SPI_DUMMY_BITS_END { MODELPARAM_VALUE.SPI_DUMMY_BITS_END PARAM_VALUE.SPI_DUMMY_BITS_END } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SPI_DUMMY_BITS_END}] ${MODELPARAM_VALUE.SPI_DUMMY_BITS_END}
}

proc update_MODELPARAM_VALUE.SPI_DUMMY_BITS_BEG { MODELPARAM_VALUE.SPI_DUMMY_BITS_BEG PARAM_VALUE.SPI_DUMMY_BITS_BEG } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SPI_DUMMY_BITS_BEG}] ${MODELPARAM_VALUE.SPI_DUMMY_BITS_BEG}
}

