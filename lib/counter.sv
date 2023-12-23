module counter #(parameter C=1) (
	input logic clk, r,
	output logic t
);

generate
	if (C == 1) begin : counter_eq_one
		assign t = 1'b1;
	end else begin : counter_gt_one

		localparam N = $clog2(C);

		logic [N-1:0] n;
		logic [N-1:0] next_n;

		logic n_is_max;
		logic next_n_is_max;

		assign t = n_is_max;

		always_comb begin
			next_n_is_max = n == C - 2;

			next_n = n_is_max ? 0 : n + 1;
		end

		dffsr #(N) n_flop (
			.d(next_n),
			.q(n),
			.r(r),
			.clk(clk)
		);

		dffsr n_is_max_flop (
			.d(next_n_is_max),
			.q(n_is_max),
			.r(r),
			.clk(clk)
		);

	end
endgenerate

endmodule
