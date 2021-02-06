`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.01.2021 06:22:35
// Design Name: 
// Module Name: CONV
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


module CONV(input [11:0]p0, input [11:0]p1, input [11:0]p2, input [11:0]p3, input [11:0]p4, input [11:0]p5, output reg [11:0]outpixel);
    
    always @*
    begin
        assign outpixel = p0 + p1 + p2 + p3 + p4 + p5;
    end
endmodule