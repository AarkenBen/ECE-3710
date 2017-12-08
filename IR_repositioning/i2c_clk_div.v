`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:27:50 11/25/2017 
// Design Name: 
// Module Name:    i2c_clk_div 
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
module i2c_clk_div(
		input  		clk,
		//input  		rst,
		output reg	i2c_clk
    );



	//reg [9:0]cnt = 0;
	reg [16:0]cnt = 0;
	initial i2c_clk = 0;
	
	// count down timer
	always@(posedge clk)
	begin
		
			// 0 - 499
			//if(cnt == 32768)
			if(cnt == 131071)
			//if(cnt == 499)
				begin
					i2c_clk = ~i2c_clk;
					cnt = 0;
				end
			else
				begin
					cnt = cnt + 1'b1;
				end
			end
	
endmodule
