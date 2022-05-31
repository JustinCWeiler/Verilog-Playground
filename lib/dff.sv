module dff #(parameter WIDTH=1) (
	input logic [WIDTH-1:0] d,
	output logic [WIDTH-1:0] q,
	input logic clk
);

	always_ff @(posedge clk)
		q <= d;

endmodule
