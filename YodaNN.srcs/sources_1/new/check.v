`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.01.2021 01:07:31
// Design Name: 
// Module Name: check
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


module check(input [63:0]inpixel, input[63:0]data, output reg[63:0]outdata);
    always @*
    begin
        if (inpixel[63:0] == 64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx)
        begin
            outdata[63:0] = inpixel[63:0];
        end else begin
            outdata[63:0] = data[63:0];
        end
    end
endmodule
