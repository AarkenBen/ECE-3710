`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:57:01 11/25/2017
// Design Name:   i2c
// Module Name:   C:/Users/User/Documents/GitHub/ECE-3710/IR_repositioning/i2c_test.v
// Project Name:  IR_repositioning
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: i2c
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module i2c_test;

	// Inputs
	reg clk;
	reg rst;
	reg en;
	//reg [7:0] data;

	// Outputs
	wire SDA;
	wire SCL;

	wire i2c_clk;



	// Instantiate the module
	//i2c_clk_div  instance_name (
    //.clk(clk), 
    //.rst(rst), 
    //.i2c_clk(i2c_clk)
    //);
	 
	// Instantiate the Unit Under Test (UUT)
	i2c uut (
		.ref_clk(clk), 
		.rst(rst), 
		//.data(data), 
		.SDA(SDA), 
		.SCL_OUT(SCL),
		.en(en)
	);


	

initial begin
	clk = 0;
	en = 0;
	
	forever begin
		clk = #5 ~clk;
		end
end

	initial begin

		// Initialize Inputs
	
		rst = 1;
		#10000
		
		//data = 0;
	
		rst = 0;
		
		#10000
		
		en = 1;
		
		#10000
		// Wait 100 ns for global reset to finish
		//#200000;
		
		en = 0;
		

        
		
		// Add stimulus here

	end
      
endmodule

