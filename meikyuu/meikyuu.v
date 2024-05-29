module meikyuu(
    input CLOCK_50,
    input reset,
    input btn_up,
    input btn_down,
    input btn_left,
    input btn_right,
    output [7:0] VGA_R,
    output [7:0] VGA_G,
    output [7:0] VGA_B,
    output VGA_HS,
    output VGA_VS,
    output VGA_SYNC_N,
    output VGA_BLANK_N,
    output VGA_CLK
);

reg [9:0] h_counter;
reg [9:0] v_counter;

wire [9:0] x_pos;
wire [9:0] y_pos;

reg CLOCK_25;

wire enable_v_counter;

wire active;
wire active_cube;

assign VGA_R = active_cube ? 8'd153 : 0;
assign VGA_G = active_cube ? 8'd51 : 0;
assign VGA_B = active_cube ? 8'd153 : 0;

assign VGA_SYNC_N = 0;
assign VGA_BLANK_N = 1;
assign VGA_CLK = CLOCK_25;

player player(
  .CLOCK_25(CLOCK_25),
  .reset(reset),
  .x_pos_in(x_pos),
  .y_pos_in(y_pos),
  .btn_up(btn_up),
  .btn_down(btn_down),
  .btn_left(btn_left),
  .btn_right(btn_right),
  .x_pos_out(x_pos),
  .y_pos_out(y_pos)
);

always @(posedge CLOCK_50 or posedge reset) begin
  if(reset) begin
    CLOCK_25 = 0;
  end else begin
	 CLOCK_25 = !CLOCK_25;
  end
end


always @ (posedge CLOCK_25 or posedge reset) begin
  if(reset) begin
    h_counter = 0;
    v_counter = 0;
  end else begin
    h_counter = h_counter + 1;
    if (h_counter == 800) begin
      h_counter = 0;
      v_counter = v_counter + 1;
      if(v_counter == 525) begin
        v_counter = 0;
      end
    end
  end
end

assign VGA_HS = (h_counter <= 96) ? 1 : 0;
assign VGA_VS = (v_counter <= 2) ? 1 : 0;
assign active = ((v_counter > 2) && (h_counter > 96)) ? 1 : 0;
assign active_cube = ((v_counter > y_pos) && (h_counter > x_pos) && (v_counter <= y_pos + 16) && (h_counter <= x_pos + 16)) ? 1 : 0;

reg mapa_vertical = (h_counter < 96 + 100 && h_counter > 96 + 640 - 100) ? 1 : 0; // Parades retas horizontais
reg mapa_horizontal = (v_counter < 2 + 100 && v_counter > 2 + 480 - 100) ? 1 : 0; // Parades retas verticais

reg mapa_L1 = ((h_counter < 96 + 100 && v_counter < 2 + 100) || (v_counter > 2 + 480 - 100) || (h_counter > 96 + 640 - 100)) ? 1 : 0; //Parede em L
reg mapa_L2 = ((h_counter > 96 + 640 - 100 && v_counter < 2 + 100) || (v_counter > 2 + 480 - 100) || (h_counter < 96 + 100)) ? 1 : 0; //Parede em L
reg mapa_L3 = ((h_counter > 96 + 640 - 100 && v_counter > 2 + 480 - 100) || (v_counter < 2 + 100) || (h_counter < 96 + 100)) ? 1 : 0; //Parede em L
reg mapa_L4 = ((h_counter < 96 + 100 && v_counter > 2 + 480 - 100) || (v_counter > 2 + 100) || (h_counter > 96 + 640 - 100)) ? 1 : 0; //Parede em L

endmodule