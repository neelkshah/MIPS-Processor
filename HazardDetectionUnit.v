module HazardDetectionUnit(stall, Rs1, Rt1, Rt2, MemRead2, clk);
	input clk, MemRead2;
	input [4:0] Rs1, Rt1, Rt2;
	output [2:0] stall;
	
	always (@ negedge clk) begin
		if(MemRead2 & ((Rt2 = Rs1) | (Rt2 = Rt1)))
			stall <= 3'b000;
		else
			stall <= 3'b111;
	end
	
endmodule
