module clk_div #(parameter CLK_IN=48_000_000, parameter CLK_OUT=1) (
	input logic clk_in,
	output logic clk_out
);

	logic tick;
	dffe flop (
		.clk(clk_in),
		.d(~clk_out),
		.q(clk_out),
		.e(tick)
	);

	localparam AMOUNT = CLK_IN / CLK_OUT;

	counter #(AMOUNT) count (
		.clk(clk_in),
		.r(1'b0),
		.t(tick)
	);

endmodule
