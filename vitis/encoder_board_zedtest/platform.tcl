# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Users\91988\Documents\Amruth\Files\EAS\hls_accel\Vitis_2\encoder_board_zedtest\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Users\91988\Documents\Amruth\Files\EAS\hls_accel\Vitis_2\encoder_board_zedtest\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {encoder_board_zedtest}\
-hw {C:\Users\91988\Documents\Amruth\Files\EAS\hls_accel\encoder_board_zedtest\encoder_system_wrapper.xsa}\
-proc {ps7_cortexa9_0} -os {standalone} -out {C:/Users/91988/Documents/Amruth/Files/EAS/hls_accel/Vitis_2}

platform write
platform generate -domains 
platform active {encoder_board_zedtest}
platform generate
platform generate
