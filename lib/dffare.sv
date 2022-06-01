module dffare #(parameter N=1) (
	input logic [N-1:0] d,
	output logic [N-1:0] q,
	input logic clk, r, e
);

	always_ff @(posedge clk, posedge r)
		if (r)
			q <= '0;
		else if (e)
			q <= d;
		else
			q <= q;

endmodule
