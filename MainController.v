module MainControlUnit (RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, Jump, ALUOp, Op);
	input [5:0] Op;
	output RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, Jump;
	output [1:0] ALUOp;
	wire Rformat, lw, sw, beq;
	
	assign Rformat = (~Op[0]) & (~Op[1]) & (~Op[2]) & (~Op[3]) & (~Op[4]) & (~Op[5]);
	assign lw = (Op[0]) & (Op[1]) & (~Op[2]) & (~Op[3]) & (~Op[4]) & (Op[5]);
	assign sw = (Op[0]) & (Op[1]) & (Op[2]) & (Op[3]) & (~Op[4]) & (Op[5]);
	assign beq = (~Op[0]) & (~Op[1]) & (Op[2]) & (~Op[3]) & (~Op[4]) & (~Op[5]);
	assign Jump = (~Op[0]) & (Op[1]) & (~Op[2]) & (~Op[3]) & (~Op[4]) & (~Op[5]);
	assign RegDst = Rformat;
	assign ALUSrc = lw | sw;
	assign MemtoReg = lw;
	assign RegWrite = Rformat | lw;
	assign MemRead = lw;
	assign MemWrite = sw;
	assign Branch = beq;
	assign ALUOp[0] = Rformat;
	assign ALUOp[1] = beq;
	
endmodule