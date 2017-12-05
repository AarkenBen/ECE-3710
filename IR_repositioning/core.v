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
				input wire clk,
				input wire [15:0] data_from_mem,
				//input      [7:0]  servo_in,
				//input      [7:0]  ir_in,
				output reg [15:0] data_from_core_to_mem,
				output reg [23:0] mem_addr,
				output reg        write_en
				//output reg [7:0]  ir_out,
				//output reg [7:0]  servo_out,
    		);

	// current info
	reg[31:0] current_instruction = 32'd0;
	reg[5:0] current_op_code = 6'd0;
	reg[15:0] current_immediate = 16'd0;   //All Immediate arithmetic should use only 16 bits!!! 
	
	// program counter
	reg[23:0] pc = 24'h2800;

	////// STATES ///////	
	reg[2:0] state = 3'd0;
	
	
	///// FLAGS /////////
	reg zero = 0;
	reg sign = 0;
	reg carry = 0;
	reg overflow = 0;
	wire [15:0] result;


	localparam fetch1 = 3'd0;
	localparam fetch2 = 3'd1;
	localparam decode1 = 3'd2;
	localparam decode2 = 3'd3;
	localparam execute = 3'd4;
	localparam load1 = 3'd5;
	localparam load2 = 3'd6;
	localparam store = 3'd7;
	//localparam fetch = 8;
	//localparam fetch = 7;
	
	
	
	
	localparam AND = 6'b000000,       OR = 6'b000001, 
			     NOT = 6'b000010,      XOR = 6'b000011,
		       addu = 6'b000100,     subu = 6'b000110,
				addui = 6'b000101,    subui = 6'b000111,
			shiftrli = 6'b001111,  shiftli = 6'b010001,
			 shiftrl = 6'b001110,   shiftl = 6'b010000,
			    jmpb = 6'b010110,    jmpbe = 6'b010111,
				 jmpa = 6'b011010,    jmpae = 6'b011011,
				 jmpe = 6'b011100,    jmpne = 6'b011101,
				  jmp = 6'b100000,
				  cmp = 6'b011110,
			   loadL = 4'b1001,      loadH = 6'b1010, 
			  writeL = 4'b1011,     writeH = 6'b1100;


	//////////////  STATES  ////////////////////
	
	
		//////////////  SEQUANTIAL STATES  ////////////////////
		always @(posedge clk)
		begin
			case(state)
				fetch1: 
					begin
						state <= decode1;
						pc = pc + 1'b1;	
					end
					
				fetch2: 
					begin
						state <= decode2;
					
						pc = pc + 1'b1;
					end
				
				decode1: 
					begin
					
						//current_instruction <= {data_from_mem[7:0], data_from_mem[15:8], 16'd0};
						current_instruction <= {data_from_mem, 16'd0};
					
						current_op_code <= data_from_mem[15:10];
						
						//TODO: Move index setting for multiword instructions to decode2

						// one word
						if(		data_from_mem[15:10] == addu 
								|| data_from_mem[15:10] == subu
								|| data_from_mem[15:10] == NOT
								|| data_from_mem[15:10] == XOR
								|| data_from_mem[15:10] == AND
								|| data_from_mem[15:10] == OR
								|| data_from_mem[15:10] == shiftrli
								|| data_from_mem[15:10] == shiftli //Not doing register versions
								|| data_from_mem[15:10] == cmp
							)																
						begin
							reg_ndx_1 <= data_from_mem[9:5];
							reg_ndx_2 <= data_from_mem[4:0];
							state <= execute;
						end
						// Two Word Arithmetic    
						else if( data_from_mem[15:10] == addui
								|| data_from_mem[15:10] == subui
								  )
						begin
							state <= fetch2;
						end
						// memory instructions
						else if(data_from_mem[15:12] == loadL || data_from_mem[15:12] == writeL)
						begin
							reg_ndx_1 <= 5'd0; //data_from_mem[9:5]; //delete me
							reg_ndx_2 <= {1'd0, data_from_mem[11:8]};
							state <= fetch2;
						end
						else if(data_from_mem[15:12] == loadH || data_from_mem[15:12] == writeH)
						begin
							reg_ndx_1 <= 5'd0;
							reg_ndx_2 <= {1'd1, data_from_mem[11:8]};
							state <= fetch2;
						end
						else if(data_from_mem[15:10] == jmp
						     || data_from_mem[15:10] == jmpb
							  || data_from_mem[15:10] == jmpbe
							  || data_from_mem[15:10] == jmpa
							  || data_from_mem[15:10] == jmpae
							  || data_from_mem[15:10] == jmpe
							  || data_from_mem[15:10] == jmpne)
						begin
							state <= fetch2;
						end
						else
						//When will we hit this case??
						begin
							reg_ndx_1 <= data_from_mem[9:5];
							reg_ndx_2 <= data_from_mem[4:0];
							state <= execute;
						end
						
					/*	// if one word
						if(      data_from_mem[15:10] == addu 
								|| data_from_mem[15:10] == subu
								|| data_from_mem[15:10] == NOT
								|| data_from_mem[15:10] == XOR)
							state <= execute;
						// if two word
						else
							state <= fetch2;*/
					end
				
				decode2:
					begin
						//current_instruction <= {current_instruction[31:16], data_from_mem[7:0], data_from_mem[15:8]};
						current_instruction <= {current_instruction[31:16], data_from_mem[15:0]};
						
						//pc <= pc;
						
						if(current_op_code == addui || current_op_code == subui)
						begin
							reg_ndx_1 <= data_from_mem[4:0];
							reg_ndx_2 <= data_from_mem[4:0];
							current_immediate <= {current_instruction[20:16],data_from_mem[15:5]}; //See ISA doc for structure of instruction
							state <= execute;
						end
						
						
						//else if(current_op_code == jmp)
						//begin
							//pc = current_instruction[22:0];
							//state <= fetch1;
						//end
						
						else if(current_op_code[5:2] == loadL || current_op_code[5:2] == loadH) //Because loadL is only highest 4 bits of opcode 
							state <= load1;
							
						else if(current_op_code[5:2] == writeL || current_op_code[5:2] == writeH) //Same as above comment
							state <= store;
							
						else if(current_op_code == jmp) 
						begin
							state <= fetch1;
							pc = {current_instruction[23:16], data_from_mem[15:0]};
						end
						else if(current_op_code == jmpb)  //Jump based on registers
						begin
							state<= fetch1;
							
							if(carry == 1)
								pc = {current_instruction[23:16], data_from_mem[15:0]};
						end
						else if(current_op_code == jmpbe)
						begin
							state<= fetch1;
							
							if(carry == 1 && zero == 1)
								pc = {current_instruction[23:16], data_from_mem[15:0]};
						end
						else if(current_op_code == jmpa)
						begin
							state<= fetch1;
							
							if(carry == 0 && zero == 0)
								pc = {current_instruction[23:16], data_from_mem[15:0]};
						end
						else if(current_op_code == jmpae)
						begin
							state<= fetch1;
							
							if(carry == 0)
								pc = {current_instruction[23:16], data_from_mem[15:0]};
						end
						else if(current_op_code == jmpe)
						begin
							state<= fetch1;
							
							if(zero == 1)
								pc = {current_instruction[23:16], data_from_mem[15:0]};
						end
						else if(current_op_code == jmpne)
						begin
							state<= fetch1;
							
							if(zero == 0)
								pc = {current_instruction[23:16], data_from_mem[15:0]};
						end
						else
							state <= execute;
				
					end
				execute:
					begin
						//Flag setting
						if(  current_op_code == cmp
						  || current_op_code == subu)
						begin	
							if(reg_right_data == reg_left_data)
								zero <= 1;
							else 
								zero <= 0;
								
							if(reg_right_data < reg_left_data)
								carry <= 1;
							else
								carry <= 0;
						end
						else if(current_op_code == subui)
						begin
							if(reg_right_data == current_immediate)
								zero <= 1;
							else 
								zero <= 0;
									
							if(reg_right_data < current_immediate) //If unsigned operation needs to carry
								carry <= 1;
							else
								carry <= 0;
						end
						
						
						//if(current_op_code == addu || current_op_code == subu)
						begin
							state <= fetch1;
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
		
		reg_w_en = 0;
		write_en = 0;
		mem_addr = 24'd0;
		data_from_core_to_mem = 16'd0;
		w_data = 16'd0;
		//current_instruction = current_instruction;
		
		//current_op_code = current_op_code;
		
			case(state)
				fetch1:
				begin
					mem_addr = pc;
				end
				
				fetch2:
				begin
					mem_addr = pc;
				end
				
				decode1: 
				begin
					
					
					
					// one word and immediate
					//else if(current_op_code == jmp)
				
				end
				
				decode2:
					begin
					
					end
				
				execute:
					begin
				
						if(current_op_code == addu)
							begin
								w_data = reg_right_data + reg_left_data;
								reg_w_en = 1;
							
							end
						else if(current_op_code == subu)
							begin
								w_data = reg_right_data - reg_left_data;
								reg_w_en = 1;
							end
						else if(current_op_code == addui)
							begin
								w_data = reg_right_data + current_immediate;
								reg_w_en = 1;
							end
						else if(current_op_code == subui)
							begin
								w_data = reg_right_data - current_immediate;
								reg_w_en = 1;
							end
						else if(current_op_code == AND)
							begin
								w_data = reg_right_data & reg_left_data;
								reg_w_en = 1;

							end
						else if(current_op_code == XOR)
							begin
								w_data = reg_right_data ^ reg_left_data;
								reg_w_en = 1;
							end
						else if(current_op_code == NOT)
							begin
								w_data = ~reg_left_data;
								reg_w_en = 1;
							end
						else if(current_op_code == OR)
							begin
								w_data = reg_right_data | reg_left_data;
								reg_w_en = 1;
							end
						else if(current_op_code == AND)
							begin
								w_data = reg_right_data & reg_left_data;
								reg_w_en = 1;
							end
						else if(current_op_code == shiftrli)
							begin
								w_data = reg_right_data >> current_instruction[25:21];
								reg_w_en = 1;
							end
						else if(current_op_code == shiftli)
							begin
							   w_data = reg_right_data << current_instruction[25:21];
								reg_w_en = 1;
							end
						else  // Default case, should'nt be executed
								w_data = reg_right_data;							
					end
				
				
				
				load1:
					begin
						mem_addr = current_instruction[23:0];
						write_en = 0;
					end
					
				load2:
					begin
						w_data = data_from_mem; //what we got from mem 
						reg_w_en = 1;
					end
						//w_data = data_from_mem;
				store:
					begin	
						mem_addr = current_instruction[23:0];
						data_from_core_to_mem = reg_right_data;
						write_en = 1;
					
					end
				
			endcase
		end
		
		
		
		// register module
		wire [15:0] reg_left_data;
		wire [15:0] reg_right_data;
		//reg  [15:0] store_to_reg; // prob delete

		reg  [4:0]  reg_ndx_1 = 5'd0;
		reg  [4:0]  reg_ndx_2 = 5'd0;
		reg  [15:0] w_data;
		reg	  	   reg_w_en = 1'b0;
		
		
		reg_manager rm(.clk(clk),
				.reg_index1(reg_ndx_1),
				.reg_index2(reg_ndx_2),				
				.w_data(w_data),
				.w_enable(reg_w_en),
				.read_reg_data1(reg_left_data),
				.read_reg_data2(reg_right_data)
    			);


endmodule
