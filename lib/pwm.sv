module pwm #(
	parameter WIDTH = 1
)
(
	input clk,
	input [WIDTH-1:0] off_time,
	input [WIDTH-1:0] on_time,
	input set_time,

	output logic out
);

	localparam ZERO = {WIDTH{1'b0}};
	localparam ONE = {{WIDTH-1{1'b0}}, 1'b1};

	logic [WIDTH-1:0] _off_time;
	logic [WIDTH-1:0] _on_time;
	logic [WIDTH-1:0] counter;

	logic state;
	logic reset_counter = counter == (state ? _on_time : _off_time);

	always_comb begin
		if (_off_time == ZERO)
			out = 1'b1;
		else if (_on_time == ZERO)
			out = 1'b0;
		else
			out = state;
	end

	dffe #(2*WIDTH) set_time_flop (
		.clk(clk),
		.d({off_time, on_time}),
		.q({_off_time, _on_time}),
		.e(set_time)
	);

	dffsr #(WIDTH) counter_flop (
		.clk(clk),
		.d(counter + ONE),
		.q(counter),
		.r(reset_counter)
	);

	dffe state_flop (
		.clk(clk),
		.d(~state),
		.q(state),
		.e(reset_counter)
	);

endmodule
