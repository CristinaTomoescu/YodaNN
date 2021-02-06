`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.01.2021 07:02:13
// Design Name: 
// Module Name: address_splitter
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


module address_splitter(
    a_in, a_out
    );
    input [63:0] a_in;
    output [9:0] a_out;
    
    assign a_out = a_in[9:0];
endmodule
