`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.01.2021 03:04:55
// Design Name: 
// Module Name: adder
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


module adder(input [11:0]p0, input [11:0]p1, input [11:0]p2, input [11:0]p3, input [11:0]p4, input [11:0]p5, input [11:0]p6, input [11:0]p7, output reg [11:0]outpixel);
    
    always @*
    begin
        assign outpixel = p0 + p1 + p2 + p3 + p4 + p5 + p6 + p7;
    end
endmodule
