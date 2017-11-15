`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:00:26 11/07/2017 
// Design Name: 
// Module Name:    PWM_control 
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
module PWM_control(	
						input clk,
						input[8:0] theta,  // theta represents approx .2 degrees per unit
						output pulse
    );

reg[7:0] divisions_360 = 8'd0;
reg[6:0] cntr_uS = 7'd0;
reg[14:0] count_to_20k_uS = 15'd0;
reg[5:0] count_0_20_uS;

wire uS_clk = cntr_uS < 50;
wire[9:0] duty_cycle_uS = {theta, 1'd0} < 1000 ? {theta, 1'd0} : 10'd1000;
wire nxt_pulse = count_to_20k_uS < (10'd999 + duty_cycle_uS);
assign pulse = nxt_pulse;

	always @(posedge clk)
	begin
		cntr_uS <= (cntr_uS < 7'd99) ? cntr_uS + 7'd1 : 7'd0;  // divides 100Mhz to 1/100 mS => 10ns -> 1uS
		if(cntr_uS == 7'd99)
			count_to_20k_uS <=  (count_to_20k_uS < 19999) ? count_to_20k_uS + 15'd1 :  15'd0; // count to 20000us -> 20ms
		else
			count_to_20k_uS <= count_to_20k_uS;
	end

endmodule

 	