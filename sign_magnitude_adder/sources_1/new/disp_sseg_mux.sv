`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2024 08:36:16 PM
// Design Name: 
// Module Name: disp_sseg_mux
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


module disp_sseg_mux(
 input wire clk,
 input wire [6:0] in0, in1, in2, in3,
 output wire [3:0] an,
 output wire [6:0] sseg
    );
 
 logic [1:0] led;
 
 sseg_refresh_counter refcount_unit (.clk(clk), .LED_activating_counter(led));
 
 assign an = (led == 2'b00) ? 4'd1 :
             (led == 2'b01) ? 4'd2 :
             (led == 2'b10) ? 4'd4 : 4'd8;

 assign sseg = (led == 2'b00) ? in0 :
               (led == 2'b01) ? in1 :
               (led == 2'b10) ? in2 : in3;
               
endmodule
