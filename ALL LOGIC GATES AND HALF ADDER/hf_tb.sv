`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/11/2024 03:29:01 AM
// Design Name: 
// Module Name: hf_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module hf_tb();

reg t_a,t_b;

wire s,c;

half_adder dut(.A(t_a), .B(t_b), .SUM(s), .CARRY(c));

initial begin

 t_a=0; t_b=0;
 #100
 t_a=0;t_b=1;
 #100
 t_a=1;t_b=0;
 #100
 t_a=1;t_b=1;
 #100
 $stop;

end

endmodule
