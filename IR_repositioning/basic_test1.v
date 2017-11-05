`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:17:54 11/02/2017
// Design Name:   core_top
// Module Name:   C:/Users/Nickj/Desktop/NickFall2017/ECE_3710/GROUP_FPGA_PROJECT/IR_repositioning/basic_test1.v
// Project Name:  IR_repositioning
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: core_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module basic_test1;

	// Inputs
	reg clk;
	reg [1:0] sw;

	// Outputs
	wire hsync;
	wire vsync;
	wire [7:0] rgb;

	// Instantiate the Unit Under Test (UUT)
	core_top uut (
		.clk(clk), 
		.sw(sw), 
		.hsync(hsync), 
		.vsync(vsync), 
		.rgb(rgb)
	);

	initial begin
		// Initialize Inputs
		sw = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
		clk = 0;
		sw = 0;
        
		// Add stimulus here
	end


		always 
		begin
		#5 clk = ~clk;
		end
      
endmodule

