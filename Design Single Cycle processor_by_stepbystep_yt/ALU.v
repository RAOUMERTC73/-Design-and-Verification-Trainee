module ALU
#(
	 parameter WIDTH = 32,
 	 parameter op = 2
)
(
input        [op-1:0]                   opcode,
input        [WIDTH-1:0]                op1,
input        [WIDTH-1:0]                op2,
output reg  [WIDTH-1:0]                 alu_out

);
wire  	 [WIDTH-1:0] 	 mux_4_to_1_out;
wire  	 [WIDTH-1:0] 	 bitwise_nand_out;
wire  	 [WIDTH-1:0] 	 mult_out;
wire  	 [WIDTH-1:0] 	 sub_out;
wire  	 [WIDTH-1:0] 	 add_out;


add 
#(
	
.WIDTH             (WIDTH)
)
add_inst
(
.in1                (op1),
.in2                (op2),
.out                (add_out)
);



sub 
#(
	
.WIDTH             (WIDTH)
)
sub_inst
(
.in1                (op1),
.in2                (op2),
.out                (sub_out)
);



mult 
#(
	
.WIDTH             (WIDTH)
)
mult_inst
(
.in1                (op1),
.in2                (op2),
.out                (mult_out)
);



bitwise_nand 
#(
	
.WIDTH             (WIDTH)
)
bitwise_nand_inst
(
.in1                (op1),
.in2                (op2),
.out                (bitwise_nand_out)
);



mux_4_to_1 
#(
	
.WIDTH             (WIDTH)
)
mux_4_to_1_inst
(
.i_data0            (add_out),
.i_data1            (sub_out),
.i_data2            (mult_out),
.i_data3            (bitwise_nand_out),
.i_sel              (opcode),
.o_data             (mux_4_to_1_out)
);


always@* alu_out = mux_4_to_1_out;

endmodule