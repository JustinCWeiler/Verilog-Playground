module dffe #(parameter WIDTH=1) (
	input [WIDTH-1:0] d,
	output [WIDTH-1:0] q,
	input clk, e
);

	always @(posedge clk)
		if (e)
			q <= d;
		else
			q <= q;

endmodule
