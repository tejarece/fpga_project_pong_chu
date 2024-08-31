module hex_to_sseg (
 input wire [3:0] hex,
 output reg [6:0] sseg // sseg digit
);

 always_comb begin
  case (hex)
   //                7'babc_def_g
   4'h0: sseg[6:0] = 7'b000_000_1;
   4'h1: sseg[6:0] = 7'b100_111_1;
   4'h2: sseg[6:0] = 7'b001_001_0;
   4'h3: sseg[6:0] = 7'b000_011_0;
   4'h4: sseg[6:0] = 7'b100_110_0;
   4'h5: sseg[6:0] = 7'b010_010_0;
   4'h6: sseg[6:0] = 7'b010_000_0;
   4'h7: sseg[6:0] = 7'b000_111_1;
   4'h8: sseg[6:0] = 7'b000_000_0;
   4'h9: sseg[6:0] = 7'b000_010_0;
   4'ha: sseg[6:0] = 7'b000_100_0;
   4'hb: sseg[6:0] = 7'b110_000_0;
   4'hc: sseg[6:0] = 7'b011_000_1;
   4'hd: sseg[6:0] = 7'b100_001_0;
   4'he: sseg[6:0] = 7'b011_000_0;
   default: sseg[6:0] = 7'b011_100_0; // 4'hf
  endcase
 end

endmodule