`timescale 1ns / 1ps

module mux_2x1(
    input a, b, sel, 
    output y);
    assign y = (a & ~sel) | (b & sel);
endmodule
                    
module or_using_mux(
    input a, b, 
    output y);
    mux_2x1 m1(b,1'b1,a,y);
endmodule





