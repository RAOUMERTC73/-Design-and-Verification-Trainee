`timescale 1ns / 1ps

module decade_counter_tb;
    wire [3:0]q;
    reg clk,rst;
    decade_counter #(.N(4)) dut(q,clk,rst);
    
    initial begin
        rst = 1;
        clk = 0;
        #20 rst = 0;
        #500 $finish();
    end
    always #10 clk = ~clk;
    initial begin
      $dumpfile("dump.vcd");
      $dumpvars(0);
    end
endmodule
