module ID_EX(new_content, control_signals, newPC, lower26, read_Rs, read_Rt, sign_extended32, clk, pwrite2);
	input pwrite2, clk;
	input [31:0] sign_extended32, read_Rs, read_Rt, newPC;
	input [25:0] lower26;
	input [9:0] control_signals;
	output [163:0] new_content;
	reg [163:0] new_content;
	
	always (@ negedge clk) begin
		if(pwrite2)
			new_content <= {sign_extended32, read_Rs, read_Rt, lower26, newPC, control_signals};
		else
			new_content <= 164'b0;
	end
	
endmodule
