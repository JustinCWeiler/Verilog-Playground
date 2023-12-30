module pwm #(
	parameter WIDTH = 1
)
(
	input clk,
	input [WIDTH-1:0] off_cyc,
	input [WIDTH-1:0] on_cyc,
	input set_time,

	output logic out
);

	logic [WIDTH-1:0] _off_cyc;
	logic [WIDTH-1:0] _on_cyc;
	logic [WIDTH-1:0] counter;

	logic state;
	logic reset_counter = counter == (state ? _on_cyc : _off_cyc) - 1;

	always_comb begin
		if (_off_cyc == 0)
			out = 1'b1;
		else if (_on_cyc == 0)
			out = 1'b0;
		else
			out = state;
	end

	dffe #(2*WIDTH) set_time_flop (
		.clk(clk),
		.d({off_cyc, on_cyc}),
		.q({_off_cyc, _on_cyc}),
		.e(set_time)
	);

	dffsr #(WIDTH) counter_flop (
		.clk(clk),
		.d(counter + 1),
		.q(counter),
		.r(reset_counter | set_time)
	);

	dffsre state_flop (
		.clk(clk),
		.d(~state),
		.q(state),
		.r(set_time),
		.e(reset_counter)
	);

endmodule
