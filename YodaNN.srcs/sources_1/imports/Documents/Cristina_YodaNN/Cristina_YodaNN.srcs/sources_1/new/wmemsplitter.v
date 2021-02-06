`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.01.2021 18:12:04
// Design Name: 
// Module Name: wmemsplitter
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


module wmemsplitter(input wen, input[63:0]addr, output reg [5:0]addrout);
    
    always @*
    begin
        if (wen)
        begin
            addrout[5:0] = addr[5:0];
        end else begin
            addrout[5:0] = 6'bxxxxxx;
        end
    end
endmodule
