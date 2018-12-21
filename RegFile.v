module RegFile(clk, reset, ReadReg1, ReadReg2, WriteData, WriteReg, RegWrite, ReadData1, ReadData2);
	input clk, reset, RegWrite;
	input [31:0] WriteData;
	input [1:0] WriteReg, ReadReg1, ReadReg2;
	output [31:0] ReadData1, ReadData2;
	wire [3:0] decw;
	wire [3:0] andout;
	wire [31:0] q0, q1, q2, q3;
	genvar j;
	
	bit1_2to4decoder dec(decw, WriteReg[0], WriteReg[1]);
	generate
		for (j = 0; j < 4; j = j + 1) begin: reg_loop
			bit1_3to1and a1(andout[j], clk, RegWrite, decw[j]);
		end
	endgenerate
	
	reg_32bit reg1(q0, WriteData, andout[0], reset);
	reg_32bit reg2(q1, WriteData, andout[1], reset);
	reg_32bit reg3(q2, WriteData, andout[2], reset);
	reg_32bit reg4(q3, WriteData, andout[3], reset);
	
	bit32_4to1mux mux1(ReadData1, ReadReg1, q0, q1, q2, q3);
	bit32_4to1mux mux2(ReadData2, ReadReg2, q0, q1, q2, q3);
	
endmodule