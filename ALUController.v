module ALUControlUnit (Operation, FuncField, ALUOp);
	input [5:0] FuncField;
	input [1:0] ALUOp;
	output [2:0] Operation;
	wire and_out, or_out;
	
	and a1(and_out, ALUOp[1], FuncField[1]);
	or o1(Operation[2], ALUOp[0], and_out);
	or o2(or_out, FuncField[0], FuncField[3]);
	and a2(Operation[0], ALUOp[1], or_out);
	nand(Operation[1], ALUOp[1], FuncField[2]);
	
endmodule