module mux_4_to_1
#(
	parameter   WIDTH = 32,
	parameter	width2 = 2
	
)

(
input      [WIDTH-1:0]     i_data0,
input      [WIDTH-1:0]     i_data1,
input      [WIDTH-1:0]     i_data2,
input      [WIDTH-1:0]     i_data3,
input      [width2-1:0] i_sel,
output reg [WIDTH-1:0]     o_data
);


always@*
	begin
		case(i_sel)
			2'b00 : o_data = i_data0;
			2'b01 : o_data = i_data1;
			2'b10 : o_data = i_data2;
			2'b11 : o_data = i_data3;
		endcase
	end	
endmodule