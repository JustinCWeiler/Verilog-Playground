module counter #(parameter COUNT=1) (
	input logic clk, r,
	output logic t
);

	localparam WIDTH = $clog2(COUNT);
	logic [WIDTH-1:0] n;
	logic [WIDTH-1:0] next_n;

	assign next_n = n >= COUNT ? {WIDTH{1'd0}} : n + 1'd1;
	assign t = n >= COUNT;

	dffar #(WIDTH) flop (.d(next_n), .q(n), .clk(clk), .r(r));

endmodule
