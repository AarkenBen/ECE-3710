`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:52:57 10/30/2017 
// Design Name: 
// Module Name:    core_top 
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
module core_top(		
					input			 	clk,
					output[7:0] 		VGA_pad,
					output[7:0]			servo_pad
			    );


	//			wire[] mem_out_to_core	

//wire mem

/*
				core core1(
							.clock(clk),
				 			.mem_out(),				//input[23:0]
				 			//.servo_in(),				//input[7:0] 
				 			//.ir_in(),				//input[7:0] 
				 			.mem_addr(),				//output[23:0]
							.write_en()
				 			//.ir_out(),				//output[7:0]
				 			//.servo_out(),				//output[7:0]
    						);
							

				

				// Instantiate mem_manager
				mem_manager mem_manager1(
											.clock(clk)			//input				clock,
											//.input[23:0] 		addr_in_block1,						
														//input[23:0] 		addr_in_block2,
														//input[15:0]			data_in1,
														//input[15:0]			data_in2,
														//input				req,
														//input				read_write1,
														//input				read_write2,
														//output reg[15:0]	data_out1,
														//output reg[15:0]	data_out2,


											);

				// INSTANTIATE CELL MEM

				// INSTANTIATE SERVO CONTROL

				// INSTANTIATE IR SENSOR DECODER

				// INSTANTIATE CORE
*/
endmodule
