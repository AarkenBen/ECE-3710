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
						input	wire		reset,
						input	wire		clock1,
						input wire     clock2,
						input wire[23:0] 		addr_in_block1,						
						input wire[23:0] 		addr_in_block2,
//						input[23:0] 		addr_in_cell,						
						input wire[15:0]			data_in1,
						input wire[15:0]			data_in2,
						input	wire					req,
						input	wire					read_write1, // read write enable
						input	wire					read_write2, // read write enable
						output reg[15:0]	data_out1,
						output reg[15:0]	data_out2,
						
						inout wire SDA,
						output wire SCL,
						
						output reg[15:0] servo_angle,
						output wire[7:0] temp_3_testing,
						input wire enable_temps
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
	
	wire [15:0] packet_0;
	wire [15:0] packet_1;
	wire [15:0] packet_2;
	wire [15:0] packet_3;
	wire [15:0] packet_4;
	wire [15:0] packet_5;
	wire [15:0] packet_6;
	wire [15:0] packet_7;
	
	reg en;
	wire valid;
	reg io_read;
	reg [24:0] io_addr;
	
	reg [15:0] temp_0;
	reg [15:0] temp_1;
	reg [15:0] temp_2;
	reg [15:0] temp_3;
	reg [15:0] temp_4;
	reg [15:0] temp_5;
	reg [15:0] temp_6;
	reg [15:0] temp_7;
	
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
    .ref_clk(clock1), 
    .rst(1'b0), 
    .en(en), // need to tie this into the core some where
	 
    //.PTAT_packet(PTAT_packet), // might not need to store the reference temp
    .packet_0(packet_0), 
    .packet_1(packet_1), 
    .packet_2(packet_2), 
    .packet_3(packet_3), 
    .packet_4(packet_4), 
    .packet_5(packet_5), 
    .packet_6(packet_6), 
    .packet_7(packet_7), 
    //.pec_data(pec_data), 	// also don't need to store this error
	 
    .SCL_OUT(SCL), 
    .SDA(SDA), 
	 
    .valid(valid) // this also needs to be tied into the core
    );					

   assign temp_3_testing = packet_3[7:0];
	
	//Storing/reading values from temp sensor
	always@(posedge clock1)
	begin
		en <= 0;
		if(valid)
		begin
			temp_0 <= packet_0;
			temp_1 <= packet_1;
			temp_2 <= packet_2;
			temp_3 <= packet_3;
			temp_4 <= packet_4;
			temp_5 <= packet_5;
			temp_6 <= packet_6;
			temp_7 <= packet_7;
		end
		else
			en <= enable_temps;
	end


	always @(*)
	begin			
		data_out1 = block_data_out_1;
		data_out2 = block_data_out_2;
		
		if(io_read) //If needing to redirect IO to memory address
		begin
			case(io_addr)
				24'h002400: data_out1 = temp_0; //Temperature addresses
				24'h002401: data_out1 = temp_1;
				24'h002402: data_out1 = temp_2;
				24'h002403: data_out1 = temp_3;
				24'h002404: data_out1 = temp_4;
				24'h002405: data_out1 = temp_5;
				24'h002406: data_out1 = temp_6;
				24'h002407: data_out1 = temp_7;
			endcase
		end
	
	
		if(req == 1) //Writing to memory
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


	//Read from special I/O registers


	always @(posedge clock1)
	begin
		io_read <= 0;
		io_addr <= 0;
	
		if(read_write1)  //Writing reroute
		begin
			case(addr_in_block1)
				24'h002408: servo_angle <= data_in1; //Servo address
			endcase
		end
		else
		begin			//Reading reroute (have to output on next cycle to stay consistent.....)
			if(addr_in_block1 >= 24'h002400 && addr_in_block1 <= 24'h002407)
			begin
				io_read <= 1;
				io_addr <= addr_in_block1;
			end
		end
	end

endmodule
