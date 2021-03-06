`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:32:02 10/27/2017 
// Design Name: 
// Module Name:    memory_manager 
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
module memory_manager(	
						input				clock,
						input[23:0] 		addr_in_block1,						
						input[23:0] 		addr_in_block2,
//						input[23:0] 		addr_in_cell,						
						input[15:0]			data_in1,
						input[15:0]			data_in2,
						input				req,
						input				read_write1,
						input				read_write2,
						output reg[15:0]	data_out1,
						output reg[15:0]	data_out2,

					    );


	reg[15:0] block_data_in1 = 16'd0;
	reg[15:0] block_data_in2 = 16'd0;

	reg[15:0] block_data_out_1;
	reg[15:0] block_data_out_2;


	//////////////// Conditinons for actions  ///////////////////////

	// 1 is req hi
	// 2 is read or write => 
/*

input clka;
input [0 : 0] wea;
input [15 : 0] addra;
input [15 : 0] dina;
output [15 : 0] douta;
input clkb;
input [0 : 0] web;
input [15 : 0] addrb;
input [15 : 0] dinb;
output [15 : 0] doutb;
*/

	block_mem b_mem(
						.clka(clock),
						.wea(read_write),
						.addra(addr_in_block1),
						.dina(block_data_in1)
						.douta(block_data_out1),
						
						.clkb(clock),
						.web(read_write2),
						.addrb(addr_in_block2),
						.dinb(block_data_in2),
						.doutb(block_data_out2),
					);


	always @(*)
	begin			
		if(req == 1)
		begin
			if(read_write1 == 1)
				block_data_in1 = data_in1;
			else 
				block_data_in1 = 16'd0;												

			if(read_write2 == 1)
				block_data_in2 = data_in2;
			else 
				block_data_in2 = 16'd0;								

		end
		else 
		begin
			block_data_in1 = 16'd0;
			block_data_in2 = 16'd0;
		end
	end


	//Read


	/****
	SEQUENTIAL LOGIC

	****/
	always @(posedge clock)
	begin			

		if(req == 1)
			data_out_1 <= block_data_out1;
			data_out_2 <= block_data_out2;
		end
		else 
		begin
			data_out_1 <= 16'd0;
			data_out_2 <= 16'd0;
		end

		/// if cellular request, then wait 8 cycles else wait only 1 cycle

	end




endmodule

