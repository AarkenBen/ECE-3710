`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:26:59 10/26/2017 
// Design Name: 
// Module Name:    core 
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
module core(	
				input clk,
				input[23:0] mem_out,
				input[7:0] servo_in,
				input[7:0] ir_in,
				output[23:0] mem_addr,
				output[7:0] ir_out,
				output[7:0] servo_out,

    		);

	reg[2:0] state = 4'd0;

	////// STATES ///////
	param fetch = 0;
	param fetch = 1;
	param fetch = 2;
	param fetch = 3;
	param fetch = 4;
	param fetch = 5;
	param fetch = 6;
	param fetch = 7;

	//////////////  STATES  ////////////////////

		//////////////  SEQUANTIAL STATES  ////////////////////

		always @(posedge clk)
		begin
			case(state)
			3'd0:	
			3'd1:
			3'd2:
			3'd3:
			3'd4:
			3'd5:
			3'd6:
			3'd7:

		end

		//////////////  COMBINATORIAL STATES  ////////////////////

		always @(*)
		begin

		end


endmodule
