module driver (
	input wire clk,
	output wire r, g, b
);

	wire on;
	assign {r, g, b} = {3{on}};

	wire t;
	counter #(.COUNT(48_000_000)) c (.clk(clk), .r(1'b0), .t(t));

	dffe flop (.d(~on), .q(on), .e(t), .clk(clk));

endmodule
