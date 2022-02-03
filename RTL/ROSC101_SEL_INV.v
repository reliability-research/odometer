`timescale 1ns/100ps


module ROSC101_SEL_INV ( IN, OUT, VDD, VSS );
  input IN, VDD, VSS;
  output OUT;
  wire   \w[100] , \w[99] , \w[98] , \w[97] , \w[96] , \w[95] , \w[94] ,
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

  INVX2 invx1x_INV1 ( .A(IN), .X(\w[2] ) );
  INVX2 invx2x_INV1 ( .A(\w[2] ), .X(\w[3] ) );
  INVX2 invx3x_INV1 ( .A(\w[3] ), .X(\w[4] ) );
  INVX2 invx4x_INV1 ( .A(\w[4] ), .X(\w[5] ) );
  INVX2 invx5x_INV1 ( .A(\w[5] ), .X(\w[6] ) );
  INVX2 invx6x_INV1 ( .A(\w[6] ), .X(\w[7] ) );
  INVX2 invx7x_INV1 ( .A(\w[7] ), .X(\w[8] ) );
  INVX2 invx8x_INV1 ( .A(\w[8] ), .X(\w[9] ) );
  INVX2 invx9x_INV1 ( .A(\w[9] ), .X(\w[10] ) );
  INVX2 invx10x_INV1 ( .A(\w[10] ), .X(\w[11] ) );
  INVX2 invx11x_INV1 ( .A(\w[11] ), .X(\w[12] ) );
  INVX2 invx12x_INV1 ( .A(\w[12] ), .X(\w[13] ) );
  INVX2 invx13x_INV1 ( .A(\w[13] ), .X(\w[14] ) );
  INVX2 invx14x_INV1 ( .A(\w[14] ), .X(\w[15] ) );
  INVX2 invx15x_INV1 ( .A(\w[15] ), .X(\w[16] ) );
  INVX2 invx16x_INV1 ( .A(\w[16] ), .X(\w[17] ) );
  INVX2 invx17x_INV1 ( .A(\w[17] ), .X(\w[18] ) );
  INVX2 invx18x_INV1 ( .A(\w[18] ), .X(\w[19] ) );
  INVX2 invx19x_INV1 ( .A(\w[19] ), .X(\w[20] ) );
  INVX2 invx20x_INV1 ( .A(\w[20] ), .X(\w[21] ) );
  INVX2 invx21x_INV1 ( .A(\w[21] ), .X(\w[22] ) );
  INVX2 invx22x_INV1 ( .A(\w[22] ), .X(\w[23] ) );
  INVX2 invx23x_INV1 ( .A(\w[23] ), .X(\w[24] ) );
  INVX2 invx24x_INV1 ( .A(\w[24] ), .X(\w[25] ) );
  INVX2 invx25x_INV1 ( .A(\w[25] ), .X(\w[26] ) );
  INVX2 invx26x_INV1 ( .A(\w[26] ), .X(\w[27] ) );
  INVX2 invx27x_INV1 ( .A(\w[27] ), .X(\w[28] ) );
  INVX2 invx28x_INV1 ( .A(\w[28] ), .X(\w[29] ) );
  INVX2 invx29x_INV1 ( .A(\w[29] ), .X(\w[30] ) );
  INVX2 invx30x_INV1 ( .A(\w[30] ), .X(\w[31] ) );
  INVX2 invx31x_INV1 ( .A(\w[31] ), .X(\w[32] ) );
  INVX2 invx32x_INV1 ( .A(\w[32] ), .X(\w[33] ) );
  INVX2 invx33x_INV1 ( .A(\w[33] ), .X(\w[34] ) );
  INVX2 invx34x_INV1 ( .A(\w[34] ), .X(\w[35] ) );
  INVX2 invx35x_INV1 ( .A(\w[35] ), .X(\w[36] ) );
  INVX2 invx36x_INV1 ( .A(\w[36] ), .X(\w[37] ) );
  INVX2 invx37x_INV1 ( .A(\w[37] ), .X(\w[38] ) );
  INVX2 invx38x_INV1 ( .A(\w[38] ), .X(\w[39] ) );
  INVX2 invx39x_INV1 ( .A(\w[39] ), .X(\w[40] ) );
  INVX2 invx40x_INV1 ( .A(\w[40] ), .X(\w[41] ) );
  INVX2 invx41x_INV1 ( .A(\w[41] ), .X(\w[42] ) );
  INVX2 invx42x_INV1 ( .A(\w[42] ), .X(\w[43] ) );
  INVX2 invx43x_INV1 ( .A(\w[43] ), .X(\w[44] ) );
  INVX2 invx44x_INV1 ( .A(\w[44] ), .X(\w[45] ) );
  INVX2 invx45x_INV1 ( .A(\w[45] ), .X(\w[46] ) );
  INVX2 invx46x_INV1 ( .A(\w[46] ), .X(\w[47] ) );
  INVX2 invx47x_INV1 ( .A(\w[47] ), .X(\w[48] ) );
  INVX2 invx48x_INV1 ( .A(\w[48] ), .X(\w[49] ) );
  INVX2 invx49x_INV1 ( .A(\w[49] ), .X(\w[50] ) );
  INVX2 invx50x_INV1 ( .A(\w[50] ), .X(\w[51] ) );
  INVX2 invx51x_INV1 ( .A(\w[51] ), .X(\w[52] ) );
  INVX2 invx52x_INV1 ( .A(\w[52] ), .X(\w[53] ) );
  INVX2 invx53x_INV1 ( .A(\w[53] ), .X(\w[54] ) );
  INVX2 invx54x_INV1 ( .A(\w[54] ), .X(\w[55] ) );
  INVX2 invx55x_INV1 ( .A(\w[55] ), .X(\w[56] ) );
  INVX2 invx56x_INV1 ( .A(\w[56] ), .X(\w[57] ) );
  INVX2 invx57x_INV1 ( .A(\w[57] ), .X(\w[58] ) );
  INVX2 invx58x_INV1 ( .A(\w[58] ), .X(\w[59] ) );
  INVX2 invx59x_INV1 ( .A(\w[59] ), .X(\w[60] ) );
  INVX2 invx60x_INV1 ( .A(\w[60] ), .X(\w[61] ) );
  INVX2 invx61x_INV1 ( .A(\w[61] ), .X(\w[62] ) );
  INVX2 invx62x_INV1 ( .A(\w[62] ), .X(\w[63] ) );
  INVX2 invx63x_INV1 ( .A(\w[63] ), .X(\w[64] ) );
  INVX2 invx64x_INV1 ( .A(\w[64] ), .X(\w[65] ) );
  INVX2 invx65x_INV1 ( .A(\w[65] ), .X(\w[66] ) );
  INVX2 invx66x_INV1 ( .A(\w[66] ), .X(\w[67] ) );
  INVX2 invx67x_INV1 ( .A(\w[67] ), .X(\w[68] ) );
  INVX2 invx68x_INV1 ( .A(\w[68] ), .X(\w[69] ) );
  INVX2 invx69x_INV1 ( .A(\w[69] ), .X(\w[70] ) );
  INVX2 invx70x_INV1 ( .A(\w[70] ), .X(\w[71] ) );
  INVX2 invx71x_INV1 ( .A(\w[71] ), .X(\w[72] ) );
  INVX2 invx72x_INV1 ( .A(\w[72] ), .X(\w[73] ) );
  INVX2 invx73x_INV1 ( .A(\w[73] ), .X(\w[74] ) );
  INVX2 invx74x_INV1 ( .A(\w[74] ), .X(\w[75] ) );
  INVX2 invx75x_INV1 ( .A(\w[75] ), .X(\w[76] ) );
  INVX2 invx76x_INV1 ( .A(\w[76] ), .X(\w[77] ) );
  INVX2 invx77x_INV1 ( .A(\w[77] ), .X(\w[78] ) );
  INVX2 invx78x_INV1 ( .A(\w[78] ), .X(\w[79] ) );
  INVX2 invx79x_INV1 ( .A(\w[79] ), .X(\w[80] ) );
  INVX2 invx80x_INV1 ( .A(\w[80] ), .X(\w[81] ) );
  INVX2 invx81x_INV1 ( .A(\w[81] ), .X(\w[82] ) );
  INVX2 invx82x_INV1 ( .A(\w[82] ), .X(\w[83] ) );
  INVX2 invx83x_INV1 ( .A(\w[83] ), .X(\w[84] ) );
  INVX2 invx84x_INV1 ( .A(\w[84] ), .X(\w[85] ) );
  INVX2 invx85x_INV1 ( .A(\w[85] ), .X(\w[86] ) );
  INVX2 invx86x_INV1 ( .A(\w[86] ), .X(\w[87] ) );
  INVX2 invx87x_INV1 ( .A(\w[87] ), .X(\w[88] ) );
  INVX2 invx88x_INV1 ( .A(\w[88] ), .X(\w[89] ) );
  INVX2 invx89x_INV1 ( .A(\w[89] ), .X(\w[90] ) );
  INVX2 invx90x_INV1 ( .A(\w[90] ), .X(\w[91] ) );
  INVX2 invx91x_INV1 ( .A(\w[91] ), .X(\w[92] ) );
  INVX2 invx92x_INV1 ( .A(\w[92] ), .X(\w[93] ) );
  INVX2 invx93x_INV1 ( .A(\w[93] ), .X(\w[94] ) );
  INVX2 invx94x_INV1 ( .A(\w[94] ), .X(\w[95] ) );
  INVX2 invx95x_INV1 ( .A(\w[95] ), .X(\w[96] ) );
  INVX2 invx96x_INV1 ( .A(\w[96] ), .X(\w[97] ) );
  INVX2 invx97x_INV1 ( .A(\w[97] ), .X(\w[98] ) );
  INVX2 invx98x_INV1 ( .A(\w[98] ), .X(\w[99] ) );
  INVX2 invx99x_INV1 ( .A(\w[99] ), .X(\w[100] ) );
  INVX2 invx100x_INV1 ( .A(\w[100] ), .X(OUT) );
endmodule


