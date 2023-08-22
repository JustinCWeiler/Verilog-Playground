module top (
	output led_red, led_green, led_blue
);

	logic sys_clk;
	SB_HFOSC #(
		.CLKHF_DIV("0b00")
	) u_SB_HFOSC (
		.CLKHFPU(1'b1),
		.CLKHFEN(1'b1),
		.CLKHF(sys_clk)
	);

	logic r, g, b;

	driver led_driver (
		.clk(sys_clk),
		.r(r),
		.g(g),
		.b(b)
	);

	SB_RGBA_DRV #(
		.CURRENT_MODE("0b1"),
		.RGB0_CURRENT("0b000001"),
		.RGB1_CURRENT("0b000001"),
		.RGB2_CURRENT("0b000001")
	) rgb (
		.RGBLEDEN (1'b1),
		.RGB0PWM  (g),
		.RGB1PWM  (b),
		.RGB2PWM  (r),
		.CURREN   (1'b1),
		.RGB0     (led_green),
		.RGB1     (led_blue),
		.RGB2     (led_red)
	);

endmodule
