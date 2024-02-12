`timescale 1ns / 1ps

module fa_tb;
    wire sum,carry;
    reg a,b,Cout;
fa dut(sum,carry,a,b,Cout);
    initial
    begin
        a = 0;
        b = 0;
        Cout = 0;
    end
    always #100 a= ~a;
    always #200 b =~b;
    always #400 Cout = ~Cout;
endmodule
