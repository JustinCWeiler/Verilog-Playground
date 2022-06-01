module counter #(parameter C=1) (
	input logic clk, r,
	output logic t
);

	localparam N = $clog2(C + 1);
	logic [N-1:0] n;
	logic [N-1:0] next_n;

	assign next_n = n == C - 1 ? '0 : n + 1'd1;
	assign t = n == C - 1;

	dffar #(N) flop (.d(next_n), .q(n), .clk(clk), .r(r));

endmodule
