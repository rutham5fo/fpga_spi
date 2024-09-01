# FPGA-SPI

## File structure

- Decoder_board: Contains Vivado project files for Decoder unit.
- Encoder_board: Contains Vivado project files for Encoder Unit and simulation using AXI VIP (Tested with PYNQ).
- Encoder_board_Zedtest: Contains project files for Encoder Unit (Tested with ZedBoard).
- Encoder_decoder_test_v3: Contains Vivado project files used for intra-board testing and experimentation.
- IP_repo: Contains IP files for Decoder unit and AXI-SPI Interface.
- Vitis: Contains source files for Vitis Hardware/Application platform.

## Getting started

* Read "SPI Communication and Synchronous Interface Constraining In FPGAs".
* Include custom IP_repo into Vivado project repository before starting design implementation.
* Modify constraints and configure IP parameters.
* Implement, test and have fun.

## Known issues in Vitis 2022.1

* When using custom IP (this case it was the axi IP from the encoder), Vitis will throw the following error while building board platform:
	
	"Compiling axi_spi_interface..."

	cc1.exe: fatal error: *.c: Invalid argument
	compilation terminated.
	make[3]: *** [Makefile:18: libs] Error 1
	make[2]: *** [Makefile:46: ps7_cortexa9_0/libsrc/axi_spi_interface_v1_0/src/make.libs] Error 2
	make[1]: *** [Makefile:18: all] Error 2
	
The issue is regarding the GNU archiver not accepting a wildcard within a workspace Makefile. In particular, the Makefile generated from the custom IP fails.
The workaround is to change the affected make file:

Original:
INCLUDEFILES=*.h
LIBSOURCES=*.c
OUTS = *.o

Work-around:
INCLUDEFILES=$(wildcard *.h)
LIBSOURCES=$(wildcard *.c)
OUTS = $(wildcard *.o)

{fix source : https://support.xilinx.com/s/article/000034569?language=en_US}

---------------------------------------------------------------------------------------------------------------------

* While building sytem/application on a platform, a build error regarding the absence of "qemu_args" file may be encountered. In case
  this happens, go to the platform directory (as indicated by the error message) and find the qemu folder and place it within the
  right path.

	EX: qemu file was within the standalone folder in platform project while the application project was looking for it
	    two directories above. The solution was to move the qemu folder two directories above.

---------------------------------------------------------------------------------------------------------------------

* Application dubugging can crash due to MMU erro. Look at the following link for possible explanation for cause.
  The solution is to boot in JTAG mode, or to jump into uboot and not linux because this is caused by the ARM MMU running.
  Link: https://support.xilinx.com/s/question/0D52E00006hpTQeSAM/sdk-debugs-causes-mmu-section-translation-fault?language=en_US
  
---------------------------------------------------------------------------------------------------------------------
  
* Do not reset peripherals by pulling FCLK0_RSTN low by calling 'init()' function from 'main.c'.
  This will mess with the AXI peripherals and cause the PS to freeze if there are pending axi transactions in queue.