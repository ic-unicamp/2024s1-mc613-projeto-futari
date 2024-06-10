module player (
    input CLOCK_25,
    input reset,
    input enable,
    input [9:0] x_pos_in,
    input [9:0] y_pos_in,
    input collision,
    input btn_up,
    input btn_down,
    input btn_left,
    input btn_right,
    input [9:0] h_counter,
    input [9:0] v_counter,
    output [9:0] x_pos_out,
    output [9:0] y_pos_out,
    output [2:0] mapa_pos_x_out,
    output [2:0] mapa_pos_y_out,
    output active_draw
);

//horizontal sync, a = 96, b = 48, c = 640, d = 16, total = 800
//vertical sync, a = 2, b = 33, c = 480, d = 10, total = 525



reg draw [11:0][20:0];


reg [9:0] x_pos = 96 + 48 - 16 + 311;
reg [9:0] y_pos  = 2 + 33 + 231;

reg [2:0] mapa_x_pos = 0;
reg [2:0] mapa_y_pos = 7;


reg [18:0] move_timer;

reg [2:0] estado = IDLE;

localparam MAX_TIMER = 150000;

localparam NADA       = 3'b000;
localparam MOVE_UP    = 3'b001;
localparam MOVE_DOWN  = 3'b010;
localparam MOVE_RIGHT = 3'b011;
localparam MOVE_LEFT  = 3'b100;
localparam IDLE       = 3'b101;
localparam DEAD       = 3'b110;


always @ (posedge CLOCK_25 or posedge reset) begin
    if (reset) begin
        x_pos = 96 + 48 - 16 + 311;
        y_pos = 2 + 33 + 231;
        estado = IDLE;
        move_timer = 0;
        mapa_x_pos = 0;
        mapa_y_pos = 7;

        draw[0][1] = 0;draw[1][1] = 0;draw[2][1] = 0;draw[3][1] = 0;draw[4][1] = 0;draw[5][1] = 1;draw[6][1] = 1;draw[7][1] = 1;draw[8][1] = 1;draw[9][1] = 0;draw[10][1] = 0;
        draw[0][2] = 0;draw[1][2] = 0;draw[2][2] = 0;draw[3][2] = 1;draw[4][2] = 1;draw[5][2] = 1;draw[6][2] = 1;draw[7][2] = 1;draw[8][2] = 1;draw[9][2] = 1;draw[10][2] = 0;
        draw[0][3] = 0;draw[1][3] = 0;draw[2][3] = 1;draw[3][3] = 1;draw[4][3] = 1;draw[5][3] = 1;draw[6][3] = 1;draw[7][3] = 1;draw[8][3] = 1;draw[9][3] = 1;draw[10][3] = 0;
        draw[0][4] = 0;draw[1][4] = 0;draw[2][4] = 1;draw[3][4] = 1;draw[4][4] = 0;draw[5][4] = 1;draw[6][4] = 0;draw[7][4] = 1;draw[8][4] = 1;draw[9][4] = 1;draw[10][4] = 0;
        draw[0][5] = 0;draw[1][5] = 0;draw[2][5] = 1;draw[3][5] = 1;draw[4][5] = 1;draw[5][5] = 1;draw[6][5] = 1;draw[7][5] = 1;draw[8][5] = 1;draw[9][5] = 1;draw[10][5] = 0;
        draw[0][6] = 0;draw[1][6] = 0;draw[2][6] = 1;draw[3][6] = 1;draw[4][6] = 0;draw[5][6] = 0;draw[6][6] = 0;draw[7][6] = 1;draw[8][6] = 1;draw[9][6] = 1;draw[10][6] = 0;
        draw[0][7] = 0;draw[1][7] = 0;draw[2][7] = 1;draw[3][7] = 1;draw[4][7] = 1;draw[5][7] = 1;draw[6][7] = 1;draw[7][7] = 1;draw[8][7] = 1;draw[9][7] = 1;draw[10][7] = 0;
        draw[0][8] = 0;draw[1][8] = 0;draw[2][8] = 1;draw[3][8] = 1;draw[4][8] = 1;draw[5][8] = 1;draw[6][8] = 1;draw[7][8] = 1;draw[8][8] = 1;draw[9][8] = 1;draw[10][8] = 0;
        draw[0][9] = 1;draw[1][9] = 1;draw[2][9] = 1;draw[3][9] = 0;draw[4][9] = 0;draw[5][9] = 1;draw[6][9] = 1;draw[7][9] = 1;draw[8][9] = 0;draw[9][9] = 1;draw[10][9] = 1;
        draw[0][10] = 1;draw[1][10] = 1;draw[2][10] = 1;draw[3][10] = 0;draw[4][10] = 0;draw[5][10] = 0;draw[6][10] = 1;draw[7][10] = 0;draw[8][10] = 0;draw[9][10] = 1;draw[10][10] = 1;
        draw[0][11] = 1;draw[1][11] = 1;draw[2][11] = 1;draw[3][11] = 0;draw[4][11] = 0;draw[5][11] = 1;draw[6][11] = 1;draw[7][11] = 1;draw[8][11] = 0;draw[9][11] = 1;draw[10][11] = 1;
        draw[0][12] = 1;draw[1][12] = 1;draw[2][12] = 1;draw[3][12] = 0;draw[4][12] = 0;draw[5][12] = 1;draw[6][12] = 1;draw[7][12] = 1;draw[8][12] = 0;draw[9][12] = 1;draw[10][12] = 1;
        draw[0][13] = 1;draw[1][13] = 1;draw[2][13] = 1;draw[3][13] = 0;draw[4][13] = 0;draw[5][13] = 1;draw[6][13] = 1;draw[7][13] = 1;draw[8][13] = 0;draw[9][13] = 1;draw[10][13] = 1;
        draw[0][14] = 0;draw[1][14] = 0;draw[2][14] = 1;draw[3][14] = 0;draw[4][14] = 0;draw[5][14] = 0;draw[6][14] = 1;draw[7][14] = 0;draw[8][14] = 0;draw[9][14] = 1;draw[10][14] = 0;
        draw[0][15] = 0;draw[1][15] = 0;draw[2][15] = 1;draw[3][15] = 0;draw[4][15] = 0;draw[5][15] = 0;draw[6][15] = 0;draw[7][15] = 0;draw[8][15] = 0;draw[9][15] = 1;draw[10][15] = 0;
        draw[0][16] = 0;draw[1][16] = 0;draw[2][16] = 1;draw[3][16] = 1;draw[4][16] = 1;draw[5][16] = 1;draw[6][16] = 1;draw[7][16] = 1;draw[8][16] = 1;draw[9][16] = 1;draw[10][16] = 0;
        draw[0][17] = 0;draw[1][17] = 0;draw[2][17] = 1;draw[3][17] = 1;draw[4][17] = 1;draw[5][17] = 0;draw[6][17] = 0;draw[7][17] = 0;draw[8][17] = 1;draw[9][17] = 1;draw[10][17] = 0;
        draw[0][18] = 0;draw[1][18] = 0;draw[2][18] = 1;draw[3][18] = 1;draw[4][18] = 1;draw[5][18] = 0;draw[6][18] = 0;draw[7][18] = 0;draw[8][18] = 1;draw[9][18] = 1;draw[10][18] = 0;
        draw[0][19] = 0;draw[1][19] = 0;draw[2][19] = 1;draw[3][19] = 1;draw[4][19] = 1;draw[5][19] = 0;draw[6][19] = 0;draw[7][19] = 0;draw[8][19] = 1;draw[9][19] = 1;draw[10][19] = 0;

    end else begin
        x_pos = x_pos_in;
        y_pos = y_pos_in;
        case (estado)
            IDLE: begin
                if (~btn_left) begin 
                    estado = MOVE_LEFT;
                end
                else if (~btn_down) begin
                    estado = MOVE_DOWN;
                end
                else if (~btn_up) begin
                    estado = MOVE_UP;
                end
                else if (~btn_right) begin
                    estado = MOVE_RIGHT;
                end else if (~enable) begin
                    estado = DEAD;
                end
                else begin
                    estado = IDLE;
                    move_timer = 0;
                end
            end
            MOVE_LEFT: begin
                if(x_pos < 96 + 48 - 11) begin
                    x_pos = 96 + 48 + 640 - 11;
                    mapa_x_pos = mapa_x_pos - 1;
                end
                if(~btn_left) begin
                    move_timer = move_timer + 1;
                    estado = MOVE_LEFT;
                    if(collision) begin
                        x_pos = x_pos + 1;
                    end

                    if (move_timer == MAX_TIMER) begin
                        move_timer = 0;
                        x_pos = x_pos_in - 1;
                    end
                end else begin
                    estado = IDLE;
                end
                if (~enable) begin
                    estado = DEAD;
                end
            end

            MOVE_DOWN: begin
                if(y_pos > 2 + 33 + 480 - 20) begin
                    y_pos = 2 + 33;
                    mapa_y_pos = mapa_y_pos + 1;
                end
                if(~btn_down) begin
                    move_timer = move_timer + 1;
                    estado = MOVE_DOWN;
                    if(collision) begin
                            y_pos = y_pos - 1;
                        end
                    if (move_timer == MAX_TIMER) begin
                        move_timer = 0;
                        y_pos = y_pos_in + 1;
                    end
                end else begin
                    estado = IDLE;
                end
                if (~enable) begin
                    estado = DEAD;
                end
            end
            
            MOVE_UP: begin
                if(y_pos < 2 + 33) begin
                    y_pos = 2 + 33 + 480 - 20;
                    mapa_y_pos = mapa_y_pos - 1;
                end
                if(~btn_up) begin
                    move_timer = move_timer + 1;
                    estado = MOVE_UP;
                    if(collision) begin
                            y_pos = y_pos + 1;
                        end
                    if (move_timer == MAX_TIMER) begin
                        move_timer = 0;
                        y_pos = y_pos_in - 1;
                    end
                end else begin
                    estado = IDLE;
                end
                if (~enable) begin
                    estado = DEAD;
                end
            end

            MOVE_RIGHT: begin
                if(x_pos > 96 + 48 + 640 - 11) begin
                    x_pos = 96 + 48 - 11;
                    mapa_x_pos = mapa_x_pos + 1;
                end
                if(~btn_right) begin
                    move_timer = move_timer + 1;
                    estado = MOVE_RIGHT;
                    if(collision) begin
                            x_pos = x_pos - 1;
                        end

                    if (move_timer == MAX_TIMER && ~collision) begin
                        move_timer = 0;
                        x_pos = x_pos_in + 1;
                    end
                end else begin
                    estado = IDLE;
                end
                if (~enable) begin
                    estado = DEAD;
                end
            end
            DEAD: begin
                estado = DEAD;
            end
            default: begin
                estado = IDLE;
            end
        endcase           
    end
end

assign x_pos_out = x_pos;
assign y_pos_out = y_pos;

assign mapa_pos_x_out = mapa_x_pos;
assign mapa_pos_y_out = mapa_y_pos;

assign active_draw = (draw[h_counter - x_pos][v_counter - y_pos]) ? 1 : 0;

 endmodule