// Code your testbench here
// or browse Examples
module register_64bit_tb();
reg [64-1:0] data_in;
reg reset;
bit clk;  // default=0
wire [64-1:0] data_out;

// Instantiate 

//register_64bit dut(data_in,clk,reset,data_out);// methode 1 sequenc matter
//register_64bit dut(.*); //methode 2  test bench variable name same as dut module name
register_64bit dut(.data_out(data_out),.data_in(data_in),.clk(clk),.reset(reset)); 
//methode 3  best practice   sequenc and same name dosent matter



// Clock generation
initial begin
  forever #5 clk = ~clk; // Toggle clock every 5 time units
end

// Initial values
initial begin
  reset = 0;
  data_in = 64'd9; 
  #10; 
  reset = 1; 
  #10; 
  data_in = 64'd1; 
  #10;
  data_in = 64'd2; 
  #10; 
  reset = 0; 
  #10; 
  data_in = 64'd3; 
  #10; 
  data_in = 64'd4; 
  #10;
  data_in = 64'd5; 
  #10; 

  $finish; // End simulation
end

 initial begin 
  
  $dumpfile("dumped.vcd");
  $dumpvars(0);
  #100;
  $finish();
  
 end    
endmodule
