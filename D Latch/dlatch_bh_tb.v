`timescale 1ns / 1ps
module dlatch_bh_tb;
    wire q;
    reg d;
    reg clk;
    dlatch_bh dut(.clk(clk),.d(d),.q(q));
    initial
    begin
        clk = 0;
        d = 0; #5;
        d = 1; #5;
        d = 0; #5;
        d = 1; #4;
        d = 0; #4;
        d = 1; #5;
        d = 0; #5;
        d = 0; #5;
        d = 1; #5;
        #60 $finish;
    end
    always #5 clk = ~clk;
endmodule
