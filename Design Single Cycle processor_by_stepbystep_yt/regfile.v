module reg_file
#(
	parameter WIDTH_ADDR = 5,
	parameter WIDTH_DATA = 32
)
(
		input 			clk,
		input 	[WIDTH_ADDR-1:0]	rd_addr1,
		input	[WIDTH_ADDR-1:0]	rd_addr2,
		output	[WIDTH_DATA-1:0]	rd_data1,
		output	[WIDTH_DATA-1:0]	rd_data2,
		
		input	[WIDTH_ADDR-1:0]	wr_addr,
		input			wr_en,
		input	[WIDTH_DATA-1:0]	wr_data
);

reg [31:0] regs[0:31];

always@(posedge clk)
	if(wr_en)	regs[wr_addr] <= wr_data;
		
assign	rd_data1 = regs[rd_addr1];
assign	rd_data2 = regs[rd_addr2];

endmodule