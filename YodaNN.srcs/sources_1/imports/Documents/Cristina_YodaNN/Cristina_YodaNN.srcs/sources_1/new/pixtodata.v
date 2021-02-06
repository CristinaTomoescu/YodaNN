
module pixtodata(input[11:0]inpixel, output reg [63:0]data);
    
    always @*
    begin
       data[63:12] = 52'b0000000000000000000000000000000000000000000000000000;
       data[11:0] = inpixel[11:0];
    end
endmodule
