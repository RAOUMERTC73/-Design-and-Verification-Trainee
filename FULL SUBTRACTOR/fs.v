`timescale 1ns / 1ps

module fs(
output d,bout,
input a,b,c
    );
    assign d = a ^ b ^ c;
    assign bout = (~a & b) | (b & c) | (~a & c);
endmodule
