// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\all_model_filt\Filter.v
// Created: 2020-11-14 19:40:50
// 
// Generated by MATLAB 9.5 and HDL Coder 3.13
// 
// 
// -- -------------------------------------------------------------
// -- Rate and Clocking Details
// -- -------------------------------------------------------------
// Model base rate: 0.0001
// Target subsystem base rate: 0.0001
// 
// 
// Clock Enable  Sample Time
// -- -------------------------------------------------------------
// ce_out        0.0001
// -- -------------------------------------------------------------
// 
// 
// Output Signal                 Clock Enable  Sample Time
// -- -------------------------------------------------------------
// Output_rsvd                   ce_out        0.0001
// -- -------------------------------------------------------------
// 
// -------------------------------------------------------------


// ------------------------------------------------------------
// 
// Module: Filter
// Source Path: all_model_filt/Filter
// Hierarchy Level: 0
// 
// ------------------------------------------------------------

`timescale 1 ns / 1 ns

module Filter
          (clk,
           reset,
           clk_enable,
           Input_rsvd,
           ce_out,
           Output_rsvd);


  input   clk;
  input   reset;
  input   clk_enable;
  input   signed [17:0] Input_rsvd;  // sfix18_En5
  output  ce_out;
  output  signed [17:0] Output_rsvd;  // sfix18_En5


  wire enb;
  wire signed [37:0] s_1_mul_temp;  // sfix38_En24
  wire signed [36:0] s_1_cast;  // sfix37_En24
  wire signed [25:0] s_1_out1;  // sfix26_En17
  reg signed [32:0] Delay11_out1;  // sfix33_En18
  reg signed [32:0] Delay21_out1;  // sfix33_En18
  wire signed [59:0] a_3_1_mul_temp;  // sfix60_En44
  wire signed [58:0] a_3_1_cast;  // sfix59_En44
  wire signed [30:0] a_3_1_out1;  // sfix31_En16
  wire signed [32:0] SumA31_out1;  // sfix33_En18
  wire signed [60:0] a_2_1_mul_temp;  // sfix61_En44
  wire signed [33:0] a_2_1_out1;  // sfix34_En18
  wire signed [33:0] SumA21_sub_cast;  // sfix34_En18
  wire signed [34:0] SumA21_sub_cast_1;  // sfix35_En18
  wire signed [34:0] SumA21_sub_cast_2;  // sfix35_En18
  wire signed [34:0] SumA21_sub_temp;  // sfix35_En18
  wire signed [33:0] SumA21_out1;  // sfix34_En18
  wire signed [34:0] SumA31_sub_cast;  // sfix35_En18
  wire signed [33:0] SumA31_sub_cast_1;  // sfix34_En18
  wire signed [34:0] SumA31_sub_cast_2;  // sfix35_En18
  wire signed [34:0] SumA31_sub_temp;  // sfix35_En18
  wire signed [33:0] SumA31_cast;  // sfix34_En18
  wire signed [52:0] b_2_1_mul_temp;  // sfix53_En37
  wire signed [51:0] b_2_1_cast;  // sfix52_En37
  wire signed [24:0] b_2_1_out1;  // sfix25_En11
  wire signed [25:0] SumB21_add_cast;  // sfix26_En10
  wire signed [25:0] SumB21_add_cast_1;  // sfix26_En10
  wire signed [25:0] SumB21_out1;  // sfix26_En10
  wire signed [27:0] SumB31_add_cast;  // sfix28_En11
  wire signed [27:0] SumB31_add_cast_1;  // sfix28_En11
  wire signed [27:0] SumB31_out1;  // sfix28_En11
  wire signed [56:0] s_2_mul_temp;  // sfix57_En39
  wire signed [55:0] s_2_cast;  // sfix56_En39
  wire signed [29:0] s_2_out1;  // sfix30_En20
  reg signed [34:0] Delay12_out1;  // sfix35_En21
  reg signed [34:0] Delay22_out1;  // sfix35_En21
  wire signed [60:0] a_3_2_mul_temp;  // sfix61_En46
  wire signed [59:0] a_3_2_cast;  // sfix60_En46
  wire signed [34:0] a_3_2_out1;  // sfix35_En21
  wire signed [34:0] SumA32_out1;  // sfix35_En21
  wire signed [57:0] a_2_2_mul_temp;  // sfix58_En42
  wire signed [33:0] a_2_2_out1;  // sfix34_En19
  wire signed [34:0] SumA22_sub_cast;  // sfix35_En20
  wire signed [35:0] SumA22_sub_cast_1;  // sfix36_En20
  wire signed [35:0] SumA22_sub_cast_2;  // sfix36_En20
  wire signed [35:0] SumA22_sub_temp;  // sfix36_En20
  wire signed [34:0] SumA22_out1;  // sfix35_En20
  wire signed [36:0] SumA32_sub_cast;  // sfix37_En21
  wire signed [35:0] SumA32_sub_cast_1;  // sfix36_En21
  wire signed [36:0] SumA32_sub_cast_2;  // sfix37_En21
  wire signed [36:0] SumA32_sub_temp;  // sfix37_En21
  wire signed [35:0] SumA32_cast;  // sfix36_En21
  wire signed [55:0] b_2_2_mul_temp;  // sfix56_En40
  wire signed [28:0] b_2_2_out1;  // sfix29_En15
  wire signed [28:0] SumB22_add_cast;  // sfix29_En15
  wire signed [29:0] SumB22_add_cast_1;  // sfix30_En15
  wire signed [29:0] SumB22_add_cast_2;  // sfix30_En15
  wire signed [29:0] SumB22_add_temp;  // sfix30_En15
  wire signed [28:0] SumB22_cast;  // sfix29_En15
  wire signed [25:0] SumB22_out1;  // sfix26_En15
  wire signed [29:0] SumB32_add_cast;  // sfix30_En16
  wire signed [30:0] SumB32_add_cast_1;  // sfix31_En16
  wire signed [29:0] SumB32_add_cast_2;  // sfix30_En16
  wire signed [30:0] SumB32_add_cast_3;  // sfix31_En16
  wire signed [30:0] SumB32_add_temp;  // sfix31_En16
  wire signed [29:0] SumB32_cast;  // sfix30_En16
  wire signed [17:0] SumB32_out1;  // sfix18_En5
  reg signed [17:0] SumB32_out1_1;


  assign s_1_mul_temp = 20'sb00000111101110101001 * Input_rsvd;
  assign s_1_cast = s_1_mul_temp[36:0];
  assign s_1_out1 = (((s_1_cast[36] == 1'b0) && (s_1_cast[35:32] != 4'b0000)) || ((s_1_cast[36] == 1'b0) && (s_1_cast[32:7] == 26'sb01111111111111111111111111)) ? 26'sb01111111111111111111111111 :
              ((s_1_cast[36] == 1'b1) && (s_1_cast[35:32] != 4'b1111) ? 26'sb10000000000000000000000000 :
              s_1_cast[32:7] + $signed({1'b0, s_1_cast[6]})));


  assign enb = clk_enable;

  always @(posedge clk or posedge reset)
    begin : Delay21_process
      if (reset == 1'b1) begin
        Delay21_out1 <= 33'sh000000000;
      end
      else begin
        if (enb) begin
          Delay21_out1 <= Delay11_out1;
        end
      end
    end


  assign a_3_1_mul_temp = 27'sb011010111101010010000101011 * Delay21_out1;
  assign a_3_1_cast = a_3_1_mul_temp[58:0];
  assign a_3_1_out1 = ((a_3_1_cast[58] == 1'b0) && (a_3_1_cast[57:28] == 30'b111111111111111111111111111111) ? 31'sb0111111111111111111111111111111 :
              a_3_1_cast[58:28] + $signed({1'b0, a_3_1_cast[27]}));


  always @(posedge clk or posedge reset)
    begin : Delay11_process
      if (reset == 1'b1) begin
        Delay11_out1 <= 33'sh000000000;
      end
      else begin
        if (enb) begin
          Delay11_out1 <= SumA31_out1;
        end
      end
    end


  assign a_2_1_mul_temp = 28'sb1000101011001111011011011011 * Delay11_out1;
  assign a_2_1_out1 = (((a_2_1_mul_temp[60] == 1'b0) && (a_2_1_mul_temp[59] != 1'b0)) || ((a_2_1_mul_temp[60] == 1'b0) && (a_2_1_mul_temp[59:26] == 34'sh1FFFFFFFF)) ? 34'sh1FFFFFFFF :
              ((a_2_1_mul_temp[60] == 1'b1) && (a_2_1_mul_temp[59] != 1'b1) ? 34'sh200000000 :
              a_2_1_mul_temp[59:26] + $signed({1'b0, a_2_1_mul_temp[25]})));


  assign SumA21_sub_cast = {{7{s_1_out1[25]}}, {s_1_out1, 1'b0}};
  assign SumA21_sub_cast_1 = {SumA21_sub_cast[33], SumA21_sub_cast};
  assign SumA21_sub_cast_2 = {a_2_1_out1[33], a_2_1_out1};
  assign SumA21_sub_temp = SumA21_sub_cast_1 - SumA21_sub_cast_2;
  assign SumA21_out1 = ((SumA21_sub_temp[34] == 1'b0) && (SumA21_sub_temp[33] != 1'b0) ? 34'sh1FFFFFFFF :
              ((SumA21_sub_temp[34] == 1'b1) && (SumA21_sub_temp[33] != 1'b1) ? 34'sh200000000 :
              $signed(SumA21_sub_temp[33:0])));


  assign SumA31_sub_cast = {SumA21_out1[33], SumA21_out1};
  assign SumA31_sub_cast_1 = {a_3_1_out1[30], {a_3_1_out1, 2'b00}};
  assign SumA31_sub_cast_2 = {SumA31_sub_cast_1[33], SumA31_sub_cast_1};
  assign SumA31_sub_temp = SumA31_sub_cast - SumA31_sub_cast_2;
  assign SumA31_cast = ((SumA31_sub_temp[34] == 1'b0) && (SumA31_sub_temp[33] != 1'b0) ? 34'sh1FFFFFFFF :
              ((SumA31_sub_temp[34] == 1'b1) && (SumA31_sub_temp[33] != 1'b1) ? 34'sh200000000 :
              $signed(SumA31_sub_temp[33:0])));
  assign SumA31_out1 = ((SumA31_cast[33] == 1'b0) && (SumA31_cast[32] != 1'b0) ? 33'sh0FFFFFFFF :
              ((SumA31_cast[33] == 1'b1) && (SumA31_cast[32] != 1'b1) ? 33'sh100000000 :
              $signed(SumA31_cast[32:0])));


  assign b_2_1_mul_temp = 20'sb01000110001000011001 * Delay11_out1;
  assign b_2_1_cast = b_2_1_mul_temp[51:0];
  assign b_2_1_out1 = (((b_2_1_cast[51] == 1'b0) && (b_2_1_cast[50] != 1'b0)) || ((b_2_1_cast[51] == 1'b0) && (b_2_1_cast[50:26] == 25'sb0111111111111111111111111)) ? 25'sb0111111111111111111111111 :
              ((b_2_1_cast[51] == 1'b1) && (b_2_1_cast[50] != 1'b1) ? 25'sb1000000000000000000000000 :
              b_2_1_cast[50:26] + $signed({1'b0, b_2_1_cast[25]})));


  assign SumB21_add_cast = ({SumA31_out1[32], SumA31_out1[32:8]}) + $signed({1'b0, SumA31_out1[7]});
  assign SumB21_add_cast_1 = ({{2{b_2_1_out1[24]}}, b_2_1_out1[24:1]}) + $signed({1'b0, b_2_1_out1[0]});
  assign SumB21_out1 = SumB21_add_cast + SumB21_add_cast_1;


  assign SumB31_add_cast = {SumB21_out1[25], {SumB21_out1, 1'b0}};
  assign SumB31_add_cast_1 = ({{2{Delay21_out1[32]}}, Delay21_out1[32:7]}) + $signed({1'b0, Delay21_out1[6]});
  assign SumB31_out1 = SumB31_add_cast + SumB31_add_cast_1;


  assign s_2_mul_temp = 29'sb00000000010010000001000000011 * SumB31_out1;
  assign s_2_cast = s_2_mul_temp[55:0];
  assign s_2_out1 = (((s_2_cast[55] == 1'b0) && (s_2_cast[54:48] != 7'b0000000)) || ((s_2_cast[55] == 1'b0) && (s_2_cast[48:19] == 30'sb011111111111111111111111111111)) ? 30'sb011111111111111111111111111111 :
              ((s_2_cast[55] == 1'b1) && (s_2_cast[54:48] != 7'b1111111) ? 30'sb100000000000000000000000000000 :
              s_2_cast[48:19] + $signed({1'b0, s_2_cast[18]})));


  always @(posedge clk or posedge reset)
    begin : Delay22_process
      if (reset == 1'b1) begin
        Delay22_out1 <= 35'sh000000000;
      end
      else begin
        if (enb) begin
          Delay22_out1 <= Delay12_out1;
        end
      end
    end


  assign a_3_2_mul_temp = 26'sb01110111011011110000100011 * Delay22_out1;
  assign a_3_2_cast = a_3_2_mul_temp[59:0];
  assign a_3_2_out1 = ((a_3_2_cast[59] == 1'b0) && (a_3_2_cast[58:25] == 34'h3FFFFFFFF) ? 35'sh3FFFFFFFF :
              a_3_2_cast[59:25] + $signed({1'b0, a_3_2_cast[24]}));


  always @(posedge clk or posedge reset)
    begin : Delay12_process
      if (reset == 1'b1) begin
        Delay12_out1 <= 35'sh000000000;
      end
      else begin
        if (enb) begin
          Delay12_out1 <= SumA32_out1;
        end
      end
    end


  assign a_2_2_mul_temp = 23'sb10000110000110101100001 * Delay12_out1;
  assign a_2_2_out1 = (((a_2_2_mul_temp[57] == 1'b0) && (a_2_2_mul_temp[56] != 1'b0)) || ((a_2_2_mul_temp[57] == 1'b0) && (a_2_2_mul_temp[56:23] == 34'sh1FFFFFFFF)) ? 34'sh1FFFFFFFF :
              ((a_2_2_mul_temp[57] == 1'b1) && (a_2_2_mul_temp[56] != 1'b1) ? 34'sh200000000 :
              a_2_2_mul_temp[56:23] + $signed({1'b0, a_2_2_mul_temp[22]})));


  assign SumA22_sub_cast = {{5{s_2_out1[29]}}, s_2_out1};
  assign SumA22_sub_cast_1 = {SumA22_sub_cast[34], SumA22_sub_cast};
  assign SumA22_sub_cast_2 = {a_2_2_out1[33], {a_2_2_out1, 1'b0}};
  assign SumA22_sub_temp = SumA22_sub_cast_1 - SumA22_sub_cast_2;
  assign SumA22_out1 = ((SumA22_sub_temp[35] == 1'b0) && (SumA22_sub_temp[34] != 1'b0) ? 35'sh3FFFFFFFF :
              ((SumA22_sub_temp[35] == 1'b1) && (SumA22_sub_temp[34] != 1'b1) ? 35'sh400000000 :
              $signed(SumA22_sub_temp[34:0])));


  assign SumA32_sub_cast = {SumA22_out1[34], {SumA22_out1, 1'b0}};
  assign SumA32_sub_cast_1 = {a_3_2_out1[34], a_3_2_out1};
  assign SumA32_sub_cast_2 = {SumA32_sub_cast_1[35], SumA32_sub_cast_1};
  assign SumA32_sub_temp = SumA32_sub_cast - SumA32_sub_cast_2;
  assign SumA32_cast = ((SumA32_sub_temp[36] == 1'b0) && (SumA32_sub_temp[35] != 1'b0) ? 36'sh7FFFFFFFF :
              ((SumA32_sub_temp[36] == 1'b1) && (SumA32_sub_temp[35] != 1'b1) ? 36'sh800000000 :
              $signed(SumA32_sub_temp[35:0])));
  assign SumA32_out1 = ((SumA32_cast[35] == 1'b0) && (SumA32_cast[34] != 1'b0) ? 35'sh3FFFFFFFF :
              ((SumA32_cast[35] == 1'b1) && (SumA32_cast[34] != 1'b1) ? 35'sh400000000 :
              $signed(SumA32_cast[34:0])));


  assign b_2_2_mul_temp = 21'sb101110111001111111011 * Delay12_out1;
  assign b_2_2_out1 = (((b_2_2_mul_temp[55] == 1'b0) && (b_2_2_mul_temp[54:53] != 2'b00)) || ((b_2_2_mul_temp[55] == 1'b0) && (b_2_2_mul_temp[53:25] == 29'sb01111111111111111111111111111)) ? 29'sb01111111111111111111111111111 :
              ((b_2_2_mul_temp[55] == 1'b1) && (b_2_2_mul_temp[54:53] != 2'b11) ? 29'sb10000000000000000000000000000 :
              b_2_2_mul_temp[53:25] + $signed({1'b0, b_2_2_mul_temp[24]})));


  assign SumB22_add_cast = ((SumA32_out1[34] == 1'b0) && (SumA32_out1[33:6] == 28'b1111111111111111111111111111) ? 29'sb01111111111111111111111111111 :
              SumA32_out1[34:6] + $signed({1'b0, SumA32_out1[5]}));
  assign SumB22_add_cast_1 = {SumB22_add_cast[28], SumB22_add_cast};
  assign SumB22_add_cast_2 = {b_2_2_out1[28], b_2_2_out1};
  assign SumB22_add_temp = SumB22_add_cast_1 + SumB22_add_cast_2;
  assign SumB22_cast = ((SumB22_add_temp[29] == 1'b0) && (SumB22_add_temp[28] != 1'b0) ? 29'sb01111111111111111111111111111 :
              ((SumB22_add_temp[29] == 1'b1) && (SumB22_add_temp[28] != 1'b1) ? 29'sb10000000000000000000000000000 :
              $signed(SumB22_add_temp[28:0])));
  assign SumB22_out1 = ((SumB22_cast[28] == 1'b0) && (SumB22_cast[27:25] != 3'b000) ? 26'sb01111111111111111111111111 :
              ((SumB22_cast[28] == 1'b1) && (SumB22_cast[27:25] != 3'b111) ? 26'sb10000000000000000000000000 :
              $signed(SumB22_cast[25:0])));


  assign SumB32_add_cast = {{3{SumB22_out1[25]}}, {SumB22_out1, 1'b0}};
  assign SumB32_add_cast_1 = {SumB32_add_cast[29], SumB32_add_cast};
  assign SumB32_add_cast_2 = ((Delay22_out1[34] == 1'b0) && (Delay22_out1[33:5] == 29'b11111111111111111111111111111) ? 30'sb011111111111111111111111111111 :
              Delay22_out1[34:5] + $signed({1'b0, Delay22_out1[4]}));
  assign SumB32_add_cast_3 = {SumB32_add_cast_2[29], SumB32_add_cast_2};
  assign SumB32_add_temp = SumB32_add_cast_1 + SumB32_add_cast_3;
  assign SumB32_cast = ((SumB32_add_temp[30] == 1'b0) && (SumB32_add_temp[29] != 1'b0) ? 30'sb011111111111111111111111111111 :
              ((SumB32_add_temp[30] == 1'b1) && (SumB32_add_temp[29] != 1'b1) ? 30'sb100000000000000000000000000000 :
              $signed(SumB32_add_temp[29:0])));
  assign SumB32_out1 = (((SumB32_cast[29] == 1'b0) && (SumB32_cast[28] != 1'b0)) || ((SumB32_cast[29] == 1'b0) && (SumB32_cast[28:11] == 18'sb011111111111111111)) ? 18'sb011111111111111111 :
              ((SumB32_cast[29] == 1'b1) && (SumB32_cast[28] != 1'b1) ? 18'sb100000000000000000 :
              SumB32_cast[28:11] + $signed({1'b0, SumB32_cast[10]})));

  always@(posedge clk)
  SumB32_out1_1<=SumB32_out1;

  assign Output_rsvd = SumB32_out1_1;

  assign ce_out = clk_enable;

endmodule  // Filter
