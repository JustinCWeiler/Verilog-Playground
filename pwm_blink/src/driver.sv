module driver (
	input clk,
	output r, g, b
);

	logic out;

	assign {r, g, b} = {3{out}};

	logic [7:0] red_val;

	logic tick;

	logic state;
	logic next_state;

	always_comb begin
		if (state && red_val == 8'hfe)
			next_state = 1'b0;
		else if (~state && red_val == 8'h01)
			next_state = 1'b1;
		else
			next_state = state;
	end

	timer #(
		.MULT(1),
		.DIV(256)
	) inc_red_val_timer (
		.clk(clk),
		.r(1'b0),
		.tick(tick)
	);

	pwm #(8) red_driver (
		.clk(clk),
		.off_time(8'hff -  red_val),
		.on_time(red_val),
		.set_time(1'b1),
		.out(out)
	);

	dffe #(8) red_val_flop (
		.clk(clk),
		.d(red_val + (state ? 8'h01 : 8'hff)),
		.q(red_val),
		.e(tick)
	);

	dffe state_flop (
		.clk(clk),
		.d(next_state),
		.q(state),
		.e(tick)
	);

endmodule
