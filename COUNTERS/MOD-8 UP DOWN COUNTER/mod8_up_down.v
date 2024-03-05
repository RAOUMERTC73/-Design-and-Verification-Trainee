`timescale 1ns / 1ps

module mod8_up_down #(parameter N = 3)(
	output reg [N-1:0]q,
	input  mod,clk, rst);

	always @(posedge clk) begin
		if (rst) begin
			q <= 0;
		end
		else begin
		 if(mod)
              begin
              q <= q + 1;
              end
		  else
              begin
              q <= q - 1;
              end
		end
	end
endmodule
