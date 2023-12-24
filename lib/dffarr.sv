module dffarr #(parameter N=1, parameter R=1'b0) (
	input logic [N-1:0] d,
	output logic [N-1:0] q,
	input logic clk, r
);

	always_ff @(posedge clk, posedge r)
		if (r)
			q <= R;
		else
			q <= d;

endmodule
