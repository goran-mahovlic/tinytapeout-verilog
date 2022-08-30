`default_nettype none

//  Top level io for this module should stay the same to fit into the scan_wrapper.
//  The pin connections within the user_module are up to you,
//  although (if one is present) it is recommended to place a clock on io_in[0].
//  This allows use of the internal clock divider if you wish.
module user_module_341424636358034002(
  input [7:0] io_in, 
  output [7:0] io_out
);

// using io_in[0] as clk
wire clk;
assign clk = io_in[0];

wire audio_l, audio_r;

assign io_out[4:0] = audio_l;
assign io_out[7:5] = audio_r;

wire [11:0] pcm_trianglewave;
// triangle wave generator /\/\/
trianglewave
#(
  .C_delay(6) // smaller value -> higher freq
)
trianglewave_instance
(
  .clk(clk),
  .pcm(pcm_trianglewave)
);


wire [11:0] pcm_sinewave;
// sine wave generator ~~~~
sinewave
#(
  .C_delay(10) // smaller value -> higher freq
)
sinewave_instance
(
  .clk(clk),
  .pcm(pcm_sinewave)
);

wire [11:0] pcm = io_in[1] ? pcm_trianglewave : pcm_sinewave;

// analog output to classic headphones
wire [3:0] dac;
dacpwm
dacpwm_instance
(
  .clk(clk),
  .pcm(pcm),
  .dac(dac)
);

assign audio_l = dac;
assign audio_r = dac;

endmodule