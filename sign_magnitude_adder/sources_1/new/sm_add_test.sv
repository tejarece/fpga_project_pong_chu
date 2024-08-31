`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2024 08:29:39 PM
// Design Name: 
// Module Name: sm_add_test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module sm_add_test(
 input wire clk,
 input wire [1:0] btn, // Selection signal of a mux to route an operand or the sum to the display circuit
 input wire [7:0] sw, // two 4-bit inputs
 output wire [3:0] an,
 output wire [6:0] sseg
    );
    
// signal declaration
wire [3:0] sum, oct;
wire [6:0] led3, led2, led1, led0;
logic [3:0] mout;

// Instantiate adder
sign_magnitude_adder #(.N(4)) sm_adder_unit (.a(sw[3:0]), .b(sw[7:4]), .sum(sum));

// Magnitude displayed on rightmost 7-seg LED
always_comb begin
 case (btn)
    2'b00: mout = sw[3:0];
    2'b01: mout = sw[7:4];
    default: mout = sum;
 endcase
end
/*
assign mout = (btn == 2'b00) ? sw[3:0] :
              (btn == 2'b01) ? sw[7:4] :
              (btn == 2'b10) ? sum : 4'b0000;
*/             
assign oct = {1'b0, mout[2:0]};

// Instantiate the hex decoder
hex_to_sseg sseg_unit (.hex(oct), .sseg(led0));

// Sign displayed on 2nd 7-seg LED// middle LED bar on for negative number
assign led1 = mout[3] ? 7'b111_111_0 : 7'b111_111_1;
// blank two other LEDs
assign led2 = 7'b111_111_1;
assign led3 = 7'b111_111_1;

// Instantiate 7-seg LED display time-muxing module
disp_sseg_mux disp_unit (.clk(clk), .in0(led0), .in1(led1), .in2(led2), .in3(led3), .an(an), .sseg(sseg));

endmodule
