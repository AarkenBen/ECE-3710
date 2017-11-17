`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:15:19 11/16/2017 
// Design Name: 
// Module Name:    servo_pwm 
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
module servo_pwm(
					input clk,
					input [15:0] angle,
					output reg pwm
    );

	wire [17:0] pulse_length;
	
	from_angle_to_pulse_length converter(angle, pulse_length);
	
	reg  [20:0] current_count = 0;
	
	always@(posedge clk)
	begin
	
		if(current_count == 21'd2_000_000) //Entire cycle is ~20ms
		begin
			current_count <= 0; //Start back count
			pwm <= 1'b1; //Start pulse
		end
		else if(current_count >= pulse_length) //If we reached the width of the pulse, set down to zero
		begin
			pwm <= 1'b0;
			current_count <= current_count + 1'b1;
		end
		else
			current_count <= current_count + 1'b1;
			
	end

endmodule
