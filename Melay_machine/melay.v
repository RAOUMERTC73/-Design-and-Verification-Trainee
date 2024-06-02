module melay_machine (
input				clk,
input				reset,
input				start,
input				done_a,
input				done_b,
input				done_c,
output	reg 		start_a,
output	reg			start_b,
output	reg			start_c,
output	reg			 done
);



reg	[1:0] state_nxt;
reg [1:0] state;

parameter		IDLE 	= 2'd0;
parameter		WAIT_A	= 2'd1;
parameter		WAIT_B	= 2'd2;
parameter		WAIT_C	= 2'd3;

always @ (*)
begin
	
	start_a		=	0;
	start_b		=	0;
	start_c		=	0;
	done		=	0;	

	case(state)
	IDLE:
		if(start)
		begin
		start_a		=	1;
		state_nxt	=	WAIT_A;
		end
	WAIT_A:
		if(done_a)
		begin
		start_b		=	1;
		state_nxt	=	WAIT_B;
		end
	WAIT_B:
		if(done_b)
		begin
		start_c		=	1;
		state_nxt	=	WAIT_C;
		end
	WAIT_C:
		if(done_c)
		begin
		done		=	1;
		state_nxt	=	IDLE;
		end
	endcase
end


always @ (posedge clk)
	if (reset)
		state <= IDLE;
	else
		state <= state_nxt;
endmodule