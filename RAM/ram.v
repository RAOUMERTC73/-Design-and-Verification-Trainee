
//this system verilog file
module ram #(parameter N =6, M=32)(clk, we, adr, din, dout);

input logic clk, we;

input logic [N-1:0] adr;

input logic [M-1:0] din;

output logic [M-1:0] dout;

logic [M-1:0] mem [2**N-1:0];

always @ (posedge clk)

begin

if(we)

mem[adr] <= din;

end

assign dout = mem[adr];

endmodule