`timescale 1ns / 1ps

module N_bit_square_number(num, result);
    parameter n = 4;
    input [n-1:0] num;
    output reg [2*n-1:0] result;
    reg [2*n-1:0] r;
    
    always @(*) begin
        r = num * num;
        result = r;
    end
endmodule
