module dff #(parameter WIDTH=1) (
	input [WIDTH-1:0] d,
	output [WIDTH-1:0] q,
	input clk
);

	always @(posedge clk)
		q <= d;

endmodule
