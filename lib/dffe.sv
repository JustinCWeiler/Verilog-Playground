module dffe #(parameter N=1) (
	input logic [N-1:0] d,
	output logic [N-1:0] q,
	input logic clk, e
);

	always_ff @(posedge clk)
		if (e)
			q <= d;
		else
			q <= q;

endmodule
