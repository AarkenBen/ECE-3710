`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:53:54 10/30/2017 
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
						input				reset,
						input				clock1,
						input          clock2,
						input[23:0] 		addr_in_block1,						
						input[23:0] 		addr_in_block2,
//						input[23:0] 		addr_in_cell,						
						input[15:0]			data_in1,
						input[15:0]			data_in2,
						input				req,
						input				read_write1, // read write enable
						input				read_write2, // read write enable
						output reg[15:0]	data_out1,
						output reg[15:0]	data_out2,
						
						output wire valid,
						inout  wire SDA,
						output wire SCL
					    );


	reg[15:0] block_data_in1 = 16'd0;
	reg[15:0] block_data_in2 = 16'd0;

	wire[15:0] block_data_out_1;
	wire[15:0] block_data_out_2;


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
 
 //synthesis attribute box_type block_mem "black_box"
	block_mem b_mem(
						.clka(clock1),
						.wea(read_write1),
						.addra(addr_in_block1[15:0]),
						.dina(block_data_in1),
						.douta(block_data_out_1),
						
						.clkb(clock2),
						.web(read_write2),
						.addrb(addr_in_block2[15:0]),
						.dinb(block_data_in2),
						.doutb(block_data_out_2)
					);


	i2c instance_name (
    .ref_clk(clk), 
    .rst(reset), 
    .en(en), // need to tie this into the core some where
	 
    .PTAT_packet(PTAT_packet), // might not need to store the reference temp
    .packet_0(packet_0), 
    .packet_1(packet_1), 
    .packet_2(packet_2), 
    .packet_3(packet_3), 
    .packet_4(packet_4), 
    .packet_5(packet_5), 
    .packet_6(packet_6), 
    .packet_7(packet_7), 
    .pec_data(pec_data), 	// also don't need to store this error
	 
    .SCL(SCL), 
    .SDA(SDA), 
	 
    .valid(valid) // this also needs to be tied into the core
    );					


	always @(*)
	begin			
	data_out1 = block_data_out_1;
	data_out2 = block_data_out_2;
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
	always @(posedge clock1)
	begin			

		if(req == 1)
		begin
			///data_out1 <= block_data_out_1;
			//data_out2 <= block_data_out_2;
		end
		else 
		begin
			//data_out1 <= 16'd0;
			//data_out2 <= 16'd0;
		end

		/// if cellular request, then wait 8 cycles else wait only 1 cycle

	end



endmodule
