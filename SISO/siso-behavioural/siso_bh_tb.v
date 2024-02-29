`timescale 1ns / 1ps

module siso_bh_tb;
    wire q,qbar;
    reg din,clk,rst;
    siso_bh uut(q,qbar,din,clk,rst);
    
    initial begin
        clk = 0;
        rst = 1;
        #100 rst = ~rst;
        din = 0;
        $monitor("time=%0t rst=%b clk=%b din=%b q=%b qbar=%b",$time,rst,clk,din,q,qbar);
	    #1000 $finish;
    end
    always #50 din = ~din;
    always #25 clk = ~clk;
    
endmodule
