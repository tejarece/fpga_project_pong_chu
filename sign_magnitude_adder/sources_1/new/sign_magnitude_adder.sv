//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2024 07:31:00 PM
// Design Name: 
// Module Name: sign_magnitude_adder
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
module sign_magnitude_adder
 #( parameter N = 4 )
 ( input wire [N-1:0] a, b,
   output logic [N-1:0] sum
 );
 
 // Signal Declaration
 logic [N-2:0] mag_a, mag_b, mag_sum, max, min;
 logic sign_a, sign_b, sign_sum;
 
 // body
 always_comb begin
  // Separate magnitude and sim
  mag_a = a[N-2:0];
  mag_b = b[N-2:0];
  sign_a = a[N-1];
  sign_b = b[N-1];
  
  // Sort according to magnitude
  if (mag_a > mag_b)
   begin
    max = mag_a;
    min = mag_b;
    sign_sum = sign_a;
   end
  else
   begin
    max = mag_b;
    min = mag_a;
    sign_sum = sign_b;
   end
 
 // Add/Sub magnitude
 if (sign_a == sign_b)
  mag_sum = max + min;
 else
  mag_sum = max - min;
  
 // Form output 
 sum = { sign_sum, mag_sum };
end

endmodule