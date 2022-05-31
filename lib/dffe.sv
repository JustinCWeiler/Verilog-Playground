module dffe #(parameter WIDTH=1) (
	input logic [WIDTH-1:0] d,
	output logic [WIDTH-1:0] q,
	input logic clk, e
);

	always_ff @(posedge clk)
		if (e)
			q <= d;
		else
			q <= q;

endmodule
