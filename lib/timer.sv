module timer #(
	parameter CLK_RATE=48_000_000,
	parameter MULT=1,
	parameter DIV=1
)
(
	input clk,
	input r,
	output tick
);

	localparam C = (MULT * CLK_RATE) / DIV;

	counter #(C) counter_block (
		.clk(clk),
		.r(r),
		.t(tick)
	);

endmodule
