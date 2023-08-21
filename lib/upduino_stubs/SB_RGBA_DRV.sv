module SB_RGBA_DRV #(
	parameter CURRENT_MODE = "",
	parameter RGB0_CURRENT = "",
	parameter RGB1_CURRENT = "",
	parameter RGB2_CURRENT = ""
)
(
	input logic CURREN, RGBLEDEN, RGB0PWM, RGB1PWM, RGB2PWM,
	output logic RGB0, RGB1, RGB2
);
endmodule
