module comb_block
#(
	parameter WIDTH = 5
)
(
input [WIDTH-1:0] in,
output reg [WIDTH-1:0] out
);

always@* out = in; 

endmodule