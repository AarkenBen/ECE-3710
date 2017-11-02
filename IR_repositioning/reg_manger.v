`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:40:12 10/30/2017 
// Design Name: 
// Module Name:    reg_manger 
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
module reg_manager(input clk,
				input[4:0] reg_index1,
				input[4:0] reg_index2,				
				input[15:0] w_data,
				input w_enable,
				output reg[15:0] read_reg_data1,
				output reg[15:0] read_reg_data2				
    			);


reg[15:0] r0 = 16'd0;
reg[15:0] r1 = 16'd0;
reg[15:0] r2 = 16'd0;
reg[15:0] r3 = 16'd0;
reg[15:0] r4 = 16'd0;
reg[15:0] r5 = 16'd0;
reg[15:0] r6 = 16'd0;
reg[15:0] r7 = 16'd0;
reg[15:0] r8 = 16'd0;
reg[15:0] r9 = 16'd0;
reg[15:0] r10 = 16'd0;
reg[15:0] r11 = 16'd0;
reg[15:0] r12 = 16'd0;
reg[15:0] r13 = 16'd0;
reg[15:0] r14 = 16'd0;
reg[15:0] r15 = 16'd0;
reg[15:0] r16 = 16'd0;
reg[15:0] r17 = 16'd0;
reg[15:0] r18 = 16'd0;
reg[15:0] r19 = 16'd0;
reg[15:0] r20 = 16'd0;
reg[15:0] r21 = 16'd0;
reg[15:0] r22 = 16'd0;
reg[15:0] r23 = 16'd0;
reg[15:0] r24 = 16'd0;
reg[15:0] r25 = 16'd0;
reg[15:0] r26 = 16'd0;
reg[15:0] r27 = 16'd0;
reg[15:0] r28 = 16'd0;
reg[15:0] r29 = 16'd0;
reg[15:0] r30 = 16'd0;
reg[15:0] r31 = 16'd0;

/**
module reg_file(input clk,
				input[4:0] reg_index,
				input w_enable,
				output reg[15:0] read_reg_data
    			);
*/
	/// Multiplex reg_index
	always @(*)
	begin
		case(reg_index1)
		
		5'd0: read_reg_data1 = r0;
		5'd1: read_reg_data1 = r1;
		5'd2: read_reg_data1 = r2;
		5'd3: read_reg_data1 = r3;
		5'd4: read_reg_data1 = r4;
		5'd5: read_reg_data1 = r5;
		5'd6: read_reg_data1 = r6;
		5'd7: read_reg_data1 = r7;
		5'd8: read_reg_data1 = r8;
		5'd9: read_reg_data1 = r9;
		5'd10: read_reg_data1 = r10;
		5'd11: read_reg_data1 = r11;
		5'd12: read_reg_data1 = r12;
		5'd13: read_reg_data1 = r13;
		5'd14: read_reg_data1 = r14;
		5'd15: read_reg_data1 = r15;
		5'd16: read_reg_data1 = r16;
		5'd17: read_reg_data1 = r17;
		5'd18: read_reg_data1 = r18;
		5'd19: read_reg_data1 = r19;
		5'd20: read_reg_data1 = r20;
		5'd21: read_reg_data1 = r21;
		5'd22: read_reg_data1 = r22;
		5'd23: read_reg_data1 = r23;
		5'd24: read_reg_data1 = r24;
		5'd25: read_reg_data1 = r25;
		5'd26: read_reg_data1 = r26;
		5'd27: read_reg_data1 = r27;
		5'd28: read_reg_data1 = r28;
		5'd29: read_reg_data1 = r29;
		5'd30: read_reg_data1 = r30;
		5'd31: read_reg_data1 = r31;
		endcase
	end


	/// Multiplex reg_index
	always @(*)
	begin
		case(reg_index1)
		
		5'd0: read_reg_data2 = r0;
		5'd1: read_reg_data2 = r1;
		5'd2: read_reg_data2 = r2;
		5'd3: read_reg_data2 = r3;
		5'd4: read_reg_data2 = r4;
		5'd5: read_reg_data2 = r5;
		5'd6: read_reg_data2 = r6;
		5'd7: read_reg_data2 = r7;
		5'd8: read_reg_data2 = r8;
		5'd9: read_reg_data2 = r9;
		5'd10: read_reg_data2 = r10;
		5'd11: read_reg_data2 = r11;
		5'd12: read_reg_data2 = r12;
		5'd13: read_reg_data2 = r13;
		5'd14: read_reg_data2 = r14;
		5'd15: read_reg_data2 = r15;
		5'd16: read_reg_data2 = r16;
		5'd17: read_reg_data2 = r17;
		5'd18: read_reg_data2 = r18;
		5'd19: read_reg_data2 = r19;
		5'd20: read_reg_data2 = r20;
		5'd21: read_reg_data2 = r21;
		5'd22: read_reg_data2 = r22;
		5'd23: read_reg_data2 = r23;
		5'd24: read_reg_data2 = r24;
		5'd25: read_reg_data2 = r25;
		5'd26: read_reg_data2 = r26;
		5'd27: read_reg_data2 = r27;
		5'd28: read_reg_data2 = r28;
		5'd29: read_reg_data2 = r29;
		5'd30: read_reg_data2 = r30;
		5'd31: read_reg_data2 = r31;
		endcase
	end

			/// Multiplex reg_index
	always @(*)
	begin
		case(reg_index1)
		
		5'd0: read_reg_data2 = r0;
		5'd1: read_reg_data2 = r1;
		5'd2: read_reg_data2 = r2;
		5'd3: read_reg_data2 = r3;
		5'd4: read_reg_data2 = r4;
		5'd5: read_reg_data2 = r5;
		5'd6: read_reg_data2 = r6;
		5'd7: read_reg_data2 = r7;
		5'd8: read_reg_data2 = r8;
		5'd9: read_reg_data2 = r9;
		5'd10: read_reg_data2 = r10;
		5'd11: read_reg_data2 = r11;
		5'd12: read_reg_data2 = r12;
		5'd13: read_reg_data2 = r13;
		5'd14: read_reg_data2 = r14;
		5'd15: read_reg_data2 = r15;
		5'd16: read_reg_data2 = r16;
		5'd17: read_reg_data2 = r17;
		5'd18: read_reg_data2 = r18;
		5'd19: read_reg_data2 = r19;
		5'd20: read_reg_data2 = r20;
		5'd21: read_reg_data2 = r21;
		5'd22: read_reg_data2 = r22;
		5'd23: read_reg_data2 = r23;
		5'd24: read_reg_data2 = r24;
		5'd25: read_reg_data2 = r25;
		5'd26: read_reg_data2 = r26;
		5'd27: read_reg_data2 = r27;
		5'd28: read_reg_data2 = r28;
		5'd29: read_reg_data2 = r29;
		5'd30: read_reg_data2 = r30;
		5'd31: read_reg_data2 = r31;
		endcase


	end
