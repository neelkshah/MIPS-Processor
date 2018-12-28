module EX_MEM(new_content, control_signals, branch_target, zero, ALU_Output, read_Rt, destination_reg, clk, pwrite3);
	input pwrite3, clk, zero;
	input [31:0] read_Rt, ALU_Output, branch_target;
	input [4:0] destination_reg;
	input [5:0] control_signals;
	output [106:0] new_content;
	reg [106:0] new_content;
	
	always (@negedge clk) begin
		if(pwrite3)
			new_content <= {destination_reg, read_Rt, ALU_Output, zero, branch_target, control_signals};
		else
			new_content <= 107'b0;
	end
	
endmodule
