module bit5_2to1mux(out, select, in1, in2);
	input [4:0] in1, in2;
	output [4:0] out;
	input select;
	genvar j;													//this is the variable that is be used in the generate //block
	
	generate 
		for (j = 0; j < 5; j = j + 1) begin: mux_loop 			//mux_loop is the name of the loop
			mux2to1 m1(out[j], select, in1[j], in2[j]);			//mux2to1 is instantiated every time it is called
		end
	endgenerate
	
endmodule