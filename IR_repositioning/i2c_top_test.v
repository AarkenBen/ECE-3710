`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:45:04 11/29/2017 
// Design Name: 
// Module Name:    i2c_top_test 
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
module i2c_top_test(
    input wire clk,
    input wire enable,
    inout wire SDA,
    inout wire SCL,
	 output wire [7:0] Led,
	 output wire analysis_clk
    );

	wire [15:0] packet_4;
	
	i2c i2c_testing (
    .ref_clk(clk), 
    .rst(0), 
    .en(enable), // need to tie this into the core some where
	 
    //.PTAT_packet(PTAT_packet), // might not need to store the reference temp
    //.packet_0(packet_0), 
    //.packet_1(packet_1), 
    //.packet_2(packet_2), 
    //.packet_3(packet_3), 
    .packet_4(packet_4), 
    //.packet_5(packet_5), 
    //.packet_6(packet_6), 
    //.packet_7(packet_7), 
    //.pec_data(pec_data), 	// also don't need to store this error
	 
    .SCL_OUT(SCL), 
    .SDA(SDA),
	 .clk(analysis_clk)
	 
    //.valid(valid) // this also needs to be tied into the core
    );

	assign Led = packet_4[9:2];
endmodule
