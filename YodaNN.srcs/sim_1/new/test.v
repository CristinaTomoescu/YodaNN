`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.01.2021 00:38:57
// Design Name: 
// Module Name: test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module test();
    reg RESET_0;
    reg CLOCK_0;
    
 /* Setup the clock */
  initial begin
    CLOCK_0 = 1'b0;
    RESET_0 = 1'b1;
    #30 $finish;
  end
  design_yodann_wrapper top(CLOCK_0, RESET_0);
  /* Toggle the clock */
  always begin
    #1 CLOCK_0 = ~CLOCK_0; RESET_0 = 1'b0;
  end
endmodule
