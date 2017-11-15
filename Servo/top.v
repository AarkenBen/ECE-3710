`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:27:32 11/14/2017 
// Design Name: 
// Module Name:    top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module top(	
			input clock,
			output JD,
			input[7:0] switches
    );

	
	reg single_bit = 1'd0;

	PWM_control pwm1(
						.clk(clock),
						.theta({switches, single_bit}),  // theta represents approx .3 degrees per unit
						.pulse(JD)
					);

endmodule
