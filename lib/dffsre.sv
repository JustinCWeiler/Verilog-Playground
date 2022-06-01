module dffsre #(parameter WIDTH=1) (
	input logic [WIDTH-1:0] d,
	output logic [WIDTH-1:0] q,
	input logic clk, r, e
);

	always_ff @(posedge clk)
		if (e)
			if (r)
				q <= '0;
			else
				q <= d;
		else
			q <= q;

endmodule
