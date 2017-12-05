`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:08:45 11/16/2017 
// Design Name: 
// Module Name:    from_angle_to_pulse_length 
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
module from_angle_to_pulse_length(
					input wire [15:0] angle, //UNSIGNED NUMBER!!!!
					output reg [17:0] pulse_length //Only need 17 bits since max number output is 210,000
    );


	// Min lengths is .6ms and max is 2.1ms
	//100,000 cycles per ms (on a 100MHz clock rate)
	localparam min_pulse_length = 18'd60000, max_pulse_length = 18'd210000, 
				conversion_rate = (max_pulse_length - min_pulse_length)/18'd180;
	
	
	// 210000 = x(180) + 60000 // 150000 = 180x // x = 150000/180
	
	always@(*)
	begin
		if(angle > 16'd180)
			pulse_length = 18'd210000;
		else
			//pulse_length = (18'd833) * (angle) + 18'd60000;
			pulse_length = (conversion_rate * angle)+ min_pulse_length;
			
	end
endmodule
