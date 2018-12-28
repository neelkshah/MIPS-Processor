module DataForwardingUnit(forwardA, forwardB, Rs2, Rt2, destreg3, destreg4, RegWrite3, RegWrite4, clk);	// Rs2 = ID_EX.Rs; Rt2 = ID_EX.Rt; destreg3 = EX_MEM.destination_reg; destreg4 = MEM_WB.destination_reg; RegWrite3 = EX_MEM.control_signals.RegWrite; RegWrite4 = MEM_WB.control_signals.RegWrite
	input RegWrite3, RegWrite4, clk;
	input [4:0] Rs2, Rt2, destreg3, destreg4;
	output [1:0] forwardA, forwardB;
	
	always (@ negedge clk) begin
		if(RegWrite3 & (destreg3 != 0) & (destreg3 = Rs2))
			forwardA <= 2'b10;
		else if(RegWrite4 & (destreg4 != 0) & (destreg3 != Rs2) & (destreg4 = Rs2))
			forwardA <= 2'b01;
		else
			forwardA <= 2'b00;
	end
	
	always (@ negedge clk) begin
		if(RegWrite3 & (destreg3 != 0) & (destreg3 = Rt2))
			forwardB <= 2'b10;
		else if(RegWrite4 & (destreg4 != 0) & (destreg3 != Rt2) & (destreg4 = Rt2))
			forwardB <= 2'b01;
		else
			forwardB <= 2'b00;
	end
	
endmodule
