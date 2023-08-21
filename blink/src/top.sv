module top (
	output logic led_red, led_green, led_blue
);

	logic sys_clk;
	SB_HFOSC #(
		.CLKHF_DIV("0b00")
	) u_SB_HFOSC (
		.CLKHFPU(1'b1),
		.CLKHFEN(1'b1),
		.CLKHF(sys_clk)
	);

	logic led_r, led_g, led_b;

	driver dut (.clk(sys_clk), .r(led_r), .g(led_g), .b(led_b));

	SB_RGBA_DRV #(
		.CURRENT_MODE("0b1"),
		.RGB0_CURRENT("0b000001"),
		.RGB1_CURRENT("0b000001"),
		.RGB2_CURRENT("0b000001")
	) rgb (
		.RGBLEDEN (1'b1),
		.RGB0PWM  (led_g),
		.RGB1PWM  (led_b),
		.RGB2PWM  (led_r),
		.CURREN   (1'b1),
		.RGB0     (led_green),
		.RGB1     (led_blue),
		.RGB2     (led_red)
	);

endmodule
