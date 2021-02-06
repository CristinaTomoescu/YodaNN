
module rmemsplitter(input ren, input[63:0]addr, output reg [5:0]addrout);
    
    always @*
    begin
        if (ren)
        begin
            addrout[5:0] = addr[5:0];
        end else begin
            addrout[5:0] = 6'bxxxxxx;
        end
    end
endmodule
