module dffar #(parameter WIDTH=1) (
	input [WIDTH-1:0] d,
	output [WIDTH-1:0] q,
	input clk, r
);

	always @(posedge clk, posedge r)
		if (r)
			q <= {WIDTH{1'b0}};
		else
			q <= d;

endmodule
