set dec_sysClk [get_clocks -of_objects [get_ports clk]]
set dec_spiClk [get_clocks -of_objects [get_ports spi_clk]]

set cdc_delay [expr {[ get_property PERIOD $dec_sysClk ] * 1}]
set spi_out_delay [expr {[ get_property PERIOD $dec_spiClk ] / 2}]; # We take the half period since the output regs are clocked on negedge and input regs sample on posedge
set spi_out_bias 4.000; # setup time of capturing flop outside (assumed as 1ns) + trace_delay (assumed to be 3ns here)
set spi_in_delay 3.000; # Arbitrary value, smaller - the closer register is placed to IOB

#set_clock_groups -asynchronous -group $dec_sysClk -group $dec_spiClk

set_property ASYNC_REG true [get_cells -hierarchical -filter {name =~ "*_metaguard_*"}]

# The signals are source synchronous, hence set_max_delay is to promote IOB register utilization
set_max_delay -from [get_ports -prop_thru_buffers spi_mosi] -to [filter -regexp [all_registers -clock $dec_spiClk -data_pins] {name =~ ".*mosi_reg.*D"}] $spi_in_delay
set_min_delay 0 -from [get_ports -prop_thru_buffers spi_mosi] -to [filter -regexp [all_registers -clock $dec_spiClk -data_pins] {name =~ ".*mosi_reg.*D"}]

set_max_delay -from [get_ports -prop_thru_buffers spi_cs_n] -to [filter -regexp [all_registers -clock $dec_spiClk -data_pins] {name =~ ".*buffer_reg.*CE"}] $spi_in_delay
set_min_delay 0 -from [get_ports -prop_thru_buffers spi_cs_n] -to [filter -regexp [all_registers -clock $dec_spiClk -data_pins] {name =~ ".*buffer_reg.*CE"}]

set_max_delay -datapath_only -from [filter -regexp [all_registers -clock $dec_spiClk -clock_pins] {name =~ ".*buffer_reg.*\[47\].*C"}] -to [get_ports -prop_thru_buffers spi_miso] [expr { $spi_out_delay - $spi_out_bias }]
set_min_delay 0 -from [filter -regexp [all_registers -clock $dec_spiClk -clock_pins] {name =~ ".*buffer_reg.*\[47\].*C"}] -to [get_ports -prop_thru_buffers spi_miso]

set_multicycle_path 2 -from [get_ports -prop_thru_buffers spi_cs_n] -to [filter -regexp [all_registers -clock $dec_sysClk -data_pins] {name =~ ".*spi_cs_n_reg.*\[0\].*D"}]

# Set max delays for CDC signals from clock dec_spiClk to dec_sysClk
set_max_delay -datapath_only -from $dec_spiClk -to $dec_sysClk $cdc_delay
set_min_delay 0 -from $dec_spiClk -to $dec_sysClk
# Set max delays for CDC signals from clock dec_sysClk to dec_spiClk
set_max_delay -datapath_only -from $dec_sysClk -to $dec_spiClk $cdc_delay
set_min_delay 0 -from $dec_sysClk -to $dec_spiClk

# Remove async_reset from STA
set_false_path -from [get_ports -prop_thru_buffers reset_n]
set_false_path -from $dec_sysClk -to [get_ports -prop_thru_buffers errors_corrected]