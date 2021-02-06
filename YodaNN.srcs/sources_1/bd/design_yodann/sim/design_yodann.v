//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
//Date        : Thu Jan 28 11:10:46 2021
//Host        : DESKTOP-BP8NIBP running 64-bit major release  (build 9200)
//Command     : generate_target design_yodann.bd
//Design      : design_yodann
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_yodann,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_yodann,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=65,numReposBlks=65,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=65,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_yodann.hwdef" *) 
module design_yodann
   (CLOCK_0,
    RESET_0);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLOCK_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLOCK_0, ASSOCIATED_RESET RESET_0, CLK_DOMAIN design_yodann_CLOCK_0, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000" *) input CLOCK_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET_0 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET_0, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input RESET_0;

  wire [63:0]ARM_CPU_0_PC;
  wire ARM_CPU_0_control_memread_out;
  wire ARM_CPU_0_control_memwrite_out;
  wire [63:0]ARM_CPU_0_mem_address_out;
  wire [63:0]ARM_CPU_0_mem_data_out;
  wire CLOCK_0_1;
  wire [11:0]CONV_0_outpixel;
  wire [63:0]Data_Memory_0_outputData;
  wire [31:0]IC_0_instruction_out;
  wire RESET_0_1;
  wire [11:0]SCM1_0_outpixel;
  wire [11:0]SCM1_1_outpixel;
  wire [11:0]SCM1_2_outpixel;
  wire [11:0]SCM1_3_outpixel;
  wire [11:0]SCM1_4_outpixel;
  wire [11:0]SCM1_5_outpixel;
  wire [11:0]SCM1_6_outpixel;
  wire [11:0]SCM1_7_outpixel;
  wire [11:0]SCM2_0_outpixel;
  wire [11:0]SCM2_1_outpixel;
  wire [11:0]SCM2_2_outpixel;
  wire [11:0]SCM2_3_outpixel;
  wire [11:0]SCM2_4_outpixel;
  wire [11:0]SCM2_5_outpixel;
  wire [11:0]SCM2_6_outpixel;
  wire [11:0]SCM2_7_outpixel;
  wire [11:0]SCM3_0_outpixel;
  wire [11:0]SCM3_1_outpixel;
  wire [11:0]SCM3_2_outpixel;
  wire [11:0]SCM3_3_outpixel;
  wire [11:0]SCM3_4_outpixel;
  wire [11:0]SCM3_5_outpixel;
  wire [11:0]SCM3_6_outpixel;
  wire [11:0]SCM3_7_outpixel;
  wire [11:0]SCM4_0_outpixel;
  wire [11:0]SCM4_1_outpixel;
  wire [11:0]SCM4_2_outpixel;
  wire [11:0]SCM4_3_outpixel;
  wire [11:0]SCM4_4_outpixel;
  wire [11:0]SCM4_5_outpixel;
  wire [11:0]SCM4_6_outpixel;
  wire [11:0]SCM4_7_outpixel;
  wire [11:0]SCM5_0_outpixel;
  wire [11:0]SCM5_1_outpixel;
  wire [11:0]SCM5_2_outpixel;
  wire [11:0]SCM5_3_outpixel;
  wire [11:0]SCM5_4_outpixel;
  wire [11:0]SCM5_5_outpixel;
  wire [11:0]SCM5_6_outpixel;
  wire [11:0]SCM5_7_outpixel;
  wire [11:0]SCM6_0_outpixel;
  wire [11:0]SCM6_1_outpixel;
  wire [11:0]SCM6_2_outpixel;
  wire [11:0]SCM6_3_outpixel;
  wire [11:0]SCM6_4_outpixel;
  wire [11:0]SCM6_5_outpixel;
  wire [11:0]SCM6_6_outpixel;
  wire [11:0]SCM6_7_outpixel;
  wire [11:0]adder_0_outpixel;
  wire [11:0]adder_1_outpixel;
  wire [11:0]adder_2_outpixel;
  wire [11:0]adder_3_outpixel;
  wire [11:0]adder_4_outpixel;
  wire [11:0]adder_5_outpixel;
  wire [9:0]address_splitter_0_a_out;
  wire [63:0]check_0_out;
  wire [11:0]data_splitter_0_d_out;
  wire [63:0]pixtodata_0_data;
  wire [11:0]pre_decoder_0_outpixel;
  wire [6:0]pre_decoder_0_wraddr;
  wire [5:0]pre_decoder_0_wren0;
  wire [5:0]pre_decoder_0_wren1;
  wire [5:0]pre_decoder_0_wren2;
  wire [5:0]pre_decoder_0_wren3;
  wire [5:0]pre_decoder_0_wren4;
  wire [5:0]pre_decoder_0_wren5;
  wire [5:0]pre_decoder_0_wren6;
  wire [5:0]pre_decoder_0_wren7;
  wire [5:0]rmemsplitter_0_addrout;
  wire [5:0]wmemsplitter_0_addrout;

  assign CLOCK_0_1 = CLOCK_0;
  assign RESET_0_1 = RESET_0;
  design_yodann_ARM_CPU_0_0 ARM_CPU_0
       (.CLOCK(CLOCK_0_1),
        .IC(IC_0_instruction_out),
        .PC(ARM_CPU_0_PC),
        .RESET(RESET_0_1),
        .control_memread_out(ARM_CPU_0_control_memread_out),
        .control_memwrite_out(ARM_CPU_0_control_memwrite_out),
        .mem_address_out(ARM_CPU_0_mem_address_out),
        .mem_data_in(Data_Memory_0_outputData),
        .mem_data_out(ARM_CPU_0_mem_data_out));
  design_yodann_CONV_0_0 CONV_0
       (.outpixel(CONV_0_outpixel),
        .p0(adder_0_outpixel),
        .p1(adder_1_outpixel),
        .p2(adder_2_outpixel),
        .p3(adder_3_outpixel),
        .p4(adder_4_outpixel),
        .p5(adder_5_outpixel));
  design_yodann_Data_Memory_0_0 Data_Memory_0
       (.CONTROL_MemRead(ARM_CPU_0_control_memread_out),
        .CONTROL_MemWrite(ARM_CPU_0_control_memwrite_out),
        .inputAddress(ARM_CPU_0_mem_address_out),
        .inputData(check_0_out),
        .outputData(Data_Memory_0_outputData));
  design_yodann_IC_0_0 IC_0
       (.PC_in(ARM_CPU_0_PC),
        .instruction_out(IC_0_instruction_out));
  design_yodann_SCM1_0_0 SCM1_0
       (.inpixel(pre_decoder_0_outpixel),
        .outpixel(SCM1_0_outpixel),
        .wraddr(pre_decoder_0_wraddr),
        .wren(pre_decoder_0_wren0));
  design_yodann_SCM1_1_0 SCM1_1
       (.inpixel(pre_decoder_0_outpixel),
        .outpixel(SCM1_1_outpixel),
        .wraddr(pre_decoder_0_wraddr),
        .wren(pre_decoder_0_wren1));
  design_yodann_SCM1_2_0 SCM1_2
       (.inpixel(pre_decoder_0_outpixel),
        .outpixel(SCM1_2_outpixel),
        .wraddr(pre_decoder_0_wraddr),
        .wren(pre_decoder_0_wren2));
  design_yodann_SCM1_3_0 SCM1_3
       (.inpixel(pre_decoder_0_outpixel),
        .outpixel(SCM1_3_outpixel),
        .wraddr(pre_decoder_0_wraddr),
        .wren(pre_decoder_0_wren3));
  design_yodann_SCM1_4_0 SCM1_4
       (.inpixel(pre_decoder_0_outpixel),
        .outpixel(SCM1_4_outpixel),
        .wraddr(pre_decoder_0_wraddr),
        .wren(pre_decoder_0_wren4));
  design_yodann_SCM1_5_0 SCM1_5
       (.inpixel(pre_decoder_0_outpixel),
        .outpixel(SCM1_5_outpixel),
        .wraddr(pre_decoder_0_wraddr),
        .wren(pre_decoder_0_wren5));
  design_yodann_SCM1_6_0 SCM1_6
       (.inpixel(pre_decoder_0_outpixel),
        .outpixel(SCM1_6_outpixel),
        .wraddr(pre_decoder_0_wraddr),
        .wren(pre_decoder_0_wren6));
  design_yodann_SCM1_7_0 SCM1_7
       (.inpixel(pre_decoder_0_outpixel),
        .outpixel(SCM1_7_outpixel),
        .wraddr(pre_decoder_0_wraddr),
        .wren(pre_decoder_0_wren7));
  design_yodann_SCM2_0_0 SCM2_0
       (.inpixel(pre_decoder_0_outpixel),
        .outpixel(SCM2_0_outpixel),
        .wraddr(pre_decoder_0_wraddr),
        .wren(pre_decoder_0_wren0));
  design_yodann_SCM2_1_0 SCM2_1
       (.inpixel(pre_decoder_0_outpixel),
        .outpixel(SCM2_1_outpixel),
        .wraddr(pre_decoder_0_wraddr),
        .wren(pre_decoder_0_wren1));
  design_yodann_SCM2_2_0 SCM2_2
       (.inpixel(pre_decoder_0_outpixel),
        .outpixel(SCM2_2_outpixel),
        .wraddr(pre_decoder_0_wraddr),
        .wren(pre_decoder_0_wren2));
  design_yodann_SCM2_3_0 SCM2_3
       (.inpixel(pre_decoder_0_outpixel),
        .outpixel(SCM2_3_outpixel),
        .wraddr(pre_decoder_0_wraddr),
        .wren(pre_decoder_0_wren3));
  design_yodann_SCM2_4_0 SCM2_4
       (.inpixel(pre_decoder_0_outpixel),
        .outpixel(SCM2_4_outpixel),
        .wraddr(pre_decoder_0_wraddr),
        .wren(pre_decoder_0_wren4));
  design_yodann_SCM2_5_0 SCM2_5
       (.inpixel(pre_decoder_0_outpixel),
        .outpixel(SCM2_5_outpixel),
        .wraddr(pre_decoder_0_wraddr),
        .wren(pre_decoder_0_wren5));
  design_yodann_SCM2_6_0 SCM2_6
       (.inpixel(pre_decoder_0_outpixel),
        .outpixel(SCM2_6_outpixel),
        .wraddr(pre_decoder_0_wraddr),
        .wren(pre_decoder_0_wren6));
  design_yodann_SCM2_7_0 SCM2_7
       (.inpixel(pre_decoder_0_outpixel),
        .outpixel(SCM2_7_outpixel),
        .wraddr(pre_decoder_0_wraddr),
        .wren(pre_decoder_0_wren7));
  design_yodann_SCM3_0_0 SCM3_0
       (.inpixel(pre_decoder_0_outpixel),
        .outpixel(SCM3_0_outpixel),
        .wraddr(pre_decoder_0_wraddr),
        .wren(pre_decoder_0_wren0));
  design_yodann_SCM3_1_0 SCM3_1
       (.inpixel(pre_decoder_0_outpixel),
        .outpixel(SCM3_1_outpixel),
        .wraddr(pre_decoder_0_wraddr),
        .wren(pre_decoder_0_wren1));
  design_yodann_SCM3_2_0 SCM3_2
       (.inpixel(pre_decoder_0_outpixel),
        .outpixel(SCM3_2_outpixel),
        .wraddr(pre_decoder_0_wraddr),
        .wren(pre_decoder_0_wren2));
  design_yodann_SCM3_3_0 SCM3_3
       (.inpixel(pre_decoder_0_outpixel),
        .outpixel(SCM3_3_outpixel),
        .wraddr(pre_decoder_0_wraddr),
        .wren(pre_decoder_0_wren3));
  design_yodann_SCM3_4_0 SCM3_4
       (.inpixel(pre_decoder_0_outpixel),
        .outpixel(SCM3_4_outpixel),
        .wraddr(pre_decoder_0_wraddr),
        .wren(pre_decoder_0_wren4));
  design_yodann_SCM3_5_0 SCM3_5
       (.inpixel(pre_decoder_0_outpixel),
        .outpixel(SCM3_5_outpixel),
        .wraddr(pre_decoder_0_wraddr),
        .wren(pre_decoder_0_wren5));
  design_yodann_SCM3_6_0 SCM3_6
       (.inpixel(pre_decoder_0_outpixel),
        .outpixel(SCM3_6_outpixel),
        .wraddr(pre_decoder_0_wraddr),
        .wren(pre_decoder_0_wren6));
  design_yodann_SCM3_7_0 SCM3_7
       (.inpixel(pre_decoder_0_outpixel),
        .outpixel(SCM3_7_outpixel),
        .wraddr(pre_decoder_0_wraddr),
        .wren(pre_decoder_0_wren7));
  design_yodann_SCM4_0_0 SCM4_0
       (.inpixel(pre_decoder_0_outpixel),
        .outpixel(SCM4_0_outpixel),
        .wraddr(pre_decoder_0_wraddr),
        .wren(pre_decoder_0_wren0));
  design_yodann_SCM4_1_0 SCM4_1
       (.inpixel(pre_decoder_0_outpixel),
        .outpixel(SCM4_1_outpixel),
        .wraddr(pre_decoder_0_wraddr),
        .wren(pre_decoder_0_wren1));
  design_yodann_SCM4_2_0 SCM4_2
       (.inpixel(pre_decoder_0_outpixel),
        .outpixel(SCM4_2_outpixel),
        .wraddr(pre_decoder_0_wraddr),
        .wren(pre_decoder_0_wren2));
  design_yodann_SCM4_3_0 SCM4_3
       (.inpixel(pre_decoder_0_outpixel),
        .outpixel(SCM4_3_outpixel),
        .wraddr(pre_decoder_0_wraddr),
        .wren(pre_decoder_0_wren3));
  design_yodann_SCM4_4_0 SCM4_4
       (.inpixel(pre_decoder_0_outpixel),
        .outpixel(SCM4_4_outpixel),
        .wraddr(pre_decoder_0_wraddr),
        .wren(pre_decoder_0_wren4));
  design_yodann_SCM4_5_0 SCM4_5
       (.inpixel(pre_decoder_0_outpixel),
        .outpixel(SCM4_5_outpixel),
        .wraddr(pre_decoder_0_wraddr),
        .wren(pre_decoder_0_wren5));
  design_yodann_SCM4_6_0 SCM4_6
       (.inpixel(pre_decoder_0_outpixel),
        .outpixel(SCM4_6_outpixel),
        .wraddr(pre_decoder_0_wraddr),
        .wren(pre_decoder_0_wren6));
  design_yodann_SCM4_7_0 SCM4_7
       (.inpixel(pre_decoder_0_outpixel),
        .outpixel(SCM4_7_outpixel),
        .wraddr(pre_decoder_0_wraddr),
        .wren(pre_decoder_0_wren7));
  design_yodann_SCM5_0_0 SCM5_0
       (.inpixel(pre_decoder_0_outpixel),
        .outpixel(SCM5_0_outpixel),
        .wraddr(pre_decoder_0_wraddr),
        .wren(pre_decoder_0_wren0));
  design_yodann_SCM5_1_0 SCM5_1
       (.inpixel(pre_decoder_0_outpixel),
        .outpixel(SCM5_1_outpixel),
        .wraddr(pre_decoder_0_wraddr),
        .wren(pre_decoder_0_wren1));
  design_yodann_SCM5_2_0 SCM5_2
       (.inpixel(pre_decoder_0_outpixel),
        .outpixel(SCM5_2_outpixel),
        .wraddr(pre_decoder_0_wraddr),
        .wren(pre_decoder_0_wren2));
  design_yodann_SCM5_3_0 SCM5_3
       (.inpixel(pre_decoder_0_outpixel),
        .outpixel(SCM5_3_outpixel),
        .wraddr(pre_decoder_0_wraddr),
        .wren(pre_decoder_0_wren3));
  design_yodann_SCM5_4_0 SCM5_4
       (.inpixel(pre_decoder_0_outpixel),
        .outpixel(SCM5_4_outpixel),
        .wraddr(pre_decoder_0_wraddr),
        .wren(pre_decoder_0_wren4));
  design_yodann_SCM5_5_0 SCM5_5
       (.inpixel(pre_decoder_0_outpixel),
        .outpixel(SCM5_5_outpixel),
        .wraddr(pre_decoder_0_wraddr),
        .wren(pre_decoder_0_wren5));
  design_yodann_SCM5_6_0 SCM5_6
       (.inpixel(pre_decoder_0_outpixel),
        .outpixel(SCM5_6_outpixel),
        .wraddr(pre_decoder_0_wraddr),
        .wren(pre_decoder_0_wren6));
  design_yodann_SCM5_7_0 SCM5_7
       (.inpixel(pre_decoder_0_outpixel),
        .outpixel(SCM5_7_outpixel),
        .wraddr(pre_decoder_0_wraddr),
        .wren(pre_decoder_0_wren7));
  design_yodann_SCM6_0_0 SCM6_0
       (.inpixel(pre_decoder_0_outpixel),
        .outpixel(SCM6_0_outpixel),
        .wraddr(pre_decoder_0_wraddr),
        .wren(pre_decoder_0_wren0));
  design_yodann_SCM6_1_0 SCM6_1
       (.inpixel(pre_decoder_0_outpixel),
        .outpixel(SCM6_1_outpixel),
        .wraddr(pre_decoder_0_wraddr),
        .wren(pre_decoder_0_wren1));
  design_yodann_SCM6_2_0 SCM6_2
       (.inpixel(pre_decoder_0_outpixel),
        .outpixel(SCM6_2_outpixel),
        .wraddr(pre_decoder_0_wraddr),
        .wren(pre_decoder_0_wren2));
  design_yodann_SCM6_3_0 SCM6_3
       (.inpixel(pre_decoder_0_outpixel),
        .outpixel(SCM6_3_outpixel),
        .wraddr(pre_decoder_0_wraddr),
        .wren(pre_decoder_0_wren3));
  design_yodann_SCM6_4_0 SCM6_4
       (.inpixel(pre_decoder_0_outpixel),
        .outpixel(SCM6_4_outpixel),
        .wraddr(pre_decoder_0_wraddr),
        .wren(pre_decoder_0_wren4));
  design_yodann_SCM6_5_0 SCM6_5
       (.inpixel(pre_decoder_0_outpixel),
        .outpixel(SCM6_5_outpixel),
        .wraddr(pre_decoder_0_wraddr),
        .wren(pre_decoder_0_wren5));
  design_yodann_SCM6_6_0 SCM6_6
       (.inpixel(pre_decoder_0_outpixel),
        .outpixel(SCM6_6_outpixel),
        .wraddr(pre_decoder_0_wraddr),
        .wren(pre_decoder_0_wren6));
  design_yodann_SCM6_7_0 SCM6_7
       (.inpixel(pre_decoder_0_outpixel),
        .outpixel(SCM6_7_outpixel),
        .wraddr(pre_decoder_0_wraddr),
        .wren(pre_decoder_0_wren7));
  design_yodann_adder_0_0 adder_0
       (.outpixel(adder_0_outpixel),
        .p0(SCM1_0_outpixel),
        .p1(SCM1_1_outpixel),
        .p2(SCM1_2_outpixel),
        .p3(SCM1_3_outpixel),
        .p4(SCM1_4_outpixel),
        .p5(SCM1_5_outpixel),
        .p6(SCM1_6_outpixel),
        .p7(SCM1_7_outpixel));
  design_yodann_adder_1_0 adder_1
       (.outpixel(adder_1_outpixel),
        .p0(SCM2_0_outpixel),
        .p1(SCM2_1_outpixel),
        .p2(SCM2_2_outpixel),
        .p3(SCM2_3_outpixel),
        .p4(SCM2_4_outpixel),
        .p5(SCM2_5_outpixel),
        .p6(SCM2_6_outpixel),
        .p7(SCM2_7_outpixel));
  design_yodann_adder_2_0 adder_2
       (.outpixel(adder_2_outpixel),
        .p0(SCM3_0_outpixel),
        .p1(SCM3_1_outpixel),
        .p2(SCM3_2_outpixel),
        .p3(SCM3_3_outpixel),
        .p4(SCM3_4_outpixel),
        .p5(SCM3_5_outpixel),
        .p6(SCM3_6_outpixel),
        .p7(SCM3_7_outpixel));
  design_yodann_adder_3_0 adder_3
       (.outpixel(adder_3_outpixel),
        .p0(SCM4_0_outpixel),
        .p1(SCM4_1_outpixel),
        .p2(SCM4_2_outpixel),
        .p3(SCM4_3_outpixel),
        .p4(SCM4_4_outpixel),
        .p5(SCM4_5_outpixel),
        .p6(SCM4_6_outpixel),
        .p7(SCM4_7_outpixel));
  design_yodann_adder_4_0 adder_4
       (.outpixel(adder_4_outpixel),
        .p0(SCM5_0_outpixel),
        .p1(SCM5_1_outpixel),
        .p2(SCM5_2_outpixel),
        .p3(SCM5_3_outpixel),
        .p4(SCM5_4_outpixel),
        .p5(SCM5_5_outpixel),
        .p6(SCM5_6_outpixel),
        .p7(SCM5_7_outpixel));
  design_yodann_adder_5_0 adder_5
       (.outpixel(adder_5_outpixel),
        .p0(SCM6_0_outpixel),
        .p1(SCM6_1_outpixel),
        .p2(SCM6_2_outpixel),
        .p3(SCM6_3_outpixel),
        .p4(SCM6_4_outpixel),
        .p5(SCM6_5_outpixel),
        .p6(SCM6_6_outpixel),
        .p7(SCM6_7_outpixel));
  design_yodann_address_splitter_0_0 address_splitter_0
       (.a_in(ARM_CPU_0_mem_address_out),
        .a_out(address_splitter_0_a_out));
  design_yodann_check_0_0 check_0
       (.data(ARM_CPU_0_mem_data_out),
        .inpixel(pixtodata_0_data),
        .outdata(check_0_out));
  design_yodann_data_splitter_0_0 data_splitter_0
       (.d_in(ARM_CPU_0_mem_data_out),
        .d_out(data_splitter_0_d_out));
  design_yodann_pixtodata_0_0 pixtodata_0
       (.data(pixtodata_0_data),
        .inpixel(CONV_0_outpixel));
  design_yodann_pre_decoder_0_0 pre_decoder_0
       (.inpixel(data_splitter_0_d_out),
        .outpixel(pre_decoder_0_outpixel),
        .raddr(address_splitter_0_a_out),
        .ren(rmemsplitter_0_addrout),
        .waddr(address_splitter_0_a_out),
        .wen(wmemsplitter_0_addrout),
        .wraddr(pre_decoder_0_wraddr),
        .wren0(pre_decoder_0_wren0),
        .wren1(pre_decoder_0_wren1),
        .wren2(pre_decoder_0_wren2),
        .wren3(pre_decoder_0_wren3),
        .wren4(pre_decoder_0_wren4),
        .wren5(pre_decoder_0_wren5),
        .wren6(pre_decoder_0_wren6),
        .wren7(pre_decoder_0_wren7));
  design_yodann_rmemsplitter_0_0 rmemsplitter_0
       (.addr(ARM_CPU_0_mem_address_out),
        .addrout(rmemsplitter_0_addrout),
        .ren(ARM_CPU_0_control_memread_out));
  design_yodann_wmemsplitter_0_0 wmemsplitter_0
       (.addr(ARM_CPU_0_mem_address_out),
        .addrout(wmemsplitter_0_addrout),
        .wen(ARM_CPU_0_control_memwrite_out));
endmodule
