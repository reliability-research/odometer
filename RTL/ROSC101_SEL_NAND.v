`timescale 1ns/100ps

module ROSC101_SEL_NAND ( IN, OUT, VDD, VSS );
  input IN, VDD, VSS;
  output OUT;
  wire   HI, \w[100] , \w[99] , \w[98] , \w[97] , \w[96] , \w[95] , \w[94] ,
         \w[93] , \w[92] , \w[91] , \w[90] , \w[89] , \w[88] , \w[87] ,
         \w[86] , \w[85] , \w[84] , \w[83] , \w[82] , \w[81] , \w[80] ,
         \w[79] , \w[78] , \w[77] , \w[76] , \w[75] , \w[74] , \w[73] ,
         \w[72] , \w[71] , \w[70] , \w[69] , \w[68] , \w[67] , \w[66] ,
         \w[65] , \w[64] , \w[63] , \w[62] , \w[61] , \w[60] , \w[59] ,
         \w[58] , \w[57] , \w[56] , \w[55] , \w[54] , \w[53] , \w[52] ,
         \w[51] , \w[50] , \w[49] , \w[48] , \w[47] , \w[46] , \w[45] ,
         \w[44] , \w[43] , \w[42] , \w[41] , \w[40] , \w[39] , \w[38] ,
         \w[37] , \w[36] , \w[35] , \w[34] , \w[33] , \w[32] , \w[31] ,
         \w[30] , \w[29] , \w[28] , \w[27] , \w[26] , \w[25] , \w[24] ,
         \w[23] , \w[22] , \w[21] , \w[20] , \w[19] , \w[18] , \w[17] ,
         \w[16] , \w[15] , \w[14] , \w[13] , \w[12] , \w[11] , \w[10] , \w[9] ,
         \w[8] , \w[7] , \w[6] , \w[5] , \w[4] , \w[3] , \w[2] ;

  TIEHIX2 TIEHI(.X (HI));
  NANDX2 ndx1x_NAND ( .A1(HI), .A2(IN), .X(\w[2] ) );
  //assign #0.1  \w[2] = !(HI & IN);
  NANDX2 ndx2x_NAND ( .A1(HI), .A2(\w[2] ), .X(\w[3] ) );
  NANDX2 ndx3x_NAND ( .A1(HI), .A2(\w[3] ), .X(\w[4] ) );
  NANDX2 ndx4x_NAND ( .A1(HI), .A2(\w[4] ), .X(\w[5] ) );
  NANDX2 ndx5x_NAND ( .A1(HI), .A2(\w[5] ), .X(\w[6] ) );
  NANDX2 ndx6x_NAND ( .A1(HI), .A2(\w[6] ), .X(\w[7] ) );
  NANDX2 ndx7x_NAND ( .A1(HI), .A2(\w[7] ), .X(\w[8] ) );
  NANDX2 ndx8x_NAND ( .A1(HI), .A2(\w[8] ), .X(\w[9] ) );
  NANDX2 ndx9x_NAND ( .A1(HI), .A2(\w[9] ), .X(\w[10] ) );
  NANDX2 ndx10x_NAND ( .A1(HI), .A2(\w[10] ), .X(\w[11] ) );
  NANDX2 ndx11x_NAND ( .A1(HI), .A2(\w[11] ), .X(\w[12] ) );
  NANDX2 ndx12x_NAND ( .A1(HI), .A2(\w[12] ), .X(\w[13] ) );
  NANDX2 ndx13x_NAND ( .A1(HI), .A2(\w[13] ), .X(\w[14] ) );
  NANDX2 ndx14x_NAND ( .A1(HI), .A2(\w[14] ), .X(\w[15] ) );
  NANDX2 ndx15x_NAND ( .A1(HI), .A2(\w[15] ), .X(\w[16] ) );
  NANDX2 ndx16x_NAND ( .A1(HI), .A2(\w[16] ), .X(\w[17] ) );
  NANDX2 ndx17x_NAND ( .A1(HI), .A2(\w[17] ), .X(\w[18] ) );
  NANDX2 ndx18x_NAND ( .A1(HI), .A2(\w[18] ), .X(\w[19] ) );
  NANDX2 ndx19x_NAND ( .A1(HI), .A2(\w[19] ), .X(\w[20] ) );
  NANDX2 ndx20x_NAND ( .A1(HI), .A2(\w[20] ), .X(\w[21] ) );
  NANDX2 ndx21x_NAND ( .A1(HI), .A2(\w[21] ), .X(\w[22] ) );
  NANDX2 ndx22x_NAND ( .A1(HI), .A2(\w[22] ), .X(\w[23] ) );
  NANDX2 ndx23x_NAND ( .A1(HI), .A2(\w[23] ), .X(\w[24] ) );
  NANDX2 ndx24x_NAND ( .A1(HI), .A2(\w[24] ), .X(\w[25] ) );
  NANDX2 ndx25x_NAND ( .A1(HI), .A2(\w[25] ), .X(\w[26] ) );
  NANDX2 ndx26x_NAND ( .A1(HI), .A2(\w[26] ), .X(\w[27] ) );
  NANDX2 ndx27x_NAND ( .A1(HI), .A2(\w[27] ), .X(\w[28] ) );
  NANDX2 ndx28x_NAND ( .A1(HI), .A2(\w[28] ), .X(\w[29] ) );
  NANDX2 ndx29x_NAND ( .A1(HI), .A2(\w[29] ), .X(\w[30] ) );
  NANDX2 ndx30x_NAND ( .A1(HI), .A2(\w[30] ), .X(\w[31] ) );
  NANDX2 ndx31x_NAND ( .A1(HI), .A2(\w[31] ), .X(\w[32] ) );
  NANDX2 ndx32x_NAND ( .A1(HI), .A2(\w[32] ), .X(\w[33] ) );
  NANDX2 ndx33x_NAND ( .A1(HI), .A2(\w[33] ), .X(\w[34] ) );
  NANDX2 ndx34x_NAND ( .A1(HI), .A2(\w[34] ), .X(\w[35] ) );
  NANDX2 ndx35x_NAND ( .A1(HI), .A2(\w[35] ), .X(\w[36] ) );
  NANDX2 ndx36x_NAND ( .A1(HI), .A2(\w[36] ), .X(\w[37] ) );
  NANDX2 ndx37x_NAND ( .A1(HI), .A2(\w[37] ), .X(\w[38] ) );
  NANDX2 ndx38x_NAND ( .A1(HI), .A2(\w[38] ), .X(\w[39] ) );
  NANDX2 ndx39x_NAND ( .A1(HI), .A2(\w[39] ), .X(\w[40] ) );
  NANDX2 ndx40x_NAND ( .A1(HI), .A2(\w[40] ), .X(\w[41] ) );
  NANDX2 ndx41x_NAND ( .A1(HI), .A2(\w[41] ), .X(\w[42] ) );
  NANDX2 ndx42x_NAND ( .A1(HI), .A2(\w[42] ), .X(\w[43] ) );
  NANDX2 ndx43x_NAND ( .A1(HI), .A2(\w[43] ), .X(\w[44] ) );
  NANDX2 ndx44x_NAND ( .A1(HI), .A2(\w[44] ), .X(\w[45] ) );
  NANDX2 ndx45x_NAND ( .A1(HI), .A2(\w[45] ), .X(\w[46] ) );
  NANDX2 ndx46x_NAND ( .A1(HI), .A2(\w[46] ), .X(\w[47] ) );
  NANDX2 ndx47x_NAND ( .A1(HI), .A2(\w[47] ), .X(\w[48] ) );
  NANDX2 ndx48x_NAND ( .A1(HI), .A2(\w[48] ), .X(\w[49] ) );
  NANDX2 ndx49x_NAND ( .A1(HI), .A2(\w[49] ), .X(\w[50] ) );
  NANDX2 ndx50x_NAND ( .A1(HI), .A2(\w[50] ), .X(\w[51] ) );
  NANDX2 ndx51x_NAND ( .A1(HI), .A2(\w[51] ), .X(\w[52] ) );
  NANDX2 ndx52x_NAND ( .A1(HI), .A2(\w[52] ), .X(\w[53] ) );
  NANDX2 ndx53x_NAND ( .A1(HI), .A2(\w[53] ), .X(\w[54] ) );
  NANDX2 ndx54x_NAND ( .A1(HI), .A2(\w[54] ), .X(\w[55] ) );
  NANDX2 ndx55x_NAND ( .A1(HI), .A2(\w[55] ), .X(\w[56] ) );
  NANDX2 ndx56x_NAND ( .A1(HI), .A2(\w[56] ), .X(\w[57] ) );
  NANDX2 ndx57x_NAND ( .A1(HI), .A2(\w[57] ), .X(\w[58] ) );
  NANDX2 ndx58x_NAND ( .A1(HI), .A2(\w[58] ), .X(\w[59] ) );
  NANDX2 ndx59x_NAND ( .A1(HI), .A2(\w[59] ), .X(\w[60] ) );
  NANDX2 ndx60x_NAND ( .A1(HI), .A2(\w[60] ), .X(\w[61] ) );
  NANDX2 ndx61x_NAND ( .A1(HI), .A2(\w[61] ), .X(\w[62] ) );
  NANDX2 ndx62x_NAND ( .A1(HI), .A2(\w[62] ), .X(\w[63] ) );
  NANDX2 ndx63x_NAND ( .A1(HI), .A2(\w[63] ), .X(\w[64] ) );
  NANDX2 ndx64x_NAND ( .A1(HI), .A2(\w[64] ), .X(\w[65] ) );
  NANDX2 ndx65x_NAND ( .A1(HI), .A2(\w[65] ), .X(\w[66] ) );
  NANDX2 ndx66x_NAND ( .A1(HI), .A2(\w[66] ), .X(\w[67] ) );
  NANDX2 ndx67x_NAND ( .A1(HI), .A2(\w[67] ), .X(\w[68] ) );
  NANDX2 ndx68x_NAND ( .A1(HI), .A2(\w[68] ), .X(\w[69] ) );
  NANDX2 ndx69x_NAND ( .A1(HI), .A2(\w[69] ), .X(\w[70] ) );
  NANDX2 ndx70x_NAND ( .A1(HI), .A2(\w[70] ), .X(\w[71] ) );
  NANDX2 ndx71x_NAND ( .A1(HI), .A2(\w[71] ), .X(\w[72] ) );
  NANDX2 ndx72x_NAND ( .A1(HI), .A2(\w[72] ), .X(\w[73] ) );
  NANDX2 ndx73x_NAND ( .A1(HI), .A2(\w[73] ), .X(\w[74] ) );
  NANDX2 ndx74x_NAND ( .A1(HI), .A2(\w[74] ), .X(\w[75] ) );
  NANDX2 ndx75x_NAND ( .A1(HI), .A2(\w[75] ), .X(\w[76] ) );
  NANDX2 ndx76x_NAND ( .A1(HI), .A2(\w[76] ), .X(\w[77] ) );
  NANDX2 ndx77x_NAND ( .A1(HI), .A2(\w[77] ), .X(\w[78] ) );
  NANDX2 ndx78x_NAND ( .A1(HI), .A2(\w[78] ), .X(\w[79] ) );
  NANDX2 ndx79x_NAND ( .A1(HI), .A2(\w[79] ), .X(\w[80] ) );
  NANDX2 ndx80x_NAND ( .A1(HI), .A2(\w[80] ), .X(\w[81] ) );
  NANDX2 ndx81x_NAND ( .A1(HI), .A2(\w[81] ), .X(\w[82] ) );
  NANDX2 ndx82x_NAND ( .A1(HI), .A2(\w[82] ), .X(\w[83] ) );
  NANDX2 ndx83x_NAND ( .A1(HI), .A2(\w[83] ), .X(\w[84] ) );
  NANDX2 ndx84x_NAND ( .A1(HI), .A2(\w[84] ), .X(\w[85] ) );
  NANDX2 ndx85x_NAND ( .A1(HI), .A2(\w[85] ), .X(\w[86] ) );
  NANDX2 ndx86x_NAND ( .A1(HI), .A2(\w[86] ), .X(\w[87] ) );
  NANDX2 ndx87x_NAND ( .A1(HI), .A2(\w[87] ), .X(\w[88] ) );
  NANDX2 ndx88x_NAND ( .A1(HI), .A2(\w[88] ), .X(\w[89] ) );
  NANDX2 ndx89x_NAND ( .A1(HI), .A2(\w[89] ), .X(\w[90] ) );
  NANDX2 ndx90x_NAND ( .A1(HI), .A2(\w[90] ), .X(\w[91] ) );
  NANDX2 ndx91x_NAND ( .A1(HI), .A2(\w[91] ), .X(\w[92] ) );
  NANDX2 ndx92x_NAND ( .A1(HI), .A2(\w[92] ), .X(\w[93] ) );
  NANDX2 ndx93x_NAND ( .A1(HI), .A2(\w[93] ), .X(\w[94] ) );
  NANDX2 ndx94x_NAND ( .A1(HI), .A2(\w[94] ), .X(\w[95] ) );
  NANDX2 ndx95x_NAND ( .A1(HI), .A2(\w[95] ), .X(\w[96] ) );
  NANDX2 ndx96x_NAND ( .A1(HI), .A2(\w[96] ), .X(\w[97] ) );
  NANDX2 ndx97x_NAND ( .A1(HI), .A2(\w[97] ), .X(\w[98] ) );
  NANDX2 ndx98x_NAND ( .A1(HI), .A2(\w[98] ), .X(\w[99] ) );
  NANDX2 ndx99x_NAND ( .A1(HI), .A2(\w[99] ), .X(\w[100] ) );
  NANDX2 ndx100x_NAND ( .A1(HI), .A2(\w[100] ), .X(OUT) );
endmodule


