/**************************************************
P1.1 8-bit BARREL SHIFTER BEHAVIORAL
************************************************/

module barrel_bh(Out,In,Lr,n);

	input [7:0]In;// input number
	input [2:0]n;  // how many bits you want to shift
	input Lr; // select the direction left ==1 and right 
	output reg [7:0]Out; // output result

	always@(*) begin
		if(Lr)
			Out = In << n;
		else
			Out = In >> n;
	end 
endmodule

