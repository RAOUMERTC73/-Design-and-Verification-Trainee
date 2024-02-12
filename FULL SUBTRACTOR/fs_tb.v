`timescale 1ns / 1ps


module fs_tb;
    wire d,bout;
    reg a,b,c;
    fs dut(d,bout,a,b,c);
    initial
    begin
        a = 0;
        b = 0;
        c = 0;
    end
    always #100 a= ~a;
    always #200 b =~b;
    always #400 c = ~c;
endmodule
