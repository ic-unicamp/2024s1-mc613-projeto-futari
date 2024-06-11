module objective (
    input CLOCK_25,
    input reset,
    input [9:0] h_counter,
    input [9:0] v_counter,
    input [9:0] x_map,
    input [9:0] y_map,
    output active_house_draw,
    output active_house_draw_back
);


reg [1:0] house_draw [39:0][35:0];

wire active_house;


always @(posedge CLOCK_25 or posedge reset) begin
    if(reset) begin
        house_draw[0][0] = 0;house_draw[1][0] = 0;house_draw[2][0] = 0;house_draw[3][0] = 0;house_draw[4][0] = 0;house_draw[5][0] = 1;house_draw[6][0] = 1;house_draw[7][0] = 1;house_draw[8][0] = 1;house_draw[9][0] = 1;house_draw[10][0] = 1;house_draw[11][0] = 1;house_draw[12][0] = 1;house_draw[13][0] = 1;house_draw[14][0] = 1;house_draw[15][0] = 1;house_draw[16][0] = 1;house_draw[17][0] = 1;house_draw[18][0] = 1;house_draw[19][0] = 1;house_draw[20][0] = 1;house_draw[21][0] = 1;house_draw[22][0] = 1;house_draw[23][0] = 1;house_draw[24][0] = 1;house_draw[25][0] = 1;house_draw[26][0] = 1;house_draw[27][0] = 1;house_draw[28][0] = 1;house_draw[29][0] = 1;house_draw[30][0] = 1;house_draw[31][0] = 1;house_draw[32][0] = 1;house_draw[33][0] = 1;house_draw[34][0] = 1;house_draw[35][0] = 1;house_draw[36][0] = 1;house_draw[37][0] = 1;house_draw[38][0] = 1;house_draw[39][0] = 1;
        house_draw[0][1] = 0;house_draw[1][1] = 0;house_draw[2][1] = 0;house_draw[3][1] = 0;house_draw[4][1] = 1;house_draw[5][1] = 2;house_draw[6][1] = 2;house_draw[7][1] = 2;house_draw[8][1] = 2;house_draw[9][1] = 2;house_draw[10][1] = 2;house_draw[11][1] = 2;house_draw[12][1] = 2;house_draw[13][1] = 2;house_draw[14][1] = 2;house_draw[15][1] = 2;house_draw[16][1] = 2;house_draw[17][1] = 2;house_draw[18][1] = 2;house_draw[19][1] = 2;house_draw[20][1] = 2;house_draw[21][1] = 2;house_draw[22][1] = 2;house_draw[23][1] = 2;house_draw[24][1] = 2;house_draw[25][1] = 2;house_draw[26][1] = 2;house_draw[27][1] = 2;house_draw[28][1] = 2;house_draw[29][1] = 2;house_draw[30][1] = 2;house_draw[31][1] = 2;house_draw[32][1] = 2;house_draw[33][1] = 2;house_draw[34][1] = 2;house_draw[35][1] = 2;house_draw[36][1] = 2;house_draw[37][1] = 2;house_draw[38][1] = 1;house_draw[39][1] = 1;
        house_draw[0][2] = 0;house_draw[1][2] = 0;house_draw[2][2] = 0;house_draw[3][2] = 1;house_draw[4][2] = 2;house_draw[5][2] = 2;house_draw[6][2] = 2;house_draw[7][2] = 2;house_draw[8][2] = 2;house_draw[9][2] = 2;house_draw[10][2] = 2;house_draw[11][2] = 2;house_draw[12][2] = 2;house_draw[13][2] = 2;house_draw[14][2] = 2;house_draw[15][2] = 2;house_draw[16][2] = 2;house_draw[17][2] = 2;house_draw[18][2] = 2;house_draw[19][2] = 2;house_draw[20][2] = 2;house_draw[21][2] = 2;house_draw[22][2] = 2;house_draw[23][2] = 2;house_draw[24][2] = 2;house_draw[25][2] = 2;house_draw[26][2] = 2;house_draw[27][2] = 2;house_draw[28][2] = 2;house_draw[29][2] = 2;house_draw[30][2] = 2;house_draw[31][2] = 2;house_draw[32][2] = 2;house_draw[33][2] = 2;house_draw[34][2] = 2;house_draw[35][2] = 2;house_draw[36][2] = 2;house_draw[37][2] = 1;house_draw[38][2] = 2;house_draw[39][2] = 1;
        house_draw[0][3] = 0;house_draw[1][3] = 0;house_draw[2][3] = 1;house_draw[3][3] = 2;house_draw[4][3] = 2;house_draw[5][3] = 2;house_draw[6][3] = 2;house_draw[7][3] = 2;house_draw[8][3] = 2;house_draw[9][3] = 2;house_draw[10][3] = 2;house_draw[11][3] = 2;house_draw[12][3] = 2;house_draw[13][3] = 2;house_draw[14][3] = 2;house_draw[15][3] = 2;house_draw[16][3] = 2;house_draw[17][3] = 2;house_draw[18][3] = 2;house_draw[19][3] = 2;house_draw[20][3] = 2;house_draw[21][3] = 2;house_draw[22][3] = 2;house_draw[23][3] = 2;house_draw[24][3] = 2;house_draw[25][3] = 2;house_draw[26][3] = 2;house_draw[27][3] = 2;house_draw[28][3] = 2;house_draw[29][3] = 2;house_draw[30][3] = 2;house_draw[31][3] = 2;house_draw[32][3] = 2;house_draw[33][3] = 2;house_draw[34][3] = 2;house_draw[35][3] = 2;house_draw[36][3] = 1;house_draw[37][3] = 2;house_draw[38][3] = 2;house_draw[39][3] = 1;
        house_draw[0][4] = 0;house_draw[1][4] = 1;house_draw[2][4] = 2;house_draw[3][4] = 2;house_draw[4][4] = 2;house_draw[5][4] = 2;house_draw[6][4] = 2;house_draw[7][4] = 2;house_draw[8][4] = 2;house_draw[9][4] = 2;house_draw[10][4] = 2;house_draw[11][4] = 2;house_draw[12][4] = 2;house_draw[13][4] = 2;house_draw[14][4] = 2;house_draw[15][4] = 2;house_draw[16][4] = 2;house_draw[17][4] = 2;house_draw[18][4] = 2;house_draw[19][4] = 2;house_draw[20][4] = 2;house_draw[21][4] = 2;house_draw[22][4] = 2;house_draw[23][4] = 2;house_draw[24][4] = 2;house_draw[25][4] = 2;house_draw[26][4] = 2;house_draw[27][4] = 2;house_draw[28][4] = 2;house_draw[29][4] = 2;house_draw[30][4] = 2;house_draw[31][4] = 2;house_draw[32][4] = 2;house_draw[33][4] = 2;house_draw[34][4] = 2;house_draw[35][4] = 1;house_draw[36][4] = 2;house_draw[37][4] = 2;house_draw[38][4] = 2;house_draw[39][4] = 1;
        house_draw[0][5] = 1;house_draw[1][5] = 1;house_draw[2][5] = 1;house_draw[3][5] = 1;house_draw[4][5] = 1;house_draw[5][5] = 1;house_draw[6][5] = 1;house_draw[7][5] = 1;house_draw[8][5] = 1;house_draw[9][5] = 1;house_draw[10][5] = 1;house_draw[11][5] = 1;house_draw[12][5] = 1;house_draw[13][5] = 1;house_draw[14][5] = 1;house_draw[15][5] = 1;house_draw[16][5] = 1;house_draw[17][5] = 1;house_draw[18][5] = 1;house_draw[19][5] = 1;house_draw[20][5] = 1;house_draw[21][5] = 1;house_draw[22][5] = 1;house_draw[23][5] = 1;house_draw[24][5] = 1;house_draw[25][5] = 1;house_draw[26][5] = 1;house_draw[27][5] = 1;house_draw[28][5] = 1;house_draw[29][5] = 1;house_draw[30][5] = 1;house_draw[31][5] = 1;house_draw[32][5] = 1;house_draw[33][5] = 1;house_draw[34][5] = 1;house_draw[35][5] = 2;house_draw[36][5] = 2;house_draw[37][5] = 2;house_draw[38][5] = 2;house_draw[39][5] = 1;
        house_draw[0][6] = 1;house_draw[1][6] = 2;house_draw[2][6] = 2;house_draw[3][6] = 2;house_draw[4][6] = 2;house_draw[5][6] = 2;house_draw[6][6] = 2;house_draw[7][6] = 2;house_draw[8][6] = 2;house_draw[9][6] = 2;house_draw[10][6] = 2;house_draw[11][6] = 2;house_draw[12][6] = 2;house_draw[13][6] = 2;house_draw[14][6] = 2;house_draw[15][6] = 2;house_draw[16][6] = 2;house_draw[17][6] = 2;house_draw[18][6] = 2;house_draw[19][6] = 2;house_draw[20][6] = 2;house_draw[21][6] = 2;house_draw[22][6] = 2;house_draw[23][6] = 2;house_draw[24][6] = 2;house_draw[25][6] = 2;house_draw[26][6] = 2;house_draw[27][6] = 2;house_draw[28][6] = 2;house_draw[29][6] = 2;house_draw[30][6] = 2;house_draw[31][6] = 2;house_draw[32][6] = 2;house_draw[33][6] = 2;house_draw[34][6] = 1;house_draw[35][6] = 2;house_draw[36][6] = 2;house_draw[37][6] = 2;house_draw[38][6] = 2;house_draw[39][6] = 1;
        house_draw[0][7] = 1;house_draw[1][7] = 2;house_draw[2][7] = 2;house_draw[3][7] = 2;house_draw[4][7] = 1;house_draw[5][7] = 1;house_draw[6][7] = 1;house_draw[7][7] = 2;house_draw[8][7] = 2;house_draw[9][7] = 2;house_draw[10][7] = 2;house_draw[11][7] = 2;house_draw[12][7] = 2;house_draw[13][7] = 2;house_draw[14][7] = 2;house_draw[15][7] = 2;house_draw[16][7] = 2;house_draw[17][7] = 2;house_draw[18][7] = 2;house_draw[19][7] = 2;house_draw[20][7] = 2;house_draw[21][7] = 2;house_draw[22][7] = 2;house_draw[23][7] = 2;house_draw[24][7] = 2;house_draw[25][7] = 2;house_draw[26][7] = 2;house_draw[27][7] = 2;house_draw[28][7] = 2;house_draw[29][7] = 2;house_draw[30][7] = 2;house_draw[31][7] = 2;house_draw[32][7] = 2;house_draw[33][7] = 2;house_draw[34][7] = 1;house_draw[35][7] = 2;house_draw[36][7] = 2;house_draw[37][7] = 2;house_draw[38][7] = 2;house_draw[39][7] = 1;
        house_draw[0][8] = 1;house_draw[1][8] = 2;house_draw[2][8] = 2;house_draw[3][8] = 2;house_draw[4][8] = 2;house_draw[5][8] = 2;house_draw[6][8] = 1;house_draw[7][8] = 1;house_draw[8][8] = 1;house_draw[9][8] = 2;house_draw[10][8] = 1;house_draw[11][8] = 1;house_draw[12][8] = 1;house_draw[13][8] = 2;house_draw[14][8] = 2;house_draw[15][8] = 1;house_draw[16][8] = 1;house_draw[17][8] = 1;house_draw[18][8] = 1;house_draw[19][8] = 2;house_draw[20][8] = 2;house_draw[21][8] = 1;house_draw[22][8] = 1;house_draw[23][8] = 1;house_draw[24][8] = 2;house_draw[25][8] = 1;house_draw[26][8] = 2;house_draw[27][8] = 1;house_draw[28][8] = 2;house_draw[29][8] = 1;house_draw[30][8] = 2;house_draw[31][8] = 2;house_draw[32][8] = 2;house_draw[33][8] = 2;house_draw[34][8] = 1;house_draw[35][8] = 2;house_draw[36][8] = 2;house_draw[37][8] = 2;house_draw[38][8] = 2;house_draw[39][8] = 1;
        house_draw[0][9] = 1;house_draw[1][9] = 2;house_draw[2][9] = 2;house_draw[3][9] = 2;house_draw[4][9] = 2;house_draw[5][9] = 2;house_draw[6][9] = 1;house_draw[7][9] = 2;house_draw[8][9] = 2;house_draw[9][9] = 2;house_draw[10][9] = 1;house_draw[11][9] = 2;house_draw[12][9] = 2;house_draw[13][9] = 2;house_draw[14][9] = 2;house_draw[15][9] = 1;house_draw[16][9] = 2;house_draw[17][9] = 2;house_draw[18][9] = 1;house_draw[19][9] = 2;house_draw[20][9] = 2;house_draw[21][9] = 1;house_draw[22][9] = 2;house_draw[23][9] = 1;house_draw[24][9] = 2;house_draw[25][9] = 1;house_draw[26][9] = 2;house_draw[27][9] = 1;house_draw[28][9] = 2;house_draw[29][9] = 1;house_draw[30][9] = 2;house_draw[31][9] = 2;house_draw[32][9] = 2;house_draw[33][9] = 2;house_draw[34][9] = 1;house_draw[35][9] = 2;house_draw[36][9] = 2;house_draw[37][9] = 2;house_draw[38][9] = 2;house_draw[39][9] = 1;
        house_draw[0][10] = 1;house_draw[1][10] = 2;house_draw[2][10] = 2;house_draw[3][10] = 1;house_draw[4][10] = 2;house_draw[5][10] = 2;house_draw[6][10] = 1;house_draw[7][10] = 2;house_draw[8][10] = 2;house_draw[9][10] = 2;house_draw[10][10] = 1;house_draw[11][10] = 1;house_draw[12][10] = 1;house_draw[13][10] = 2;house_draw[14][10] = 2;house_draw[15][10] = 1;house_draw[16][10] = 1;house_draw[17][10] = 1;house_draw[18][10] = 2;house_draw[19][10] = 2;house_draw[20][10] = 2;house_draw[21][10] = 1;house_draw[22][10] = 1;house_draw[23][10] = 2;house_draw[24][10] = 2;house_draw[25][10] = 2;house_draw[26][10] = 1;house_draw[27][10] = 1;house_draw[28][10] = 2;house_draw[29][10] = 2;house_draw[30][10] = 2;house_draw[31][10] = 2;house_draw[32][10] = 2;house_draw[33][10] = 2;house_draw[34][10] = 1;house_draw[35][10] = 2;house_draw[36][10] = 2;house_draw[37][10] = 2;house_draw[38][10] = 2;house_draw[39][10] = 1;
        house_draw[0][11] = 1;house_draw[1][11] = 2;house_draw[2][11] = 2;house_draw[3][11] = 2;house_draw[4][11] = 1;house_draw[5][11] = 1;house_draw[6][11] = 1;house_draw[7][11] = 2;house_draw[8][11] = 2;house_draw[9][11] = 2;house_draw[10][11] = 1;house_draw[11][11] = 2;house_draw[12][11] = 2;house_draw[13][11] = 2;house_draw[14][11] = 2;house_draw[15][11] = 1;house_draw[16][11] = 2;house_draw[17][11] = 1;house_draw[18][11] = 2;house_draw[19][11] = 2;house_draw[20][11] = 2;house_draw[21][11] = 1;house_draw[22][11] = 2;house_draw[23][11] = 1;house_draw[24][11] = 2;house_draw[25][11] = 2;house_draw[26][11] = 2;house_draw[27][11] = 1;house_draw[28][11] = 2;house_draw[29][11] = 2;house_draw[30][11] = 2;house_draw[31][11] = 2;house_draw[32][11] = 2;house_draw[33][11] = 2;house_draw[34][11] = 1;house_draw[35][11] = 2;house_draw[36][11] = 2;house_draw[37][11] = 2;house_draw[38][11] = 2;house_draw[39][11] = 1;
        house_draw[0][12] = 1;house_draw[1][12] = 2;house_draw[2][12] = 2;house_draw[3][12] = 2;house_draw[4][12] = 2;house_draw[5][12] = 2;house_draw[6][12] = 2;house_draw[7][12] = 2;house_draw[8][12] = 2;house_draw[9][12] = 2;house_draw[10][12] = 1;house_draw[11][12] = 2;house_draw[12][12] = 2;house_draw[13][12] = 2;house_draw[14][12] = 2;house_draw[15][12] = 1;house_draw[16][12] = 2;house_draw[17][12] = 1;house_draw[18][12] = 1;house_draw[19][12] = 2;house_draw[20][12] = 2;house_draw[21][12] = 1;house_draw[22][12] = 2;house_draw[23][12] = 2;house_draw[24][12] = 1;house_draw[25][12] = 2;house_draw[26][12] = 2;house_draw[27][12] = 1;house_draw[28][12] = 2;house_draw[29][12] = 2;house_draw[30][12] = 2;house_draw[31][12] = 2;house_draw[32][12] = 2;house_draw[33][12] = 2;house_draw[34][12] = 1;house_draw[35][12] = 2;house_draw[36][12] = 2;house_draw[37][12] = 2;house_draw[38][12] = 2;house_draw[39][12] = 1;
        house_draw[0][13] = 1;house_draw[1][13] = 2;house_draw[2][13] = 2;house_draw[3][13] = 2;house_draw[4][13] = 2;house_draw[5][13] = 2;house_draw[6][13] = 2;house_draw[7][13] = 2;house_draw[8][13] = 2;house_draw[9][13] = 2;house_draw[10][13] = 1;house_draw[11][13] = 1;house_draw[12][13] = 1;house_draw[13][13] = 2;house_draw[14][13] = 2;house_draw[15][13] = 1;house_draw[16][13] = 2;house_draw[17][13] = 2;house_draw[18][13] = 1;house_draw[19][13] = 2;house_draw[20][13] = 2;house_draw[21][13] = 2;house_draw[22][13] = 2;house_draw[23][13] = 2;house_draw[24][13] = 1;house_draw[25][13] = 2;house_draw[26][13] = 2;house_draw[27][13] = 2;house_draw[28][13] = 2;house_draw[29][13] = 2;house_draw[30][13] = 2;house_draw[31][13] = 2;house_draw[32][13] = 2;house_draw[33][13] = 2;house_draw[34][13] = 1;house_draw[35][13] = 2;house_draw[36][13] = 2;house_draw[37][13] = 2;house_draw[38][13] = 2;house_draw[39][13] = 1;
        house_draw[0][14] = 1;house_draw[1][14] = 2;house_draw[2][14] = 2;house_draw[3][14] = 2;house_draw[4][14] = 2;house_draw[5][14] = 2;house_draw[6][14] = 2;house_draw[7][14] = 2;house_draw[8][14] = 2;house_draw[9][14] = 2;house_draw[10][14] = 2;house_draw[11][14] = 2;house_draw[12][14] = 2;house_draw[13][14] = 2;house_draw[14][14] = 2;house_draw[15][14] = 2;house_draw[16][14] = 2;house_draw[17][14] = 2;house_draw[18][14] = 2;house_draw[19][14] = 2;house_draw[20][14] = 2;house_draw[21][14] = 2;house_draw[22][14] = 2;house_draw[23][14] = 2;house_draw[24][14] = 2;house_draw[25][14] = 2;house_draw[26][14] = 2;house_draw[27][14] = 2;house_draw[28][14] = 2;house_draw[29][14] = 2;house_draw[30][14] = 2;house_draw[31][14] = 2;house_draw[32][14] = 2;house_draw[33][14] = 2;house_draw[34][14] = 1;house_draw[35][14] = 2;house_draw[36][14] = 2;house_draw[37][14] = 2;house_draw[38][14] = 2;house_draw[39][14] = 1;
        house_draw[0][15] = 1;house_draw[1][15] = 2;house_draw[2][15] = 2;house_draw[3][15] = 2;house_draw[4][15] = 2;house_draw[5][15] = 2;house_draw[6][15] = 2;house_draw[7][15] = 2;house_draw[8][15] = 2;house_draw[9][15] = 2;house_draw[10][15] = 2;house_draw[11][15] = 2;house_draw[12][15] = 2;house_draw[13][15] = 2;house_draw[14][15] = 2;house_draw[15][15] = 2;house_draw[16][15] = 2;house_draw[17][15] = 2;house_draw[18][15] = 2;house_draw[19][15] = 2;house_draw[20][15] = 2;house_draw[21][15] = 2;house_draw[22][15] = 2;house_draw[23][15] = 2;house_draw[24][15] = 2;house_draw[25][15] = 2;house_draw[26][15] = 2;house_draw[27][15] = 2;house_draw[28][15] = 2;house_draw[29][15] = 2;house_draw[30][15] = 2;house_draw[31][15] = 2;house_draw[32][15] = 2;house_draw[33][15] = 2;house_draw[34][15] = 1;house_draw[35][15] = 2;house_draw[36][15] = 2;house_draw[37][15] = 2;house_draw[38][15] = 2;house_draw[39][15] = 1;
        house_draw[0][16] = 1;house_draw[1][16] = 2;house_draw[2][16] = 2;house_draw[3][16] = 2;house_draw[4][16] = 2;house_draw[5][16] = 2;house_draw[6][16] = 2;house_draw[7][16] = 2;house_draw[8][16] = 2;house_draw[9][16] = 2;house_draw[10][16] = 2;house_draw[11][16] = 2;house_draw[12][16] = 2;house_draw[13][16] = 2;house_draw[14][16] = 2;house_draw[15][16] = 2;house_draw[16][16] = 2;house_draw[17][16] = 2;house_draw[18][16] = 2;house_draw[19][16] = 2;house_draw[20][16] = 2;house_draw[21][16] = 2;house_draw[22][16] = 2;house_draw[23][16] = 2;house_draw[24][16] = 2;house_draw[25][16] = 2;house_draw[26][16] = 2;house_draw[27][16] = 2;house_draw[28][16] = 2;house_draw[29][16] = 2;house_draw[30][16] = 2;house_draw[31][16] = 2;house_draw[32][16] = 2;house_draw[33][16] = 2;house_draw[34][16] = 1;house_draw[35][16] = 2;house_draw[36][16] = 2;house_draw[37][16] = 2;house_draw[38][16] = 2;house_draw[39][16] = 1;
        house_draw[0][17] = 1;house_draw[1][17] = 2;house_draw[2][17] = 2;house_draw[3][17] = 2;house_draw[4][17] = 2;house_draw[5][17] = 2;house_draw[6][17] = 2;house_draw[7][17] = 2;house_draw[8][17] = 2;house_draw[9][17] = 2;house_draw[10][17] = 2;house_draw[11][17] = 2;house_draw[12][17] = 2;house_draw[13][17] = 2;house_draw[14][17] = 2;house_draw[15][17] = 2;house_draw[16][17] = 2;house_draw[17][17] = 2;house_draw[18][17] = 1;house_draw[19][17] = 1;house_draw[20][17] = 1;house_draw[21][17] = 1;house_draw[22][17] = 1;house_draw[23][17] = 1;house_draw[24][17] = 1;house_draw[25][17] = 1;house_draw[26][17] = 1;house_draw[27][17] = 2;house_draw[28][17] = 2;house_draw[29][17] = 2;house_draw[30][17] = 2;house_draw[31][17] = 2;house_draw[32][17] = 2;house_draw[33][17] = 2;house_draw[34][17] = 1;house_draw[35][17] = 2;house_draw[36][17] = 2;house_draw[37][17] = 2;house_draw[38][17] = 2;house_draw[39][17] = 1;
        house_draw[0][18] = 1;house_draw[1][18] = 2;house_draw[2][18] = 2;house_draw[3][18] = 2;house_draw[4][18] = 2;house_draw[5][18] = 2;house_draw[6][18] = 2;house_draw[7][18] = 2;house_draw[8][18] = 2;house_draw[9][18] = 2;house_draw[10][18] = 2;house_draw[11][18] = 2;house_draw[12][18] = 2;house_draw[13][18] = 2;house_draw[14][18] = 2;house_draw[15][18] = 2;house_draw[16][18] = 2;house_draw[17][18] = 2;house_draw[18][18] = 1;house_draw[19][18] = 2;house_draw[20][18] = 1;house_draw[21][18] = 2;house_draw[22][18] = 1;house_draw[23][18] = 2;house_draw[24][18] = 1;house_draw[25][18] = 2;house_draw[26][18] = 1;house_draw[27][18] = 2;house_draw[28][18] = 2;house_draw[29][18] = 2;house_draw[30][18] = 2;house_draw[31][18] = 2;house_draw[32][18] = 2;house_draw[33][18] = 2;house_draw[34][18] = 1;house_draw[35][18] = 2;house_draw[36][18] = 2;house_draw[37][18] = 2;house_draw[38][18] = 2;house_draw[39][18] = 1;
        house_draw[0][19] = 1;house_draw[1][19] = 2;house_draw[2][19] = 2;house_draw[3][19] = 2;house_draw[4][19] = 2;house_draw[5][19] = 1;house_draw[6][19] = 1;house_draw[7][19] = 1;house_draw[8][19] = 1;house_draw[9][19] = 1;house_draw[10][19] = 2;house_draw[11][19] = 2;house_draw[12][19] = 2;house_draw[13][19] = 2;house_draw[14][19] = 2;house_draw[15][19] = 2;house_draw[16][19] = 2;house_draw[17][19] = 2;house_draw[18][19] = 1;house_draw[19][19] = 1;house_draw[20][19] = 1;house_draw[21][19] = 1;house_draw[22][19] = 1;house_draw[23][19] = 1;house_draw[24][19] = 1;house_draw[25][19] = 1;house_draw[26][19] = 1;house_draw[27][19] = 2;house_draw[28][19] = 2;house_draw[29][19] = 2;house_draw[30][19] = 2;house_draw[31][19] = 2;house_draw[32][19] = 2;house_draw[33][19] = 2;house_draw[34][19] = 1;house_draw[35][19] = 2;house_draw[36][19] = 2;house_draw[37][19] = 2;house_draw[38][19] = 2;house_draw[39][19] = 1;
        house_draw[0][20] = 1;house_draw[1][20] = 2;house_draw[2][20] = 2;house_draw[3][20] = 2;house_draw[4][20] = 2;house_draw[5][20] = 1;house_draw[6][20] = 1;house_draw[7][20] = 1;house_draw[8][20] = 1;house_draw[9][20] = 1;house_draw[10][20] = 2;house_draw[11][20] = 2;house_draw[12][20] = 2;house_draw[13][20] = 2;house_draw[14][20] = 2;house_draw[15][20] = 2;house_draw[16][20] = 2;house_draw[17][20] = 2;house_draw[18][20] = 1;house_draw[19][20] = 2;house_draw[20][20] = 1;house_draw[21][20] = 2;house_draw[22][20] = 1;house_draw[23][20] = 2;house_draw[24][20] = 1;house_draw[25][20] = 2;house_draw[26][20] = 1;house_draw[27][20] = 2;house_draw[28][20] = 2;house_draw[29][20] = 2;house_draw[30][20] = 2;house_draw[31][20] = 2;house_draw[32][20] = 2;house_draw[33][20] = 2;house_draw[34][20] = 1;house_draw[35][20] = 2;house_draw[36][20] = 2;house_draw[37][20] = 2;house_draw[38][20] = 2;house_draw[39][20] = 1;
        house_draw[0][21] = 1;house_draw[1][21] = 2;house_draw[2][21] = 2;house_draw[3][21] = 2;house_draw[4][21] = 2;house_draw[5][21] = 1;house_draw[6][21] = 1;house_draw[7][21] = 1;house_draw[8][21] = 1;house_draw[9][21] = 1;house_draw[10][21] = 2;house_draw[11][21] = 2;house_draw[12][21] = 2;house_draw[13][21] = 2;house_draw[14][21] = 2;house_draw[15][21] = 2;house_draw[16][21] = 2;house_draw[17][21] = 2;house_draw[18][21] = 1;house_draw[19][21] = 1;house_draw[20][21] = 1;house_draw[21][21] = 1;house_draw[22][21] = 1;house_draw[23][21] = 1;house_draw[24][21] = 1;house_draw[25][21] = 1;house_draw[26][21] = 1;house_draw[27][21] = 2;house_draw[28][21] = 2;house_draw[29][21] = 2;house_draw[30][21] = 2;house_draw[31][21] = 2;house_draw[32][21] = 2;house_draw[33][21] = 2;house_draw[34][21] = 1;house_draw[35][21] = 2;house_draw[36][21] = 2;house_draw[37][21] = 2;house_draw[38][21] = 2;house_draw[39][21] = 1;
        house_draw[0][22] = 1;house_draw[1][22] = 2;house_draw[2][22] = 2;house_draw[3][22] = 2;house_draw[4][22] = 2;house_draw[5][22] = 1;house_draw[6][22] = 1;house_draw[7][22] = 1;house_draw[8][22] = 2;house_draw[9][22] = 1;house_draw[10][22] = 2;house_draw[11][22] = 2;house_draw[12][22] = 2;house_draw[13][22] = 2;house_draw[14][22] = 2;house_draw[15][22] = 2;house_draw[16][22] = 2;house_draw[17][22] = 2;house_draw[18][22] = 2;house_draw[19][22] = 2;house_draw[20][22] = 2;house_draw[21][22] = 2;house_draw[22][22] = 2;house_draw[23][22] = 2;house_draw[24][22] = 2;house_draw[25][22] = 2;house_draw[26][22] = 2;house_draw[27][22] = 2;house_draw[28][22] = 2;house_draw[29][22] = 2;house_draw[30][22] = 2;house_draw[31][22] = 2;house_draw[32][22] = 2;house_draw[33][22] = 2;house_draw[34][22] = 1;house_draw[35][22] = 2;house_draw[36][22] = 2;house_draw[37][22] = 2;house_draw[38][22] = 1;house_draw[39][22] = 0;
        house_draw[0][23] = 1;house_draw[1][23] = 2;house_draw[2][23] = 2;house_draw[3][23] = 2;house_draw[4][23] = 2;house_draw[5][23] = 1;house_draw[6][23] = 1;house_draw[7][23] = 1;house_draw[8][23] = 1;house_draw[9][23] = 1;house_draw[10][23] = 2;house_draw[11][23] = 2;house_draw[12][23] = 2;house_draw[13][23] = 2;house_draw[14][23] = 2;house_draw[15][23] = 2;house_draw[16][23] = 2;house_draw[17][23] = 2;house_draw[18][23] = 2;house_draw[19][23] = 2;house_draw[20][23] = 2;house_draw[21][23] = 2;house_draw[22][23] = 2;house_draw[23][23] = 2;house_draw[24][23] = 2;house_draw[25][23] = 2;house_draw[26][23] = 2;house_draw[27][23] = 2;house_draw[28][23] = 2;house_draw[29][23] = 2;house_draw[30][23] = 2;house_draw[31][23] = 2;house_draw[32][23] = 2;house_draw[33][23] = 2;house_draw[34][23] = 1;house_draw[35][23] = 2;house_draw[36][23] = 2;house_draw[37][23] = 1;house_draw[38][23] = 0;house_draw[39][23] = 0;
        house_draw[0][24] = 1;house_draw[1][24] = 2;house_draw[2][24] = 2;house_draw[3][24] = 2;house_draw[4][24] = 2;house_draw[5][24] = 1;house_draw[6][24] = 1;house_draw[7][24] = 1;house_draw[8][24] = 1;house_draw[9][24] = 1;house_draw[10][24] = 2;house_draw[11][24] = 2;house_draw[12][24] = 2;house_draw[13][24] = 2;house_draw[14][24] = 2;house_draw[15][24] = 2;house_draw[16][24] = 2;house_draw[17][24] = 2;house_draw[18][24] = 2;house_draw[19][24] = 2;house_draw[20][24] = 2;house_draw[21][24] = 2;house_draw[22][24] = 2;house_draw[23][24] = 2;house_draw[24][24] = 2;house_draw[25][24] = 2;house_draw[26][24] = 2;house_draw[27][24] = 2;house_draw[28][24] = 2;house_draw[29][24] = 2;house_draw[30][24] = 2;house_draw[31][24] = 2;house_draw[32][24] = 2;house_draw[33][24] = 2;house_draw[34][24] = 1;house_draw[35][24] = 2;house_draw[36][24] = 1;house_draw[37][24] = 0;house_draw[38][24] = 0;house_draw[39][24] = 0;
        house_draw[0][25] = 1;house_draw[1][25] = 2;house_draw[2][25] = 2;house_draw[3][25] = 2;house_draw[4][25] = 2;house_draw[5][25] = 1;house_draw[6][25] = 1;house_draw[7][25] = 1;house_draw[8][25] = 1;house_draw[9][25] = 1;house_draw[10][25] = 2;house_draw[11][25] = 2;house_draw[12][25] = 2;house_draw[13][25] = 2;house_draw[14][25] = 2;house_draw[15][25] = 2;house_draw[16][25] = 2;house_draw[17][25] = 2;house_draw[18][25] = 2;house_draw[19][25] = 2;house_draw[20][25] = 2;house_draw[21][25] = 2;house_draw[22][25] = 2;house_draw[23][25] = 2;house_draw[24][25] = 2;house_draw[25][25] = 2;house_draw[26][25] = 2;house_draw[27][25] = 2;house_draw[28][25] = 2;house_draw[29][25] = 2;house_draw[30][25] = 2;house_draw[31][25] = 2;house_draw[32][25] = 2;house_draw[33][25] = 2;house_draw[34][25] = 1;house_draw[35][25] = 1;house_draw[36][25] = 0;house_draw[37][25] = 0;house_draw[38][25] = 0;house_draw[39][25] = 0;
        house_draw[0][26] = 1;house_draw[1][26] = 1;house_draw[2][26] = 1;house_draw[3][26] = 1;house_draw[4][26] = 1;house_draw[5][26] = 1;house_draw[6][26] = 1;house_draw[7][26] = 1;house_draw[8][26] = 1;house_draw[9][26] = 1;house_draw[10][26] = 1;house_draw[11][26] = 1;house_draw[12][26] = 1;house_draw[13][26] = 1;house_draw[14][26] = 1;house_draw[15][26] = 1;house_draw[16][26] = 1;house_draw[17][26] = 1;house_draw[18][26] = 1;house_draw[19][26] = 1;house_draw[20][26] = 1;house_draw[21][26] = 1;house_draw[22][26] = 1;house_draw[23][26] = 1;house_draw[24][26] = 1;house_draw[25][26] = 1;house_draw[26][26] = 1;house_draw[27][26] = 1;house_draw[28][26] = 1;house_draw[29][26] = 1;house_draw[30][26] = 1;house_draw[31][26] = 1;house_draw[32][26] = 1;house_draw[33][26] = 1;house_draw[34][26] = 1;house_draw[35][26] = 0;house_draw[36][26] = 0;house_draw[37][26] = 0;house_draw[38][26] = 0;house_draw[39][26] = 0;
        house_draw[0][27] = 0;house_draw[1][27] = 0;house_draw[2][27] = 0;house_draw[3][27] = 0;house_draw[4][27] = 0;house_draw[5][27] = 0;house_draw[6][27] = 0;house_draw[7][27] = 0;house_draw[8][27] = 0;house_draw[9][27] = 0;house_draw[10][27] = 0;house_draw[11][27] = 0;house_draw[12][27] = 0;house_draw[13][27] = 0;house_draw[14][27] = 0;house_draw[15][27] = 0;house_draw[16][27] = 0;house_draw[17][27] = 0;house_draw[18][27] = 0;house_draw[19][27] = 0;house_draw[20][27] = 0;house_draw[21][27] = 0;house_draw[22][27] = 0;house_draw[23][27] = 0;house_draw[24][27] = 0;house_draw[25][27] = 0;house_draw[26][27] = 0;house_draw[27][27] = 0;house_draw[28][27] = 0;house_draw[29][27] = 0;house_draw[30][27] = 0;house_draw[31][27] = 0;house_draw[32][27] = 0;house_draw[33][27] = 0;house_draw[34][27] = 0;house_draw[35][27] = 0;house_draw[36][27] = 0;house_draw[37][27] = 0;house_draw[38][27] = 0;house_draw[39][27] = 0;
        house_draw[0][28] = 0;house_draw[1][28] = 0;house_draw[2][28] = 0;house_draw[3][28] = 0;house_draw[4][28] = 0;house_draw[5][28] = 0;house_draw[6][28] = 0;house_draw[7][28] = 0;house_draw[8][28] = 0;house_draw[9][28] = 0;house_draw[10][28] = 0;house_draw[11][28] = 0;house_draw[12][28] = 0;house_draw[13][28] = 0;house_draw[14][28] = 0;house_draw[15][28] = 0;house_draw[16][28] = 0;house_draw[17][28] = 0;house_draw[18][28] = 0;house_draw[19][28] = 0;house_draw[20][28] = 0;house_draw[21][28] = 0;house_draw[22][28] = 0;house_draw[23][28] = 0;house_draw[24][28] = 0;house_draw[25][28] = 0;house_draw[26][28] = 0;house_draw[27][28] = 0;house_draw[28][28] = 0;house_draw[29][28] = 0;house_draw[30][28] = 0;house_draw[31][28] = 0;house_draw[32][28] = 0;house_draw[33][28] = 0;house_draw[34][28] = 0;house_draw[35][28] = 0;house_draw[36][28] = 0;house_draw[37][28] = 0;house_draw[38][28] = 0;house_draw[39][28] = 0;
        house_draw[0][29] = 0;house_draw[1][29] = 0;house_draw[2][29] = 0;house_draw[3][29] = 0;house_draw[4][29] = 0;house_draw[5][29] = 0;house_draw[6][29] = 0;house_draw[7][29] = 0;house_draw[8][29] = 0;house_draw[9][29] = 0;house_draw[10][29] = 0;house_draw[11][29] = 0;house_draw[12][29] = 0;house_draw[13][29] = 0;house_draw[14][29] = 0;house_draw[15][29] = 0;house_draw[16][29] = 0;house_draw[17][29] = 0;house_draw[18][29] = 0;house_draw[19][29] = 0;house_draw[20][29] = 0;house_draw[21][29] = 0;house_draw[22][29] = 0;house_draw[23][29] = 0;house_draw[24][29] = 0;house_draw[25][29] = 0;house_draw[26][29] = 0;house_draw[27][29] = 0;house_draw[28][29] = 0;house_draw[29][29] = 0;house_draw[30][29] = 0;house_draw[31][29] = 0;house_draw[32][29] = 0;house_draw[33][29] = 0;house_draw[34][29] = 0;house_draw[35][29] = 1;house_draw[36][29] = 0;house_draw[37][29] = 0;house_draw[38][29] = 0;house_draw[39][29] = 0;
        house_draw[0][30] = 0;house_draw[1][30] = 0;house_draw[2][30] = 0;house_draw[3][30] = 0;house_draw[4][30] = 0;house_draw[5][30] = 0;house_draw[6][30] = 0;house_draw[7][30] = 0;house_draw[8][30] = 0;house_draw[9][30] = 0;house_draw[10][30] = 0;house_draw[11][30] = 0;house_draw[12][30] = 0;house_draw[13][30] = 0;house_draw[14][30] = 0;house_draw[15][30] = 0;house_draw[16][30] = 0;house_draw[17][30] = 0;house_draw[18][30] = 0;house_draw[19][30] = 0;house_draw[20][30] = 0;house_draw[21][30] = 0;house_draw[22][30] = 0;house_draw[23][30] = 1;house_draw[24][30] = 0;house_draw[25][30] = 0;house_draw[26][30] = 0;house_draw[27][30] = 1;house_draw[28][30] = 0;house_draw[29][30] = 0;house_draw[30][30] = 0;house_draw[31][30] = 1;house_draw[32][30] = 1;house_draw[33][30] = 0;house_draw[34][30] = 0;house_draw[35][30] = 0;house_draw[36][30] = 0;house_draw[37][30] = 0;house_draw[38][30] = 0;house_draw[39][30] = 0;
        house_draw[0][31] = 0;house_draw[1][31] = 0;house_draw[2][31] = 0;house_draw[3][31] = 0;house_draw[4][31] = 0;house_draw[5][31] = 0;house_draw[6][31] = 0;house_draw[7][31] = 0;house_draw[8][31] = 0;house_draw[9][31] = 0;house_draw[10][31] = 0;house_draw[11][31] = 0;house_draw[12][31] = 0;house_draw[13][31] = 0;house_draw[14][31] = 0;house_draw[15][31] = 0;house_draw[16][31] = 0;house_draw[17][31] = 0;house_draw[18][31] = 0;house_draw[19][31] = 0;house_draw[20][31] = 0;house_draw[21][31] = 0;house_draw[22][31] = 0;house_draw[23][31] = 0;house_draw[24][31] = 0;house_draw[25][31] = 0;house_draw[26][31] = 0;house_draw[27][31] = 1;house_draw[28][31] = 0;house_draw[29][31] = 0;house_draw[30][31] = 1;house_draw[31][31] = 0;house_draw[32][31] = 0;house_draw[33][31] = 1;house_draw[34][31] = 0;house_draw[35][31] = 0;house_draw[36][31] = 0;house_draw[37][31] = 0;house_draw[38][31] = 0;house_draw[39][31] = 0;
        house_draw[0][32] = 0;house_draw[1][32] = 0;house_draw[2][32] = 0;house_draw[3][32] = 0;house_draw[4][32] = 0;house_draw[5][32] = 0;house_draw[6][32] = 0;house_draw[7][32] = 0;house_draw[8][32] = 0;house_draw[9][32] = 0;house_draw[10][32] = 0;house_draw[11][32] = 0;house_draw[12][32] = 0;house_draw[13][32] = 0;house_draw[14][32] = 0;house_draw[15][32] = 0;house_draw[16][32] = 0;house_draw[17][32] = 0;house_draw[18][32] = 0;house_draw[19][32] = 0;house_draw[20][32] = 0;house_draw[21][32] = 0;house_draw[22][32] = 0;house_draw[23][32] = 0;house_draw[24][32] = 0;house_draw[25][32] = 0;house_draw[26][32] = 0;house_draw[27][32] = 0;house_draw[28][32] = 1;house_draw[29][32] = 1;house_draw[30][32] = 0;house_draw[31][32] = 0;house_draw[32][32] = 0;house_draw[33][32] = 1;house_draw[34][32] = 0;house_draw[35][32] = 0;house_draw[36][32] = 0;house_draw[37][32] = 0;house_draw[38][32] = 0;house_draw[39][32] = 0;
        house_draw[0][33] = 0;house_draw[1][33] = 0;house_draw[2][33] = 0;house_draw[3][33] = 0;house_draw[4][33] = 0;house_draw[5][33] = 0;house_draw[6][33] = 0;house_draw[7][33] = 0;house_draw[8][33] = 0;house_draw[9][33] = 0;house_draw[10][33] = 0;house_draw[11][33] = 0;house_draw[12][33] = 0;house_draw[13][33] = 0;house_draw[14][33] = 0;house_draw[15][33] = 0;house_draw[16][33] = 0;house_draw[17][33] = 0;house_draw[18][33] = 0;house_draw[19][33] = 0;house_draw[20][33] = 0;house_draw[21][33] = 0;house_draw[22][33] = 0;house_draw[23][33] = 0;house_draw[24][33] = 0;house_draw[25][33] = 0;house_draw[26][33] = 0;house_draw[27][33] = 0;house_draw[28][33] = 0;house_draw[29][33] = 0;house_draw[30][33] = 0;house_draw[31][33] = 0;house_draw[32][33] = 0;house_draw[33][33] = 0;house_draw[34][33] = 0;house_draw[35][33] = 0;house_draw[36][33] = 0;house_draw[37][33] = 0;house_draw[38][33] = 0;house_draw[39][33] = 0;
        house_draw[0][34] = 0;house_draw[1][34] = 0;house_draw[2][34] = 0;house_draw[3][34] = 0;house_draw[4][34] = 0;house_draw[5][34] = 0;house_draw[6][34] = 0;house_draw[7][34] = 0;house_draw[8][34] = 0;house_draw[9][34] = 0;house_draw[10][34] = 0;house_draw[11][34] = 0;house_draw[12][34] = 0;house_draw[13][34] = 0;house_draw[14][34] = 0;house_draw[15][34] = 0;house_draw[16][34] = 0;house_draw[17][34] = 0;house_draw[18][34] = 0;house_draw[19][34] = 0;house_draw[20][34] = 0;house_draw[21][34] = 0;house_draw[22][34] = 0;house_draw[23][34] = 0;house_draw[24][34] = 0;house_draw[25][34] = 1;house_draw[26][34] = 0;house_draw[27][34] = 0;house_draw[28][34] = 0;house_draw[29][34] = 0;house_draw[30][34] = 0;house_draw[31][34] = 0;house_draw[32][34] = 0;house_draw[33][34] = 0;house_draw[34][34] = 0;house_draw[35][34] = 0;house_draw[36][34] = 0;house_draw[37][34] = 0;house_draw[38][34] = 0;house_draw[39][34] = 0;
        house_draw[0][35] = 0;house_draw[1][35] = 0;house_draw[2][35] = 0;house_draw[3][35] = 0;house_draw[4][35] = 0;house_draw[5][35] = 0;house_draw[6][35] = 0;house_draw[7][35] = 0;house_draw[8][35] = 0;house_draw[9][35] = 0;house_draw[10][35] = 0;house_draw[11][35] = 0;house_draw[12][35] = 0;house_draw[13][35] = 0;house_draw[14][35] = 0;house_draw[15][35] = 0;house_draw[16][35] = 0;house_draw[17][35] = 0;house_draw[18][35] = 0;house_draw[19][35] = 0;house_draw[20][35] = 0;house_draw[21][35] = 0;house_draw[22][35] = 0;house_draw[23][35] = 0;house_draw[24][35] = 0;house_draw[25][35] = 0;house_draw[26][35] = 0;house_draw[27][35] = 0;house_draw[28][35] = 0;house_draw[29][35] = 0;house_draw[30][35] = 0;house_draw[31][35] = 0;house_draw[32][35] = 0;house_draw[33][35] = 0;house_draw[34][35] = 1;house_draw[35][35] = 0;house_draw[36][35] = 0;house_draw[37][35] = 0;house_draw[38][35] = 0;house_draw[39][35] = 0;
    end
    else begin
        
    end
end


assign active_house = (x_map == 4 && y_map == 0) ? 1 : 0;
assign active_house_draw = ((house_draw[h_counter - 300 - 144 - 1][v_counter - 222 - 96 - 4] == 1) && active_house) ? 1 : 0;
assign active_house_draw_back = ((house_draw[h_counter - 300 - 144 - 1][v_counter - 222 - 96 - 4] == 2) && active_house) ? 1 : 0;

endmodule