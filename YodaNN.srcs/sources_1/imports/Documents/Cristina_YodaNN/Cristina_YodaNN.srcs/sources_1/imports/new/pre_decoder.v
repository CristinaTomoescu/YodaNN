`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.01.2021 03:04:28
// Design Name: 
// Module Name: pre_decoder
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


module pre_decoder(
        input [5:0] wen,
        input [9:0]waddr,
        input[5:0]ren,
        input [9:0]raddr,
        input [11:0]inpixel,
        output reg [5:0]wren0,
        output reg [5:0]wren1,
        output reg [5:0]wren2,
        output reg [5:0]wren3,
        output reg [5:0]wren4,
        output reg [5:0]wren5,
        output reg [5:0]wren6,
        output reg [5:0]wren7,
        output reg [6:0]wraddr,
        output reg [11:0]outpixel);
        
        always @*
        begin
            if (wen != 6'bxxxxxx)
            begin
                if (waddr[9:7] == 3'b001) begin
                    wren0 = wen; wraddr = waddr;
                end else if (waddr[9:7] == 3'b010) begin
                    wren1 = wen; wraddr = waddr;
                end else if (waddr[9:7] == 3'b011) begin
                    wren2 = wen; wraddr = waddr;
                end  else if (waddr[9:7] == 3'b100) begin
                    wren3 = wen; wraddr = waddr;
                end else if (waddr[9:7] == 3'b101) begin
                    wren5 = wen; wraddr = waddr;
                end else if (waddr[9:7] == 3'b110) begin
                    wren6 = wen; wraddr = waddr;
                end else if (waddr[9:7] == 3'b111) begin
                    wren7 = wen; wraddr = waddr;
                end
                assign outpixel = inpixel;

            end else if (ren != 6'bxxxxxx)
            begin
                if (raddr[9:7] == 3'b001) begin
                    wren0 = ren; wraddr = raddr;
                end else if (raddr[9:7] == 3'b010) begin
                    wren1 = ren; wraddr = raddr;
                end else if (raddr[9:7] == 3'b011) begin
                    wren2 = ren; wraddr = raddr;
                end  else if (raddr[9:7] == 3'b100) begin
                    wren3 = ren; wraddr = raddr;
                end else if (raddr[9:7] == 3'b101) begin
                    wren5 = ren; wraddr = raddr;
                end else if (raddr[9:7] == 3'b110) begin
                    wren6 = ren; wraddr = raddr;
                end else if (raddr[9:7] == 3'b111) begin
                    wren7 = ren; wraddr = raddr;
                end
                assign outpixel = inpixel;

            end
            
        end
endmodule
