`include "DFF.v"

module  reg_32bit(q, d, clk, reset);
	input [31:0] d;
	input  reset, clk;
	output [31:0] q;
	genvar j;
	
	generate for (j = 0; j < 32; j = j + 1) begin: reg_loop
			dff_async_clear d(q[j], d[j], clk, reset);
		end
	endgenerate
	
endmodule