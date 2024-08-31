`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2024 08:41:26 PM
// Design Name: 
// Module Name: sseg_refresh_counter
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
/* The Basys3 FPGA has a clock source of 100MHz and we need a 1ms - 16ms refresh period or
   a 1KHz - 60Hz refresh rate. Lets choose a a refresh period of 10.5ms (digit period = 10.5/4 = 2.6ms)
   so that we can use a 20-bit counter for creating the refresh period with the first 2 MSB bits of the counter
   for creating LED-activating signals (digit period for 2.6ms)
*/

module sseg_refresh_counter(
 input wire clk, // 100MHz source clk on the board
 output wire [1:0] LED_activating_counter // 2-bit output for LED activation control
    );
logic [19:0] refresh_counter = '0;

// Refresh counter increments with each clock cycle. Given a 100MHz clock, it will take approximately 10.5ms to count
// from 0 to its maximum value (2^20 - 1)
always_ff @(posedge clk) begin
 refresh_counter <= refresh_counter + 1'b1;
end

// Uses the two MSBs of refresh_coutner which changes every 2.6ms and 5.24ms, respectively.
// This setup divides the 10.5ms period into four equal segments of approximately 2.6ms each.
assign LED_activating_counter = refresh_counter[19:18];

endmodule
