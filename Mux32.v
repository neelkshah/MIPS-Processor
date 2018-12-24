module bit32_32to1mux(out, in0, in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15, in16, in17, in18, in19, in20, in21, in22, in23, in24, in25, in26, in27, in28, in29, in30, in31, select);
	input [31:0] in0, in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15, in16, in17, in18, in19, in20, in21, in22, in23, in24, in25, in26, in27, in28, in29, in30, in31;
	output [31:0] out;
	input [4:0] select;
	wire [31:0] w [9:0];
	
	bit32_4to1mux m1(w[0], select[1:0], in0, in1, in2, in3);
	bit32_4to1mux m2(w[1], select[1:0], in4, in5, in6, in7);
	bit32_4to1mux m3(w[2], select[1:0], in8, in9, in10, in11);
	bit32_4to1mux m4(w[3], select[1:0], in12, in13, in14, in15);
	bit32_4to1mux m5(w[4], select[1:0], in16, in17, in18, in19);
	bit32_4to1mux m6(w[5], select[1:0], in20, in21, in22, in23);
	bit32_4to1mux m7(w[6], select[1:0], in24, in25, in26, in27);
	bit32_4to1mux m8(w[7], select[1:0], in28, in29, in30, in31);
	bit32_4to1mux m9(w[8], select[3:2], w[0], w[1], w[2], w[3]);
	bit32_4to1mux m10(w[9], select[3:2], w[4], w[5], w[6], w[7]);
	bit32_2to1mux m11(out, select[4], w[8], w[9]);
	
endmodule