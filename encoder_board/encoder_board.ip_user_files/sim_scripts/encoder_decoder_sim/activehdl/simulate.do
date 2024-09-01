onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+encoder_decoder_sim -L xilinx_vip -L xpm -L axi_infrastructure_v1_1_0 -L xil_defaultlib -L axi_vip_v1_1_12 -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.encoder_decoder_sim xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure

do {encoder_decoder_sim.udo}

run -all

endsim

quit -force
