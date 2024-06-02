module tb_melay_machine;
reg				clk;
reg				reset;
reg				start;
reg				done_a;
reg				done_b;
reg				done_c;
wire			start_a;
wire			start_b;
wire			start_c;
wire 			done;

melay_machine	melay_inst(

.clk				(clk		),
.reset				(reset		),
.start				(start		),
.done_a				(done_a		),
.done_b				(done_b		),
.done_c				(done_c		),
.start_a			(start_a	),
.start_b			(start_b	),
.start_c			(start_c	),
.done				(done		)
);

initial
begin
clk	=	0;
forever
 #5 clk	=	~clk;
end


initial
begin

$dumpfile("waveform.vcd");
$dumpvars(0,tb_melay_machine);

reset		=	0;
start		=	0;
done_a		=	0;
done_b		=	0;
done_c		=	0;

@(posedge clk)
	reset	<=	 1;
@(posedge clk)
	reset	<=	0;
	start	<=	1;
@(posedge clk);
start	=	0;
@(posedge clk);
done_a	=	1;
@(posedge clk);
done_a	=	0;
@(posedge clk);
done_b	=	1;
@(posedge clk);
done_b	=	0;
@(posedge clk);
done_c	=	1;
@(posedge clk);
done_c	=	0;


repeat(15)@(posedge clk);
$finish;
end
endmodule

