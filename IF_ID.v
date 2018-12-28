module IF_ID(new_content, instruction, newPC, clk, pwrite1);
	input pwrite1, clk;
	input [31:0] instruction, newPC;
	output [63:0] new_content;
	reg [63:0] next;
	always (@negedge clk) begin
		if(pwrite1)
			new_content <= {instruction, newPC};
		else
			new_content <= 64'b0;
	
	end
	
endmodule
