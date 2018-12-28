module dff_async_clear(q, d, clk, reset);
	input d, reset, clk;
	output q;
	reg q;
	
	always @ (posedge reset or negedge clk)
	begin
		if (!reset) q <= 1'b0;
		else q <= d;
	end
	
endmodule
