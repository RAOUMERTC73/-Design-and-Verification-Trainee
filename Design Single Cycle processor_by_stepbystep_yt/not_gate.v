module not_gate
(
input in,
output reg out
);

always@* out = ~in; 
endmodule
