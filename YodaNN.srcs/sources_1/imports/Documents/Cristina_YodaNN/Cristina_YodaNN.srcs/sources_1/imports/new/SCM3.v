`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.01.2021 03:43:04
// Design Name: 
// Module Name: SCM3
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


module SCM3(input [5:0]wren, input[6:0]wraddr, input [11:0]inpixel, output reg [11:0] outpixel);
    
    always @*
    begin
        //if (wren[5:0] == 6'b000011)
            outpixel = inpixel;
    end
    
endmodule
