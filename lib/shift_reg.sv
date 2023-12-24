module shift_reg #(
	parameter WIDTH = 8
)
(
	input clk, en, r,
	input in,
	output [WIDTH-1:0] out
);

	dffsre #(WIDTH) shift_flop (
		.clk(clk),
		.e(en),
		.r(r),
		.d({in, out[WIDTH-1:1]}),
		.q(out)
	);

endmodule
