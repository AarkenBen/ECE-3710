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
		input    				clk,
		input  		[1:0]		sw,
		input  		[15:0]	data_from_mem_to_vga,
		output	 	[23:0] 	vga_mem_addr,
		output 					hsync,
		output 					vsync,
		output [7:0] 			rgb
    );

	VGA_PIXEL_GENERATOR vpg(clk, sw, rgb, hsync, vsync, data_from_mem_to_vga, vga_mem_addr);
	
endmodule
