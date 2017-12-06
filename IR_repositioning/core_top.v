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
					//input	wire				reset,
					input	wire			clk,
					input wire[3:0]			sw,
					
					output wire				hsync,
					output wire				vsync,
					output wire[7:0] 		rgb,
					
					output wire				servo_pwm,
					
						
					inout wire SDA,
					output wire SCL,
					
					output wire[7:0] Led,
					input wire enable
					
					//output reg[7:0] 		VGA_pad,
					//output reg[7:0]		servo_pad//
			    );


	// VGA
	wire [15:0] data_from_mem_to_vga;
	wire [23:0] vga_mem_addr;
	
	// CORE
	wire [15:0] data_from_mem_to_core;
	wire [15:0] data_from_core_to_mem;
	wire [23:0] core_mem_addr;
	wire        write_en;

	wire [15:0] temp_0_testing16_wire;
	wire [15:0] temp_1_testing16_wire;
	wire [15:0] temp_2_testing16_wire;
	wire [15:0] temp_3_testing16_wire;
	wire [15:0] temp_4_testing16_wire;
	wire [15:0] temp_5_testing16_wire;
	wire [15:0] temp_6_testing16_wire;
	wire [15:0] temp_7_testing16_wire;



				core core1(
											.clk					(clk),
				 							.data_from_mem			(data_from_mem_to_core),	
											.data_from_core_to_mem	(data_from_core_to_mem),
				 							//.servo_in(),			//input[7:0] 
				 							//.ir_in(),				//input[7:0] 
				 							.mem_addr				(core_mem_addr),				//output[23:0]
											.write_en				(write_en)
				 							//.ir_out(),			//output[7:0]
				 							//.servo_out(),			//output[7:0]
    										);


				// Instantiate mem_manager
				memory_manager mem_manager1(
											//.reset					(reset),
											.clock1					(clk),
											.clock2           		(clk),
											.addr_in_block1 		(core_mem_addr),						
											.addr_in_block2			(vga_mem_addr),        // address from vga
											.data_in1 				(data_from_core_to_mem),
											.data_in2 				(16'd0),   // data -> vga
											.req					(1'b1),
											.read_write1			(write_en),
											.read_write2      		(1'b0),
											.data_out1				(data_from_mem_to_core),
											.data_out2				(data_from_mem_to_vga),
											.SDA					(SDA),
											.SCL					(SCL),
											.servo_angle			(angle),
											.temp_3_testing 		(Led),
											.temp_0_testing16       (temp_0_testing16_wire), // output
											.temp_1_testing16       (temp_1_testing16_wire), // output
											.temp_2_testing16       (temp_2_testing16_wire), // output
											.temp_3_testing16       (temp_3_testing16_wire), // output
											.temp_4_testing16       (temp_4_testing16_wire), // output
											.temp_5_testing16       (temp_5_testing16_wire), // output
											.temp_6_testing16       (temp_6_testing16_wire), // output
											.temp_7_testing16       (temp_7_testing16_wire), // output
											.enable_temps			(enable)
											);
				
				
				wire [15:0] angle;							
	
				VGA_GLPYH_TOP vga(
											.clk					(clk),
											.sw						(sw[1:0]),
											.data_from_mem_to_vga	(data_from_mem_to_vga),
											.vga_mem_addr			(vga_mem_addr),
											.hsync					(hsync),
											.vsync					(vsync),
											.rgb					(rgb),
											.temp_0_16              (temp_0_testing16_wire),
											.temp_1_16              (temp_1_testing16_wire),
											.temp_2_16              (temp_2_testing16_wire),
											.temp_3_16              (temp_3_testing16_wire),
											.temp_4_16              (temp_4_testing16_wire),
											.temp_5_16              (temp_5_testing16_wire),
											.temp_6_16              (temp_6_testing16_wire),
											.temp_7_16              (temp_7_testing16_wire)
										);
										

				
				servo_pwm servo(clk, angle, servo_pwm); 
				
				/*
				always@(*)
				begin
					if(sw[3:2] == 2'b00)
						angle = 16'd0;
					else if(sw[3:2] == 2'b01)
						angle = 16'd90;
					else if(sw[3:2] == 2'b10)
						angle = 16'd135;
					else
						angle = 16'd180;
				end
				*/

				// INSTANTIATE CELL MEM

				// INSTANTIATE SERVO CONTROL

				// INSTANTIATE IR SENSOR DECODER

				// INSTANTIATE CORE


endmodule
