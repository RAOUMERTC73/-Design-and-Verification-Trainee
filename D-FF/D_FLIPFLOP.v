`timescale 1ns / 1ps

module d_ff(
    output reg q,
    input d,
    input rst_n,
    input clk
    );

    always @(posedge clk or negedge rst_n)
	begin
        if (!rst_n)
        begin
            q <= 0;
        end
        else
        begin
            q <= d;
        end
    end
	 
endmodule
