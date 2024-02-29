module counter(
input clk,
input reset,
input increment,
input decrement,
output reg [3:0] count
);

reg enable;
reg [3:0] mux_out;

always @ (*)
begin
	enable = increment | decrement;
end

always @ (*)
begin
	case(increment)
	1'b0 : mux_out = count-1;
	1'b1 : mux_out = count+1;
endcase
end

always @ (posedge clk)
if(reset)
	count <= 0;
else if(enable)
	count <=  mux_out;

endmodule