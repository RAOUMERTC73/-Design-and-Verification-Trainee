// Code your design here
//Design a 64 bit register with asynchronous,active low reset. Also write its testbench.
module register_64bit(input wire [64-1:0] data_in,
input wire clk,
input wire reset,
output reg [64-1:0] data_out);


always@(posedge clk or negedge reset)begin 

if(reset==0)begin   // active low reset  (!reset)
data_out <= 64'b0;
end
else begin
data_out <= data_in;
end

end


endmodule
