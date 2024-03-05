

module clock_divider_tb;
	reg clk;
	reg rst;
	wire divideby2;
	wire divideby4;
	wire divideby8;
	wire divideby16;
	wire divideby32;

	clock_divider uut (clk,rst,divideby2,divideby4,divideby8,divideby16,divideby32);
	initial begin
		clk = 0;
		rst = 0;
		#1000 $finish;
		end
always #10 clk=~clk;
      

  // Dump VCD file
    initial begin 
        $dumpfile("dumped.vcd");
      $dumpvars(0, clock_divider_tb);
        #200; // Dump VCD after 200 time units
        $finish;
    end
      
endmodule