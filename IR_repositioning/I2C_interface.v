`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:10:52 11/15/2017 
// Design Name: 
// Module Name:    I2C_interface 
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
module I2C_interface(	input clk,
						output reg[7:0] byte1, 
						output reg[7:0] byte2, 
						output reg[7:0] byte3, 
						output reg[7:0] byte4, 
						output reg[7:0] byte5, 
						output reg[7:0] byte6, 
						output reg[7:0] byte7, 
						output reg[7:0] byte8, 
						output reg[7:0] byte9, 
						output reg[7:0] byte10, 
						output reg[7:0] byte11, 
						output reg[7:0] byte12, 
						output reg[7:0] byte13, 
						output reg[7:0] byte14, 
						output reg[7:0] byte15, 
						output reg[7:0] byte16, 
						output reg[7:0] byte17, 
						output reg[7:0] byte18, 
						output reg[7:0] byte19
					 );


	 localparam start	= 5'd0; 
	 localparam ADDR_W	= 5'd1;
	 localparam COMMAND	= 5'd2;
	 localparam REPEAT_START = 5'd3;
	 localparam ADDR_R	= 5'd4;
	 localparam PTAT_LO	= 5'd5;	 
	 localparam PTAT_HI	= 5'd6;
	 localparam PO_LO   = 5'd7; 
	 localparam PO_HI	= 5'd8; 
	 localparam P1_LO	= 5'd9; 
	 localparam P1_HI	= 5'd10; 
	 localparam P2_LO	= 5'd11; 
	 localparam P2_HI	= 5'd12; 
	 localparam P3_LO	= 5'd13; 
	 localparam P3_HI	= 5'd14; 
	 localparam P4_LO	= 5'd15; 
	 localparam P4_HI	= 5'd16; 
	 localparam P5_LO	= 5'd17; 
	 localparam P5_HI	= 5'd18; 
	 localparam P6_LO	= 5'd19; 
	 localparam P6_HI	= 5'd20; 
	 localparam P7_LO	= 5'd21;
	 localparam P7_HI	= 5'd22;
	 localparam PEC	= 5'd23;
	 localparam STOP = 5'd24;

	reg[4:0] state = 5'd0;
	reg[3:0] cycle = 4'd0;



	always@(posedge lead_clk_10khz)
	begin

	cycle <= cycle == 4'd8 ? 4'd0 : cycle + 1'b1;

		case(state)			
			start: 			begin state <=	cycle == 4'd8 ?  ADDR_W: state; end
			ADDR_W: 		begin state <=	cycle == 4'd8 ?  COMMAND: master_data_out == 0 ? STOP : state; end
			COMMAND: 		begin state <=	cycle == 4'd8 ?  REPEAT_START: master_data_out == 0 ? STOP : state; end 
			REPEAT_START: 	begin state <=	cycle == 4'd8 ?  ADDR_R: master_data_out == 0 ? STOP : state; end
			ADDR_R: 		begin state <=	cycle == 4'd8 ?  PTAT_LO: master_data_out == 0 ? STOP : state; end
			PTAT_LO:			begin state <=	cycle == 4'd8 ?  PTAT_HI : state; end
			PTAT_HI:			begin state <=	cycle == 4'd8 ?  PO_LO : state; end			
			PO_LO: 			begin state <=	cycle == 4'd8 ?  PO_HI : state; end
			PO_HI: 			begin state <=	cycle == 4'd8 ?  P1_LO : state; end
			P1_LO: 			begin state <=	cycle == 4'd8 ?  P1_HI : state; end
			P1_HI: 			begin state <=	cycle == 4'd8 ?  P2_LO : state; end
			P2_LO: 			begin state <=	cycle == 4'd8 ?  P2_HI : state; end
			P2_HI: 			begin state <=	cycle == 4'd8 ?  P3_LO : state; end
			P3_LO: 			begin state <=	cycle == 4'd8 ?  P3_HI : state; end
			P3_HI: 			begin state <=	cycle == 4'd8 ?  P4_LO : state; end
			P4_LO: 			begin state <=	cycle == 4'd8 ?  P4_HI : state; end
			P4_HI: 			begin state <=	cycle == 4'd8 ?  P5_LO : state; end
			P5_LO: 			begin state <=	cycle == 4'd8 ?  P5_HI : state; end
			P5_HI: 			begin state <=	cycle == 4'd8 ?  P6_LO : state; end
			P6_LO: 			begin state <=	cycle == 4'd8 ?  P6_HI : state; end
			P6_HI: 			begin state <=	cycle == 4'd8 ?  P7_LO : state; end
			P7_LO: 			begin state <=	cycle == 4'd8 ?  P7_HI : state; end
			P7_HI: 			begin state <=	cycle == 4'd8 ?  PEC : state; end
			PEC: 			begin state <= cycle == 4'd8 ? STOP : state; end
			STOP:			begin state <= state; end
			default: 		begin state <= start; cycle <= 4'd0; end
		endcase

		cur_byt_R <= state > PTAT_LO && state < PEC ? master_data_out : cur_byt_R;


	end

	reg cur_bit_W = 1'd0;
	reg[7:0] cur_byt_W = 8'd0;
	reg cur_bit_R = 1'd0;
	reg[7:0] cur_byt_R = 8'd0;
	reg master_data_out;
	reg master_clk = 1'bz;

	
	reg[13:0] cntr_10k = 14'd0;
	wire clk_10khz = cntr_10k > 14'd4999;
	wire lead_clk_10khz = (cntr_10k > 14'd3999) || (cntr_10k < 14'd500);

	// 10khz clk 
	always@(posedge clk)  //10Khz => 100Mhz/10,000 = 10khz -> T = 100uS
	begin
		cntr_10k <= cntr_10k < 14'd9999 ? cntr_10k + 1'd1 : 14'd0; 
	end

	always@(*)
	begin
		if(state == start)  // BEGIN COMMUNICTION
		begin
				// wait until 9th cycle to initiate start
				master_clk = 1'b1;
				master_data_out = (cycle == 4'd8) && (clk_10khz == 1'b1);
				cur_byt_W = 8'd0;
		end
		else if(state > 5'd0 && state < 5'd5) // Transmit states only
			begin
				master_data_out = state == REPEAT_START ? cycle < 4'd8 ? 1'b1 : 1'd0 : cycle < 4'd8 ? cur_byt_W[7 - cycle] : 1'bz;
				master_clk = state == REPEAT_START ? 1'd1: clk_10khz;

				if(state == ADDR_W) cur_byt_W = 8'b00010100; // Device ADDR 			 	
				else if(state == COMMAND) cur_byt_W = 8'b01001100; // COMMAND 0x4C -> 0100 1100
				else if(state == REPEAT_START) cur_byt_W = 8'd0; 
				else if(state == ADDR_R) cur_byt_W = 8'b00010100; // Device ADDR			 	
				else 
				  cur_byt_W = 8'd0; // ERROR					
			end
		else if( (state >= 5'd7 && state < 5'd24) || state == 5'd23 )  // Receive States Only
			begin
				master_data_out = cycle < 4'd8 ? 1'dz : 1'b1;  // Gives control to slave for first 8 cycles, goes HI on ninth to be pulled down in next state
				master_clk = cntr_10k;
				cur_byt_W = 8'd0;  // Not in use during reads

			end
		else if( state == STOP)  // END TRANSMISSION
			begin
				master_data_out = cycle < 2 ? 1'dz : 1'b1;  
				master_clk = 1'b1; 
				cur_byt_W = 1'd0;
			end
		else begin 	master_data_out = cycle < 2 ? 1'dz : 1'b1;  master_clk = 1'b1;  cur_byt_W = 8'd0; end  // ERROR OCCURED

	end



	always@(posedge lead_clk_10khz)
	begin
		if(state >= 5'd7 && state < 5'd24)
		begin
			byte1 <= cur_byt_R;
			byte2 <= byte1;
			byte3 <= byte2;
			byte4 <= byte3;
			byte5 <= byte4;
			byte6 <= byte5;
			byte7 <= byte6;
			byte8 <= byte7;
			byte9 <= byte8;
			byte10 <=byte9 ;
			byte11 <= byte10;
			byte12 <= byte11;
			byte13 <= byte12;
			byte14 <= byte13;
			byte15 <= byte14;
			byte16 <= byte15;
			byte17 <= byte16;
			byte18 <= byte17;
			byte19<= byte18;
		end
		else 
		begin
			byte1 <= byte1;
			byte2 <= byte2;
			byte3 <= byte3;		
			byte4 <= byte4;
			byte5 <= byte5;
			byte6 <= byte6;
			byte7 <= byte7;
			byte8 <= byte8;
			byte9 <= byte9;
			byte10 <= byte10;
			byte11 <= byte11;
			byte12 <= byte12;
			byte13 <= byte13;
			byte14 <= byte14;
			byte15 <= byte15;
			byte16 <= byte16;
			byte17 <= byte17;
			byte18 <= byte18;
			byte19 <= byte19;
		end
	end

endmodule
