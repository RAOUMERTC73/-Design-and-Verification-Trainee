module sub
#(
	parameter WIDTH = 32
)

(
input [WIDTH-1:0] in1,
input [WIDTH-1:0] in2,
output reg [WIDTH-1:0] out
);

always@*
begin
	out = in1 - in2;
end

endmodule