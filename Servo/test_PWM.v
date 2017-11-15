`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:24:48 11/14/2017
// Design Name:   PWM_control
// Module Name:   C:/Users/Nickj/Documents/GitHub/ECE-3710/servo/test_PWM.v
// Project Name:  servo
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PWM_control
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_PWM;

	// Inputs
	reg clk;
	reg [8:0] theta;
	integer i = 0;
	// Outputs
	wire pulse;

	// Instantiate the Unit Under Test (UUT)
	PWM_control uut (
		.clk(clk), 
		.theta(theta), 
		.pulse(pulse)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		theta = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	for(i = 0; i < 100; i = i + 1)
	begin
		theta = theta + 1'd1;
		#80000000;  // 4 20ms cycles
	end

	end

	always 
	#5 clk = ~clk;




      
endmodule

