vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 -incr \
"../../../bd/design_yodann/ip/design_yodann_ARM_CPU_0_0/sim/design_yodann_ARM_CPU_0_0.v" \
"../../../bd/design_yodann/ip/design_yodann_IC_0_0/sim/design_yodann_IC_0_0.v" \
"../../../bd/design_yodann/ip/design_yodann_address_splitter_0_0/sim/design_yodann_address_splitter_0_0.v" \
"../../../bd/design_yodann/ip/design_yodann_data_splitter_0_0/sim/design_yodann_data_splitter_0_0.v" \
"../../../bd/design_yodann/ip/design_yodann_rmemsplitter_0_0/sim/design_yodann_rmemsplitter_0_0.v" \
"../../../bd/design_yodann/ip/design_yodann_wmemsplitter_0_0/sim/design_yodann_wmemsplitter_0_0.v" \
"../../../bd/design_yodann/ip/design_yodann_pre_decoder_0_0/sim/design_yodann_pre_decoder_0_0.v" \
"../../../bd/design_yodann/ip/design_yodann_SCM1_0_0/sim/design_yodann_SCM1_0_0.v" \
"../../../bd/design_yodann/ip/design_yodann_SCM1_1_0/sim/design_yodann_SCM1_1_0.v" \
"../../../bd/design_yodann/ip/design_yodann_SCM1_2_0/sim/design_yodann_SCM1_2_0.v" \
"../../../bd/design_yodann/ip/design_yodann_SCM1_3_0/sim/design_yodann_SCM1_3_0.v" \
"../../../bd/design_yodann/ip/design_yodann_SCM1_4_0/sim/design_yodann_SCM1_4_0.v" \
"../../../bd/design_yodann/ip/design_yodann_SCM1_5_0/sim/design_yodann_SCM1_5_0.v" \
"../../../bd/design_yodann/ip/design_yodann_SCM1_6_0/sim/design_yodann_SCM1_6_0.v" \
"../../../bd/design_yodann/ip/design_yodann_SCM1_7_0/sim/design_yodann_SCM1_7_0.v" \
"../../../bd/design_yodann/ip/design_yodann_SCM2_0_0/sim/design_yodann_SCM2_0_0.v" \
"../../../bd/design_yodann/ip/design_yodann_SCM2_1_0/sim/design_yodann_SCM2_1_0.v" \
"../../../bd/design_yodann/ip/design_yodann_SCM2_2_0/sim/design_yodann_SCM2_2_0.v" \
"../../../bd/design_yodann/ip/design_yodann_SCM2_3_0/sim/design_yodann_SCM2_3_0.v" \
"../../../bd/design_yodann/ip/design_yodann_SCM2_4_0/sim/design_yodann_SCM2_4_0.v" \
"../../../bd/design_yodann/ip/design_yodann_SCM2_5_0/sim/design_yodann_SCM2_5_0.v" \
"../../../bd/design_yodann/ip/design_yodann_SCM2_6_0/sim/design_yodann_SCM2_6_0.v" \
"../../../bd/design_yodann/ip/design_yodann_SCM2_7_0/sim/design_yodann_SCM2_7_0.v" \
"../../../bd/design_yodann/ip/design_yodann_SCM3_0_0/sim/design_yodann_SCM3_0_0.v" \
"../../../bd/design_yodann/ip/design_yodann_SCM4_0_0/sim/design_yodann_SCM4_0_0.v" \
"../../../bd/design_yodann/ip/design_yodann_SCM5_0_0/sim/design_yodann_SCM5_0_0.v" \
"../../../bd/design_yodann/ip/design_yodann_SCM6_0_0/sim/design_yodann_SCM6_0_0.v" \
"../../../bd/design_yodann/ip/design_yodann_SCM3_1_0/sim/design_yodann_SCM3_1_0.v" \
"../../../bd/design_yodann/ip/design_yodann_SCM4_1_0/sim/design_yodann_SCM4_1_0.v" \
"../../../bd/design_yodann/ip/design_yodann_SCM5_1_0/sim/design_yodann_SCM5_1_0.v" \
"../../../bd/design_yodann/ip/design_yodann_SCM6_1_0/sim/design_yodann_SCM6_1_0.v" \
"../../../bd/design_yodann/ip/design_yodann_SCM3_2_0/sim/design_yodann_SCM3_2_0.v" \
"../../../bd/design_yodann/ip/design_yodann_SCM4_2_0/sim/design_yodann_SCM4_2_0.v" \
"../../../bd/design_yodann/ip/design_yodann_SCM5_2_0/sim/design_yodann_SCM5_2_0.v" \
"../../../bd/design_yodann/ip/design_yodann_SCM6_2_0/sim/design_yodann_SCM6_2_0.v" \
"../../../bd/design_yodann/ip/design_yodann_SCM3_3_0/sim/design_yodann_SCM3_3_0.v" \
"../../../bd/design_yodann/ip/design_yodann_SCM4_3_0/sim/design_yodann_SCM4_3_0.v" \
"../../../bd/design_yodann/ip/design_yodann_SCM5_3_0/sim/design_yodann_SCM5_3_0.v" \
"../../../bd/design_yodann/ip/design_yodann_SCM6_3_0/sim/design_yodann_SCM6_3_0.v" \
"../../../bd/design_yodann/ip/design_yodann_SCM3_4_0/sim/design_yodann_SCM3_4_0.v" \
"../../../bd/design_yodann/ip/design_yodann_SCM4_4_0/sim/design_yodann_SCM4_4_0.v" \
"../../../bd/design_yodann/ip/design_yodann_SCM5_4_0/sim/design_yodann_SCM5_4_0.v" \
"../../../bd/design_yodann/ip/design_yodann_SCM6_4_0/sim/design_yodann_SCM6_4_0.v" \
"../../../bd/design_yodann/ip/design_yodann_SCM3_5_0/sim/design_yodann_SCM3_5_0.v" \
"../../../bd/design_yodann/ip/design_yodann_SCM4_5_0/sim/design_yodann_SCM4_5_0.v" \
"../../../bd/design_yodann/ip/design_yodann_SCM5_5_0/sim/design_yodann_SCM5_5_0.v" \
"../../../bd/design_yodann/ip/design_yodann_SCM6_5_0/sim/design_yodann_SCM6_5_0.v" \
"../../../bd/design_yodann/ip/design_yodann_SCM3_6_0/sim/design_yodann_SCM3_6_0.v" \
"../../../bd/design_yodann/ip/design_yodann_SCM4_6_0/sim/design_yodann_SCM4_6_0.v" \
"../../../bd/design_yodann/ip/design_yodann_SCM5_6_0/sim/design_yodann_SCM5_6_0.v" \
"../../../bd/design_yodann/ip/design_yodann_SCM6_6_0/sim/design_yodann_SCM6_6_0.v" \
"../../../bd/design_yodann/ip/design_yodann_SCM3_7_0/sim/design_yodann_SCM3_7_0.v" \
"../../../bd/design_yodann/ip/design_yodann_SCM4_7_0/sim/design_yodann_SCM4_7_0.v" \
"../../../bd/design_yodann/ip/design_yodann_SCM5_7_0/sim/design_yodann_SCM5_7_0.v" \
"../../../bd/design_yodann/ip/design_yodann_SCM6_7_0/sim/design_yodann_SCM6_7_0.v" \
"../../../bd/design_yodann/ip/design_yodann_adder_0_0/sim/design_yodann_adder_0_0.v" \
"../../../bd/design_yodann/ip/design_yodann_adder_1_0/sim/design_yodann_adder_1_0.v" \
"../../../bd/design_yodann/ip/design_yodann_adder_2_0/sim/design_yodann_adder_2_0.v" \
"../../../bd/design_yodann/ip/design_yodann_adder_3_0/sim/design_yodann_adder_3_0.v" \
"../../../bd/design_yodann/ip/design_yodann_adder_4_0/sim/design_yodann_adder_4_0.v" \
"../../../bd/design_yodann/ip/design_yodann_adder_5_0/sim/design_yodann_adder_5_0.v" \
"../../../bd/design_yodann/ip/design_yodann_CONV_0_0/sim/design_yodann_CONV_0_0.v" \
"../../../bd/design_yodann/ip/design_yodann_pixtodata_0_0/sim/design_yodann_pixtodata_0_0.v" \
"../../../bd/design_yodann/sim/design_yodann.v" \
"../../../bd/design_yodann/ip/design_yodann_Data_Memory_0_0/sim/design_yodann_Data_Memory_0_0.v" \
"../../../bd/design_yodann/ip/design_yodann_check_0_0/sim/design_yodann_check_0_0.v" \


vlog -work xil_defaultlib \
"glbl.v"

