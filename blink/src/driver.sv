module driver (
	input logic clk,
	output logic r, g, b
);

	logic on;
	assign {r, g, b} = {3{on}};

	logic t;
	counter #(.C(48_000_000)) c (.clk(clk), .r(1'b0), .t(t));

	dffe flop (.d(~on), .q(on), .e(t), .clk(clk));

endmodule
