`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:47:56 09/16/2017 
// Design Name: 
// Module Name:    VGA_GLPYH_TOP 
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
module VGA_GLPYH_TOP(
		input wire				clk,
		input wire	[1:0]		sw,
		input wire	[15:0]	data_from_mem_to_vga,
		output wire[23:0] 	vga_mem_addr,
		output wire				hsync,
		output wire				vsync,
		output wire[7:0] 		rgb,
		input wire[15:0]		temp_0_16,
		input wire[15:0]		temp_1_16,
		input wire[15:0]		temp_2_16,
		input wire[15:0]		temp_3_16,
		input wire[15:0]		temp_4_16,
		input wire[15:0]		temp_5_16,
		input wire[15:0]		temp_6_16,
		input wire[15:0]		temp_7_16
    );

	VGA_PIXEL_GENERATOR vpg(		 	clk,
									 	sw,
									 	rgb,
									 	hsync,
									 	vsync,
									 	data_from_mem_to_vga,
									 	vga_mem_addr, 
										temp_0_16,
										temp_1_16,
										temp_2_16,
										temp_3_16,
										temp_4_16,
										temp_5_16,
										temp_6_16,
										temp_7_16
							);
	
endmodule
