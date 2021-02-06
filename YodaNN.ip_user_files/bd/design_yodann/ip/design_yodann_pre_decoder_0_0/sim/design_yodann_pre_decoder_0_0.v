// (c) Copyright 1995-2021 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:pre_decoder:1.0
// IP Revision: 1

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_yodann_pre_decoder_0_0 (
  wen,
  waddr,
  ren,
  raddr,
  inpixel,
  wren0,
  wren1,
  wren2,
  wren3,
  wren4,
  wren5,
  wren6,
  wren7,
  wraddr,
  outpixel
);

input wire [5 : 0] wen;
input wire [9 : 0] waddr;
input wire [5 : 0] ren;
input wire [9 : 0] raddr;
input wire [11 : 0] inpixel;
output wire [5 : 0] wren0;
output wire [5 : 0] wren1;
output wire [5 : 0] wren2;
output wire [5 : 0] wren3;
output wire [5 : 0] wren4;
output wire [5 : 0] wren5;
output wire [5 : 0] wren6;
output wire [5 : 0] wren7;
output wire [6 : 0] wraddr;
output wire [11 : 0] outpixel;

  pre_decoder inst (
    .wen(wen),
    .waddr(waddr),
    .ren(ren),
    .raddr(raddr),
    .inpixel(inpixel),
    .wren0(wren0),
    .wren1(wren1),
    .wren2(wren2),
    .wren3(wren3),
    .wren4(wren4),
    .wren5(wren5),
    .wren6(wren6),
    .wren7(wren7),
    .wraddr(wraddr),
    .outpixel(outpixel)
  );
endmodule
