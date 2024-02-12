`timescale 1ns / 1ps

module fs_bh (
    output reg d,bout,
    input a, b, c
);
    always @(*)
    begin
        d = a ^ b ^ c;
        bout = (~a & b) | (b & c) | (~a & c);
    end
endmodule
