# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "CTRL_REG_NUM" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DATA_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "MAX_ERROR_COUNT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "NUM_REGS_PER_BANK" -parent ${Page_0}
  ipgui::add_param $IPINST -name "SPI_RD_ADDR_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "SPI_WR_ADDR_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "STAT_REG_NUM" -parent ${Page_0}


}

proc update_PARAM_VALUE.CTRL_REG_NUM { PARAM_VALUE.CTRL_REG_NUM } {
	# Procedure called to update CTRL_REG_NUM when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CTRL_REG_NUM { PARAM_VALUE.CTRL_REG_NUM } {
	# Procedure called to validate CTRL_REG_NUM
	return true
}

proc update_PARAM_VALUE.DATA_WIDTH { PARAM_VALUE.DATA_WIDTH } {
	# Procedure called to update DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DATA_WIDTH { PARAM_VALUE.DATA_WIDTH } {
	# Procedure called to validate DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.ERROR_COUNT_WIDTH { PARAM_VALUE.ERROR_COUNT_WIDTH } {
	# Procedure called to update ERROR_COUNT_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ERROR_COUNT_WIDTH { PARAM_VALUE.ERROR_COUNT_WIDTH } {
	# Procedure called to validate ERROR_COUNT_WIDTH
	return true
}

proc update_PARAM_VALUE.MAX_ERROR_COUNT { PARAM_VALUE.MAX_ERROR_COUNT } {
	# Procedure called to update MAX_ERROR_COUNT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MAX_ERROR_COUNT { PARAM_VALUE.MAX_ERROR_COUNT } {
	# Procedure called to validate MAX_ERROR_COUNT
	return true
}

proc update_PARAM_VALUE.NUM_REGS_PER_BANK { PARAM_VALUE.NUM_REGS_PER_BANK } {
	# Procedure called to update NUM_REGS_PER_BANK when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUM_REGS_PER_BANK { PARAM_VALUE.NUM_REGS_PER_BANK } {
	# Procedure called to validate NUM_REGS_PER_BANK
	return true
}

proc update_PARAM_VALUE.REG_BANK_ADDR_WIDTH { PARAM_VALUE.REG_BANK_ADDR_WIDTH } {
	# Procedure called to update REG_BANK_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.REG_BANK_ADDR_WIDTH { PARAM_VALUE.REG_BANK_ADDR_WIDTH } {
	# Procedure called to validate REG_BANK_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.SPI_RD_ADDR_WIDTH { PARAM_VALUE.SPI_RD_ADDR_WIDTH } {
	# Procedure called to update SPI_RD_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SPI_RD_ADDR_WIDTH { PARAM_VALUE.SPI_RD_ADDR_WIDTH } {
	# Procedure called to validate SPI_RD_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.SPI_WR_ADDR_WIDTH { PARAM_VALUE.SPI_WR_ADDR_WIDTH } {
	# Procedure called to update SPI_WR_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SPI_WR_ADDR_WIDTH { PARAM_VALUE.SPI_WR_ADDR_WIDTH } {
	# Procedure called to validate SPI_WR_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.STAT_REG_NUM { PARAM_VALUE.STAT_REG_NUM } {
	# Procedure called to update STAT_REG_NUM when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.STAT_REG_NUM { PARAM_VALUE.STAT_REG_NUM } {
	# Procedure called to validate STAT_REG_NUM
	return true
}


proc update_MODELPARAM_VALUE.DATA_WIDTH { MODELPARAM_VALUE.DATA_WIDTH PARAM_VALUE.DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DATA_WIDTH}] ${MODELPARAM_VALUE.DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.SPI_RD_ADDR_WIDTH { MODELPARAM_VALUE.SPI_RD_ADDR_WIDTH PARAM_VALUE.SPI_RD_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SPI_RD_ADDR_WIDTH}] ${MODELPARAM_VALUE.SPI_RD_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.SPI_WR_ADDR_WIDTH { MODELPARAM_VALUE.SPI_WR_ADDR_WIDTH PARAM_VALUE.SPI_WR_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SPI_WR_ADDR_WIDTH}] ${MODELPARAM_VALUE.SPI_WR_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.NUM_REGS_PER_BANK { MODELPARAM_VALUE.NUM_REGS_PER_BANK PARAM_VALUE.NUM_REGS_PER_BANK } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUM_REGS_PER_BANK}] ${MODELPARAM_VALUE.NUM_REGS_PER_BANK}
}

proc update_MODELPARAM_VALUE.CTRL_REG_NUM { MODELPARAM_VALUE.CTRL_REG_NUM PARAM_VALUE.CTRL_REG_NUM } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CTRL_REG_NUM}] ${MODELPARAM_VALUE.CTRL_REG_NUM}
}

proc update_MODELPARAM_VALUE.STAT_REG_NUM { MODELPARAM_VALUE.STAT_REG_NUM PARAM_VALUE.STAT_REG_NUM } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.STAT_REG_NUM}] ${MODELPARAM_VALUE.STAT_REG_NUM}
}

proc update_MODELPARAM_VALUE.MAX_ERROR_COUNT { MODELPARAM_VALUE.MAX_ERROR_COUNT PARAM_VALUE.MAX_ERROR_COUNT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MAX_ERROR_COUNT}] ${MODELPARAM_VALUE.MAX_ERROR_COUNT}
}

proc update_MODELPARAM_VALUE.ERROR_COUNT_WIDTH { MODELPARAM_VALUE.ERROR_COUNT_WIDTH PARAM_VALUE.ERROR_COUNT_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ERROR_COUNT_WIDTH}] ${MODELPARAM_VALUE.ERROR_COUNT_WIDTH}
}

proc update_MODELPARAM_VALUE.REG_BANK_ADDR_WIDTH { MODELPARAM_VALUE.REG_BANK_ADDR_WIDTH PARAM_VALUE.REG_BANK_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.REG_BANK_ADDR_WIDTH}] ${MODELPARAM_VALUE.REG_BANK_ADDR_WIDTH}
}

