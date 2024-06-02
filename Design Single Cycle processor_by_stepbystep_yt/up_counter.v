module up_counter 
#(
	parameter WIDTH = 9
)
(
	input 					        clk,
	input 					        reset,
	output 	reg [WIDTH-1:0]	    count
);

	always@(posedge clk)
		if(reset)	count <= 0;
		else 	    count <= count + 1;
		
endmodule