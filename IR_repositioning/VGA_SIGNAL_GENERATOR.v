`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:58:14 09/16/2017 
// Design Name: 
// Module Name:    VGA_SIGNAL_GENERATOR 
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
module VGA_SIGNAL_GENERATOR(
		input clk,
		output reg req,
		output reg en,
		output reg[9:0] col,
      output reg[9:0] row,
		output reg hsync, vsync
    );
	 
		parameter frameWidth = 799;  // 800 - 1 entrie width of frame
		parameter frameHeight = 524; // 525 - 1 entire height of frame
		
		parameter hfp = 16; 		// horz front porch
		parameter hbp = 48; 		// hoz back porch
		parameter hsyncR = 96;	// hsync region
		
		parameter vfp = 10;		// vert front porch
		parameter vbp = 33;		// vert back  porch
		parameter vsyncR = 2;	// vsync region
		
		
		reg[1:0] pCnt;	// pixel count
		reg[9:0] hCnt;	// horizontal count
		reg[9:0] vCnt;	// vert-+ical count
		
		
		wire[9:0] nHCnt;	// next h count
		wire[9:0] nVCnt; 	// next v count
		
		wire nHsync; 		// next pixel is hsync region
		wire nVsync;		// next pixel is vsyng region
		
		// the pixel count has counted to 4
		assign pEn = &pCnt;
		
		// increment the next h count
		assign nHCnt = hCnt + 1'b1;
		
		// increment the next v count
		assign nVCnt = vCnt + 1'b1;
		
		// determine if in hsync region
		assign nHsync = nHCnt <(frameWidth - hsyncR) ? 1'b1 : 1'b0; // switch to greater
		
		// determine if the vsync region
		assign nVsync = nVCnt <(frameHeight - vsyncR) ? 1'b1 : 1'b0;
		
		
		always@(posedge clk)
		begin
			pCnt <= pCnt + 1'b1;
			hCnt <= pEn ? ((hCnt < frameWidth) ? hCnt + 1'b1: 1'b0) : hCnt;
			vCnt <= pEn ? (nHCnt == frameWidth) ? vCnt < frameHeight ? vCnt + 1'b1 : 1'b0 : vCnt : vCnt;
			
			// subtracted one because hcnt and vcnt are +1
			en <= ((col > 10'd48) && (col < 10'd688) && (row > 10'd32) && (row < 10'd513)) ? 1'b1 : 1'b0; 
			
			hsync <= nHsync; 
			vsync <= nVsync;
			
			col <= nHCnt;
			row <= nVCnt;
			
			
			//col <= hCnt;
			//row <= vCnt;
			
			req <= pEn;
		end
		

endmodule
