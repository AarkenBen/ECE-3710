`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:00:10 11/21/2017 
// Design Name: 
// Module Name:    i2c 
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
module i2c(
		input wire 		ref_clk,
		
		input wire  	en,
		
		//output reg [15:0] PTAT_packet,
		output reg [15:0] packet_0,
		output reg [15:0] packet_1,
		output reg [15:0] packet_2,
		output reg [15:0] packet_3,
		output reg [15:0] packet_4,
		output reg [15:0] packet_5,
		output reg [15:0] packet_6,
		output reg [15:0] packet_7,
		//	output reg [7:0] pec_data,
	
		inout wire 	SCL_OUT,
		inout  wire		SDA,
		
		output reg		valid
    );

	reg [15:0]PTAT_packet = 16'd0;
	reg [15:0]pec_data = 16'd0;

	wire clk;
	wire SCL;
	
	i2c_clk_div clk_div(
    .clk(ref_clk), 
    //.rst(rst), 
    .i2c_clk(clk)
    );
	 
	localparam 	idle = 0;
	localparam 	start = 1;
	localparam 	addr = 2;
	localparam 	write = 3;
	localparam 	w_ack = 4;
	localparam  start_2_1 = 50;
	localparam 	start_2_2= 5;
	localparam 	stop = 6;
	localparam 	w_ack2 = 7;
	localparam 	command = 8;
	localparam  addr_2 = 9;
	localparam  read = 10;
	localparam  read_ack = 40;
	localparam	before_stop = 51;
	
	localparam  PTAT_lo = 11;
	localparam  r_ack_ptat_lo = 41;
	localparam  PTAT_hi = 12;
	localparam  r_ack_ptat_hi = 29;
	
	localparam  state_pack_0_lo = 13;
	localparam  r_ack_0_lo = 42;		
	localparam  state_pack_0_hi = 14;
	localparam  r_ack_0_hi = 30;
	
	localparam  state_pack_1_lo = 15;
	localparam  r_ack_1_lo = 43;
	localparam  state_pack_1_hi = 16;
	localparam  r_ack_1_hi = 31;
	
	localparam  state_pack_2_lo = 17;
	localparam  r_ack_2_lo = 44;
	localparam  state_pack_2_hi = 18;
	localparam  r_ack_2_hi = 32;
	
	localparam  state_pack_3_lo = 19;
	localparam  r_ack_3_lo = 45;
	localparam  state_pack_3_hi = 20;
	localparam  r_ack_3_hi = 33;
	
	localparam  state_pack_4_lo = 21;
	localparam  r_ack_4_lo = 46;
	localparam  state_pack_4_hi = 22;
	localparam  r_ack_4_hi = 34;
	
	localparam  state_pack_5_lo = 23;
	localparam  r_ack_5_lo = 47;
	localparam  state_pack_5_hi = 24;
	localparam  r_ack_5_hi = 35;
	
	localparam  state_pack_6_lo = 25;
	localparam  r_ack_6_lo = 48;
	localparam  state_pack_6_hi = 26;
	localparam  r_ack_6_hi = 36;
	
	localparam  state_pack_7_lo = 27;
	localparam  r_ack_7_lo = 49;
	localparam  state_pack_7_hi = 28;
	localparam  r_ack_7_hi = 37;
	
	localparam  PEC = 38;
	localparam  NACK = 39;

// next = 
	
	reg		 	sda_out;
	reg			sda_en;
	reg [8:0] 	state = 0;
	reg [5:0]	last_state = 0;
	reg [2:0] 	ndx;
	reg [2:0]	last_ndx;
	reg 		scl_en = 0;
	

	wire [6:0] address = 7'h0A; // I/R sensor's address
	wire [7:0] data = 8'h4c;
	
	//assign SDA = sda_en ? sda_out : 1'bz;
	assign SDA = (sda_en && sda_out == 0) ? 1'b0 : 1'bz;
	assign SCL = (scl_en == 0) ? 1'b1 : ~clk;
	assign SCL_OUT = (SCL) ? 1'bz : 1'b0; //Just incase slave tries to clock stretch.....
														//Outputs are on pullup resistors so High Z is same as 1
	
	/*
		caller check if ready is high (posedge).
		
		look for negedge of ready after start is raised
		
		after start is raised look for the negedge of ready
		
		look for poseedge of ready
	
	*/
	//assign valid = ((state == idle ) && (rst == 0))? 1'b1 : 1'b0;
	
	
	always@(negedge clk)
	begin
		/*if(rst)
		begin
			scl_en <= 0;

			PTAT_packet <= 15'b0;
			packet_0 <= 15'b0;
			packet_1 <= 15'b0;
			packet_2 <= 15'b0;
			packet_3 <= 15'b0;
			packet_4 <= 15'b0;
			packet_5 <= 15'b0;
			packet_6 <= 15'b0;
			packet_7 <= 15'b0;
			pec_data <= 8'b0;
		end
		else
		begin*/
			if((state == idle) || (state == start) || (state == stop) || (state == start_2_2)) //(state == start_2_1) ||
			begin
				scl_en <= 0;
			end
			else
			begin
				scl_en <= 1;
			end
			
			case(last_state)
			PTAT_lo:
				begin
					PTAT_packet[last_ndx] <= SDA;
				end
				
			PTAT_hi:
				begin
					PTAT_packet[last_ndx+8] <= SDA;
				end
	
			state_pack_0_lo:
				begin
					packet_0[last_ndx] <= SDA;
				end
				
			state_pack_0_hi:
				begin
					packet_0[last_ndx+8] <= SDA;
				end	
			
			state_pack_1_lo:
				begin
					packet_1[last_ndx] <= SDA;
				end
				
			state_pack_1_hi:
				begin
					packet_1[last_ndx+8] <= SDA;
				end	
			
			state_pack_2_lo:
				begin
					packet_2[last_ndx] <= SDA;
				end
				
			state_pack_2_hi:
				begin
					packet_2[last_ndx+8] <= SDA;
				end	
	
			state_pack_3_lo:
				begin
					packet_3[last_ndx] <= SDA;
				end
				
			state_pack_3_hi:
				begin
					packet_3[last_ndx+8] <= SDA;
				end	
			
			state_pack_4_lo:
				begin
					packet_4[last_ndx] <= SDA;
				end
				
			state_pack_4_hi:
				begin
					packet_4[last_ndx+8] <= SDA;
				end	
	
			state_pack_5_lo:
				begin
					packet_5[last_ndx] <= SDA;
				end
				
			state_pack_5_hi:
				begin
					packet_5[last_ndx+8] <= SDA;
				end	
			
			state_pack_6_lo:
				begin
					packet_6[last_ndx] <= SDA;
				end

				
			state_pack_6_hi:
				begin
					packet_6[last_ndx+8] <= SDA;
				end	
			
			state_pack_7_lo:
				begin
					packet_7[last_ndx] <= SDA;
				end
				
			state_pack_7_hi:
				begin
					packet_7[last_ndx+8] <= SDA;
				end	
			
			
			PEC:
				begin
					pec_data[last_ndx] <= SDA;
				end
			endcase
		//end
	
	end
	
	
	always@(posedge clk)
	begin
		
		// reset the state machine
		/*if(rst)
		begin
		
			state <= 0;
			sda_en <= 1;
			sda_out <= 1;
			
						
			ndx <= 3'b0;
			valid <= 0;
			

			
		end // end if
		else 
		begin */
			last_state <= state[5:0];
			last_ndx <= ndx;
			case(state)
			idle: 			
				begin
					sda_out <= 1;
					sda_en <= 1;
					valid <= 0;
					
					if(en  == 1) 	state <= start;	
					else				state <= idle;
				end
			
			start: 
				begin // start
					sda_out <= 0;
					sda_en <= 1;
					ndx <= 3'd6;
					state <= addr;
				end
			
			addr:
				begin
					sda_out <= address[ndx];
					sda_en <= 1;
					if(ndx == 0) state <= write;
					else ndx <= ndx - 3'd1;
				end
		
			write:	
				begin	
					sda_out <= 0;
					sda_en <= 1;
					state <= w_ack;
				end
			
			w_ack:
				begin
				// logic to determine if ack was high
					sda_en <= 0;
					state <= command;
					ndx <= 3'd7;
				end
			
			command:
				begin
					sda_en <= 1;
					sda_out <= data[ndx]; 
					if(ndx == 0) state <= w_ack2;
					else ndx <= ndx - 3'd1;
				end
			
			w_ack2:
				begin
					sda_en <= 0;
					state <= start_2_1;
				end
			
			start_2_1:
				begin
					sda_out <= 1;
					sda_en <= 1;
					state <= start_2_2;	
				end
			
			start_2_2: 
				begin // start
					sda_out <= 0;
					sda_en <= 1;
					ndx <= 3'd6;
					state <= addr_2;
				end
			
			addr_2:
				begin
					sda_out <= address[ndx];
					sda_en <= 1;
					if(ndx == 0) state <= read;
					else ndx <= ndx - 3'd1;
				end
			////////////////////////////////////////////////////
			read:
				begin
					sda_out <= 1;
					sda_en <= 1;
					state <=  read_ack;
				end
				
			read_ack:
				begin
					sda_en <= 0;
					state <= PTAT_lo;
					ndx <= 3'd7;
				end
	
			PTAT_lo:
				begin
					sda_en <= 0;
					//PTAT_packet[ndx] <= SDA;
					if(ndx == 0) 	state <= r_ack_ptat_lo;
					else 				
						begin
							state <= PTAT_lo;
							ndx <= ndx - 3'd1;
						end
				end
		
			r_ack_ptat_lo:
				begin
					sda_out <= 0;
					sda_en <= 1;
					state <= PTAT_hi;
					ndx <= 3'd7;
				end
				
			PTAT_hi:
				begin
					sda_en <= 0;
					//PTAT_packet[8+ndx] <= SDA;
					if(ndx == 0) 	state <= r_ack_ptat_hi;
					else 				
						begin
							state <= PTAT_hi;
							ndx <= ndx - 3'd1;
						end
				end
				
			r_ack_ptat_hi:
				begin
					sda_out <= 0;
					sda_en <= 1;
					state <= state_pack_0_lo;
					ndx <= 3'd7;
				end
	
			state_pack_0_lo:
				begin
					sda_en <= 0;
					//packet_0[ndx] <= SDA;
					if(ndx == 0) 	state <= r_ack_0_lo;
					else 				
						begin
							state <= state_pack_0_lo;
							ndx <= ndx - 3'd1;
						end
				end
				
			r_ack_0_lo:
				begin
					sda_out <= 0;
					sda_en <= 1;
					state <= state_pack_0_hi;
					ndx <= 3'd7;
				end
				
			state_pack_0_hi:
				begin
					sda_en <= 0;
					//packet_0[ndx+8] <= SDA;
					if(ndx == 0) 	state <= r_ack_0_hi;
					else 				
						begin
							state <= state_pack_0_hi;
							ndx <= ndx - 3'd1;
						end
				end	
			
			r_ack_0_hi:
				begin
					sda_out <= 0;
					sda_en <= 1;
					state <= state_pack_1_lo;
					ndx <= 3'd7;
				end
			
			
			state_pack_1_lo:
				begin
					sda_en <= 0;
					//packet_1[ndx] <= SDA;
					if(ndx == 0) 	state <= r_ack_1_lo;
					else 				
						begin
							state <= state_pack_1_lo;
							ndx <= ndx - 3'd1;
						end
				end
				
			r_ack_1_lo:
				begin
					sda_out <= 0;
					sda_en <= 1;
					state <= state_pack_1_hi;
					ndx <= 3'd7;
				end
				
			state_pack_1_hi:
				begin
					sda_en <= 0;
					//packet_1[ndx+8] <= SDA;
					if(ndx == 0) 	state <= r_ack_1_hi;
					else 				
						begin
							state <= state_pack_1_hi;
							ndx <= ndx - 3'd1;
						end
				end	
			
			r_ack_1_hi:
				begin
					sda_out <= 0;
					sda_en <= 1;
					state <= state_pack_2_lo;
					ndx <= 3'd7;
				end
			
			state_pack_2_lo:
				begin
					sda_en <= 0;
					//packet_2[ndx] <= SDA;
					if(ndx == 0) 	state <= r_ack_2_lo;
					else 				
						begin
							state <= state_pack_2_lo;
							ndx <= ndx - 3'd1;
						end
				end
				
			r_ack_2_lo:
				begin
					sda_out <= 0;
					sda_en <= 1;
					state <= state_pack_2_hi;
					ndx <= 3'd7;
				end
				
			state_pack_2_hi:
				begin
					sda_en <= 0;
					//packet_2[ndx+8] <= SDA;
					if(ndx == 0) 	state <= r_ack_2_hi;
					else 				
						begin
							state <= state_pack_2_hi;
							ndx <= ndx - 3'd1;
						end
				end	
			
			r_ack_2_hi:
				begin
					sda_out <= 0;
					sda_en <= 1;
					state <= state_pack_3_lo;
					ndx <= 3'd7;
				end
	
			state_pack_3_lo:
				begin
					sda_en <= 0;
					//packet_3[ndx] <= SDA;
					if(ndx == 0) 	state <= r_ack_3_lo;
					else 				
						begin
							state <= state_pack_3_lo;
							ndx <= ndx - 3'd1;
						end
				end
				
			r_ack_3_lo:
				begin
					sda_out <= 0;
					sda_en <= 1;
					state <= state_pack_3_hi;
					ndx <= 3'd7;
				end
				
			state_pack_3_hi:
				begin
					sda_en <= 0;
					//packet_3[ndx+8] <= SDA;
					if(ndx == 0) 	state <= r_ack_3_hi;
					else 				
						begin
							state <= state_pack_3_hi;
							ndx <= ndx - 3'd1;
						end
				end	
			
			r_ack_3_hi:
				begin
					sda_out <= 0;
					sda_en <= 1;
					state <= state_pack_4_lo;
					ndx <= 'd7;
				end
			
			state_pack_4_lo:
				begin
					sda_en <= 0;
					//packet_4[ndx] <= SDA;
					if(ndx == 0) 	state <= r_ack_4_lo;
					else 				
						begin
							state <= state_pack_4_lo;
							ndx <= ndx - 3'd1;
						end
				end
				
			r_ack_4_lo:
				begin
					sda_out <= 0;
					sda_en <= 1;
					state <= state_pack_4_hi;
					ndx <= 3'd7;
				end
				
			state_pack_4_hi:
				begin
					sda_en <= 0;
					//packet_4[ndx+8] <= SDA;
					if(ndx == 0) 	state <= r_ack_4_hi;
					else 				
						begin
							state <= state_pack_4_hi;
							ndx <= ndx - 3'd1;
						end
				end	
			
			r_ack_4_hi:
				begin
					sda_out <= 0;
					sda_en <= 1;
					state <= state_pack_5_lo;
					ndx <= 3'd7;
				end
	
			state_pack_5_lo:
				begin
					sda_en <= 0;
					//packet_5[ndx] <= SDA;
					if(ndx == 0) 	state <= r_ack_5_lo;
					else 				
						begin	
							state <= state_pack_5_lo;
							ndx <= ndx - 3'd1;
						end
				end
				
			r_ack_5_lo:
				begin
					sda_out <= 0;
					sda_en <= 1;
					state <= state_pack_5_hi;
					ndx <= 3'd7;
				end
				
			state_pack_5_hi:
				begin
					sda_en <= 0;
					//packet_5[ndx+8] <= SDA;
					if(ndx == 0) 	state <= r_ack_5_hi;
					else 				
						begin
							state <= state_pack_5_hi;
							ndx <= ndx - 3'd1;
						end
				end	
			
			r_ack_5_hi:
				begin
					sda_out <= 0;
					sda_en <= 1;
					state <= state_pack_6_lo;
					ndx <= 3'd7;
				end
			
			state_pack_6_lo:
				begin
					sda_en <= 0;
					//packet_6[ndx] <= SDA;
					if(ndx == 0) 	state <= r_ack_6_lo;
					else 				
						begin
							state <= state_pack_6_lo;
							ndx <= ndx - 3'd1;
						end
				end
				
			r_ack_6_lo:
				begin
					sda_out <= 0;
					sda_en <= 1;
					state <= state_pack_6_hi;
					ndx <= 3'd7;
				end
				
			state_pack_6_hi:
				begin
					sda_en <= 0;
					//packet_6[ndx+8] <= SDA;
					if(ndx == 0) 	state <= r_ack_6_hi;
					else 				
						begin
							state <= state_pack_6_hi;
							ndx <= ndx - 3'd1;
						end
				end	
			
			r_ack_6_hi:
				begin
					sda_out <= 0;
					sda_en <= 1;
					state <= state_pack_7_lo;
					ndx <= 3'd7;
				end
			
			state_pack_7_lo:
				begin
					sda_en <= 0;
					//packet_7[ndx] <= SDA;
					if(ndx == 0) 	state <= r_ack_7_lo;
					else 				
						begin
							state <= state_pack_7_lo;
							ndx <= ndx - 3'd1;
						end
				end
				
			r_ack_7_lo:
				begin
					sda_out <= 0;
					sda_en <= 1;
					state <= state_pack_7_hi;
					ndx <= 3'd7;
				end
				
			state_pack_7_hi:
				begin
					sda_en <= 0;
					//packet_7[ndx+8] <= SDA;
					if(ndx == 0) 	state <= r_ack_7_hi;
					else 				
						begin
							state <= state_pack_7_hi;
							ndx <= ndx - 3'd1;
						end
				end	
			
			r_ack_7_hi:
				begin
					sda_out <= 0;
					sda_en <= 1;
					state <= PEC;
					ndx <= 3'd7;
				end
	
			
			PEC:
				begin
					sda_en <= 0;
					//pec_data[ndx] <= SDA;
					if(ndx == 0) 	state <= NACK;
					else 				
						begin
							state <= PEC;
							ndx <= ndx - 3'd1;
						end
				end
			
			NACK:
				begin
					sda_out <= 1;
					sda_en <= 1;
					state <= before_stop;
				end
	
			before_stop:
				begin
					sda_out <= 0;
					sda_en <= 1;
					state <= stop;
				
				end
	
	////////////////////////////////////////////////////////////////
			stop:
				begin
					valid <= 1;
					sda_out <= 1;
					state <= idle;
				end
		endcase
			
		//end // end else
		
	end // end always	
endmodule
