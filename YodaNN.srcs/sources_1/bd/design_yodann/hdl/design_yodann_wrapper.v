//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
//Date        : Thu Jan 28 11:10:46 2021
//Host        : DESKTOP-BP8NIBP running 64-bit major release  (build 9200)
//Command     : generate_target design_yodann_wrapper.bd
//Design      : design_yodann_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_yodann_wrapper
   (CLOCK_0,
    RESET_0);
  input CLOCK_0;
  input RESET_0;

  wire CLOCK_0;
  wire RESET_0;

  design_yodann design_yodann_i
       (.CLOCK_0(CLOCK_0),
        .RESET_0(RESET_0));
endmodule
