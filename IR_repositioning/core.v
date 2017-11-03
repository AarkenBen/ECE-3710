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
				output reg [15:0] data_from_core_to_mem,
				output reg [23:0] mem_addr,
				output reg        write_en
				//output reg [7:0]  ir_out,
				//output reg [7:0]  servo_out,

    		);

	// current info
	reg[31:0] current_instruction = 32'd0;
	reg[5:0] current_op_code = 6'd0;
	
	// program counter
	reg[23:0] pc = 24'h2800;

	////// STATES ///////	
	reg[2:0] state = 3'd0;


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
	
	
	
	
	localparam AND = 6'b000000, // OR = 6'b000001, 
			   NOT = 6'b000010, 
			   XOR = 6'b000011,
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
					
						current_instruction <= {data_from_mem[7:0], data_from_mem[15:8], 16'd0};
					
					
						current_op_code <= data_from_mem[7:2];
						
						
/// !!!!!!!!!!!!!!!!!!! Not working as expected? transitioned from decode1 to fetch2 where data from mem[7:2] == 00100
/// !!!!!!!!!!!!!!!!!!! Not working as expected? transitioned from decode1 to fetch2 where data from mem[7:2] == 00100
						// one word
						if(data_from_mem[7:2] == addu || data_from_mem[7:2] == subu)
						begin
							reg_ndx_1 <= data_from_mem[9:5];
							reg_ndx_2 <= data_from_mem[4:0];
						end
/// !!!!!!!!!!!!!!!!!!! Not working as expected? transitioned from decode1 to fetch2 where data from mem[7:2] == 00100					
/// !!!!!!!!!!!!!!!!!!! Not working as expected? transitioned from decode1 to fetch2 where data from mem[7:2] == 00100
					
						// memory instructions
						else if(data_from_mem[7:2] == loadL || data_from_mem[7:2] == writeL)
						begin
							reg_ndx_1 <= data_from_mem[9:5]; //delete me
							reg_ndx_2 <= {1'd0, data_from_mem[11:8]};
						end
						
						else
						begin
							reg_ndx_1 <= data_from_mem[9:5];
							reg_ndx_2 <= data_from_mem[4:0];
						end
						
						// if one word
						if(data_from_mem[7:2] == addu || data_from_mem[7:2] == subu)
							state <= execute;
						// if two word
						else
							state <= fetch2;
					end
				
				decode2:
					begin
						current_instruction <= {current_instruction[31:16], data_from_mem[7:0], data_from_mem[15:8]};
						
						//pc <= pc;
					
						if(current_op_code == jmp)
							pc = current_instruction[22:0];
						
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
					write_en = 0;
					
					
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
						else if(current_op_code == AND)
							begin
								w_data = reg_right_data & reg_left_data;
							end
						else if(current_op_code == XOR)
							begin
								w_data = reg_right_data ^ reg_left_data;
							end
						else if(current_op_code == NOT)
							begin
								w_data = !reg_left_data;
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
