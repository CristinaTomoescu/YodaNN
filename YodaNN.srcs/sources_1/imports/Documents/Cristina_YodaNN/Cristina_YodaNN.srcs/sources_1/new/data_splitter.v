`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.01.2021 06:57:38
// Design Name: 
// Module Name: data_splitter
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


module data_splitter(
    d_in, d_out
    );
    input [63:0] d_in;
    output [11:0] d_out;
    
    assign d_out = d_in[11:0];
endmodule
