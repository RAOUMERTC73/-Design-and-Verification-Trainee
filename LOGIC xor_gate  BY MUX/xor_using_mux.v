module mux_2x1(
    input a, b, sel, 
    output y);
    assign y = (a & ~sel) | (b & sel);
endmodule

module xor_using_mux(
    input a, b, 
    output y);
    mux_2x1 m1(a,~a,b,y);
endmodule
