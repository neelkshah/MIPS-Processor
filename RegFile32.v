`include "Reg32.v"
`include "Decoder.v"
`include "Mux32.v"

module RegFile32(clk, reset, ReadReg1, ReadReg2, WriteData, WriteReg, RegWrite, ReadData1, ReadData2);
	input clk, reset, RegWrite;
	input [31:0] WriteData;
	input [4:0] WriteReg, ReadReg1, ReadReg2;
	output [31:0] ReadData1, ReadData2;
	wire [31:0] decw;
	wire [31:0] andout;
	wire [31:0][31:0] q;
	genvar j, n;
	
	fiveToThirtyTwoDecoder dec(decw, WriteReg);
	generate
		for (j = 0; j < 32; j = j + 1) begin: reg_loop
			bit1_3to1and a1(andout[j], clk, RegWrite, decw[j]);
		end
	endgenerate
	
	generate
		for (n = 0; n < 32; n = n + 1) begin: and_loop
			reg_32bit reg1(q[n], WriteData, andout[n], reset);
		end
	endgenerate
	
	bit32_32to1mux(ReadData1, q[0], q[1], q[3], q[4], q[5], q[6], q[7], q[8], q[9], q[10], q[11], q[12], q[13], q[14], q[15], q[16], q[17], q[18], q[19], q[20], q[21], q[22], q[23], q[24], q[25], q[26], q[27], q[28], q[29], q[30], q[31], ReadReg1);
	bit32_32to1mux(ReadData2, q[0], q[1], q[3], q[4], q[5], q[6], q[7], q[8], q[9], q[10], q[11], q[12], q[13], q[14], q[15], q[16], q[17], q[18], q[19], q[20], q[21], q[22], q[23], q[24], q[25], q[26], q[27], q[28], q[29], q[30], q[31], ReadReg2);	
	
endmodule