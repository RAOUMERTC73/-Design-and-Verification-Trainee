module logic_gates_by_2x1mux(input a,
                             input b,
									  output y1,y2,y3,y4,y5);
									  
   
 mux_2x1 and_gate(1'b0,b,a,y1);// and gate
 
 mux_2x1 nand_gate(1'b1,~b,a,y2);// nand gate
 
 mux_2x1 or_gate(b,1'b1,a,y3);// or gate
 
 mux_2x1 nor_gate(~b,1'b0,a,y4); // nor gate
  
 mux_2x1 xor_gate(a,~a,b,y5); // xor gate



endmodule


module mux_2x1(
    input a, b, sel, 
    output y);
    assign y = (a & ~sel) | (b & sel);
endmodule








									  


									  