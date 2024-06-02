`timescale 1ns / 1ps

module tb_digital_clk;
    reg clk,reset;
    wire [5:0] sec;
    wire [5:0] min;
    wire [4:0] hrs;
    
    digital_clk dut(clk,reset,sec,min,hrs);
    initial begin
        $monitor("%d %d %d %d %d",clk,reset,sec,min,hrs);
        reset = 1;
        #100 reset = 0;
    end
    initial clk = 0;
    always #50000000 clk = ~clk; // toggle for every 0.5 sec
endmodule
