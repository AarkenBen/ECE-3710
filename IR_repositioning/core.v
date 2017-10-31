`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:55:25 10/30/2017 
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
				input      [15:0] data_from_mem,
				//input      [7:0]  servo_in,
				//input      [7:0]  ir_in,
				output reg [23:0] mem_addr,
				output reg        write_en
				//output reg [7:0]  ir_out,
				//output reg [7:0]  servo_out,

    		);

	// current info
	reg[31:0] current_instruction = 32'd0;
	reg[5:0] current_op_code = 6'd0;
	

	// program counter
	reg[23:0] pc = 24'd0;

	////// STATES ///////	
	reg[2:0] state = 4'd0;


	localparam fetch1 = 0;
	localparam fetch2 = 1;
	localparam decode1 = 2;
	localparam decode2 = 3;
	localparam execute = 4;
	localparam load1 = 5;
	localparam load2 = 6;
	localparam store = 7;
	//localparam fetch = 8;
	//localparam fetch = 7;
	
	
	
	
	localparam //AND = 6'b000000, OR = 6'b000001, NOT = 6'b000010, XOR = 6'b000011,
		        addu = 6'b000100, subu = 6'b000110,
				  loadL = 6'b100100,
				//  loadH = 6'b101000, 
				  writeL = 6'b101100, 
				 // writeH = 6'b110000,
				  jmp = 6'b100000;

	//////////////  STATES  ////////////////////

		//////////////  SEQUANTIAL STATES  ////////////////////
		always @(posedge clk)
		begin
			case(state)
				fetch1: state <= decode1;
				fetch2: state <= decode2;
				
				decode1: 
					begin
						// if one word
						if(current_op_code == addu || current_op_code == subu)
							state <= execute;
						// if two word
						else
							state <= fetch2;
					end
				
				decode2:
					begin
						if(current_op_code == loadL)
							state <= load1;
						else if(current_op_code == writeL)
							state <= store;
						else if(current_op_code == jmp)
							state <= fetch1;
						else
						state <= execute;
				
					end
				execute:
					begin
					
						if(current_op_code == addu || current_op_code == subu)
						begin
							state <= store;
						end	
					
				
					end
				load1:
					state <= load2;
				load2:
					state <= fetch1;
				store:
				begin
					
					state <= fetch1;
				end
			endcase
		end

		//////////////  COMBINATORIAL STATES  ////////////////////
		always@*
		begin
		
		
		write_en = 0;
		mem_addr = 24'd0;
		current_instruction = current_instruction;
		
		current_op_code = current_op_code;
		
			case(state)
				fetch1:
				begin
					mem_addr = pc;
					write_en = 0;
					
					pc = pc + 1'b1;
				end
				
				fetch2:
				begin
					mem_addr = pc;
					pc = pc + 1'b1;
				end
				
				decode1: 
				begin
					current_instruction = {data_from_mem[7:0], data_from_mem[15:8], 16'd0};
					
					
					current_op_code = data_from_mem[7:2];
					
					// one word
					if(data_from_mem[7:2] == addu || data_from_mem[7:2] == subu)
					begin
						 reg_ndx_1 = data_from_mem[9:5];
						 reg_ndx_2 = data_from_mem[4:0];
					end
					
					
					// memory instructions
					else if(data_from_mem[7:2] == loadL || data_from_mem[7:2] == writeL)
					begin
						reg_ndx_1 = {1'd0, data_from_mem[11:8]};
					end
					
					// one word and immediate
					//else if(current_op_code == jmp)
				
				end
				
				decode2:
				begin
					current_instruction = {current_instruction[31:16], data_from_mem[7:0], data_from_mem[15:8]};
					
					pc = pc;
					
					if(current_op_code == jmp)
						pc = current_instruction[22:0] + 1;
				end
				
				execute:
					begin
				
						if(current_op_code == addu)
							begin
								w_data = reg_right_data + reg_left_data; 
							
							end
						else if(current_op_code == subu)
							begin
								w_data = reg_right_data - reg_left_data ;
							
							end
					end
				
				
				
				load1:
					begin
						mem_addr = current_instruction[23:0];
						write_en = 1;
					end
					
				load2:
					write_en = 0;
						//w_data = data_from_mem;
				store:
				begin
					if(current_op_code == addu || current_op_code == subu)
					begin
						reg_w_en = 1;
					end
				
				end
				
			endcase
		end
		
		
		
		// register module
		wire [15:0] reg_left_data;
		wire [15:0] reg_right_data;
		reg  [15:0] store_to_reg;

		reg  [4:0]  reg_ndx_1 = 5'b0;
		reg  [4:0]  reg_ndx_2 = 5'b0;
		reg  [15:0] w_data;
		reg	  	   reg_w_en;
		
		
		reg_manager rm(.clk(clk),
				.reg_index1(reg_ndx_1),
				.reg_index2(reg_ndx_2),				
				.w_data(w_data),
				.w_enable(reg_w_en),
				.read_reg_data1(reg_left_data),
				.read_reg_data2(reg_right_data)
    			);


endmodule
