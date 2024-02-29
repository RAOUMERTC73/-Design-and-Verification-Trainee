learn form the udemy and semirise and Mindluster
/**************************************************
 P1.1 FULL ADDER STRUCTURAL
 ************************************************/

 module full_adder_st(s, cout, a, b, cin); 
 	input a, b, cin;
 	output s, cout;

 	wire n1,n2,n3;

 	xor xor1(s,a,b,cin);
 	and and1(n1,a,b);
 	and and2(n2,a,cin);
 	and and3(n3,b,cin);
 	or or1(cout,n1,n2,n3);

 endmodule



/**************************************************
 P1.1 FULL ADDER DATAFLOW
 ************************************************/

 module full_adder_df(s, cout, a, b, cin); 
 	input a, b, cin;
 	output s, cout;

 	assign s=a^b^cin;
 	assign cout=(a&b)|(a&cin)|(b&cin);

 endmodule


/**************************************************
 P1.1 FULL ADDER BEHAVIORAL
 ************************************************/

 module full_adder_bh_tb(s, cout, a, b, cin); 
 	input a, b, cin;
 	output reg s, cout;

 	always@(a,b,cin) begin
 		s=a^b^cin;
 		cout=(a&b)|(a&cin)|(b&cin);
 	end

 endmodule


/**************************************************
 P1.1 FULL ADDER TESTBENCH
 ************************************************/

 module full_adder_bh; 
 	reg a, b, cin;
 	wire s,cout;

 	full_adder_bh fa_dut(s,cout,a,b,cin);

 	initial begin
 		$monitor("time=%d \t a=%b \t b=%b \t cin=%b \t s=%b \t cout=%b",$time,a,b,cin,s,cout);
 		a=0;
 		b=0;
 		cin=0;		//{cin,a,b}=3'b000
 		#10 a=1;	//{cin,a,b}=3'b010
 		#10 b=1;	//{cin,a,b}=3'b011
 		#10 cin=1;	//{cin,a,b}=3'b111
 		#10 $stop;
 	end // initial

 endmodule


/**************************************************
 P1.1 4-bit FULL ADDER STRUCTURAL
 ************************************************/

 module full_adder_4bit_st(s,cout,a,b,cin); 
 	input [3:0]a, b;
 	input cin;
 	output [3:0]s;
 	output cout;

 	wire n1,n2,n3;

 	full_adder_bh fa1(s[0],n1,a[0],b[0],cin);
 	full_adder_bh fa2(s[1],n2,a[1],b[1],n1);
 	full_adder_bh fa3(s[2],n3,a[2],b[2],n2);
 	full_adder_bh fa4(s[3],cout,a[3],b[3],n3);


 endmodule


/**************************************************
 P1.1 4-bit FULL ADDER DATAFLOW
 ************************************************/

 module full_adder_4bit_df(s,cout,a,b,cin); 
 	input [3:0]a, b;
 	input cin;
 	output [3:0]s;
 	output cout;

 	assign {cout,s} = a + b + cin;


 endmodule


/**************************************************
 P1.1 4-bit FULL ADDER BEHAVIORAL
 ************************************************/

 module full_adder_4bit_bh(s,cout,a,b,cin); 
 	input [3:0]a, b;
 	input cin;
 	output reg [3:0]s;
 	output reg cout;

 	always@(a,b,cin)

 	{cout,s} = a + b + cin;


 endmodule


/**************************************************
 P1.1 4-bit FULL ADDER TESTBENCH
 ************************************************/

 module full_adder_4bit_bh_tb;
 	reg [3:0]a, b;
 	reg cin;
 	wire [3:0]s;
 	wire cout;

	full_adder_4bit_bh fa4_dut(s,cout,a,b,cin);

	initial
		$monitor("time=%d \t a=%b \t b=%b \t cin=%b \t s=%b \t cout=%b",$time,a,b,cin,s,cout);

	initial begin
		a=0;
		b=0;
		cin=0;
		repeat(16) begin
			#10 a=a+1;
			repeat(16) begin
				#10 b=b+1;
					repeat(2)
						#10 cin=~cin;
			end // repeat(16)
		end // repeat(16)
	end


 endmodule



/**************************************************
 P1.1 3X8 DECODER DATAFLOW
 ************************************************/

 module decode_3_8_df(Y,I,En);
 	input [2:0]I;
 	input En;
 	output [7:0]Y;

 	assign Y = {En & ~I[0] & ~I[1] & ~I[2],
 				En & ~I[0] & ~I[1] & I[2],
 				En & ~I[0] & I[1] & ~I[2],
 				En & ~I[0] & I[1] & I[2],
 				En & I[0] & ~I[1] & ~I[2],
 				En & I[0] & ~I[1] & I[2],
 				En & I[0] & I[1] & ~I[2],
 				En & I[0] & I[1] & I[2]};

 endmodule


/**************************************************
 P1.1 2:1 MULTIPLEXER DATAFLOW
 ************************************************/

 module mux_2_1_df(Y,I,S);
 	input [1:0]I;
 	input S;
 	output Y;

 	assign Y = S?I[1]:I[0];

 endmodule


/**************************************************
 P1.1 2:1 MULTIPLEXER BEHAVIORAL
 ************************************************/

 module mux_2_1_bh(Y,I,S);
 	input [1:0]I;
 	input S;
 	output reg Y;

 	always@(*)
 	if(S)
 		Y=I[1];
 	else
 		Y=I[0];

 endmodule


/**************************************************
 P1.1 4:1 MULTIPLEXER STRUCTURAL
 ************************************************/

 module mux_4_1_st(Y,I,S);
 	input [3:0]I;
 	input [1:0]S;
 	output Y;

 	mux_2_1_df m1(n1,I[3:2],S[1]);
 	mux_2_1_df m2(n2,I[1:0],S[1]);
 	mux_2_1_df m3(Y,{n1,n2},S[0]);


 endmodule


/**************************************************
 P1.1 4:1 MULTIPLEXER DATAFLOW1
 ************************************************/

 module mux_4_1_df(Y,I,S);
 	input [3:0]I;
 	input [1:0]S;
 	output Y;

 assign Y= I[S];


 endmodule




/**************************************************
 P1.1 4:1 MULTIPLEXER DATAFLOW2
 ************************************************/

 module mux_4_1_df(Y,I,S);
 	input [3:0]I;
 	input [1:0]S;
 	output Y;

 assign Y= ~|S?I[0]:(&S?I[3]:(S[0]?I[1]:I[2]));


 endmodule



/**************************************************
 P1.1 4:1 MULTIPLEXER DATAFLOW3
 ************************************************/

 module mux_4_1_df(Y,I,S);
 	input [3:0]I;
 	input [1:0]S;
 	output Y;

 assign Y= (S==2'd0)?I[0]:((S==2'd1):I[1]:((S==2'd2)?I[2]:I[3]));


 endmodule

/**************************************************
P1.1 4:1 MULTIPLEXER BEHAVIORAL
************************************************/

module mux_2_1_df(Y,I,S);

	input [3:0]I;
	input [1:0]S;
	output reg Y;

	always@(*)
	case(S)
		2'd0: Y=I[0];
		2'd1: Y=I[1];
		2'd2: Y=I[2];
		2'd3: Y=I[3];
		default:$display("error");
	endcase

endmodule

/**************************************************
P1.1 4X2 ENCODER DATAFLOW
************************************************/

module encode_4_2_df(Y,V,I);

	input [3:0]I;
	output [1:0]Y;
	output V;

	assign Y={I[3]|I[2], I[3]|I[1]};
	assign V=|I;

endmodule

/**************************************************
P1.1 4X2 ENCODER BEHAVIORAL
************************************************/

module encode_4_2_bh(Y,V,I);

	input [3:0]I;
	output reg [1:0]Y;
	output reg V;

	always@(*) begin
		case(I)
			4'd1: {V,Y}=3'b100;
			4'd2: {V,Y}=3'b101;
			4'd4: {V,Y}=3'b110;
			4'd8: {V,Y}=3'b111;
			4'd0,4'd3,4'd5,4'd6,4'd7,4'd9,4'd10,4'd11,4'd12,4'd13,4'd14,4'd15: {V,Y}=3'b000;
			default: $display("error");
		endcase
	end

endmodule


/**************************************************
P1.1 4X2 PRIORITY ENCODER BEHAVIORAL
************************************************/

module encode_4_2_priority_bh(Y,V,I);

	input [3:0]I;
	output reg [1:0]Y;
	output reg V;

	always@(*) begin
		if(I[0]) {V,Y}=3'b100;
		else if(I[1]) {V,Y}=3'b101;
		else if(I[2]) {V,Y}=3'b110;
		else if(I[3]) {V,Y}=3'b111;
		else {V,Y}=3'b000;
	end

endmodule

/**************************************************
P1.1 4-bit COMPARATOR DATAFLOW1
************************************************/

module comparator_df1(Eq,Gt,Sm,A,B);

	input [3:0]A,B;
	output Eq,Gt,Sm;

assign Eq= &(A ~^ B);	//A==B
assign Gt= (A[3]& ~B[3]) | ((A[3]~^B[3]) & (A[2]& ~B[2])) | ((A[3]~^B[3]) & (A[2]~^B[2]) & (A[1]& ~B[1])) | ((A[3]~^B[3]) & (A[2]~^B[2]) & (A[1]~^B[1]) & (A[0]& ~B[0]));	//A>B
assign Sm= ~(Gt|Eq);

endmodule

/**************************************************
P1.1 4-bit COMPARATOR DATAFLOW2
************************************************/

module comparator_df2(Eq,Gt,Sm,A,B);

	input [3:0]A,B;
	output Eq,Gt,Sm;

assign Eq= (A==B);	//A==B
assign Gt= (A>B);	//A>B
assign Sm= (A<B);	//A<B

endmodule


/**************************************************
P1.1 4-bit COMPARATOR BEHAVIORAL
************************************************/

module comparator_bh(Eq,Gt,Sm,A,B);

	input [3:0]A,B;
	output reg Eq,Gt,Sm;

	always@(*) begin
		Eq= (A==B);	//A==B
		Gt= (A>B);	//A>B
		Sm= (A<B);	//A<B
	end // always@(*)

endmodule

/**************************************************
P1.1 8-bit BARREL SHIFTER BEHAVIORAL
************************************************/

module barrel_bh(Out,In,Lr,n);

	input [7:0]In;
	input [2:0]n;
	input Lr;
	output reg [7:0]Out;

	always@(*) begin
		if(Lr)
			Out = In << n;
		else
			Out = In >> n;
	end // always@(*)

endmodule


/**************************************************
P1.1 D-LATCH DATAFLOW
************************************************/

module dlatch_df(q,d,en);

	input en,d;
	output q;

assign q = en?d:q;

endmodule


/**************************************************
P1.1 D-LATCH BEHAVIORAL
************************************************/

module dlatch_bh(q,d,clk);

output reg q;

input d,clk;

always @(clk,d)
begin
 if (clk)
   q = d;
end

endmodule

/**************************************************
P1.1 D-LATCH BEHAVIORAL WITH ASYNC RESET
************************************************/

module dlatch_bh(q,d,en,rst);

	input en,d,rst;
	output reg q;

	always@(en,q,rst)
	if(rst)
		q = 1'b0;
	else if(en) q=d;

endmodule

/**************************************************
P1.1 D-FLIPFLOP BEHAVIORAL BASIC
************************************************/

module dffb(q,d,clk);

	input d,clk;
	output reg q;

	always@(posedge clk)
	if(clk)
		q = d;

endmodule


/**************************************************
P1.1 BEHAVIORAL POSITIVE EDGE TRIGGERED D-FLIPFLOP   
ASYNCHRONOUS ACTIVE HIGH RESET
************************************************/


module dffb(q,d,clk,rst);

	input d,clk,rst;
	output reg q;

	always@(posedge clk or posedge rst)
		if(rst)
			q <= 1'b0;

		/**************************************************
P1.1 BEHAVIORAL POSITIVE EDGE TRIGGERED D-FLIPFLOP   
ASYNCHRONOUS ACTIVE LOW RESET
************************************************/


module dffb(q,d,clk,rst);

	input d,clk,rst;
	output reg q;

	always@(posedge clk, negedge rst)
		if(!rst)
			q <= 1'b0;
		else
			q <= d;

endmodule


/**************************************************
P1.1 BEHAVIORAL POSITIVE EDGE TRIGGERED D-FLIPFLOP   
ASYNCHRONOUS ACTIVE LOW RESET & ACTIVE HIGH SET
************************************************/


module dffb(q,d,clk,rst,set);

	input d,clk,rst,set;
	output reg q;

	always@(posedge clk, negedge rst, posedge set)
		if(!rst)
			q <= 1'b0;
		else if(set)
			q <= 1'b1;
		else
			q <= d;

endmodule


/**************************************************
P1.1 BEHAVIORAL POSITIVE EDGE TRIGGERED D-FLIPFLOP   
SYNCHRONOUS ACTIVE LOW RESET & ACTIVE HIGH SET
************************************************/


module dffb(q,d,clk,rst,set);

	input d,clk,rst,set;
	output reg q;

	always@(posedge clk)
		if(!rst)
			q <= 1'b0;
		else if(set)
			q <= 1'b1;
		else
			q <= d;

endmodule

		else
			q <= d;

endmodule

/**************************************************
P1.1 BEHAVIORAL POSITIVE EDGE TRIGGERED D-FLIPFLOP   
SYNCHRONOUS ACTIVE HIGH RESET
************************************************/


module dffb(q,d,clk,rst);

	input d,clk,rst;
	output reg q;

	always@(posedge clk)
		if(rst)
			q <= 1'b0;
		else
			q <= d;

endmodule


/**************************************************
P1.1 BEHAVIORAL POSITIVE EDGE TRIGGERED D-FLIPFLOP   
SYNCHRONOUS ACTIVE LOW RESET
************************************************/


module dffb(q,d,clk,rst);

	input d,clk,rst;
	output reg q;

	always@(posedge clk)
		if(!rst)
			q <= 1'b0;
		else
			q <= d;

endmodule


/**************************************************
P1.1 BEHAVIORAL POSITIVE EDGE TRIGGERED D-FLIPFLOP   
ASYNCHRONOUS ACTIVE LOW RESET
************************************************/


module dffb(q,d,clk,rst);

	input d,clk,rst;
	output reg q;

	always@(posedge clk, negedge rst)
		if(!rst)
			q <= 1'b0;
		else
			q <= d;

endmodule


/**************************************************
P1.1 BEHAVIORAL POSITIVE EDGE TRIGGERED D-FLIPFLOP   
ASYNCHRONOUS ACTIVE LOW RESET & ACTIVE HIGH SET
************************************************/


module dffb(q,d,clk,rst,set);

	input d,clk,rst,set;
	output reg q;

	always@(posedge clk, negedge rst, posedge set)
		if(!rst)
			q <= 1'b0;
		else if(set)
			q <= 1'b1;
		else
			q <= d;

endmodule


/**************************************************
P1.1 BEHAVIORAL POSITIVE EDGE TRIGGERED D-FLIPFLOP   
SYNCHRONOUS ACTIVE LOW RESET & ACTIVE HIGH SET
************************************************/


module dffb(q,d,clk,rst,set);

	input d,clk,rst,set;
	output reg q;

	always@(posedge clk)
		if(!rst)
			q <= 1b0;
		else if(set)
			q <= 1'b1;
		else
			q <= d;

endmodule


/**************************************************
P1.1 5-bit SHIFT REGISTER (L-R)
************************************************/

module SR_LR(SO,clk,rst,SI);
	input SI,clk,rst;
	output SO;

	reg [4:0]SR;

	always@(posedge clk, negedge rst)
	if(rst)
		SR <= 5'd0;
	else
		SR <= {SR[3:0],SI};

	assign SO = SR[4];

	
endmodule

/**************************************************
P1.1 5-bit UNIVERSAL SHIFT REGISTER
************************************************/

module USR(PO,PI,sel,clk,rst,SI);
	input [1:0] sel;
	input [4:0] PI;
	input  clk, rst,SI;
	output reg[4:0] PO; 
	
	
	always@(posedge clk)
	if (rst) 
		PO <= 5'd0;
	else begin case(sel)
	
			2'b00 : PO <= PO;
			2'b01 : PO <= {PO[3:0],SI};
			2'b10 : PO <= {SI,PO[4:1]};
			2'b11 : PO <= PI;  
			default : PO <= 0;
	
		endcase
		end
	assign SO = (sel == 2'b01) ? PO[4] : PO[0] ;

	
endmodule


/**************************************************
P1.1 SINGLE PORT SYNCHRONOUS SRAM 64K Bytes
************************************************/

module sram(
	input write_enable,
	input [15:0] address,
	input [7:0] data_in,
	input clk,
	output reg [7:0] data_out );

	reg [7:0] memory[65535:0];

	always@(posedge clk)
		if(write_enable)
			memory[address]<=data_in; else
		data_out<=memory[address];

endmodule

/**************************************************
P1.1 SINGLE PORT REGISTERED OUTPUT RAM
************************************************/

module sram(q,data,addr,we,clk);
	input [7:0] data;
	input [5:0] addr;
	input we, clk;
	output [7:0] q;
	
	reg [7:0] sram[63:0];
	
	reg [5:0] addr_reg;
	
	always @ (posedge clk)
	begin
		if (we)
			ram[addr] <= data;
		addr_reg <= addr;
	end
		
	assign q = ram[addr_reg];
	
endmodule

/**************************************************
P1.1 TRUE DUAL PORT RAM
************************************************/
module sram(q_a, q_b, data_a, data_b, addr_a, addr_b, we_a, we_b, clk);
	input [7:0] data_a, data_b;
	input [5:0] addr_a, addr_b;
	input we_a, we_b, clk;
	output reg [7:0] q_a, q_b;

	reg [7:0] sram[63:0];
	
	// Port A
	always @ (posedge clk)
	begin
		if (we_a) 
		begin
			sram[addr_a] <= data_a;
			q_a <= data_a;
		end
		else 
		begin
			q_a <= sram[addr_a];
		end
	end
	
	// Port B
	always @ (posedge clk)
	begin
		if (we_b)
		begin
			sram[addr_b] <= data_b;
			q_b <= data_b;
		end
		else
		begin
			q_b <= sram[addr_b];
		end
	end
	
endmodule

/**************************************************
P1.1 DUAL PORT RAM
************************************************/
module sram(q, data, read_addr, write_addr, we, read_clock, write_clock);
	input [7:0] data;
	input [5:0] read_addr, write_addr;
	input we, read_clock, write_clock;
	output reg [7:0] q;

	reg [7:0] sram[63:0];
	
	always @ (posedge write_clock)
	begin
	
		if (we)
			sram[write_addr] <= data;
	end
	
	always @ (posedge read_clock)
	begin
	
		q <= sram[read_addr];
	end
endmodule


/**************************************************
P1.1 FIFO
************************************************/
module FIFO( clk, rst, buf_in, buf_out, wr_en, rd_en, buf_empty, buf_full, fifo_counter );

input                 rst, clk, wr_en, rd_en;   
input [7:0]           buf_in;                   
output[7:0]           buf_out;                  
output                buf_empty, buf_full;      
output[3 :0] fifo_counter;             

reg[7:0]              buf_out;
reg                   buf_empty, buf_full;
reg[3 :0]    fifo_counter;
reg[3 -1:0]  rd_ptr, wr_ptr;           
reg[7:0]              buf_mem[7 : 0];   

always @(fifo_counter)
begin
   buf_empty = (fifo_counter==0);
   buf_full = (fifo_counter== 8);

end

always @(posedge clk or posedge rst)
begin
   if( rst )
       fifo_counter <= 0;

   else if( (!buf_full && wr_en) && ( !buf_empty && rd_en ) )
       fifo_counter <= fifo_counter;

   else if( !buf_full && wr_en )
       fifo_counter <= fifo_counter + 1;

   else if( !buf_empty && rd_en )
       fifo_counter <= fifo_counter - 1;
   else
      fifo_counter <= fifo_counter;
end

always @( posedge clk or posedge rst)
begin
   if( rst )
      buf_out <= 0;
   else
   begin
      if( rd_en && !buf_empty )
         buf_out <= buf_mem[rd_ptr];

      else
         buf_out <= buf_out;

   end
end

always @(posedge clk)
begin

   if( wr_en && !buf_full )
      buf_mem[ wr_ptr ] <= buf_in;

   else
      buf_mem[ wr_ptr ] <= buf_mem[ wr_ptr ];
end

always@(posedge clk or posedge rst)
begin
   if( rst )
   begin
      wr_ptr <= 0;
      rd_ptr <= 0;
   end
   else
   begin
      if( !buf_full && wr_en )    wr_ptr <= wr_ptr + 1;
          else  wr_ptr <= wr_ptr;

      if( !buf_empty && rd_en )   rd_ptr <= rd_ptr + 1;
      else rd_ptr <= rd_ptr;
   end

end
endmodule


/**************************************************
P1.1 MOORE SEQUENCE DETECTOR
************************************************/
module moore(
	input reset,
	input clk,
	input in,
	output reg det
	);
reg [2:0] pr_stage, nx_stage; parameter  s0=3'b000;
parameter s1=3'b010;
parameter s2=3'b011 ;
parameter s3=3'b100 ;
always@(posedge clk)
begin
	if(reset)
		pr_stage<=s0;
	else
	pr_stage<=nx_stage; 
end
always@(pr_stage,in)
case(pr_stage)
	s0:if(in==1)
	nx_stage=s1;
	else
	nx_stage=s0;
	s1:if(in==0)
	nx_stage=s2;
	else
	nx_stage=s1;
	s2:if(in==1)
	nx_stage=s3;
	else
	nx_stage=s0;
	s3:if(in==1)
	nx_stage=s1;
	else
	nx_stage=s2;
	default:nx_stage=s0;
endcase


always@(pr_stage)
case(pr_stage)
	s0: det=0;
	s1: det=0;
	s2: det=0;
	s3: det=1;
	default: det=0;
endcase
endmodule




/**************************************************
P1.1 FREQUENCY DIVIDER BY 3
************************************************/
module div_3(
	input clk,
	input reset,
	output clk_out);


	reg[1:0] pos_cnt;
	reg [1:0]neg_cnt;

	always@(posedge clk)
		if(reset)
			pos_cnt<= 0;
		else if(pos_cnt==2)
			pos_cnt<= 0;
		else
			pos_cnt<= pos_cnt+1;

	always@(negedge clk)
	if(reset)
		neg_cnt<= 0;
	else if(neg_cnt==2)
		neg_cnt<= 0;
	else neg_cnt<= neg_cnt+1;

	assign clk_out=((pos_cnt==2) | (neg_cnt==2));

endmodule
