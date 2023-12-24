module dffsrre #(parameter N=1, parameter R=1'b0) (
	input logic [N-1:0] d,
	output logic [N-1:0] q,
	input logic clk, r, e
);

	always_ff @(posedge clk)
		if (e)
			if (r)
				q <= R;
			else
				q <= d;
		else
			q <= q;

endmodule
