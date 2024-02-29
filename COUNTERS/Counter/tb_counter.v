module tb_counter;
reg clk;
reg reset;
reg increment;
reg decrement;
wire [3:0] count;

counter counter_inst(
.clk (clk),
.reset (reset),
.increment (increment),
.decrement (decrement),
.count ( count)
);

initial
begin
clk=0;
forever
#5 clk = ~clk;
end

initial
begin
$dumpfile("waveform.vcd");
$dumpvars(1, tb_counter);

increment=0;
decrement=0;
reset=0;


@(posedge clk)
reset <= #1 1;
@(posedge clk)
reset <= #1 0;


@(posedge clk);
#1 increment = 1;
repeat(2) @(posedge clk);
#1 increment = 0;
decrement = 1;
@(posedge clk);
#1 decrement=0;
$display("Count = %d ", count);
repeat(20)@(posedge clk);
$finish;
end
endmodule