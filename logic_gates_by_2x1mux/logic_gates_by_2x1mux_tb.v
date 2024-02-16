module logic_gates_by_2x1mux_tb;
    reg a, b;
    wire y1,y2,y3,y4,y5;
	 
	 
    logic_gates_by_2x1mux uut(a,b,y1,y2,y3,y4,y5);
	 
    initial begin
        a = 0; b = 0;
        #100; 
        a = 0 ; b =1;
        #100;
        a = 1; b = 0;
        #100;
        a = 1; b = 1;
        #100;
        $finish;
    end
	 
    initial $monitor("a=%b b=%b y1=%b y2=%b y3=%b y4=%b y5=%b",a,b,y1,y2,y3,y4,y5);
	 
endmodule

