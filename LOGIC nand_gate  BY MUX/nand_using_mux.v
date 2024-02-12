`timescale 1ns / 1ps

module mux_2x1(
    input a, b, sel, 
    output y);
    assign y = (a & ~sel) | (b & sel);
endmodule
                    
module nand_using_mux(
    input a, b, 
    output y);
    mux_2x1 m1(1'b1,~b,a,y);
endmodule

