`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:57:51 09/16/2017 
// Design Name: 
// Module Name:    VGA_PIXEL_GENERATOR 
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
module VGA_PIXEL_GENERATOR(
		input clk,
		input       [1:0]sw,
		output reg  [7:0] color,
		output hs, vs,
		input  		[15:0]	data_from_mem_to_vga,
		output  	[23:0]vga_mem_addr,
		input 		[15:0]temp_0_16,
		input 		[15:0]temp_1_16,
		input 		[15:0]temp_2_16,
		input 		[15:0]temp_3_16,
		input 		[15:0]temp_4_16,
		input 		[15:0]temp_5_16,
		input 		[15:0]temp_6_16,
		input 		[15:0]temp_7_16
    );
		parameter BLACK = 8'b00000000;
		parameter WHITE = 8'b11111111;
		parameter RED = 8'b11100000; //changed because latch issues. 
		parameter BLUE = 8'b11111111;
		parameter X = 8'b11011100;
		parameter Y = 8'b10101011;
		parameter Z = 8'b00001011;
	 
	 // state for ram access
	 reg[1:0] state;
	 
	 // value to use the next color
	 reg[7:0] tempColor = 8'b00000000;
	 
	 // beginning of random #
	 reg[30:0] seed = 31'b101_0011_1101_1011_0011_0101_0111_1110;
	 
	 // pixel is within 640x480 window
	 //assign drawAbleRange =  (col > 10'd47 && col < 10'd687 && row > 10'd32 && row < 10'd512);
	 
	 assign checker = row[4]^col[4];

	 // Temperature Grid
	 assign temp_grid_view = (trow >= 360 && trow < 480);
	 reg [7:0]TemperatureColr = 8'd0;

	localparam IR_addr0 = 24'h002400;
	localparam IR_addr1 = 24'h002401;
	localparam IR_addr2 = 24'h002402;
	localparam IR_addr3 = 24'h002403;
	localparam IR_addr4 = 24'h002404;
	localparam IR_addr5 = 24'h002405;
	localparam IR_addr6 = 24'h002406;
	localparam IR_addr7 = 24'h002407;

	 reg[15:0] color_i_temp = 7'd0;

	 always@(*)
	 begin
	 	if(tcol >= 0 && tcol < 80) color_i_temp = temp_0_16;
	 	else if(tcol >= 80 && tcol< 160 )   color_i_temp = temp_1_16;
	 	else if(tcol >= 160 && tcol < 240)  color_i_temp = temp_2_16;
	 	else if(tcol >= 240 && tcol < 320)  color_i_temp = temp_3_16;
	 	else if(tcol >= 320 && tcol < 400)  color_i_temp = temp_4_16;
	 	else if(tcol >= 400 && tcol < 480)  color_i_temp = temp_5_16;
	 	else if(tcol >= 480 && tcol < 560)  color_i_temp = temp_6_16;
	 	else if(tcol >= 560 && tcol < 640)  color_i_temp = temp_7_16;
	 	else 
		begin
			 	color_i_temp = temp_0_16;
	    end	 
	 	 
	 end

	reg[2:0] red = 3'd0;
	reg[2:0] green = 3'd0;
	reg[1:0] blue = 3'd0;

	 always@(*)
	 begin
		if(color_i_temp >= 16'd0 && color_i_temp < 16'd25_0)//1   Dark Blue
		begin
			red = 3'd0;
			green = 3'd0;
			blue = 2'd1;
		end
		else if(color_i_temp >= 16'd25_0 && color_i_temp < 16'd27_0)//2  Light Blue
		begin
			red = 3'd0;
			green = 3'd5;
			blue = 2'd2;
		end
		else if(color_i_temp >= 16'd27_0 && color_i_temp < 16'd29_0)//3  Mystery Inbetween Color
		begin
			red = 3'd4;
			green = 3'd5;
			blue = 2'd3;
		end
		else if(color_i_temp >= 16'd29_0 && color_i_temp < 16'd31_0)//4  Yellow
		begin
			red = 3'd7;
			green = 3'd7;
			blue = 2'd0;
		end
		else if(color_i_temp >= 16'd31_0 && color_i_temp < 16'd33_0)//5 Orange
		begin
			red = 3'd7;
			green = 3'd3;
			blue = 2'd0;
		end
		else if(color_i_temp >= 16'd33_0 && color_i_temp < 16'd35_0)//6 Bright Red
		begin
			red = 3'd7;
			green = 3'd0;
			blue = 2'd0;
		end
		else
		begin																			//7 Dark Red
			red = 3'd2;
			green = 3'd0;
			blue = 2'd0;
		end
	 end
	 
	 always@(posedge clk)
	 begin
			tcol <= tcol;
			trow <= trow;
		 
		// advance the state
		state <= state + 1'b1;
		
		// random number gen
		seed <= {seed[28:0], seed[30]^seed[27], seed[29]^seed[28]};
		
		// checker
		if(sw == 2'b00)
			tempColor <= req ? en ? checker ? RED : BLUE : BLACK : tempColor;
		
		// snow
		else if(sw == 2'b01)
			tempColor <= req ? en ? seed[7:0] : BLACK : tempColor;
		// glyphs
		else if(sw == 2'b10)
		begin
			//tempColor <= req ? en ? temp_grid_view ? TemperatureColr : RED : seed[7:0] : tempColor; 
			tempColor <= en ? temp_grid_view ? {red, green, blue} : BLACK : BLACK;
		end
		else
		begin
			if(state == 2'b11)
			tempColor <= en ? trow[0] ? DOUTA[tcol[2:0]]? WHITE:BLACK : DOUTA[tcol[2:0] + 4'd8] ? WHITE : BLACK : BLACK;
		end

		if(state == 2'b0)
		begin
			tcol <= col - 6'd48;
			trow <= row - 6'd33;
		end
		
		color <= tempColor;
					
	 end
	 
	 always@(*)
	 begin
		
		//ADDRA = ADDRA;
		
		// calc address for text
		if(state == 2'b01)
			ADDRA = {({trow[9:3],7'b0} + tcol[9:3])};	

		// calc address for glpyh
		else if(state == 2'b10)
			ADDRA = {14'h2000 + {DOUTA[7:0],2'b0} + {trow[2:1]}};

		// added to avoid latching for incomplete statement
		else
			ADDRA = 14'b0;
	
	 end
	 
		reg [9:0] tcol;	// logical column counter
		reg [9:0] trow;	// logical row counter
		wire [9:0] col;	// column counter
		wire [9:0] row;	// row counter
		wire 	req;			// pixel end
		wire  en;		 	// in the drawable range 
		reg [13:0] ADDRA = 14'b0;	// address into memory at this address
		wire[15:0] DOUTA;	// receive data from memory
	
	// pixel generator. Location, and req
	VGA_SIGNAL_GENERATOR vsg(.clk(clk), .req(req), .en(en), .col(col), .row(row), .hsync(hs), .vsync(vs));
	 
	// ram 
	// 
	//VGA_RAM_1 r(.clka(clk), .wea(1'b0), .addra(ADDRA), .dina(16'b0), .douta(DOUTA));
	
	assign vga_mem_addr = {10'd0 , ADDRA};
	assign DOUTA = data_from_mem_to_vga;

	

	
		
endmodule
