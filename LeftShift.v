module LeftShift(out, in);
	input [31:0] in;
	output [31:0] out;
	assign out = {in[29:0], 1'b0, 1'b0};
endmodule