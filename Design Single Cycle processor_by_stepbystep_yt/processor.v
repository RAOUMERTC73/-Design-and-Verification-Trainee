module processor
#(
	 parameter DATA_END_ADDR = 5,
	 parameter DATA_START_ADDR = 0,
	 parameter DATA_FILE = "data_file.txt",
	 parameter PROG_END_ADDR = 8,
	 parameter PROG_START_ADDR = 0,
	 parameter PROG_FILE = "program.hex",
	 parameter RAM_ADDR_BITS = 9,
	 parameter RAM_WIDTH = 32,
 	 parameter WIDTH = 9
)
(
input               clk,
input               reset

);
parameter	SW	= 5'd5;
parameter	LW	= 5'd4;
wire  	   	 ctl1;
wire  	   	 ctl2;
wire  	   	 ctl3;
wire  	 [WIDTH-1:0] 	 prog_cnt;
wire  	 [RAM_WIDTH-1:0] 	 op1;
wire  	 [RAM_WIDTH-1:0] 	 op2;
wire  	 [RAM_WIDTH-1:0] 	 dram_data_out;
wire  	 [RAM_WIDTH-1:0] 	 alu_out;
wire  	 [RAM_WIDTH-1:0] 	 reg_data_in;
wire  	 [RAM_WIDTH-1:0] 	 instr;
wire  	 [4:0] 	 opcode;


up_counter 
#(
	
.WIDTH             (WIDTH)
)
cntr
(
.clk                (clk),
.reset              (reset),
.count              (prog_cnt)
);



bram 
#(
	
.RAM_WIDTH         (RAM_WIDTH),
.RAM_ADDR_BITS     (RAM_ADDR_BITS),
.DATA_FILE         (PROG_FILE),
.INIT_START_ADDR   (PROG_START_ADDR),
.INIT_END_ADDR     (PROG_END_ADDR)
)
prg_mem
(
.clock              (clk),
.ram_enable         (1'b1),
.write_enable       (1'b0),
.address            (prog_cnt),
.in_data            (0),
.out_data           (instr)
);



reg_file 
#(
	
.WIDTH_ADDR        (DATA_END_ADDR),
.WIDTH_DATA        (RAM_WIDTH)
)
regfile_inst
(
.clk                (clk),
.rd_addr1           (instr[21:17]),
.rd_addr2           (instr[16:12]),
.rd_data1           (op1),
.rd_data2           (op2),
.wr_addr            (instr[26:22]),
.wr_en              (ctl1),
.wr_data            (reg_data_in)
);



ALU 
#(
	
.WIDTH             (RAM_WIDTH)
)
ALU_inst
(
.opcode             (opcode[1:0]),
.op1                (op1),
.op2                (op2),
.alu_out            (alu_out)
);



mux_2_to_1 
#(
	
.WIDTH             (RAM_WIDTH)
)
mx2to1
(
.s_l                (ctl2),
.in0                (alu_out),
.in1                (dram_data_out),
.out                (reg_data_in)
);



bram 
#(
	
.RAM_WIDTH         (RAM_WIDTH),
.RAM_ADDR_BITS     (RAM_ADDR_BITS),
.DATA_FILE         (DATA_FILE),
.INIT_START_ADDR   (DATA_START_ADDR),
.INIT_END_ADDR     (DATA_END_ADDR)
)
data_mem
(
.clock              (clk),
.ram_enable         (1'b1),
.write_enable       (ctl3),
.address            (instr[8:0]),
.in_data            (op1),
.out_data           (dram_data_out)
);



not_gate n_gate
(
.in                 (ctl3),
.out                (ctl1)
);



comparator 
#(
	
.WIDTH             (DATA_END_ADDR)
)
cmp1
(
.in0                (opcode),
.in1                 (LW),
.out                (ctl2)
);



comparator 
#(
	
.WIDTH             (DATA_END_ADDR)
)
cmp2
(
.in0                (opcode),
.in1                 (SW),
.out                (ctl3)
);



comb_block 
#(
	
.WIDTH             (DATA_END_ADDR)
)
cmb3
(
.in                 (instr[31:27]),
.out                (opcode)
);

endmodule