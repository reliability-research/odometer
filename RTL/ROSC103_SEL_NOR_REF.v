`timescale 1ns/100ps

module ROSC103_SEL_NOR_REF ( IN, OUT, VDD, VSS );
  input IN, VDD, VSS;
  output OUT;
  wire   LO, \w[102] , \w[101] , \w[100] , \w[99] , \w[98] , \w[97] , \w[96] ,
         \w[95] , \w[94] , \w[93] , \w[92] , \w[91] , \w[90] , \w[89] ,
         \w[88] , \w[87] , \w[86] , \w[85] , \w[84] , \w[83] , \w[82] ,
         \w[81] , \w[80] , \w[79] , \w[78] , \w[77] , \w[76] , \w[75] ,
         \w[74] , \w[73] , \w[72] , \w[71] , \w[70] , \w[69] , \w[68] ,
         \w[67] , \w[66] , \w[65] , \w[64] , \w[63] , \w[62] , \w[61] ,
         \w[60] , \w[59] , \w[58] , \w[57] , \w[56] , \w[55] , \w[54] ,
         \w[53] , \w[52] , \w[51] , \w[50] , \w[49] , \w[48] , \w[47] ,
         \w[46] , \w[45] , \w[44] , \w[43] , \w[42] , \w[41] , \w[40] ,
         \w[39] , \w[38] , \w[37] , \w[36] , \w[35] , \w[34] , \w[33] ,
         \w[32] , \w[31] , \w[30] , \w[29] , \w[28] , \w[27] , \w[26] ,
         \w[25] , \w[24] , \w[23] , \w[22] , \w[21] , \w[20] , \w[19] ,
         \w[18] , \w[17] , \w[16] , \w[15] , \w[14] , \w[13] , \w[12] ,
         \w[11] , \w[10] , \w[9] , \w[8] , \w[7] , \w[6] , \w[5] , \w[4] ,
         \w[3] , \w[2] ;

  TIELOX2 TIELO(.X (LO));
  NORX2 nrx1x_NOR ( .A1(LO), .A2(IN), .X(\w[2] ) );
  NORX2 nrx2x_NOR ( .A1(LO), .A2(\w[2] ), .X(\w[3] ) );
  NORX2 nrx3x_NOR ( .A1(LO), .A2(\w[3] ), .X(\w[4] ) );
  NORX2 nrx4x_NOR ( .A1(LO), .A2(\w[4] ), .X(\w[5] ) );
  NORX2 nrx5x_NOR ( .A1(LO), .A2(\w[5] ), .X(\w[6] ) );
  NORX2 nrx6x_NOR ( .A1(LO), .A2(\w[6] ), .X(\w[7] ) );
  NORX2 nrx7x_NOR ( .A1(LO), .A2(\w[7] ), .X(\w[8] ) );
  NORX2 nrx8x_NOR ( .A1(LO), .A2(\w[8] ), .X(\w[9] ) );
  NORX2 nrx9x_NOR ( .A1(LO), .A2(\w[9] ), .X(\w[10] ) );
  NORX2 nrx10x_NOR ( .A1(LO), .A2(\w[10] ), .X(\w[11] ) );
  NORX2 nrx11x_NOR ( .A1(LO), .A2(\w[11] ), .X(\w[12] ) );
  NORX2 nrx12x_NOR ( .A1(LO), .A2(\w[12] ), .X(\w[13] ) );
  NORX2 nrx13x_NOR ( .A1(LO), .A2(\w[13] ), .X(\w[14] ) );
  NORX2 nrx14x_NOR ( .A1(LO), .A2(\w[14] ), .X(\w[15] ) );
  NORX2 nrx15x_NOR ( .A1(LO), .A2(\w[15] ), .X(\w[16] ) );
  NORX2 nrx16x_NOR ( .A1(LO), .A2(\w[16] ), .X(\w[17] ) );
  NORX2 nrx17x_NOR ( .A1(LO), .A2(\w[17] ), .X(\w[18] ) );
  NORX2 nrx18x_NOR ( .A1(LO), .A2(\w[18] ), .X(\w[19] ) );
  NORX2 nrx19x_NOR ( .A1(LO), .A2(\w[19] ), .X(\w[20] ) );
  NORX2 nrx20x_NOR ( .A1(LO), .A2(\w[20] ), .X(\w[21] ) );
  NORX2 nrx21x_NOR ( .A1(LO), .A2(\w[21] ), .X(\w[22] ) );
  NORX2 nrx22x_NOR ( .A1(LO), .A2(\w[22] ), .X(\w[23] ) );
  NORX2 nrx23x_NOR ( .A1(LO), .A2(\w[23] ), .X(\w[24] ) );
  NORX2 nrx24x_NOR ( .A1(LO), .A2(\w[24] ), .X(\w[25] ) );
  NORX2 nrx25x_NOR ( .A1(LO), .A2(\w[25] ), .X(\w[26] ) );
  NORX2 nrx26x_NOR ( .A1(LO), .A2(\w[26] ), .X(\w[27] ) );
  NORX2 nrx27x_NOR ( .A1(LO), .A2(\w[27] ), .X(\w[28] ) );
  NORX2 nrx28x_NOR ( .A1(LO), .A2(\w[28] ), .X(\w[29] ) );
  NORX2 nrx29x_NOR ( .A1(LO), .A2(\w[29] ), .X(\w[30] ) );
  NORX2 nrx30x_NOR ( .A1(LO), .A2(\w[30] ), .X(\w[31] ) );
  NORX2 nrx31x_NOR ( .A1(LO), .A2(\w[31] ), .X(\w[32] ) );
  NORX2 nrx32x_NOR ( .A1(LO), .A2(\w[32] ), .X(\w[33] ) );
  NORX2 nrx33x_NOR ( .A1(LO), .A2(\w[33] ), .X(\w[34] ) );
  NORX2 nrx34x_NOR ( .A1(LO), .A2(\w[34] ), .X(\w[35] ) );
  NORX2 nrx35x_NOR ( .A1(LO), .A2(\w[35] ), .X(\w[36] ) );
  NORX2 nrx36x_NOR ( .A1(LO), .A2(\w[36] ), .X(\w[37] ) );
  NORX2 nrx37x_NOR ( .A1(LO), .A2(\w[37] ), .X(\w[38] ) );
  NORX2 nrx38x_NOR ( .A1(LO), .A2(\w[38] ), .X(\w[39] ) );
  NORX2 nrx39x_NOR ( .A1(LO), .A2(\w[39] ), .X(\w[40] ) );
  NORX2 nrx40x_NOR ( .A1(LO), .A2(\w[40] ), .X(\w[41] ) );
  NORX2 nrx41x_NOR ( .A1(LO), .A2(\w[41] ), .X(\w[42] ) );
  NORX2 nrx42x_NOR ( .A1(LO), .A2(\w[42] ), .X(\w[43] ) );
  NORX2 nrx43x_NOR ( .A1(LO), .A2(\w[43] ), .X(\w[44] ) );
  NORX2 nrx44x_NOR ( .A1(LO), .A2(\w[44] ), .X(\w[45] ) );
  NORX2 nrx45x_NOR ( .A1(LO), .A2(\w[45] ), .X(\w[46] ) );
  NORX2 nrx46x_NOR ( .A1(LO), .A2(\w[46] ), .X(\w[47] ) );
  NORX2 nrx47x_NOR ( .A1(LO), .A2(\w[47] ), .X(\w[48] ) );
  NORX2 nrx48x_NOR ( .A1(LO), .A2(\w[48] ), .X(\w[49] ) );
  NORX2 nrx49x_NOR ( .A1(LO), .A2(\w[49] ), .X(\w[50] ) );
  NORX2 nrx50x_NOR ( .A1(LO), .A2(\w[50] ), .X(\w[51] ) );
  NORX2 nrx51x_NOR ( .A1(LO), .A2(\w[51] ), .X(\w[52] ) );
  NORX2 nrx52x_NOR ( .A1(LO), .A2(\w[52] ), .X(\w[53] ) );
  NORX2 nrx53x_NOR ( .A1(LO), .A2(\w[53] ), .X(\w[54] ) );
  NORX2 nrx54x_NOR ( .A1(LO), .A2(\w[54] ), .X(\w[55] ) );
  NORX2 nrx55x_NOR ( .A1(LO), .A2(\w[55] ), .X(\w[56] ) );
  NORX2 nrx56x_NOR ( .A1(LO), .A2(\w[56] ), .X(\w[57] ) );
  NORX2 nrx57x_NOR ( .A1(LO), .A2(\w[57] ), .X(\w[58] ) );
  NORX2 nrx58x_NOR ( .A1(LO), .A2(\w[58] ), .X(\w[59] ) );
  NORX2 nrx59x_NOR ( .A1(LO), .A2(\w[59] ), .X(\w[60] ) );
  NORX2 nrx60x_NOR ( .A1(LO), .A2(\w[60] ), .X(\w[61] ) );
  NORX2 nrx61x_NOR ( .A1(LO), .A2(\w[61] ), .X(\w[62] ) );
  NORX2 nrx62x_NOR ( .A1(LO), .A2(\w[62] ), .X(\w[63] ) );
  NORX2 nrx63x_NOR ( .A1(LO), .A2(\w[63] ), .X(\w[64] ) );
  NORX2 nrx64x_NOR ( .A1(LO), .A2(\w[64] ), .X(\w[65] ) );
  NORX2 nrx65x_NOR ( .A1(LO), .A2(\w[65] ), .X(\w[66] ) );
  NORX2 nrx66x_NOR ( .A1(LO), .A2(\w[66] ), .X(\w[67] ) );
  NORX2 nrx67x_NOR ( .A1(LO), .A2(\w[67] ), .X(\w[68] ) );
  NORX2 nrx68x_NOR ( .A1(LO), .A2(\w[68] ), .X(\w[69] ) );
  NORX2 nrx69x_NOR ( .A1(LO), .A2(\w[69] ), .X(\w[70] ) );
  NORX2 nrx70x_NOR ( .A1(LO), .A2(\w[70] ), .X(\w[71] ) );
  NORX2 nrx71x_NOR ( .A1(LO), .A2(\w[71] ), .X(\w[72] ) );
  NORX2 nrx72x_NOR ( .A1(LO), .A2(\w[72] ), .X(\w[73] ) );
  NORX2 nrx73x_NOR ( .A1(LO), .A2(\w[73] ), .X(\w[74] ) );
  NORX2 nrx74x_NOR ( .A1(LO), .A2(\w[74] ), .X(\w[75] ) );
  NORX2 nrx75x_NOR ( .A1(LO), .A2(\w[75] ), .X(\w[76] ) );
  NORX2 nrx76x_NOR ( .A1(LO), .A2(\w[76] ), .X(\w[77] ) );
  NORX2 nrx77x_NOR ( .A1(LO), .A2(\w[77] ), .X(\w[78] ) );
  NORX2 nrx78x_NOR ( .A1(LO), .A2(\w[78] ), .X(\w[79] ) );
  NORX2 nrx79x_NOR ( .A1(LO), .A2(\w[79] ), .X(\w[80] ) );
  NORX2 nrx80x_NOR ( .A1(LO), .A2(\w[80] ), .X(\w[81] ) );
  NORX2 nrx81x_NOR ( .A1(LO), .A2(\w[81] ), .X(\w[82] ) );
  NORX2 nrx82x_NOR ( .A1(LO), .A2(\w[82] ), .X(\w[83] ) );
  NORX2 nrx83x_NOR ( .A1(LO), .A2(\w[83] ), .X(\w[84] ) );
  NORX2 nrx84x_NOR ( .A1(LO), .A2(\w[84] ), .X(\w[85] ) );
  NORX2 nrx85x_NOR ( .A1(LO), .A2(\w[85] ), .X(\w[86] ) );
  NORX2 nrx86x_NOR ( .A1(LO), .A2(\w[86] ), .X(\w[87] ) );
  NORX2 nrx87x_NOR ( .A1(LO), .A2(\w[87] ), .X(\w[88] ) );
  NORX2 nrx88x_NOR ( .A1(LO), .A2(\w[88] ), .X(\w[89] ) );
  NORX2 nrx89x_NOR ( .A1(LO), .A2(\w[89] ), .X(\w[90] ) );
  NORX2 nrx90x_NOR ( .A1(LO), .A2(\w[90] ), .X(\w[91] ) );
  NORX2 nrx91x_NOR ( .A1(LO), .A2(\w[91] ), .X(\w[92] ) );
  NORX2 nrx92x_NOR ( .A1(LO), .A2(\w[92] ), .X(\w[93] ) );
  NORX2 nrx93x_NOR ( .A1(LO), .A2(\w[93] ), .X(\w[94] ) );
  NORX2 nrx94x_NOR ( .A1(LO), .A2(\w[94] ), .X(\w[95] ) );
  NORX2 nrx95x_NOR ( .A1(LO), .A2(\w[95] ), .X(\w[96] ) );
  NORX2 nrx96x_NOR ( .A1(LO), .A2(\w[96] ), .X(\w[97] ) );
  NORX2 nrx97x_NOR ( .A1(LO), .A2(\w[97] ), .X(\w[98] ) );
  NORX2 nrx98x_NOR ( .A1(LO), .A2(\w[98] ), .X(\w[99] ) );
  NORX2 nrx99x_NOR ( .A1(LO), .A2(\w[99] ), .X(\w[100] ) );
  NORX2 nrx100x_NOR ( .A1(LO), .A2(\w[100] ), .X(\w[101] ) );
  NORX2 nrx101x_NOR ( .A1(LO), .A2(\w[101] ), .X(\w[102] ) );
  NORX2 nrx102x_NOR ( .A1(LO), .A2(\w[102] ), .X(OUT) );
endmodule

