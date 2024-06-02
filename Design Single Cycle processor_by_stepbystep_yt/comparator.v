module comparator 
#(
	parameter WIDTH 		= 5
)
(
input     [WIDTH-1:0] in0,
input     [WIDTH-1:0] in1,
output    reg out
);


always@*  out = in0 == in1;

endmodule