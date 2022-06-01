module driver (
	input logic clk,
	output logic r, g, b
);

	logic slow_clk;
	assign {r, g, b} = {3{slow_clk}};

	clk_div #(.CLK_IN(48_000_000), .CLK_OUT(10)) cd (
		.clk_in(clk),
		.clk_out(slow_clk)
	);

endmodule
