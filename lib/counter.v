module counter #(parameter COUNT=1) (
	input clk, r,
	output t
);

	localparam WIDTH = $clog2(COUNT);
	wire [WIDTH-1:0] n;
	wire [WIDTH-1:0] next_n;

	assign next_n = n >= COUNT ? {WIDTH{1'd0}} : n + 1'd1;
	assign t = n >= COUNT;

	dffar flop (.d(next_n), .q(n), .clk(clk), .r(r));

endmodule
