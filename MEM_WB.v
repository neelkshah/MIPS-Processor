module MEM_WB(new_content, control_signals, memory_data, ALU_Output, destination_reg, clk, pwrite4);
	input pwrite4, clk;
	input [31:0] ALU_Output, memory_data;
	input [4:0] destination_reg;
	input [1:0] control_signals;
	output [72:0] new_content;
	reg [72:0] new_content;
	
	always (@ negedge clk) begin
		if(pwrite4)
			new_content <= {destination_reg, ALU_Output, memory_data, control_signals};
		else
			new_content <= 73'b0;
	end
	
endmodule
