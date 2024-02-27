`timescale 1ns / 1ps

module tb_square_number;
    parameter n = 4;
    reg [n-1:0] num;
    wire [2*n-1:0] result;
    N_bit_square_number dut(num, result);
    initial begin 
        $monitor("%d^2 = %0d ",num, result);
        #1000 $finish;
    end
    always begin
    	num=$random;
        #100;
	end
endmodule
