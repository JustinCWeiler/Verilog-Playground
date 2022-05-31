module dffare #(parameter WIDTH=1) (
	input logic [WIDTH-1:0] d,
	output logic [WIDTH-1:0] q,
	input logic clk, r, e
);

	always_ff @(posedge clk, posedge r)
		if (r)
			q <= {WIDTH{1'b0}};
		else if (e)
			q <= d;
		else
			q <= q;

endmodule
