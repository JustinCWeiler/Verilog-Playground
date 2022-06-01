module driver (
	input logic clk,
	output logic r, g, b
);

	logic [2:0] slow_clk;
	logic [2:0] int_clk;
	assign {r, g, b} = slow_clk;

	localparam OUT_F = 1;
	localparam INT0_F = 24_000_000;
	localparam INT1_F = 10_000;
	localparam INT2_F = 100;

	// 1
	clk_div #(.CLK_IN(48_000_000), .CLK_OUT(INT0_F)) int_div0 (
		.clk_in(clk),
		.clk_out(int_clk[0])
	);

	clk_div #(.CLK_IN(INT0_F), .CLK_OUT(OUT_F)) div0 (
		.clk_in(int_clk[0]),
		.clk_out(slow_clk[0])
	);

	// 2

	clk_div #(.CLK_IN(48_000_000), .CLK_OUT(INT1_F)) int_div1 (
		.clk_in(clk),
		.clk_out(int_clk[1])
	);

	clk_div #(.CLK_IN(INT1_F), .CLK_OUT(OUT_F)) div1 (
		.clk_in(int_clk[1]),
		.clk_out(slow_clk[1])
	);

	// 3

	clk_div #(.CLK_IN(48_000_000), .CLK_OUT(INT2_F)) int_div2 (
		.clk_in(clk),
		.clk_out(int_clk[2])
	);

	clk_div #(.CLK_IN(INT2_F), .CLK_OUT(OUT_F)) div2 (
		.clk_in(int_clk[2]),
		.clk_out(slow_clk[2])
	);

endmodule
