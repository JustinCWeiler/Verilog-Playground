module dff #(parameter N=1) (
	input logic [N-1:0] d,
	output logic [N-1:0] q,
	input logic clk
);

	always_ff @(posedge clk)
		q <= d;

endmodule
