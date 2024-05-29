module player (
    input CLOCK_25,
    input reset,
    input [9:0] x_pos_in,
    input [9:0] y_pos_in,
    input btn_up,
    input btn_down,
    input btn_left,
    input btn_right,
    output [9:0] x_pos_out,
    output [9:0] y_pos_out
);

//horizontal sync, a = 96, b = 48, c = 640, d = 16, total = 800
//vertical sync, a = 2, b = 33, c = 480, d = 10, total = 525

reg [9:0] x_pos = 96 + 48 - 16 + 311;
reg [9:0] y_pos  = 2 + 33 + 231;

reg [2:0] estado = IDLE;

localparam NADA       = 3'b000;
localparam MOVE_UP    = 3'b001;
localparam MOVE_DOWN  = 3'b010;
localparam MOVE_RIGHT = 3'b011;
localparam MOVE_LEFT  = 3'b100;
localparam IDLE       = 3'b101;


always @ (posedge CLOCK_25 or posedge reset) begin
    if (reset) begin
      x_pos = 96 + 48 - 16 + 311;
      y_pos = 2 + 33 + 231;
      estado = IDLE;
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
                end else begin
                    estado = IDLE;
                end
            end
            MOVE_LEFT: begin
                x_pos = x_pos_in - 16;

                if(x_pos < 96 + 48 - 16) begin
                    x_pos = 96 + 48 + 640 - 16;
                end
                if(~btn_left) begin
                    estado = NADA;
                end else begin
                    estado = IDLE;
                end
            end

            MOVE_DOWN: begin
                y_pos = y_pos_in + 16;

                if(y_pos > 2 + 33 + 480 - 16) begin
                    y_pos = 2 + 33;
                end
                if(~btn_down) begin
                    estado = NADA;
                end else begin
                    estado = IDLE;
                end
            end
            
            MOVE_UP: begin
                y_pos = y_pos_in - 16;

                if(y_pos < 2 + 33) begin
                    y_pos = 2 + 33 + 480 - 16;
                end
                if(~btn_up) begin
                    estado = NADA;
                end else begin
                    estado = IDLE;
                end
            end

            MOVE_RIGHT: begin
                x_pos = x_pos_in + 16;

                if(x_pos > 96 + 48 + 640 - 16) begin
                    x_pos = 96 + 48 - 16;
                end
                if(~btn_right) begin
                    estado = NADA;
                end else begin
                    estado = IDLE;
                end
            end

            NADA: begin
                if(~btn_left || ~btn_down || ~btn_up || ~btn_right) begin
                    estado = NADA;
                end else begin
                    estado = IDLE;
                end
            end
        endcase            
    end
end

assign x_pos_out = x_pos;
assign y_pos_out = y_pos;


endmodule