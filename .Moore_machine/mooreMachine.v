module mooreMachine(
input			clk,
input			reset,
input 			start,
input			done_a,
input			done_b,
input			done_c,
output	reg		start_a,
output	reg		start_b,
output	reg		start_c,
output	reg		done
);

reg	[2:0]	state;
reg	[2:0]	state_nxt;

parameter 	IDLE		=	3'd0;
parameter	WAIT_A		=	3'd1;
parameter	WAIT_B		=	3'd2;
parameter	WAIT_C		=	3'd3;
parameter	START_A		=	3'd4;
parameter	START_B		=	3'd5;
parameter	START_C		=	3'd6;
parameter	DONE		=	3'd7;


always @(*)
begin
	case(state)
	IDLE:
		if(start)
		begin
		state_nxt	=	START_A;
		end
	START_A:
			begin
			state_nxt	= WAIT_A;
			end
	WAIT_A:
		if(done_a)
		begin
			state_nxt	=	START_B;
		end
	START_B:
			begin
			state_nxt	= WAIT_B;
			end
	WAIT_B:
		if(done_b)
		begin
			state_nxt	=	START_C;
		end
	START_C:
			begin
			state_nxt	=	WAIT_C;
			end	
	WAIT_C:
		if(done_c)
		begin
			state_nxt	=	DONE;
		end
	DONE:
		begin
		state_nxt	=	IDLE;
		end	
	endcase
end	

always @ (*)
begin
	start_a	= state	==	START_A;
	start_b	= state	==	START_B;
	start_c	= state	==	START_C;
	done 	= state	==	DONE;
end
	
always @(posedge clk)
begin
	if(reset)
		state	<=	IDLE;
	else
		state	<=	state_nxt;
end	
endmodule