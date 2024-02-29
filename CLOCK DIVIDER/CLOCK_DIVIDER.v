module clk_divider(clk, clk_50);

input clk_50;

output reg clk;

reg [31:0] count;

initial

count = 32'h00000000;

//reg count;

always@(posedge (clk_50))

begin

if (count >= 32'd50000000)

count <= 32'h00000000;

else

begin

if (count<=32'd25000000)

clk <= 1;

else

clk <= 0;

count <= count + 1;

end

end

endmodule