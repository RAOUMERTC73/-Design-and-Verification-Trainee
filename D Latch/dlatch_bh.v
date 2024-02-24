/**************************************************
P1.1 D-LATCH BEHAVIORAL
************************************************/
module dlatch_bh(q,d,clk);

output reg q;

input d,clk;

always @(clk,d)
begin
 if (clk)
   q = d;
end

endmodule
