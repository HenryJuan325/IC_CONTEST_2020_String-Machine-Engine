/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03
// Date      : Thu Mar 16 00:38:11 2023
/////////////////////////////////////////////////////////////


module SME_COMP ( reset, clk, str_reg_w, pat_reg_w, str_len, pat_len, c_state, 
        ready, match, match_index );
  input [271:0] str_reg_w;
  input [79:0] pat_reg_w;
  input [5:0] str_len;
  input [3:0] pat_len;
  input [2:0] c_state;
  output [4:0] match_index;
  input reset, clk;
  output ready, match;
  wire   \str_buf[33][7] , \str_buf[33][6] , \str_buf[33][5] ,
         \str_buf[33][4] , \str_buf[33][3] , \str_buf[33][2] ,
         \str_buf[33][1] , \str_buf[32][5] , \str_buf[32][3] ,
         \str_buf[32][2] , \str_buf[31][7] , \str_buf[31][6] ,
         \str_buf[31][5] , \str_buf[31][4] , \str_buf[31][3] ,
         \str_buf[31][2] , \str_buf[31][1] , \str_buf[31][0] ,
         \str_buf[30][5] , \str_buf[30][3] , \str_buf[30][2] ,
         \str_buf[29][7] , \str_buf[29][6] , \str_buf[29][5] ,
         \str_buf[29][4] , \str_buf[29][3] , \str_buf[29][2] ,
         \str_buf[29][1] , \str_buf[29][0] , \str_buf[28][7] ,
         \str_buf[28][6] , \str_buf[28][5] , \str_buf[28][4] ,
         \str_buf[28][3] , \str_buf[28][2] , \str_buf[28][1] ,
         \str_buf[28][0] , \str_buf[27][7] , \str_buf[27][6] ,
         \str_buf[27][5] , \str_buf[27][4] , \str_buf[27][3] ,
         \str_buf[27][2] , \str_buf[27][1] , \str_buf[27][0] ,
         \str_buf[26][5] , \str_buf[26][3] , \str_buf[26][2] ,
         \str_buf[25][7] , \str_buf[25][6] , \str_buf[25][5] ,
         \str_buf[25][4] , \str_buf[25][3] , \str_buf[25][2] ,
         \str_buf[25][1] , \str_buf[25][0] , \str_buf[24][7] ,
         \str_buf[24][6] , \str_buf[24][5] , \str_buf[24][4] ,
         \str_buf[24][3] , \str_buf[24][2] , \str_buf[24][1] ,
         \str_buf[24][0] , N1212, N1213, N1214, N1220, N1221, N1222, N1223,
         N1229, n81, n82, n83, n84, n85, n86, n89, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n111, n114, n117, n118, n119, n120, n121, n122, n123, n124, n127,
         n128, n129, n133, n136, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n161, n164, n167, n168, n169, n170, n171, n172, n173,
         n174, n175, n176, n177, n178, n179, n180, n181, n182, n183, n184,
         n188, n191, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n206, n207, n208, n209, n210, n211, n212, n213, n214,
         n215, n216, n217, n221, n224, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n237, n238, n239, n240, n241, n242, n245, n246,
         n247, n251, n254, n256, n257, n258, n259, n260, n261, n262, n263,
         n264, n265, n266, n267, n268, n269, n270, n271, n272, n273, n277,
         n280, n283, n284, n285, n286, n287, n288, n289, n290, n291, n292,
         n293, n294, n295, n296, n297, n300, n301, n302, n306, n309, n311,
         n312, n313, n314, n315, n316, n317, n318, n319, n320, n322, n323,
         n324, n325, n326, n327, n328, n329, n330, n331, n332, n333, n334,
         n335, n336, n337, n338, n342, n345, n348, n349, n350, n351, n353,
         n354, n355, n356, n357, n358, n359, n360, n361, n362, n363, n364,
         n365, n366, n367, n368, n369, n370, n371, n372, n373, n374, n375,
         n376, n377, n378, n379, n380, n381, n382, n383, n384, n385, n386,
         n387, n388, n389, n390, n391, n392, n393, n394, n395, n396, n397,
         n398, n399, n400, n401, n402, n403, n404, n405, n406, n407, n408,
         n409, n410, n411, n412, n413, n414, n415, n416, n417, n418, n419,
         n420, n421, n422, n423, n424, n425, n426, n427, n428, n429, n430,
         n431, n432, n433, n434, n435, n436, n437, n438, n439, n440, n441,
         n442, n443, n444, n445, n446, n447, n448, n449, n450, n451, n452,
         n453, n454, n455, n456, n457, n458, n459, n460, n461, n462, n463,
         n464, n465, n466, n467, n468, n469, n470, n471, n472, n473, n474,
         n475, n476, n477, n478, n479, n480, n481, n482, n483, n484, n485,
         n486, n487, n488, n489, n490, n491, n492, n493, n494, n495, n496,
         n497, n498, n499, n500, n501, n502, n503, n504, n505, n506, n507,
         n508, n509, n510, n511, n512, n513, n514, n515, n516, n517, n518,
         n519, n520, n521, n522, n523, n524, n525, n526, n527, n528, n529,
         n530, n531, n532, n533, n534, n535, n536, n537, n538, n539, n540,
         n541, n542, n543, n544, n545, n546, n547, n548, n549, n550, n551,
         n552, n553, n554, n555, n556, n557, n558, n559, n560, n561, n562,
         n563, n564, n565, n566, n567, n568, n569, n570, n571, n572, n573,
         n574, n575, n576, n577, n578, n579, n580, n581, n582, n583, n584,
         n585, n586, n587, n588, n589, n590, n591, n592, n593, n594, n595,
         n596, n597, n598, n599, n601, n603, n605, n607, n609, n611, n613,
         n615, n616, n617, n618, n619, n620, n621, n622, n623, n624, n625,
         n626, n627, n628, n629, n630, n633, n634, n635, n636, n637, n638,
         n641, n645, n646, n647, n648, n649, n650, n651, n652, n653, n654,
         n655, n656, n657, n658, n659, n660, n662, n663, n664, n665, n666,
         n668, n669, n670, n671, n672, n673, n674, n675, n676, n677, n678,
         n679, n680, n681, n682, n683, n684, n685, n686, n687, n688, n689,
         n690, n691, n692, n693, n694, n695, n696, n697, n698, n699, n700,
         n701, n702, n703, n704, n705, n706, n707, n708, n709, n710, n711,
         n712, n713, n714, n715, n716, n717, n718, n719, n720, n721, n722,
         n723, n724, n725, n726, n727, n728, n729, n730, n731, n732, n733,
         n734, n735, n736, n737, n738, n739, n740, n741, n742, n743, n744,
         n745, n746, n747, n748, n749, n750, n751, n752, n753, n754, n755,
         n756, n757, n758, n759, n760, n761, n762, n763, n764, n765, n766,
         n767, n768, n769, n770, n771, n772, n773, n774, n775, n776, n777,
         n778, n779, n780, n781, n782, n783, n784, n785, n786, n787, n788,
         n789, n790, n791, n792, n793, n794, n795, n796, n797, n798, n799,
         n800, n801, n802, n803, n804, n805, n806, n807, n808, n809, n810,
         n811, n812, n813, n814, n815, n816, n817, n818, n819, n820, n821,
         n822, n823, n824, n825, n826, n827, n828, n829, n830, n831, n832,
         n833, n834, n835, n836, n837, n838, n839, n840, n841, n842, n843,
         n844, n845, n846, n847, n848, n849, n850, n851, n852, n853, n854,
         n855, n856, n857, n858, n859, n860, n861, n862, n863, n864, n865,
         n866, n867, n868, n869, n870, n871, n872, n873, n874, n875, n876,
         n877, n878, n879, n880, n881, n882, n883, n884, n885, n887, n888,
         n889, n890, n891, n892, n893, n894, n895, n896, n897, n898, n899,
         n900, n901, n902, n903, n904, n905, n906, n907, n908, n909, n910,
         n911, n912, n913, n914, n915, n916, n917, n918, n919, n920, n921,
         n922, n923, n924, n925, n926, n927, n928, n929, n930, n931, n932,
         n933, n934, n935, n936, n937, n938, n939, n940, n941, n942, n943,
         n944, n945, n946, n947, n948, n949, n950, n951, n952, n953, n954,
         n955, n956, n957, n958, n959, n960, n961, n962, n963, n964, n965,
         n966, n967, n968, n969, n970, n971, n972, n973, n974, n975, n976,
         n977, n978, n979, n980, n981, n982, n983, n984, n985, n986, n987,
         n988, n989, n990, n991, n992, n993, n994, n995, n996, n997, n998,
         n999, n1000, n1001, n1002, n1003, n1004, n1005, n1006, n1007, n1008,
         n1009, n1010, n1011, n1012, n1013, n1014, n1015, n1016, n1017, n1018,
         n1019, n1020, n1021, n1022, n1023, n1024, n1025, n1026, n1027, n1028,
         n1029, n1030, n1031, n1032, n1033, n1034, n1035, n1036, n1037, n1038,
         n1039, n1040, n1041, n1042, n1043, n1044, n1045, n1046, n1047, n1048,
         n1049, n1050, n1051, n1052, n1053, n1054, n1055, n1056, n1057, n1058,
         n1059, n1060, n1061, n1062, n1063, n1064, n1065, n1066, n1067, n1068,
         n1069, n1070, n1071, n1072, n1073, n1074, n1075, n1076, n1077, n1078,
         n1079, n1080, n1081, n1082, n1083, n1084, n1085, n1086, n1087, n1088,
         n1089, n1090, n1091, n1092, n1093, n1094, n1095, n1096, n1097, n1098,
         n1099, n1100, n1101, n1102, n1103, n1104, n1105, n1106, n1107, n1108,
         n1109, n1110, n1111, n1112, n1113, n1114, n1115, n1116, n1117, n1118,
         n1119, n1120, n1121, n1122, n1123, n1124, n1125, n1126, n1127, n1128,
         n1129, n1130, n1131, n1132, n1133, n1134, n1135, n1136, n1137, n1138,
         n1139, n1140, n1141, n1142, n1143, n1144, n1145, n1146, n1147, n1148,
         n1149, n1150, n1151, n1152, n1153, n1154, n1155, n1156, n1157, n1158,
         n1159, n1160, n1161, n1162, n1163, n1164, n1165, n1166, n1167, n1168,
         n1169, n1170, n1171, n1172, n1173, n1174, n1175, n1176, n1177, n1178,
         n1179, n1180, n1181, \add_153/carry[4] , \add_153/carry[3] ,
         \add_153/carry[2] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n87, n88,
         n90, n108, n109, n110, n112, n113, n115, n116, n125, n126, n130, n131,
         n132, n134, n135, n137, n158, n159, n160, n162, n163, n165, n166,
         n185, n186, n187, n189, n190, n192, n193, n205, n218, n219, n220,
         n222, n223, n225, n226, n236, n243, n244, n248, n249, n250, n252,
         n253, n255, n274, n275, n276, n278, n279, n281, n282, n298, n299,
         n303, n304, n305, n307, n308, n310, n321, n339, n340, n341, n343,
         n344, n346, n347, n352, n600, n602, n604, n606, n608, n610;

  DFFRX1 match_reg ( .D(N1229), .CK(clk), .RN(n57), .Q(match) );
  DFFRX1 \str_buf_reg[1][0]  ( .D(n1148), .CK(clk), .RN(n67), .Q(n683) );
  DFFRX1 \str_buf_reg[2][0]  ( .D(n1140), .CK(clk), .RN(n74), .Q(n691) );
  DFFRX1 \str_buf_reg[3][0]  ( .D(n1132), .CK(clk), .RN(n59), .Q(n699) );
  DFFRX1 \str_buf_reg[4][0]  ( .D(n1124), .CK(clk), .RN(n61), .Q(n707) );
  DFFRX1 \str_buf_reg[5][0]  ( .D(n1116), .CK(clk), .RN(n62), .Q(n715) );
  DFFRX1 \str_buf_reg[6][0]  ( .D(n1108), .CK(clk), .RN(n68), .Q(n723) );
  DFFRX1 \str_buf_reg[7][0]  ( .D(n1100), .CK(clk), .RN(n76), .Q(n731) );
  DFFRX1 \str_buf_reg[8][0]  ( .D(n1092), .CK(clk), .RN(n76), .Q(n739) );
  DFFRX1 \str_buf_reg[9][0]  ( .D(n1084), .CK(clk), .RN(n76), .Q(n747) );
  DFFRX1 \str_buf_reg[10][0]  ( .D(n1076), .CK(clk), .RN(n76), .Q(n755) );
  DFFRX1 \str_buf_reg[11][0]  ( .D(n1068), .CK(clk), .RN(n76), .Q(n763) );
  DFFRX1 \str_buf_reg[12][0]  ( .D(n1060), .CK(clk), .RN(n76), .Q(n771) );
  DFFRX1 \str_buf_reg[13][0]  ( .D(n1052), .CK(clk), .RN(n76), .Q(n779) );
  DFFRX1 \str_buf_reg[14][0]  ( .D(n1044), .CK(clk), .RN(n76), .Q(n787) );
  DFFRX1 \str_buf_reg[15][0]  ( .D(n1036), .CK(clk), .RN(n76), .Q(n795) );
  DFFRX1 \str_buf_reg[16][0]  ( .D(n1028), .CK(clk), .RN(n76), .Q(n803) );
  DFFRX1 \str_buf_reg[17][0]  ( .D(n1020), .CK(clk), .RN(n76), .Q(n811) );
  DFFRX1 \str_buf_reg[18][0]  ( .D(n1012), .CK(clk), .RN(n76), .Q(n819) );
  DFFRX1 \str_buf_reg[19][0]  ( .D(n1004), .CK(clk), .RN(n75), .Q(n827) );
  DFFRX1 \str_buf_reg[20][0]  ( .D(n996), .CK(clk), .RN(n75), .Q(n835) );
  DFFRX1 \str_buf_reg[21][0]  ( .D(n988), .CK(clk), .RN(n75), .Q(n843) );
  DFFRX1 \str_buf_reg[22][0]  ( .D(n980), .CK(clk), .RN(n75), .Q(n851) );
  DFFRX1 \str_buf_reg[1][1]  ( .D(n1149), .CK(clk), .RN(n75), .Q(n682) );
  DFFRX1 \str_buf_reg[2][1]  ( .D(n1141), .CK(clk), .RN(n75), .Q(n690) );
  DFFRX1 \str_buf_reg[3][1]  ( .D(n1133), .CK(clk), .RN(n75), .Q(n698) );
  DFFRX1 \str_buf_reg[4][1]  ( .D(n1125), .CK(clk), .RN(n75), .Q(n706) );
  DFFRX1 \str_buf_reg[5][1]  ( .D(n1117), .CK(clk), .RN(n75), .Q(n714) );
  DFFRX1 \str_buf_reg[6][1]  ( .D(n1109), .CK(clk), .RN(n74), .Q(n722) );
  DFFRX1 \str_buf_reg[7][1]  ( .D(n1101), .CK(clk), .RN(n74), .Q(n730) );
  DFFRX1 \str_buf_reg[8][1]  ( .D(n1093), .CK(clk), .RN(n74), .Q(n738) );
  DFFRX1 \str_buf_reg[9][1]  ( .D(n1085), .CK(clk), .RN(n74), .Q(n746) );
  DFFRX1 \str_buf_reg[10][1]  ( .D(n1077), .CK(clk), .RN(n74), .Q(n754) );
  DFFRX1 \str_buf_reg[11][1]  ( .D(n1069), .CK(clk), .RN(n74), .Q(n762) );
  DFFRX1 \str_buf_reg[12][1]  ( .D(n1061), .CK(clk), .RN(n74), .Q(n770) );
  DFFRX1 \str_buf_reg[13][1]  ( .D(n1053), .CK(clk), .RN(n74), .Q(n778) );
  DFFRX1 \str_buf_reg[14][1]  ( .D(n1045), .CK(clk), .RN(n74), .Q(n786) );
  DFFRX1 \str_buf_reg[15][1]  ( .D(n1037), .CK(clk), .RN(n74), .Q(n794) );
  DFFRX1 \str_buf_reg[16][1]  ( .D(n1029), .CK(clk), .RN(n74), .Q(n802) );
  DFFRX1 \str_buf_reg[17][1]  ( .D(n1021), .CK(clk), .RN(n74), .Q(n810) );
  DFFRX1 \str_buf_reg[18][1]  ( .D(n1013), .CK(clk), .RN(n73), .Q(n818) );
  DFFRX1 \str_buf_reg[19][1]  ( .D(n1005), .CK(clk), .RN(n73), .Q(n826) );
  DFFRX1 \str_buf_reg[20][1]  ( .D(n997), .CK(clk), .RN(n73), .Q(n834) );
  DFFRX1 \str_buf_reg[21][1]  ( .D(n989), .CK(clk), .RN(n73), .Q(n842) );
  DFFRX1 \str_buf_reg[22][1]  ( .D(n981), .CK(clk), .RN(n73), .Q(n850) );
  DFFRX1 \str_buf_reg[1][2]  ( .D(n1150), .CK(clk), .RN(n72), .Q(n681) );
  DFFRX1 \str_buf_reg[2][2]  ( .D(n1142), .CK(clk), .RN(n72), .Q(n689) );
  DFFRX1 \str_buf_reg[3][2]  ( .D(n1134), .CK(clk), .RN(n72), .Q(n697) );
  DFFRX1 \str_buf_reg[4][2]  ( .D(n1126), .CK(clk), .RN(n72), .Q(n705) );
  DFFRX1 \str_buf_reg[5][2]  ( .D(n1118), .CK(clk), .RN(n72), .Q(n713) );
  DFFRX1 \str_buf_reg[6][2]  ( .D(n1110), .CK(clk), .RN(n72), .Q(n721) );
  DFFRX1 \str_buf_reg[7][2]  ( .D(n1102), .CK(clk), .RN(n72), .Q(n729) );
  DFFRX1 \str_buf_reg[8][2]  ( .D(n1094), .CK(clk), .RN(n72), .Q(n737) );
  DFFRX1 \str_buf_reg[9][2]  ( .D(n1086), .CK(clk), .RN(n71), .Q(n745) );
  DFFRX1 \str_buf_reg[10][2]  ( .D(n1078), .CK(clk), .RN(n71), .Q(n753) );
  DFFRX1 \str_buf_reg[11][2]  ( .D(n1070), .CK(clk), .RN(n71), .Q(n761) );
  DFFRX1 \str_buf_reg[12][2]  ( .D(n1062), .CK(clk), .RN(n71), .Q(n769) );
  DFFRX1 \str_buf_reg[13][2]  ( .D(n1054), .CK(clk), .RN(n71), .Q(n777) );
  DFFRX1 \str_buf_reg[14][2]  ( .D(n1046), .CK(clk), .RN(n71), .Q(n785) );
  DFFRX1 \str_buf_reg[15][2]  ( .D(n1038), .CK(clk), .RN(n71), .Q(n793) );
  DFFRX1 \str_buf_reg[16][2]  ( .D(n1030), .CK(clk), .RN(n71), .Q(n801) );
  DFFRX1 \str_buf_reg[17][2]  ( .D(n1022), .CK(clk), .RN(n71), .Q(n809) );
  DFFRX1 \str_buf_reg[18][2]  ( .D(n1014), .CK(clk), .RN(n71), .Q(n817) );
  DFFRX1 \str_buf_reg[19][2]  ( .D(n1006), .CK(clk), .RN(n71), .Q(n825) );
  DFFRX1 \str_buf_reg[20][2]  ( .D(n998), .CK(clk), .RN(n71), .Q(n833) );
  DFFRX1 \str_buf_reg[21][2]  ( .D(n990), .CK(clk), .RN(n60), .Q(n841) );
  DFFRX1 \str_buf_reg[22][2]  ( .D(n982), .CK(clk), .RN(n69), .Q(n849) );
  DFFRX1 \str_buf_reg[23][2]  ( .D(n974), .CK(clk), .RN(n75), .Q(n857) );
  DFFRX1 \str_buf_reg[1][3]  ( .D(n1151), .CK(clk), .RN(n70), .Q(n680) );
  DFFRX1 \str_buf_reg[2][3]  ( .D(n1143), .CK(clk), .RN(n70), .Q(n688) );
  DFFRX1 \str_buf_reg[3][3]  ( .D(n1135), .CK(clk), .RN(n70), .Q(n696) );
  DFFRX1 \str_buf_reg[4][3]  ( .D(n1127), .CK(clk), .RN(n70), .Q(n704) );
  DFFRX1 \str_buf_reg[5][3]  ( .D(n1119), .CK(clk), .RN(n70), .Q(n712) );
  DFFRX1 \str_buf_reg[6][3]  ( .D(n1111), .CK(clk), .RN(n70), .Q(n720) );
  DFFRX1 \str_buf_reg[7][3]  ( .D(n1103), .CK(clk), .RN(n70), .Q(n728) );
  DFFRX1 \str_buf_reg[8][3]  ( .D(n1095), .CK(clk), .RN(n70), .Q(n736) );
  DFFRX1 \str_buf_reg[9][3]  ( .D(n1087), .CK(clk), .RN(n70), .Q(n744) );
  DFFRX1 \str_buf_reg[10][3]  ( .D(n1079), .CK(clk), .RN(n70), .Q(n752) );
  DFFRX1 \str_buf_reg[11][3]  ( .D(n1071), .CK(clk), .RN(n70), .Q(n760) );
  DFFRX1 \str_buf_reg[12][3]  ( .D(n1063), .CK(clk), .RN(n69), .Q(n768) );
  DFFRX1 \str_buf_reg[13][3]  ( .D(n1055), .CK(clk), .RN(n69), .Q(n776) );
  DFFRX1 \str_buf_reg[14][3]  ( .D(n1047), .CK(clk), .RN(n69), .Q(n784) );
  DFFRX1 \str_buf_reg[15][3]  ( .D(n1039), .CK(clk), .RN(n69), .Q(n792) );
  DFFRX1 \str_buf_reg[16][3]  ( .D(n1031), .CK(clk), .RN(n69), .Q(n800) );
  DFFRX1 \str_buf_reg[17][3]  ( .D(n1023), .CK(clk), .RN(n69), .Q(n808) );
  DFFRX1 \str_buf_reg[18][3]  ( .D(n1015), .CK(clk), .RN(n69), .Q(n816) );
  DFFRX1 \str_buf_reg[19][3]  ( .D(n1007), .CK(clk), .RN(n69), .Q(n824) );
  DFFRX1 \str_buf_reg[20][3]  ( .D(n999), .CK(clk), .RN(n69), .Q(n832) );
  DFFRX1 \str_buf_reg[21][3]  ( .D(n991), .CK(clk), .RN(n69), .Q(n840) );
  DFFRX1 \str_buf_reg[22][3]  ( .D(n983), .CK(clk), .RN(n69), .Q(n848) );
  DFFRX1 \str_buf_reg[23][3]  ( .D(n975), .CK(clk), .RN(n69), .Q(n856) );
  DFFRX1 \str_buf_reg[1][4]  ( .D(n1152), .CK(clk), .RN(n68), .Q(n679) );
  DFFRX1 \str_buf_reg[2][4]  ( .D(n1144), .CK(clk), .RN(n68), .Q(n687) );
  DFFRX1 \str_buf_reg[3][4]  ( .D(n1136), .CK(clk), .RN(n67), .Q(n695) );
  DFFRX1 \str_buf_reg[4][4]  ( .D(n1128), .CK(clk), .RN(n67), .Q(n703) );
  DFFRX1 \str_buf_reg[5][4]  ( .D(n1120), .CK(clk), .RN(n67), .Q(n711) );
  DFFRX1 \str_buf_reg[6][4]  ( .D(n1112), .CK(clk), .RN(n67), .Q(n719) );
  DFFRX1 \str_buf_reg[7][4]  ( .D(n1104), .CK(clk), .RN(n67), .Q(n727) );
  DFFRX1 \str_buf_reg[8][4]  ( .D(n1096), .CK(clk), .RN(n67), .Q(n735) );
  DFFRX1 \str_buf_reg[9][4]  ( .D(n1088), .CK(clk), .RN(n67), .Q(n743) );
  DFFRX1 \str_buf_reg[10][4]  ( .D(n1080), .CK(clk), .RN(n67), .Q(n751) );
  DFFRX1 \str_buf_reg[11][4]  ( .D(n1072), .CK(clk), .RN(n67), .Q(n759) );
  DFFRX1 \str_buf_reg[12][4]  ( .D(n1064), .CK(clk), .RN(n67), .Q(n767) );
  DFFRX1 \str_buf_reg[13][4]  ( .D(n1056), .CK(clk), .RN(n67), .Q(n775) );
  DFFRX1 \str_buf_reg[14][4]  ( .D(n1048), .CK(clk), .RN(n67), .Q(n783) );
  DFFRX1 \str_buf_reg[15][4]  ( .D(n1040), .CK(clk), .RN(n66), .Q(n791) );
  DFFRX1 \str_buf_reg[16][4]  ( .D(n1032), .CK(clk), .RN(n66), .Q(n799) );
  DFFRX1 \str_buf_reg[17][4]  ( .D(n1024), .CK(clk), .RN(n66), .Q(n807) );
  DFFRX1 \str_buf_reg[18][4]  ( .D(n1016), .CK(clk), .RN(n66), .Q(n815) );
  DFFRX1 \str_buf_reg[19][4]  ( .D(n1008), .CK(clk), .RN(n66), .Q(n823) );
  DFFRX1 \str_buf_reg[20][4]  ( .D(n1000), .CK(clk), .RN(n66), .Q(n831) );
  DFFRX1 \str_buf_reg[21][4]  ( .D(n992), .CK(clk), .RN(n66), .Q(n839) );
  DFFRX1 \str_buf_reg[22][4]  ( .D(n984), .CK(clk), .RN(n66), .Q(n847) );
  DFFRX1 \str_buf_reg[1][5]  ( .D(n1153), .CK(clk), .RN(n65), .Q(n678) );
  DFFRX1 \str_buf_reg[2][5]  ( .D(n1145), .CK(clk), .RN(n65), .Q(n686) );
  DFFRX1 \str_buf_reg[3][5]  ( .D(n1137), .CK(clk), .RN(n65), .Q(n694) );
  DFFRX1 \str_buf_reg[4][5]  ( .D(n1129), .CK(clk), .RN(n65), .Q(n702) );
  DFFRX1 \str_buf_reg[5][5]  ( .D(n1121), .CK(clk), .RN(n65), .Q(n710) );
  DFFRX1 \str_buf_reg[6][5]  ( .D(n1113), .CK(clk), .RN(n64), .Q(n718) );
  DFFRX1 \str_buf_reg[7][5]  ( .D(n1105), .CK(clk), .RN(n64), .Q(n726) );
  DFFRX1 \str_buf_reg[8][5]  ( .D(n1097), .CK(clk), .RN(n64), .Q(n734) );
  DFFRX1 \str_buf_reg[9][5]  ( .D(n1089), .CK(clk), .RN(n64), .Q(n742) );
  DFFRX1 \str_buf_reg[10][5]  ( .D(n1081), .CK(clk), .RN(n64), .Q(n750) );
  DFFRX1 \str_buf_reg[11][5]  ( .D(n1073), .CK(clk), .RN(n64), .Q(n758) );
  DFFRX1 \str_buf_reg[12][5]  ( .D(n1065), .CK(clk), .RN(n64), .Q(n766) );
  DFFRX1 \str_buf_reg[13][5]  ( .D(n1057), .CK(clk), .RN(n64), .Q(n774) );
  DFFRX1 \str_buf_reg[14][5]  ( .D(n1049), .CK(clk), .RN(n64), .Q(n782) );
  DFFRX1 \str_buf_reg[15][5]  ( .D(n1041), .CK(clk), .RN(n64), .Q(n790) );
  DFFRX1 \str_buf_reg[16][5]  ( .D(n1033), .CK(clk), .RN(n64), .Q(n798) );
  DFFRX1 \str_buf_reg[17][5]  ( .D(n1025), .CK(clk), .RN(n64), .Q(n806) );
  DFFRX1 \str_buf_reg[18][5]  ( .D(n1017), .CK(clk), .RN(n63), .Q(n814) );
  DFFRX1 \str_buf_reg[19][5]  ( .D(n1009), .CK(clk), .RN(n63), .Q(n822) );
  DFFRX1 \str_buf_reg[20][5]  ( .D(n1001), .CK(clk), .RN(n63), .Q(n830) );
  DFFRX1 \str_buf_reg[21][5]  ( .D(n993), .CK(clk), .RN(n63), .Q(n838) );
  DFFRX1 \str_buf_reg[22][5]  ( .D(n985), .CK(clk), .RN(n63), .Q(n846) );
  DFFRX1 \str_buf_reg[23][5]  ( .D(n977), .CK(clk), .RN(n63), .Q(n854) );
  DFFRX1 \str_buf_reg[1][6]  ( .D(n1154), .CK(clk), .RN(n62), .Q(n677) );
  DFFRX1 \str_buf_reg[2][6]  ( .D(n1146), .CK(clk), .RN(n62), .Q(n685) );
  DFFRX1 \str_buf_reg[3][6]  ( .D(n1138), .CK(clk), .RN(n62), .Q(n693) );
  DFFRX1 \str_buf_reg[4][6]  ( .D(n1130), .CK(clk), .RN(n62), .Q(n701) );
  DFFRX1 \str_buf_reg[5][6]  ( .D(n1122), .CK(clk), .RN(n62), .Q(n709) );
  DFFRX1 \str_buf_reg[6][6]  ( .D(n1114), .CK(clk), .RN(n62), .Q(n717) );
  DFFRX1 \str_buf_reg[7][6]  ( .D(n1106), .CK(clk), .RN(n62), .Q(n725) );
  DFFRX1 \str_buf_reg[8][6]  ( .D(n1098), .CK(clk), .RN(n62), .Q(n733) );
  DFFRX1 \str_buf_reg[9][6]  ( .D(n1090), .CK(clk), .RN(n61), .Q(n741) );
  DFFRX1 \str_buf_reg[10][6]  ( .D(n1082), .CK(clk), .RN(n61), .Q(n749) );
  DFFRX1 \str_buf_reg[11][6]  ( .D(n1074), .CK(clk), .RN(n61), .Q(n757) );
  DFFRX1 \str_buf_reg[12][6]  ( .D(n1066), .CK(clk), .RN(n61), .Q(n765) );
  DFFRX1 \str_buf_reg[13][6]  ( .D(n1058), .CK(clk), .RN(n61), .Q(n773) );
  DFFRX1 \str_buf_reg[14][6]  ( .D(n1050), .CK(clk), .RN(n61), .Q(n781) );
  DFFRX1 \str_buf_reg[15][6]  ( .D(n1042), .CK(clk), .RN(n61), .Q(n789) );
  DFFRX1 \str_buf_reg[16][6]  ( .D(n1034), .CK(clk), .RN(n61), .Q(n797) );
  DFFRX1 \str_buf_reg[17][6]  ( .D(n1026), .CK(clk), .RN(n61), .Q(n805) );
  DFFRX1 \str_buf_reg[18][6]  ( .D(n1018), .CK(clk), .RN(n61), .Q(n813) );
  DFFRX1 \str_buf_reg[19][6]  ( .D(n1010), .CK(clk), .RN(n61), .Q(n821) );
  DFFRX1 \str_buf_reg[20][6]  ( .D(n1002), .CK(clk), .RN(n61), .Q(n829) );
  DFFRX1 \str_buf_reg[21][6]  ( .D(n994), .CK(clk), .RN(n60), .Q(n837) );
  DFFRX1 \str_buf_reg[22][6]  ( .D(n986), .CK(clk), .RN(n60), .Q(n845) );
  DFFRX1 \str_buf_reg[1][7]  ( .D(n1155), .CK(clk), .RN(n59), .Q(n676) );
  DFFRX1 \str_buf_reg[2][7]  ( .D(n1147), .CK(clk), .RN(n59), .Q(n684) );
  DFFRX1 \str_buf_reg[3][7]  ( .D(n1139), .CK(clk), .RN(n59), .Q(n692) );
  DFFRX1 \str_buf_reg[4][7]  ( .D(n1131), .CK(clk), .RN(n59), .Q(n700) );
  DFFRX1 \str_buf_reg[5][7]  ( .D(n1123), .CK(clk), .RN(n59), .Q(n708) );
  DFFRX1 \str_buf_reg[6][7]  ( .D(n1115), .CK(clk), .RN(n59), .Q(n716) );
  DFFRX1 \str_buf_reg[7][7]  ( .D(n1107), .CK(clk), .RN(n59), .Q(n724) );
  DFFRX1 \str_buf_reg[8][7]  ( .D(n1099), .CK(clk), .RN(n59), .Q(n732) );
  DFFRX1 \str_buf_reg[9][7]  ( .D(n1091), .CK(clk), .RN(n59), .Q(n740) );
  DFFRX1 \str_buf_reg[10][7]  ( .D(n1083), .CK(clk), .RN(n59), .Q(n748) );
  DFFRX1 \str_buf_reg[11][7]  ( .D(n1075), .CK(clk), .RN(n59), .Q(n756) );
  DFFRX1 \str_buf_reg[12][7]  ( .D(n1067), .CK(clk), .RN(n62), .Q(n764) );
  DFFRX1 \str_buf_reg[13][7]  ( .D(n1059), .CK(clk), .RN(n68), .Q(n772) );
  DFFRX1 \str_buf_reg[14][7]  ( .D(n1051), .CK(clk), .RN(n66), .Q(n780) );
  DFFRX1 \str_buf_reg[15][7]  ( .D(n1043), .CK(clk), .RN(n64), .Q(n788) );
  DFFRX1 \str_buf_reg[16][7]  ( .D(n1035), .CK(clk), .RN(n70), .Q(n796) );
  DFFRX1 \str_buf_reg[17][7]  ( .D(n1027), .CK(clk), .RN(n72), .Q(n804) );
  DFFRX1 \str_buf_reg[18][7]  ( .D(n1019), .CK(clk), .RN(n69), .Q(n812) );
  DFFRX1 \str_buf_reg[19][7]  ( .D(n1011), .CK(clk), .RN(n60), .Q(n820) );
  DFFRX1 \str_buf_reg[20][7]  ( .D(n1003), .CK(clk), .RN(n76), .Q(n828) );
  DFFRX1 \str_buf_reg[21][7]  ( .D(n995), .CK(clk), .RN(n63), .Q(n836) );
  DFFRX1 \str_buf_reg[22][7]  ( .D(n987), .CK(clk), .RN(n65), .Q(n844) );
  DFFRX1 \str_buf_reg[0][0]  ( .D(n1156), .CK(clk), .RN(n73), .Q(n675) );
  DFFRX1 \str_buf_reg[0][1]  ( .D(n1157), .CK(clk), .RN(n75), .Q(n674) );
  DFFRX1 \str_buf_reg[0][2]  ( .D(n1158), .CK(clk), .RN(n72), .Q(n673) );
  DFFRX1 \str_buf_reg[0][3]  ( .D(n1159), .CK(clk), .RN(n70), .Q(n672) );
  DFFRX1 \str_buf_reg[0][4]  ( .D(n1160), .CK(clk), .RN(n68), .Q(n671) );
  DFFRX1 \str_buf_reg[0][5]  ( .D(n1161), .CK(clk), .RN(n65), .Q(n670) );
  DFFRX1 \str_buf_reg[0][6]  ( .D(n1162), .CK(clk), .RN(n62), .Q(n669) );
  DFFRX1 \str_buf_reg[0][7]  ( .D(n1163), .CK(clk), .RN(n59), .Q(n668) );
  DFFRX1 \str_buf_reg[23][0]  ( .D(n972), .CK(clk), .RN(n75), .Q(n859) );
  DFFRX1 \str_buf_reg[23][1]  ( .D(n973), .CK(clk), .RN(n73), .Q(n858) );
  DFFRX1 \str_buf_reg[23][4]  ( .D(n976), .CK(clk), .RN(n66), .Q(n855) );
  DFFRX1 \str_buf_reg[23][6]  ( .D(n978), .CK(clk), .RN(n60), .Q(n853) );
  DFFRX1 \str_buf_reg[23][7]  ( .D(n979), .CK(clk), .RN(n71), .Q(n852) );
  DFFRX1 \str_buf_reg[32][5]  ( .D(n913), .CK(clk), .RN(n62), .Q(
        \str_buf[32][5] ) );
  DFFRX1 \str_buf_reg[27][5]  ( .D(n948), .CK(clk), .RN(n63), .Q(
        \str_buf[27][5] ) );
  DFFRX1 \str_buf_reg[28][5]  ( .D(n941), .CK(clk), .RN(n63), .Q(
        \str_buf[28][5] ) );
  DFFRX1 \str_buf_reg[29][5]  ( .D(n934), .CK(clk), .RN(n63), .Q(
        \str_buf[29][5] ) );
  DFFRX1 \str_buf_reg[30][5]  ( .D(n927), .CK(clk), .RN(n62), .Q(
        \str_buf[30][5] ) );
  DFFRX1 \str_buf_reg[31][5]  ( .D(n920), .CK(clk), .RN(n62), .Q(
        \str_buf[31][5] ) );
  DFFRX1 \str_buf_reg[26][5]  ( .D(n955), .CK(clk), .RN(n63), .Q(
        \str_buf[26][5] ) );
  DFFRX1 \str_buf_reg[27][3]  ( .D(n946), .CK(clk), .RN(n68), .Q(
        \str_buf[27][3] ) );
  DFFRX1 \str_buf_reg[28][3]  ( .D(n939), .CK(clk), .RN(n68), .Q(
        \str_buf[28][3] ) );
  DFFRX1 \str_buf_reg[29][3]  ( .D(n932), .CK(clk), .RN(n68), .Q(
        \str_buf[29][3] ) );
  DFFRX1 \str_buf_reg[31][3]  ( .D(n918), .CK(clk), .RN(n68), .Q(
        \str_buf[31][3] ) );
  DFFRX1 \str_buf_reg[32][0]  ( .D(n908), .CK(clk), .RN(n70), .Q(n861) );
  DFFRX1 \str_buf_reg[30][0]  ( .D(n922), .CK(clk), .RN(n58), .Q(n866) );
  DFFRX1 \str_buf_reg[27][2]  ( .D(n945), .CK(clk), .RN(n76), .Q(
        \str_buf[27][2] ) );
  DFFRX1 \str_buf_reg[28][2]  ( .D(n938), .CK(clk), .RN(n63), .Q(
        \str_buf[28][2] ) );
  DFFRX1 \str_buf_reg[29][2]  ( .D(n931), .CK(clk), .RN(n65), .Q(
        \str_buf[29][2] ) );
  DFFRX1 \str_buf_reg[31][2]  ( .D(n917), .CK(clk), .RN(n71), .Q(
        \str_buf[31][2] ) );
  DFFRX1 \str_buf_reg[32][4]  ( .D(n912), .CK(clk), .RN(n65), .Q(n862) );
  DFFRX1 \str_buf_reg[24][5]  ( .D(n969), .CK(clk), .RN(n63), .Q(
        \str_buf[24][5] ) );
  DFFRX1 \str_buf_reg[26][0]  ( .D(n950), .CK(clk), .RN(n58), .Q(n872) );
  DFFRX1 \str_buf_reg[30][4]  ( .D(n926), .CK(clk), .RN(n65), .Q(n867) );
  DFFRX1 \str_buf_reg[25][5]  ( .D(n959), .CK(clk), .RN(n63), .Q(
        \str_buf[25][5] ) );
  DFFRX1 \str_buf_reg[26][4]  ( .D(n954), .CK(clk), .RN(n66), .Q(n873) );
  DFFRX1 \str_buf_reg[24][3]  ( .D(n967), .CK(clk), .RN(n68), .Q(
        \str_buf[24][3] ) );
  DFFRX1 \str_buf_reg[25][3]  ( .D(n961), .CK(clk), .RN(n68), .Q(
        \str_buf[25][3] ) );
  DFFRX1 \str_buf_reg[24][2]  ( .D(n966), .CK(clk), .RN(n67), .Q(
        \str_buf[24][2] ) );
  DFFRX1 \str_buf_reg[25][2]  ( .D(n962), .CK(clk), .RN(n74), .Q(
        \str_buf[25][2] ) );
  DFFRX1 \str_buf_reg[32][2]  ( .D(n910), .CK(clk), .RN(n70), .Q(
        \str_buf[32][2] ), .QN(n7) );
  DFFRX1 \str_buf_reg[30][2]  ( .D(n924), .CK(clk), .RN(n72), .Q(
        \str_buf[30][2] ), .QN(n12) );
  DFFRX1 \str_buf_reg[27][6]  ( .D(n949), .CK(clk), .RN(n60), .Q(
        \str_buf[27][6] ), .QN(n10) );
  DFFRX1 \str_buf_reg[28][6]  ( .D(n942), .CK(clk), .RN(n60), .Q(
        \str_buf[28][6] ), .QN(n11) );
  DFFRX1 \str_buf_reg[29][6]  ( .D(n935), .CK(clk), .RN(n60), .Q(
        \str_buf[29][6] ), .QN(n9) );
  DFFRX1 \str_buf_reg[31][6]  ( .D(n921), .CK(clk), .RN(n60), .Q(
        \str_buf[31][6] ), .QN(n6) );
  DFFRX1 \str_buf_reg[32][3]  ( .D(n911), .CK(clk), .RN(n68), .Q(
        \str_buf[32][3] ), .QN(n22) );
  DFFRX1 \str_buf_reg[30][3]  ( .D(n925), .CK(clk), .RN(n68), .Q(
        \str_buf[30][3] ), .QN(n32) );
  DFFRX1 \str_buf_reg[27][7]  ( .D(n1177), .CK(clk), .RN(n58), .Q(
        \str_buf[27][7] ), .QN(n28) );
  DFFRX1 \str_buf_reg[28][7]  ( .D(n1176), .CK(clk), .RN(n59), .Q(
        \str_buf[28][7] ), .QN(n29) );
  DFFRX1 \str_buf_reg[29][7]  ( .D(n1175), .CK(clk), .RN(n58), .Q(
        \str_buf[29][7] ), .QN(n26) );
  DFFRX1 \str_buf_reg[31][7]  ( .D(n1173), .CK(clk), .RN(n58), .Q(
        \str_buf[31][7] ), .QN(n21) );
  DFFRX1 \str_buf_reg[27][4]  ( .D(n947), .CK(clk), .RN(n65), .Q(
        \str_buf[27][4] ), .QN(n49) );
  DFFRX1 \str_buf_reg[28][4]  ( .D(n940), .CK(clk), .RN(n65), .Q(
        \str_buf[28][4] ), .QN(n50) );
  DFFRX1 \str_buf_reg[29][4]  ( .D(n933), .CK(clk), .RN(n65), .Q(
        \str_buf[29][4] ), .QN(n46) );
  DFFRX1 \str_buf_reg[31][4]  ( .D(n919), .CK(clk), .RN(n65), .Q(
        \str_buf[31][4] ), .QN(n41) );
  DFFRX1 \str_buf_reg[27][0]  ( .D(n943), .CK(clk), .RN(n58), .Q(
        \str_buf[27][0] ), .QN(n24) );
  DFFRX1 \str_buf_reg[28][0]  ( .D(n936), .CK(clk), .RN(n58), .Q(
        \str_buf[28][0] ), .QN(n25) );
  DFFRX1 \str_buf_reg[29][0]  ( .D(n929), .CK(clk), .RN(n58), .Q(
        \str_buf[29][0] ), .QN(n23) );
  DFFRX1 \str_buf_reg[31][0]  ( .D(n915), .CK(clk), .RN(n275), .Q(
        \str_buf[31][0] ), .QN(n18) );
  DFFRX1 \str_buf_reg[26][2]  ( .D(n952), .CK(clk), .RN(n57), .Q(
        \str_buf[26][2] ), .QN(n13) );
  DFFRX1 \str_buf_reg[27][1]  ( .D(n944), .CK(clk), .RN(n73), .Q(
        \str_buf[27][1] ), .QN(n44) );
  DFFRX1 \str_buf_reg[28][1]  ( .D(n937), .CK(clk), .RN(n73), .Q(
        \str_buf[28][1] ), .QN(n45) );
  DFFRX1 \str_buf_reg[29][1]  ( .D(n930), .CK(clk), .RN(n73), .Q(
        \str_buf[29][1] ), .QN(n43) );
  DFFRX1 \str_buf_reg[31][1]  ( .D(n916), .CK(clk), .RN(n72), .Q(
        \str_buf[31][1] ), .QN(n38) );
  DFFRX1 \str_buf_reg[32][1]  ( .D(n909), .CK(clk), .RN(n72), .Q(n860), .QN(
        n40) );
  DFFRX1 \str_buf_reg[32][7]  ( .D(n1172), .CK(clk), .RN(n58), .Q(n863), .QN(
        n39) );
  DFFRX1 \str_buf_reg[32][6]  ( .D(n914), .CK(clk), .RN(n60), .Q(n864), .QN(
        n19) );
  DFFRX1 \str_buf_reg[30][1]  ( .D(n923), .CK(clk), .RN(n72), .Q(n865), .QN(
        n52) );
  DFFRX1 \str_buf_reg[26][3]  ( .D(n953), .CK(clk), .RN(n68), .Q(
        \str_buf[26][3] ), .QN(n33) );
  DFFRX1 \str_buf_reg[30][7]  ( .D(n1174), .CK(clk), .RN(n58), .Q(n868), .QN(
        n47) );
  DFFRX1 \str_buf_reg[30][6]  ( .D(n928), .CK(clk), .RN(n60), .Q(n869), .QN(
        n30) );
  DFFRX1 \str_buf_reg[26][1]  ( .D(n951), .CK(clk), .RN(n73), .Q(n871), .QN(
        n53) );
  DFFRX1 \str_buf_reg[26][7]  ( .D(n1178), .CK(clk), .RN(n61), .Q(n874), .QN(
        n51) );
  DFFRX1 \str_buf_reg[26][6]  ( .D(n956), .CK(clk), .RN(n60), .Q(n875), .QN(
        n31) );
  DFFRX1 \str_buf_reg[24][6]  ( .D(n970), .CK(clk), .RN(n60), .Q(
        \str_buf[24][6] ), .QN(n37) );
  DFFRX1 \str_buf_reg[25][6]  ( .D(n958), .CK(clk), .RN(n60), .Q(
        \str_buf[25][6] ), .QN(n48) );
  DFFRX1 \str_buf_reg[24][7]  ( .D(n971), .CK(clk), .RN(n62), .Q(
        \str_buf[24][7] ), .QN(n17) );
  DFFRX1 \str_buf_reg[25][7]  ( .D(n957), .CK(clk), .RN(n68), .Q(
        \str_buf[25][7] ), .QN(n27) );
  DFFRX1 \str_buf_reg[24][4]  ( .D(n968), .CK(clk), .RN(n66), .Q(
        \str_buf[24][4] ), .QN(n5) );
  DFFRX1 \str_buf_reg[24][0]  ( .D(n964), .CK(clk), .RN(n75), .Q(
        \str_buf[24][0] ), .QN(n36) );
  DFFRX1 \str_buf_reg[25][4]  ( .D(n960), .CK(clk), .RN(n66), .Q(
        \str_buf[25][4] ), .QN(n8) );
  DFFRX1 \str_buf_reg[25][0]  ( .D(n1179), .CK(clk), .RN(n58), .Q(
        \str_buf[25][0] ), .QN(n42) );
  DFFRX1 \str_buf_reg[24][1]  ( .D(n965), .CK(clk), .RN(n73), .Q(
        \str_buf[24][1] ), .QN(n16) );
  DFFRX1 \str_buf_reg[25][1]  ( .D(n963), .CK(clk), .RN(n73), .Q(
        \str_buf[25][1] ), .QN(n20) );
  DFFRX1 \match_index_reg[4]  ( .D(n882), .CK(clk), .RN(n60), .Q(
        match_index[4]), .QN(n876) );
  DFFRX1 \match_index_reg[2]  ( .D(n883), .CK(clk), .RN(n66), .Q(
        match_index[2]), .QN(n877) );
  DFFRX1 \flag_reg[6]  ( .D(n904), .CK(clk), .RN(n57), .Q(n870), .QN(n54) );
  DFFRX1 \match_index_reg[3]  ( .D(n885), .CK(clk), .RN(n64), .Q(
        match_index[3]), .QN(n879) );
  DFFRX1 \match_index_reg[1]  ( .D(n884), .CK(clk), .RN(n69), .Q(
        match_index[1]), .QN(n878) );
  DFFRX1 ready_reg ( .D(n1181), .CK(clk), .RN(n57), .Q(ready) );
  DFFRX1 \match_index_reg[0]  ( .D(n887), .CK(clk), .RN(n57), .Q(
        match_index[0]), .QN(n881) );
  DFFRX1 \str_buf_reg[33][5]  ( .D(n1169), .CK(clk), .RN(n73), .Q(
        \str_buf[33][5] ), .QN(n14) );
  DFFRX1 \str_buf_reg[33][0]  ( .D(n1164), .CK(clk), .RN(n72), .QN(n1) );
  DFFRX1 \str_buf_reg[33][2]  ( .D(n1166), .CK(clk), .RN(n66), .Q(
        \str_buf[33][2] ), .QN(n15) );
  DFFRX1 \str_buf_reg[33][1]  ( .D(n1165), .CK(clk), .RN(n64), .Q(
        \str_buf[33][1] ), .QN(n34) );
  DFFRX1 \str_buf_reg[33][7]  ( .D(n1171), .CK(clk), .RN(n58), .Q(
        \str_buf[33][7] ), .QN(n3) );
  DFFRX1 \str_buf_reg[33][6]  ( .D(n1170), .CK(clk), .RN(n58), .Q(
        \str_buf[33][6] ), .QN(n2) );
  DFFRX1 \str_buf_reg[33][4]  ( .D(n1168), .CK(clk), .RN(n75), .Q(
        \str_buf[33][4] ), .QN(n35) );
  DFFRX1 \str_buf_reg[33][3]  ( .D(n1167), .CK(clk), .RN(n58), .Q(
        \str_buf[33][3] ), .QN(n4) );
  DFFRX1 \cs_reg[0]  ( .D(N1212), .CK(clk), .RN(n275), .Q(n250), .QN(n898) );
  DFFRX1 \cs_reg[2]  ( .D(N1214), .CK(clk), .RN(n275), .Q(n253), .QN(n880) );
  DFFRX1 \cs_reg[1]  ( .D(N1213), .CK(clk), .RN(n275), .Q(n255), .QN(n897) );
  DFFRX1 \flag_reg[5]  ( .D(n903), .CK(clk), .RN(n275), .QN(n893) );
  DFFRX1 \flag_reg[4]  ( .D(n902), .CK(clk), .RN(n275), .QN(n892) );
  DFFRX1 \flag_reg[3]  ( .D(n901), .CK(clk), .RN(n275), .QN(n891) );
  DFFRX1 \flag_reg[1]  ( .D(n907), .CK(clk), .RN(n275), .QN(n889) );
  DFFRX1 \flag_reg[9]  ( .D(n1180), .CK(clk), .RN(n275), .QN(n896) );
  DFFRX1 \flag_reg[8]  ( .D(n906), .CK(clk), .RN(n275), .QN(n895) );
  DFFRX1 \flag_reg[7]  ( .D(n905), .CK(clk), .RN(n275), .QN(n894) );
  DFFRX1 \flag_reg[2]  ( .D(n900), .CK(clk), .RN(n275), .QN(n890) );
  DFFRX1 \flag_reg[0]  ( .D(n899), .CK(clk), .RN(n275), .QN(n888) );
  INVX3 U3 ( .A(reset), .Y(n275) );
  CLKBUFX3 U4 ( .A(n350), .Y(n56) );
  NOR2X1 U5 ( .A(n255), .B(n898), .Y(n207) );
  NOR2X2 U6 ( .A(n629), .B(n898), .Y(n85) );
  NOR2X1 U7 ( .A(pat_len[2]), .B(pat_len[3]), .Y(n206) );
  CLKINVX1 U8 ( .A(pat_len[3]), .Y(n276) );
  CLKBUFX3 U9 ( .A(n78), .Y(n109) );
  CLKBUFX3 U10 ( .A(n115), .Y(n110) );
  CLKBUFX3 U11 ( .A(n125), .Y(n90) );
  INVX3 U12 ( .A(n222), .Y(n185) );
  CLKBUFX3 U13 ( .A(n113), .Y(n112) );
  CLKBUFX3 U14 ( .A(n113), .Y(n108) );
  CLKBUFX3 U15 ( .A(n116), .Y(n88) );
  CLKBUFX3 U16 ( .A(n116), .Y(n87) );
  CLKBUFX3 U17 ( .A(n132), .Y(n159) );
  CLKBUFX3 U18 ( .A(n132), .Y(n160) );
  CLKBUFX3 U19 ( .A(n135), .Y(n162) );
  CLKBUFX3 U20 ( .A(n134), .Y(n163) );
  CLKBUFX3 U21 ( .A(n134), .Y(n165) );
  CLKBUFX3 U22 ( .A(n132), .Y(n166) );
  CLKBUFX3 U23 ( .A(n130), .Y(n137) );
  CLKBUFX3 U24 ( .A(n131), .Y(n158) );
  INVX3 U25 ( .A(n243), .Y(n218) );
  INVX3 U26 ( .A(n220), .Y(n205) );
  INVX3 U27 ( .A(n220), .Y(n193) );
  INVX3 U28 ( .A(n236), .Y(n192) );
  INVX3 U29 ( .A(n220), .Y(n190) );
  INVX3 U30 ( .A(n236), .Y(n189) );
  INVX3 U31 ( .A(n236), .Y(n187) );
  INVX3 U32 ( .A(n236), .Y(n186) );
  INVX3 U33 ( .A(n220), .Y(n219) );
  CLKBUFX3 U34 ( .A(n226), .Y(n222) );
  CLKBUFX3 U35 ( .A(n77), .Y(n115) );
  CLKBUFX3 U36 ( .A(n77), .Y(n113) );
  CLKBUFX3 U37 ( .A(n78), .Y(n116) );
  CLKBUFX3 U38 ( .A(n78), .Y(n125) );
  CLKBUFX3 U39 ( .A(n225), .Y(n223) );
  CLKBUFX3 U40 ( .A(n56), .Y(n132) );
  CLKBUFX3 U41 ( .A(n56), .Y(n134) );
  CLKBUFX3 U42 ( .A(n56), .Y(n135) );
  CLKBUFX3 U43 ( .A(n56), .Y(n126) );
  CLKBUFX3 U44 ( .A(n56), .Y(n130) );
  CLKBUFX3 U45 ( .A(n56), .Y(n131) );
  CLKBUFX3 U46 ( .A(n236), .Y(n220) );
  CLKINVX1 U47 ( .A(n629), .Y(n249) );
  CLKBUFX3 U48 ( .A(n57), .Y(n58) );
  CLKBUFX3 U49 ( .A(n76), .Y(n59) );
  CLKBUFX3 U50 ( .A(n275), .Y(n60) );
  CLKBUFX3 U51 ( .A(n63), .Y(n61) );
  CLKBUFX3 U52 ( .A(n65), .Y(n62) );
  CLKBUFX3 U53 ( .A(n57), .Y(n63) );
  CLKBUFX3 U54 ( .A(n74), .Y(n64) );
  CLKBUFX3 U55 ( .A(n57), .Y(n65) );
  CLKBUFX3 U56 ( .A(n67), .Y(n66) );
  CLKBUFX3 U57 ( .A(n57), .Y(n67) );
  CLKBUFX3 U58 ( .A(n71), .Y(n68) );
  CLKBUFX3 U59 ( .A(n57), .Y(n69) );
  CLKBUFX3 U60 ( .A(n57), .Y(n70) );
  CLKBUFX3 U61 ( .A(n57), .Y(n71) );
  CLKBUFX3 U62 ( .A(n57), .Y(n72) );
  CLKBUFX3 U63 ( .A(n58), .Y(n73) );
  CLKBUFX3 U64 ( .A(n57), .Y(n74) );
  CLKBUFX3 U65 ( .A(n57), .Y(n75) );
  CLKBUFX3 U66 ( .A(n57), .Y(n76) );
  CLKBUFX3 U67 ( .A(n244), .Y(n226) );
  CLKBUFX3 U68 ( .A(n80), .Y(n77) );
  CLKBUFX3 U69 ( .A(n79), .Y(n78) );
  AND2X2 U70 ( .A(n624), .B(n223), .Y(n350) );
  CLKBUFX3 U71 ( .A(n244), .Y(n225) );
  CLKBUFX3 U72 ( .A(n243), .Y(n236) );
  NAND2X1 U73 ( .A(n204), .B(n249), .Y(n86) );
  NOR2X1 U74 ( .A(n81), .B(n630), .Y(n629) );
  NAND2X1 U75 ( .A(n207), .B(n253), .Y(n626) );
  CLKBUFX3 U76 ( .A(n351), .Y(n79) );
  CLKBUFX3 U77 ( .A(n351), .Y(n80) );
  CLKBUFX3 U78 ( .A(n248), .Y(n244) );
  CLKBUFX3 U79 ( .A(n248), .Y(n243) );
  NOR2BX1 U80 ( .AN(n630), .B(n656), .Y(n624) );
  NOR2X1 U81 ( .A(n250), .B(n253), .Y(n630) );
  CLKINVX1 U82 ( .A(n625), .Y(n274) );
  OAI21XL U83 ( .A0(n662), .A1(n663), .B0(n655), .Y(n658) );
  NAND4X1 U84 ( .A(n35), .B(n14), .C(n2), .D(n3), .Y(n662) );
  NAND4X1 U85 ( .A(n1), .B(n34), .C(n15), .D(n4), .Y(n663) );
  NOR2BX1 U86 ( .AN(n628), .B(n250), .Y(n204) );
  NAND2X1 U87 ( .A(n255), .B(n658), .Y(n628) );
  NOR2X2 U88 ( .A(n253), .B(n255), .Y(n81) );
  NAND2X1 U89 ( .A(n207), .B(n249), .Y(n84) );
  OAI21X1 U90 ( .A0(n203), .A1(n204), .B0(n249), .Y(n147) );
  AND2X2 U91 ( .A(n206), .B(n207), .Y(n203) );
  NAND3X1 U92 ( .A(n13), .B(n33), .C(n53), .Y(n129) );
  NAND3X1 U93 ( .A(n12), .B(n32), .C(n52), .Y(n247) );
  NAND3X1 U94 ( .A(n7), .B(n22), .C(n40), .Y(n302) );
  NAND3X1 U95 ( .A(n10), .B(n28), .C(n49), .Y(n157) );
  NAND3X1 U96 ( .A(n11), .B(n29), .C(n50), .Y(n184) );
  NAND3X1 U97 ( .A(n9), .B(n26), .C(n46), .Y(n217) );
  NAND3X1 U98 ( .A(n6), .B(n21), .C(n41), .Y(n273) );
  NOR3X1 U99 ( .A(n606), .B(n600), .C(n602), .Y(n641) );
  NOR2X1 U100 ( .A(n253), .B(n252), .Y(n82) );
  CLKINVX1 U101 ( .A(n207), .Y(n252) );
  NOR2BX1 U102 ( .AN(n82), .B(n656), .Y(N1213) );
  OAI2BB2XL U103 ( .B0(n656), .B1(n626), .A0N(n628), .A1N(n624), .Y(N1212) );
  NOR2X1 U104 ( .A(pat_len[0]), .B(pat_len[1]), .Y(n208) );
  NAND2X1 U105 ( .A(pat_len[1]), .B(pat_len[0]), .Y(n148) );
  CLKINVX1 U106 ( .A(pat_len[1]), .Y(n608) );
  NOR2BX1 U107 ( .AN(n1181), .B(n655), .Y(N1229) );
  CLKBUFX3 U108 ( .A(n275), .Y(n57) );
  NOR2X1 U109 ( .A(n185), .B(n898), .Y(n351) );
  CLKINVX1 U110 ( .A(n348), .Y(n248) );
  OAI221XL U111 ( .A0(n625), .A1(n626), .B0(n880), .B1(n250), .C0(n897), .Y(
        n348) );
  OAI21XL U112 ( .A0(n236), .A1(n5), .B0(n412), .Y(n968) );
  AOI22X1 U113 ( .A0(str_reg_w[196]), .A1(n163), .B0(n855), .B1(n109), .Y(n412) );
  OAI21XL U114 ( .A0(n220), .A1(n17), .B0(n415), .Y(n971) );
  AOI22X1 U115 ( .A0(str_reg_w[199]), .A1(n134), .B0(n852), .B1(n109), .Y(n415) );
  OAI21XL U116 ( .A0(n243), .A1(n37), .B0(n414), .Y(n970) );
  AOI22X1 U117 ( .A0(str_reg_w[198]), .A1(n134), .B0(n853), .B1(n109), .Y(n414) );
  OAI21XL U118 ( .A0(n220), .A1(n16), .B0(n409), .Y(n965) );
  AOI22X1 U119 ( .A0(str_reg_w[193]), .A1(n162), .B0(n858), .B1(n110), .Y(n409) );
  OAI21XL U120 ( .A0(n220), .A1(n36), .B0(n408), .Y(n964) );
  AOI22X1 U121 ( .A0(str_reg_w[192]), .A1(n126), .B0(n859), .B1(n90), .Y(n408)
         );
  OAI2BB1X1 U122 ( .A0N(n218), .A1N(\str_buf[24][2] ), .B0(n410), .Y(n966) );
  AOI22X1 U123 ( .A0(str_reg_w[194]), .A1(n166), .B0(n857), .B1(n112), .Y(n410) );
  OAI2BB1X1 U124 ( .A0N(n218), .A1N(\str_buf[24][3] ), .B0(n411), .Y(n967) );
  AOI22X1 U125 ( .A0(str_reg_w[195]), .A1(n131), .B0(n856), .B1(n77), .Y(n411)
         );
  OAI2BB1X1 U126 ( .A0N(n218), .A1N(\str_buf[24][5] ), .B0(n413), .Y(n969) );
  AOI22X1 U127 ( .A0(str_reg_w[197]), .A1(n130), .B0(n854), .B1(n109), .Y(n413) );
  OAI2BB1X1 U128 ( .A0N(n218), .A1N(n852), .B0(n423), .Y(n979) );
  AOI22X1 U129 ( .A0(str_reg_w[191]), .A1(n163), .B0(n844), .B1(n109), .Y(n423) );
  OAI2BB1X1 U130 ( .A0N(n218), .A1N(n844), .B0(n431), .Y(n987) );
  AOI22X1 U131 ( .A0(str_reg_w[183]), .A1(n165), .B0(n836), .B1(n109), .Y(n431) );
  OAI2BB1X1 U132 ( .A0N(n205), .A1N(n836), .B0(n439), .Y(n995) );
  AOI22X1 U133 ( .A0(str_reg_w[175]), .A1(n165), .B0(n828), .B1(n78), .Y(n439)
         );
  OAI2BB1X1 U134 ( .A0N(n205), .A1N(n828), .B0(n447), .Y(n1003) );
  AOI22X1 U135 ( .A0(str_reg_w[167]), .A1(n166), .B0(n820), .B1(n115), .Y(n447) );
  OAI2BB1X1 U136 ( .A0N(n205), .A1N(n820), .B0(n455), .Y(n1011) );
  AOI22X1 U137 ( .A0(str_reg_w[159]), .A1(n134), .B0(n812), .B1(n110), .Y(n455) );
  OAI2BB1X1 U138 ( .A0N(n193), .A1N(n812), .B0(n463), .Y(n1019) );
  AOI22X1 U139 ( .A0(str_reg_w[151]), .A1(n350), .B0(n804), .B1(n115), .Y(n463) );
  OAI2BB1X1 U140 ( .A0N(n193), .A1N(n804), .B0(n471), .Y(n1027) );
  AOI22X1 U141 ( .A0(str_reg_w[143]), .A1(n131), .B0(n796), .B1(n115), .Y(n471) );
  OAI2BB1X1 U142 ( .A0N(n192), .A1N(n796), .B0(n479), .Y(n1035) );
  AOI22X1 U143 ( .A0(str_reg_w[135]), .A1(n163), .B0(n788), .B1(n78), .Y(n479)
         );
  OAI2BB1X1 U144 ( .A0N(n192), .A1N(n788), .B0(n487), .Y(n1043) );
  AOI22X1 U145 ( .A0(str_reg_w[127]), .A1(n162), .B0(n780), .B1(n80), .Y(n487)
         );
  OAI2BB1X1 U146 ( .A0N(n192), .A1N(n780), .B0(n495), .Y(n1051) );
  AOI22X1 U147 ( .A0(str_reg_w[119]), .A1(n130), .B0(n772), .B1(n112), .Y(n495) );
  OAI2BB1X1 U148 ( .A0N(n190), .A1N(n756), .B0(n519), .Y(n1075) );
  AOI22X1 U149 ( .A0(str_reg_w[95]), .A1(n160), .B0(n748), .B1(n90), .Y(n519)
         );
  OAI2BB1X1 U150 ( .A0N(n189), .A1N(n748), .B0(n527), .Y(n1083) );
  AOI22X1 U151 ( .A0(str_reg_w[87]), .A1(n134), .B0(n740), .B1(n90), .Y(n527)
         );
  OAI2BB1X1 U152 ( .A0N(n189), .A1N(n740), .B0(n535), .Y(n1091) );
  AOI22X1 U153 ( .A0(str_reg_w[79]), .A1(n350), .B0(n732), .B1(n113), .Y(n535)
         );
  OAI2BB1X1 U154 ( .A0N(n189), .A1N(n732), .B0(n543), .Y(n1099) );
  AOI22X1 U155 ( .A0(str_reg_w[71]), .A1(n137), .B0(n724), .B1(n88), .Y(n543)
         );
  OAI2BB1X1 U156 ( .A0N(n187), .A1N(n724), .B0(n551), .Y(n1107) );
  AOI22X1 U157 ( .A0(str_reg_w[63]), .A1(n130), .B0(n716), .B1(n88), .Y(n551)
         );
  OAI2BB1X1 U158 ( .A0N(n187), .A1N(n716), .B0(n559), .Y(n1115) );
  AOI22X1 U159 ( .A0(str_reg_w[55]), .A1(n130), .B0(n708), .B1(n116), .Y(n559)
         );
  OAI2BB1X1 U160 ( .A0N(n186), .A1N(n708), .B0(n567), .Y(n1123) );
  AOI22X1 U161 ( .A0(str_reg_w[47]), .A1(n158), .B0(n700), .B1(n108), .Y(n567)
         );
  OAI2BB1X1 U162 ( .A0N(n186), .A1N(n700), .B0(n575), .Y(n1131) );
  AOI22X1 U163 ( .A0(str_reg_w[39]), .A1(n158), .B0(n692), .B1(n108), .Y(n575)
         );
  OAI2BB1X1 U164 ( .A0N(n186), .A1N(n692), .B0(n583), .Y(n1139) );
  AOI22X1 U165 ( .A0(str_reg_w[31]), .A1(n131), .B0(n684), .B1(n80), .Y(n583)
         );
  OAI2BB1X1 U166 ( .A0N(n185), .A1N(n684), .B0(n591), .Y(n1147) );
  AOI22X1 U167 ( .A0(str_reg_w[23]), .A1(n165), .B0(n676), .B1(n77), .Y(n591)
         );
  OAI2BB1X1 U168 ( .A0N(n185), .A1N(n676), .B0(n599), .Y(n1155) );
  AOI22X1 U169 ( .A0(str_reg_w[15]), .A1(n166), .B0(n668), .B1(n110), .Y(n599)
         );
  OAI2BB1X1 U170 ( .A0N(n218), .A1N(n853), .B0(n422), .Y(n978) );
  AOI22X1 U171 ( .A0(str_reg_w[190]), .A1(n163), .B0(n845), .B1(n109), .Y(n422) );
  OAI2BB1X1 U172 ( .A0N(n218), .A1N(n845), .B0(n430), .Y(n986) );
  AOI22X1 U173 ( .A0(str_reg_w[182]), .A1(n165), .B0(n837), .B1(n113), .Y(n430) );
  OAI2BB1X1 U174 ( .A0N(n205), .A1N(n837), .B0(n438), .Y(n994) );
  AOI22X1 U175 ( .A0(str_reg_w[174]), .A1(n165), .B0(n829), .B1(n80), .Y(n438)
         );
  OAI2BB1X1 U176 ( .A0N(n205), .A1N(n829), .B0(n446), .Y(n1002) );
  AOI22X1 U177 ( .A0(str_reg_w[166]), .A1(n166), .B0(n821), .B1(n115), .Y(n446) );
  OAI2BB1X1 U178 ( .A0N(n205), .A1N(n821), .B0(n454), .Y(n1010) );
  AOI22X1 U179 ( .A0(str_reg_w[158]), .A1(n56), .B0(n813), .B1(n110), .Y(n454)
         );
  OAI2BB1X1 U180 ( .A0N(n193), .A1N(n813), .B0(n462), .Y(n1018) );
  AOI22X1 U181 ( .A0(str_reg_w[150]), .A1(n56), .B0(n805), .B1(n110), .Y(n462)
         );
  OAI2BB1X1 U182 ( .A0N(n193), .A1N(n805), .B0(n470), .Y(n1026) );
  AOI22X1 U183 ( .A0(str_reg_w[142]), .A1(n134), .B0(n797), .B1(n112), .Y(n470) );
  OAI2BB1X1 U184 ( .A0N(n192), .A1N(n797), .B0(n478), .Y(n1034) );
  AOI22X1 U185 ( .A0(str_reg_w[134]), .A1(n165), .B0(n789), .B1(n80), .Y(n478)
         );
  OAI2BB1X1 U186 ( .A0N(n192), .A1N(n789), .B0(n486), .Y(n1042) );
  AOI22X1 U187 ( .A0(str_reg_w[126]), .A1(n159), .B0(n781), .B1(n77), .Y(n486)
         );
  OAI2BB1X1 U188 ( .A0N(n192), .A1N(n781), .B0(n494), .Y(n1050) );
  AOI22X1 U189 ( .A0(str_reg_w[118]), .A1(n160), .B0(n773), .B1(n112), .Y(n494) );
  OAI2BB1X1 U190 ( .A0N(n190), .A1N(n757), .B0(n518), .Y(n1074) );
  AOI22X1 U191 ( .A0(str_reg_w[94]), .A1(n126), .B0(n749), .B1(n90), .Y(n518)
         );
  OAI2BB1X1 U192 ( .A0N(n189), .A1N(n749), .B0(n526), .Y(n1082) );
  AOI22X1 U193 ( .A0(str_reg_w[86]), .A1(n130), .B0(n741), .B1(n78), .Y(n526)
         );
  OAI2BB1X1 U194 ( .A0N(n189), .A1N(n741), .B0(n534), .Y(n1090) );
  AOI22X1 U195 ( .A0(str_reg_w[78]), .A1(n131), .B0(n733), .B1(n87), .Y(n534)
         );
  OAI2BB1X1 U196 ( .A0N(n189), .A1N(n733), .B0(n542), .Y(n1098) );
  AOI22X1 U197 ( .A0(str_reg_w[70]), .A1(n137), .B0(n725), .B1(n78), .Y(n542)
         );
  OAI2BB1X1 U198 ( .A0N(n187), .A1N(n725), .B0(n550), .Y(n1106) );
  AOI22X1 U199 ( .A0(str_reg_w[62]), .A1(n159), .B0(n717), .B1(n116), .Y(n550)
         );
  OAI2BB1X1 U200 ( .A0N(n187), .A1N(n717), .B0(n558), .Y(n1114) );
  AOI22X1 U201 ( .A0(str_reg_w[54]), .A1(n160), .B0(n709), .B1(n77), .Y(n558)
         );
  OAI2BB1X1 U202 ( .A0N(n186), .A1N(n709), .B0(n566), .Y(n1122) );
  AOI22X1 U203 ( .A0(str_reg_w[46]), .A1(n158), .B0(n701), .B1(n108), .Y(n566)
         );
  OAI2BB1X1 U204 ( .A0N(n186), .A1N(n701), .B0(n574), .Y(n1130) );
  AOI22X1 U205 ( .A0(str_reg_w[38]), .A1(n131), .B0(n693), .B1(n108), .Y(n574)
         );
  OAI2BB1X1 U206 ( .A0N(n186), .A1N(n693), .B0(n582), .Y(n1138) );
  AOI22X1 U207 ( .A0(str_reg_w[30]), .A1(n165), .B0(n685), .B1(n77), .Y(n582)
         );
  OAI2BB1X1 U208 ( .A0N(n185), .A1N(n685), .B0(n590), .Y(n1146) );
  AOI22X1 U209 ( .A0(str_reg_w[22]), .A1(n131), .B0(n677), .B1(n80), .Y(n590)
         );
  OAI2BB1X1 U210 ( .A0N(n185), .A1N(n677), .B0(n598), .Y(n1154) );
  AOI22X1 U211 ( .A0(str_reg_w[14]), .A1(n160), .B0(n669), .B1(n113), .Y(n598)
         );
  OAI2BB1X1 U212 ( .A0N(n218), .A1N(n854), .B0(n421), .Y(n977) );
  AOI22X1 U213 ( .A0(str_reg_w[189]), .A1(n163), .B0(n846), .B1(n109), .Y(n421) );
  OAI2BB1X1 U214 ( .A0N(n218), .A1N(n846), .B0(n429), .Y(n985) );
  AOI22X1 U215 ( .A0(str_reg_w[181]), .A1(n165), .B0(n838), .B1(n110), .Y(n429) );
  OAI2BB1X1 U216 ( .A0N(n205), .A1N(n838), .B0(n437), .Y(n993) );
  AOI22X1 U217 ( .A0(str_reg_w[173]), .A1(n165), .B0(n830), .B1(n78), .Y(n437)
         );
  OAI2BB1X1 U218 ( .A0N(n205), .A1N(n830), .B0(n445), .Y(n1001) );
  AOI22X1 U219 ( .A0(str_reg_w[165]), .A1(n166), .B0(n822), .B1(n90), .Y(n445)
         );
  OAI2BB1X1 U220 ( .A0N(n205), .A1N(n822), .B0(n453), .Y(n1009) );
  AOI22X1 U221 ( .A0(str_reg_w[157]), .A1(n166), .B0(n814), .B1(n110), .Y(n453) );
  OAI2BB1X1 U222 ( .A0N(n193), .A1N(n814), .B0(n461), .Y(n1017) );
  AOI22X1 U223 ( .A0(str_reg_w[149]), .A1(n56), .B0(n806), .B1(n110), .Y(n461)
         );
  OAI2BB1X1 U224 ( .A0N(n193), .A1N(n806), .B0(n469), .Y(n1025) );
  AOI22X1 U225 ( .A0(str_reg_w[141]), .A1(n135), .B0(n798), .B1(n113), .Y(n469) );
  OAI2BB1X1 U226 ( .A0N(n193), .A1N(n798), .B0(n477), .Y(n1033) );
  AOI22X1 U227 ( .A0(str_reg_w[133]), .A1(n159), .B0(n790), .B1(n125), .Y(n477) );
  OAI2BB1X1 U228 ( .A0N(n192), .A1N(n790), .B0(n485), .Y(n1041) );
  AOI22X1 U229 ( .A0(str_reg_w[125]), .A1(n134), .B0(n782), .B1(n77), .Y(n485)
         );
  OAI2BB1X1 U230 ( .A0N(n192), .A1N(n782), .B0(n493), .Y(n1049) );
  AOI22X1 U231 ( .A0(str_reg_w[117]), .A1(n162), .B0(n774), .B1(n112), .Y(n493) );
  OAI2BB1X1 U232 ( .A0N(n190), .A1N(n774), .B0(n501), .Y(n1057) );
  AOI22X1 U233 ( .A0(str_reg_w[109]), .A1(n135), .B0(n766), .B1(n112), .Y(n501) );
  OAI2BB1X1 U234 ( .A0N(n190), .A1N(n758), .B0(n517), .Y(n1073) );
  AOI22X1 U235 ( .A0(str_reg_w[93]), .A1(n135), .B0(n750), .B1(n90), .Y(n517)
         );
  OAI2BB1X1 U236 ( .A0N(n189), .A1N(n750), .B0(n525), .Y(n1081) );
  AOI22X1 U237 ( .A0(str_reg_w[85]), .A1(n350), .B0(n742), .B1(n79), .Y(n525)
         );
  OAI2BB1X1 U238 ( .A0N(n189), .A1N(n742), .B0(n533), .Y(n1089) );
  AOI22X1 U239 ( .A0(str_reg_w[77]), .A1(n350), .B0(n734), .B1(n79), .Y(n533)
         );
  OAI2BB1X1 U240 ( .A0N(n189), .A1N(n734), .B0(n541), .Y(n1097) );
  AOI22X1 U241 ( .A0(str_reg_w[69]), .A1(n137), .B0(n726), .B1(n79), .Y(n541)
         );
  OAI2BB1X1 U242 ( .A0N(n187), .A1N(n726), .B0(n549), .Y(n1105) );
  AOI22X1 U243 ( .A0(str_reg_w[61]), .A1(n132), .B0(n718), .B1(n88), .Y(n549)
         );
  OAI2BB1X1 U244 ( .A0N(n187), .A1N(n718), .B0(n557), .Y(n1113) );
  AOI22X1 U245 ( .A0(str_reg_w[53]), .A1(n131), .B0(n710), .B1(n78), .Y(n557)
         );
  OAI2BB1X1 U246 ( .A0N(n187), .A1N(n710), .B0(n565), .Y(n1121) );
  AOI22X1 U247 ( .A0(str_reg_w[45]), .A1(n158), .B0(n702), .B1(n108), .Y(n565)
         );
  OAI2BB1X1 U248 ( .A0N(n186), .A1N(n702), .B0(n573), .Y(n1129) );
  AOI22X1 U249 ( .A0(str_reg_w[37]), .A1(n158), .B0(n694), .B1(n108), .Y(n573)
         );
  OAI2BB1X1 U250 ( .A0N(n186), .A1N(n694), .B0(n581), .Y(n1137) );
  AOI22X1 U251 ( .A0(str_reg_w[29]), .A1(n126), .B0(n686), .B1(n116), .Y(n581)
         );
  OAI2BB1X1 U252 ( .A0N(n185), .A1N(n686), .B0(n589), .Y(n1145) );
  AOI22X1 U253 ( .A0(str_reg_w[21]), .A1(n126), .B0(n678), .B1(n116), .Y(n589)
         );
  OAI2BB1X1 U254 ( .A0N(n185), .A1N(n678), .B0(n597), .Y(n1153) );
  AOI22X1 U255 ( .A0(str_reg_w[13]), .A1(n132), .B0(n670), .B1(n87), .Y(n597)
         );
  OAI2BB1X1 U256 ( .A0N(n218), .A1N(n855), .B0(n420), .Y(n976) );
  AOI22X1 U257 ( .A0(str_reg_w[188]), .A1(n163), .B0(n847), .B1(n109), .Y(n420) );
  OAI2BB1X1 U258 ( .A0N(n218), .A1N(n847), .B0(n428), .Y(n984) );
  AOI22X1 U259 ( .A0(str_reg_w[180]), .A1(n165), .B0(n839), .B1(n116), .Y(n428) );
  OAI2BB1X1 U260 ( .A0N(n205), .A1N(n839), .B0(n436), .Y(n992) );
  AOI22X1 U261 ( .A0(str_reg_w[172]), .A1(n165), .B0(n831), .B1(n79), .Y(n436)
         );
  OAI2BB1X1 U262 ( .A0N(n205), .A1N(n831), .B0(n444), .Y(n1000) );
  AOI22X1 U263 ( .A0(str_reg_w[164]), .A1(n166), .B0(n823), .B1(n125), .Y(n444) );
  OAI2BB1X1 U264 ( .A0N(n205), .A1N(n823), .B0(n452), .Y(n1008) );
  AOI22X1 U265 ( .A0(str_reg_w[156]), .A1(n166), .B0(n815), .B1(n110), .Y(n452) );
  OAI2BB1X1 U266 ( .A0N(n193), .A1N(n815), .B0(n460), .Y(n1016) );
  AOI22X1 U267 ( .A0(str_reg_w[148]), .A1(n56), .B0(n807), .B1(n110), .Y(n460)
         );
  OAI2BB1X1 U268 ( .A0N(n193), .A1N(n807), .B0(n468), .Y(n1024) );
  AOI22X1 U269 ( .A0(str_reg_w[140]), .A1(n130), .B0(n799), .B1(n79), .Y(n468)
         );
  OAI2BB1X1 U270 ( .A0N(n193), .A1N(n799), .B0(n476), .Y(n1032) );
  AOI22X1 U271 ( .A0(str_reg_w[132]), .A1(n126), .B0(n791), .B1(n113), .Y(n476) );
  OAI2BB1X1 U272 ( .A0N(n192), .A1N(n791), .B0(n484), .Y(n1040) );
  AOI22X1 U273 ( .A0(str_reg_w[124]), .A1(n131), .B0(n783), .B1(n77), .Y(n484)
         );
  OAI2BB1X1 U274 ( .A0N(n192), .A1N(n783), .B0(n492), .Y(n1048) );
  AOI22X1 U275 ( .A0(str_reg_w[116]), .A1(n132), .B0(n775), .B1(n112), .Y(n492) );
  OAI2BB1X1 U276 ( .A0N(n190), .A1N(n775), .B0(n500), .Y(n1056) );
  AOI22X1 U277 ( .A0(str_reg_w[108]), .A1(n135), .B0(n767), .B1(n112), .Y(n500) );
  OAI2BB1X1 U278 ( .A0N(n190), .A1N(n759), .B0(n516), .Y(n1072) );
  AOI22X1 U279 ( .A0(str_reg_w[92]), .A1(n159), .B0(n751), .B1(n90), .Y(n516)
         );
  OAI2BB1X1 U280 ( .A0N(n189), .A1N(n751), .B0(n524), .Y(n1080) );
  AOI22X1 U281 ( .A0(str_reg_w[84]), .A1(n350), .B0(n743), .B1(n90), .Y(n524)
         );
  OAI2BB1X1 U282 ( .A0N(n189), .A1N(n743), .B0(n532), .Y(n1088) );
  AOI22X1 U283 ( .A0(str_reg_w[76]), .A1(n350), .B0(n735), .B1(n88), .Y(n532)
         );
  OAI2BB1X1 U284 ( .A0N(n189), .A1N(n735), .B0(n540), .Y(n1096) );
  AOI22X1 U285 ( .A0(str_reg_w[68]), .A1(n137), .B0(n727), .B1(n351), .Y(n540)
         );
  OAI2BB1X1 U286 ( .A0N(n187), .A1N(n727), .B0(n548), .Y(n1104) );
  AOI22X1 U287 ( .A0(str_reg_w[60]), .A1(n137), .B0(n719), .B1(n110), .Y(n548)
         );
  OAI2BB1X1 U288 ( .A0N(n187), .A1N(n719), .B0(n556), .Y(n1112) );
  AOI22X1 U289 ( .A0(str_reg_w[52]), .A1(n132), .B0(n711), .B1(n80), .Y(n556)
         );
  OAI2BB1X1 U290 ( .A0N(n187), .A1N(n711), .B0(n564), .Y(n1120) );
  AOI22X1 U291 ( .A0(str_reg_w[44]), .A1(n158), .B0(n703), .B1(n108), .Y(n564)
         );
  OAI2BB1X1 U292 ( .A0N(n186), .A1N(n703), .B0(n572), .Y(n1128) );
  AOI22X1 U293 ( .A0(str_reg_w[36]), .A1(n158), .B0(n695), .B1(n108), .Y(n572)
         );
  OAI2BB1X1 U294 ( .A0N(n186), .A1N(n695), .B0(n580), .Y(n1136) );
  AOI22X1 U295 ( .A0(str_reg_w[28]), .A1(n137), .B0(n687), .B1(n80), .Y(n580)
         );
  OAI2BB1X1 U296 ( .A0N(n185), .A1N(n687), .B0(n588), .Y(n1144) );
  AOI22X1 U297 ( .A0(str_reg_w[20]), .A1(n130), .B0(n679), .B1(n78), .Y(n588)
         );
  OAI2BB1X1 U298 ( .A0N(n185), .A1N(n679), .B0(n596), .Y(n1152) );
  AOI22X1 U299 ( .A0(str_reg_w[12]), .A1(n134), .B0(n671), .B1(n116), .Y(n596)
         );
  OAI2BB1X1 U300 ( .A0N(n218), .A1N(n856), .B0(n419), .Y(n975) );
  AOI22X1 U301 ( .A0(str_reg_w[187]), .A1(n163), .B0(n848), .B1(n109), .Y(n419) );
  OAI2BB1X1 U302 ( .A0N(n218), .A1N(n848), .B0(n427), .Y(n983) );
  AOI22X1 U303 ( .A0(str_reg_w[179]), .A1(n163), .B0(n840), .B1(n88), .Y(n427)
         );
  OAI2BB1X1 U304 ( .A0N(n205), .A1N(n840), .B0(n435), .Y(n991) );
  AOI22X1 U305 ( .A0(str_reg_w[171]), .A1(n165), .B0(n832), .B1(n115), .Y(n435) );
  OAI2BB1X1 U306 ( .A0N(n205), .A1N(n832), .B0(n443), .Y(n999) );
  AOI22X1 U307 ( .A0(str_reg_w[163]), .A1(n166), .B0(n824), .B1(n77), .Y(n443)
         );
  OAI2BB1X1 U308 ( .A0N(n205), .A1N(n824), .B0(n451), .Y(n1007) );
  AOI22X1 U309 ( .A0(str_reg_w[155]), .A1(n166), .B0(n816), .B1(n110), .Y(n451) );
  OAI2BB1X1 U310 ( .A0N(n193), .A1N(n816), .B0(n459), .Y(n1015) );
  AOI22X1 U311 ( .A0(str_reg_w[147]), .A1(n56), .B0(n808), .B1(n110), .Y(n459)
         );
  OAI2BB1X1 U312 ( .A0N(n193), .A1N(n808), .B0(n467), .Y(n1023) );
  AOI22X1 U313 ( .A0(str_reg_w[139]), .A1(n131), .B0(n800), .B1(n115), .Y(n467) );
  OAI2BB1X1 U314 ( .A0N(n193), .A1N(n800), .B0(n475), .Y(n1031) );
  AOI22X1 U315 ( .A0(str_reg_w[131]), .A1(n160), .B0(n792), .B1(n115), .Y(n475) );
  OAI2BB1X1 U316 ( .A0N(n192), .A1N(n792), .B0(n483), .Y(n1039) );
  AOI22X1 U317 ( .A0(str_reg_w[123]), .A1(n134), .B0(n784), .B1(n77), .Y(n483)
         );
  OAI2BB1X1 U318 ( .A0N(n192), .A1N(n784), .B0(n491), .Y(n1047) );
  AOI22X1 U319 ( .A0(str_reg_w[115]), .A1(n137), .B0(n776), .B1(n112), .Y(n491) );
  OAI2BB1X1 U320 ( .A0N(n192), .A1N(n776), .B0(n499), .Y(n1055) );
  AOI22X1 U321 ( .A0(str_reg_w[107]), .A1(n163), .B0(n768), .B1(n112), .Y(n499) );
  OAI2BB1X1 U322 ( .A0N(n190), .A1N(n760), .B0(n515), .Y(n1071) );
  AOI22X1 U323 ( .A0(str_reg_w[91]), .A1(n165), .B0(n752), .B1(n90), .Y(n515)
         );
  OAI2BB1X1 U324 ( .A0N(n189), .A1N(n752), .B0(n523), .Y(n1079) );
  AOI22X1 U325 ( .A0(str_reg_w[83]), .A1(n350), .B0(n744), .B1(n90), .Y(n523)
         );
  OAI2BB1X1 U326 ( .A0N(n189), .A1N(n744), .B0(n531), .Y(n1087) );
  AOI22X1 U327 ( .A0(str_reg_w[75]), .A1(n350), .B0(n736), .B1(n108), .Y(n531)
         );
  OAI2BB1X1 U328 ( .A0N(n189), .A1N(n736), .B0(n539), .Y(n1095) );
  AOI22X1 U329 ( .A0(str_reg_w[67]), .A1(n137), .B0(n728), .B1(n80), .Y(n539)
         );
  OAI2BB1X1 U330 ( .A0N(n187), .A1N(n728), .B0(n547), .Y(n1103) );
  AOI22X1 U331 ( .A0(str_reg_w[59]), .A1(n137), .B0(n720), .B1(n79), .Y(n547)
         );
  OAI2BB1X1 U332 ( .A0N(n187), .A1N(n720), .B0(n555), .Y(n1111) );
  AOI22X1 U333 ( .A0(str_reg_w[51]), .A1(n159), .B0(n712), .B1(n77), .Y(n555)
         );
  OAI2BB1X1 U334 ( .A0N(n187), .A1N(n712), .B0(n563), .Y(n1119) );
  AOI22X1 U335 ( .A0(str_reg_w[43]), .A1(n158), .B0(n704), .B1(n80), .Y(n563)
         );
  OAI2BB1X1 U336 ( .A0N(n186), .A1N(n704), .B0(n571), .Y(n1127) );
  AOI22X1 U337 ( .A0(str_reg_w[35]), .A1(n158), .B0(n696), .B1(n108), .Y(n571)
         );
  OAI2BB1X1 U338 ( .A0N(n186), .A1N(n696), .B0(n579), .Y(n1135) );
  AOI22X1 U339 ( .A0(str_reg_w[27]), .A1(n135), .B0(n688), .B1(n80), .Y(n579)
         );
  OAI2BB1X1 U340 ( .A0N(n186), .A1N(n688), .B0(n587), .Y(n1143) );
  AOI22X1 U341 ( .A0(str_reg_w[19]), .A1(n131), .B0(n680), .B1(n351), .Y(n587)
         );
  OAI2BB1X1 U342 ( .A0N(n185), .A1N(n680), .B0(n595), .Y(n1151) );
  AOI22X1 U343 ( .A0(str_reg_w[11]), .A1(n126), .B0(n672), .B1(n80), .Y(n595)
         );
  OAI2BB1X1 U344 ( .A0N(n218), .A1N(n857), .B0(n418), .Y(n974) );
  AOI22X1 U345 ( .A0(str_reg_w[186]), .A1(n163), .B0(n849), .B1(n109), .Y(n418) );
  OAI2BB1X1 U346 ( .A0N(n218), .A1N(n849), .B0(n426), .Y(n982) );
  AOI22X1 U347 ( .A0(str_reg_w[178]), .A1(n163), .B0(n841), .B1(n78), .Y(n426)
         );
  OAI2BB1X1 U348 ( .A0N(n205), .A1N(n841), .B0(n434), .Y(n990) );
  AOI22X1 U349 ( .A0(str_reg_w[170]), .A1(n165), .B0(n833), .B1(n77), .Y(n434)
         );
  OAI2BB1X1 U350 ( .A0N(n205), .A1N(n833), .B0(n442), .Y(n998) );
  AOI22X1 U351 ( .A0(str_reg_w[162]), .A1(n166), .B0(n825), .B1(n113), .Y(n442) );
  OAI2BB1X1 U352 ( .A0N(n205), .A1N(n825), .B0(n450), .Y(n1006) );
  AOI22X1 U353 ( .A0(str_reg_w[154]), .A1(n166), .B0(n817), .B1(n90), .Y(n450)
         );
  OAI2BB1X1 U354 ( .A0N(n193), .A1N(n817), .B0(n458), .Y(n1014) );
  AOI22X1 U355 ( .A0(str_reg_w[146]), .A1(n56), .B0(n809), .B1(n110), .Y(n458)
         );
  OAI2BB1X1 U356 ( .A0N(n193), .A1N(n809), .B0(n466), .Y(n1022) );
  AOI22X1 U357 ( .A0(str_reg_w[138]), .A1(n130), .B0(n801), .B1(n108), .Y(n466) );
  OAI2BB1X1 U358 ( .A0N(n193), .A1N(n801), .B0(n474), .Y(n1030) );
  AOI22X1 U359 ( .A0(str_reg_w[130]), .A1(n132), .B0(n793), .B1(n115), .Y(n474) );
  OAI2BB1X1 U360 ( .A0N(n192), .A1N(n793), .B0(n482), .Y(n1038) );
  AOI22X1 U361 ( .A0(str_reg_w[122]), .A1(n165), .B0(n785), .B1(n79), .Y(n482)
         );
  OAI2BB1X1 U362 ( .A0N(n192), .A1N(n785), .B0(n490), .Y(n1046) );
  AOI22X1 U363 ( .A0(str_reg_w[114]), .A1(n165), .B0(n777), .B1(n112), .Y(n490) );
  OAI2BB1X1 U364 ( .A0N(n192), .A1N(n777), .B0(n498), .Y(n1054) );
  AOI22X1 U365 ( .A0(str_reg_w[106]), .A1(n134), .B0(n769), .B1(n112), .Y(n498) );
  OAI2BB1X1 U366 ( .A0N(n190), .A1N(n761), .B0(n514), .Y(n1070) );
  AOI22X1 U367 ( .A0(str_reg_w[90]), .A1(n126), .B0(n753), .B1(n90), .Y(n514)
         );
  OAI2BB1X1 U368 ( .A0N(n189), .A1N(n753), .B0(n522), .Y(n1078) );
  AOI22X1 U369 ( .A0(str_reg_w[82]), .A1(n135), .B0(n745), .B1(n90), .Y(n522)
         );
  OAI2BB1X1 U370 ( .A0N(n189), .A1N(n745), .B0(n530), .Y(n1086) );
  AOI22X1 U371 ( .A0(str_reg_w[74]), .A1(n350), .B0(n737), .B1(n79), .Y(n530)
         );
  OAI2BB1X1 U372 ( .A0N(n189), .A1N(n737), .B0(n538), .Y(n1094) );
  AOI22X1 U373 ( .A0(str_reg_w[66]), .A1(n137), .B0(n729), .B1(n116), .Y(n538)
         );
  OAI2BB1X1 U374 ( .A0N(n187), .A1N(n729), .B0(n546), .Y(n1102) );
  AOI22X1 U375 ( .A0(str_reg_w[58]), .A1(n137), .B0(n721), .B1(n108), .Y(n546)
         );
  OAI2BB1X1 U376 ( .A0N(n187), .A1N(n721), .B0(n554), .Y(n1110) );
  AOI22X1 U377 ( .A0(str_reg_w[50]), .A1(n126), .B0(n713), .B1(n113), .Y(n554)
         );
  OAI2BB1X1 U378 ( .A0N(n187), .A1N(n713), .B0(n562), .Y(n1118) );
  AOI22X1 U379 ( .A0(str_reg_w[42]), .A1(n158), .B0(n705), .B1(n116), .Y(n562)
         );
  OAI2BB1X1 U380 ( .A0N(n186), .A1N(n705), .B0(n570), .Y(n1126) );
  AOI22X1 U381 ( .A0(str_reg_w[34]), .A1(n158), .B0(n697), .B1(n108), .Y(n570)
         );
  OAI2BB1X1 U382 ( .A0N(n186), .A1N(n697), .B0(n578), .Y(n1134) );
  AOI22X1 U383 ( .A0(str_reg_w[26]), .A1(n130), .B0(n689), .B1(n80), .Y(n578)
         );
  OAI2BB1X1 U384 ( .A0N(n186), .A1N(n689), .B0(n586), .Y(n1142) );
  AOI22X1 U385 ( .A0(str_reg_w[18]), .A1(n130), .B0(n681), .B1(n79), .Y(n586)
         );
  OAI2BB1X1 U386 ( .A0N(n185), .A1N(n681), .B0(n594), .Y(n1150) );
  AOI22X1 U387 ( .A0(str_reg_w[10]), .A1(n132), .B0(n673), .B1(n116), .Y(n594)
         );
  OAI2BB1X1 U388 ( .A0N(n218), .A1N(n858), .B0(n417), .Y(n973) );
  AOI22X1 U389 ( .A0(str_reg_w[185]), .A1(n163), .B0(n850), .B1(n109), .Y(n417) );
  OAI2BB1X1 U390 ( .A0N(n218), .A1N(n850), .B0(n425), .Y(n981) );
  AOI22X1 U391 ( .A0(str_reg_w[177]), .A1(n163), .B0(n842), .B1(n125), .Y(n425) );
  OAI2BB1X1 U392 ( .A0N(n218), .A1N(n842), .B0(n433), .Y(n989) );
  AOI22X1 U393 ( .A0(str_reg_w[169]), .A1(n165), .B0(n834), .B1(n77), .Y(n433)
         );
  OAI2BB1X1 U394 ( .A0N(n205), .A1N(n834), .B0(n441), .Y(n997) );
  AOI22X1 U395 ( .A0(str_reg_w[161]), .A1(n166), .B0(n826), .B1(n115), .Y(n441) );
  OAI2BB1X1 U396 ( .A0N(n205), .A1N(n826), .B0(n449), .Y(n1005) );
  AOI22X1 U397 ( .A0(str_reg_w[153]), .A1(n166), .B0(n818), .B1(n125), .Y(n449) );
  OAI2BB1X1 U398 ( .A0N(n193), .A1N(n818), .B0(n457), .Y(n1013) );
  AOI22X1 U399 ( .A0(str_reg_w[145]), .A1(n56), .B0(n810), .B1(n110), .Y(n457)
         );
  OAI2BB1X1 U400 ( .A0N(n193), .A1N(n810), .B0(n465), .Y(n1021) );
  AOI22X1 U401 ( .A0(str_reg_w[137]), .A1(n131), .B0(n802), .B1(n109), .Y(n465) );
  OAI2BB1X1 U402 ( .A0N(n193), .A1N(n802), .B0(n473), .Y(n1029) );
  AOI22X1 U403 ( .A0(str_reg_w[129]), .A1(n135), .B0(n794), .B1(n77), .Y(n473)
         );
  OAI2BB1X1 U404 ( .A0N(n192), .A1N(n794), .B0(n481), .Y(n1037) );
  AOI22X1 U405 ( .A0(str_reg_w[121]), .A1(n56), .B0(n786), .B1(n115), .Y(n481)
         );
  OAI2BB1X1 U406 ( .A0N(n192), .A1N(n786), .B0(n489), .Y(n1045) );
  AOI22X1 U407 ( .A0(str_reg_w[113]), .A1(n166), .B0(n778), .B1(n112), .Y(n489) );
  OAI2BB1X1 U408 ( .A0N(n192), .A1N(n778), .B0(n497), .Y(n1053) );
  AOI22X1 U409 ( .A0(str_reg_w[105]), .A1(n135), .B0(n770), .B1(n112), .Y(n497) );
  OAI2BB1X1 U410 ( .A0N(n190), .A1N(n762), .B0(n513), .Y(n1069) );
  AOI22X1 U411 ( .A0(str_reg_w[89]), .A1(n135), .B0(n754), .B1(n90), .Y(n513)
         );
  OAI2BB1X1 U412 ( .A0N(n190), .A1N(n754), .B0(n521), .Y(n1077) );
  AOI22X1 U413 ( .A0(str_reg_w[81]), .A1(n162), .B0(n746), .B1(n90), .Y(n521)
         );
  OAI2BB1X1 U414 ( .A0N(n189), .A1N(n746), .B0(n529), .Y(n1085) );
  AOI22X1 U415 ( .A0(str_reg_w[73]), .A1(n350), .B0(n738), .B1(n110), .Y(n529)
         );
  OAI2BB1X1 U416 ( .A0N(n189), .A1N(n738), .B0(n537), .Y(n1093) );
  AOI22X1 U417 ( .A0(str_reg_w[65]), .A1(n137), .B0(n730), .B1(n113), .Y(n537)
         );
  OAI2BB1X1 U418 ( .A0N(n187), .A1N(n730), .B0(n545), .Y(n1101) );
  AOI22X1 U419 ( .A0(str_reg_w[57]), .A1(n137), .B0(n722), .B1(n79), .Y(n545)
         );
  OAI2BB1X1 U420 ( .A0N(n187), .A1N(n722), .B0(n553), .Y(n1109) );
  AOI22X1 U421 ( .A0(str_reg_w[49]), .A1(n166), .B0(n714), .B1(n78), .Y(n553)
         );
  OAI2BB1X1 U422 ( .A0N(n187), .A1N(n714), .B0(n561), .Y(n1117) );
  AOI22X1 U423 ( .A0(str_reg_w[41]), .A1(n158), .B0(n706), .B1(n80), .Y(n561)
         );
  OAI2BB1X1 U424 ( .A0N(n186), .A1N(n706), .B0(n569), .Y(n1125) );
  AOI22X1 U425 ( .A0(str_reg_w[33]), .A1(n158), .B0(n698), .B1(n108), .Y(n569)
         );
  OAI2BB1X1 U426 ( .A0N(n186), .A1N(n698), .B0(n577), .Y(n1133) );
  AOI22X1 U427 ( .A0(str_reg_w[25]), .A1(n137), .B0(n690), .B1(n79), .Y(n577)
         );
  OAI2BB1X1 U428 ( .A0N(n186), .A1N(n690), .B0(n585), .Y(n1141) );
  AOI22X1 U429 ( .A0(str_reg_w[17]), .A1(n126), .B0(n682), .B1(n79), .Y(n585)
         );
  OAI2BB1X1 U430 ( .A0N(n185), .A1N(n682), .B0(n593), .Y(n1149) );
  AOI22X1 U431 ( .A0(str_reg_w[9]), .A1(n130), .B0(n674), .B1(n88), .Y(n593)
         );
  OAI2BB1X1 U432 ( .A0N(n218), .A1N(n859), .B0(n416), .Y(n972) );
  AOI22X1 U433 ( .A0(str_reg_w[184]), .A1(n163), .B0(n851), .B1(n109), .Y(n416) );
  OAI2BB1X1 U434 ( .A0N(n218), .A1N(n851), .B0(n424), .Y(n980) );
  AOI22X1 U435 ( .A0(str_reg_w[176]), .A1(n163), .B0(n843), .B1(n109), .Y(n424) );
  OAI2BB1X1 U436 ( .A0N(n218), .A1N(n843), .B0(n432), .Y(n988) );
  AOI22X1 U437 ( .A0(str_reg_w[168]), .A1(n165), .B0(n835), .B1(n79), .Y(n432)
         );
  OAI2BB1X1 U438 ( .A0N(n205), .A1N(n835), .B0(n440), .Y(n996) );
  AOI22X1 U439 ( .A0(str_reg_w[160]), .A1(n165), .B0(n827), .B1(n115), .Y(n440) );
  OAI2BB1X1 U440 ( .A0N(n205), .A1N(n827), .B0(n448), .Y(n1004) );
  AOI22X1 U441 ( .A0(str_reg_w[152]), .A1(n166), .B0(n819), .B1(n87), .Y(n448)
         );
  OAI2BB1X1 U442 ( .A0N(n193), .A1N(n819), .B0(n456), .Y(n1012) );
  AOI22X1 U443 ( .A0(str_reg_w[144]), .A1(n56), .B0(n811), .B1(n110), .Y(n456)
         );
  OAI2BB1X1 U444 ( .A0N(n193), .A1N(n811), .B0(n464), .Y(n1020) );
  AOI22X1 U445 ( .A0(str_reg_w[136]), .A1(n56), .B0(n803), .B1(n79), .Y(n464)
         );
  OAI2BB1X1 U446 ( .A0N(n193), .A1N(n803), .B0(n472), .Y(n1028) );
  AOI22X1 U447 ( .A0(str_reg_w[128]), .A1(n56), .B0(n795), .B1(n125), .Y(n472)
         );
  OAI2BB1X1 U448 ( .A0N(n192), .A1N(n795), .B0(n480), .Y(n1036) );
  AOI22X1 U449 ( .A0(str_reg_w[120]), .A1(n166), .B0(n787), .B1(n80), .Y(n480)
         );
  OAI2BB1X1 U450 ( .A0N(n192), .A1N(n787), .B0(n488), .Y(n1044) );
  AOI22X1 U451 ( .A0(str_reg_w[112]), .A1(n131), .B0(n779), .B1(n78), .Y(n488)
         );
  OAI2BB1X1 U452 ( .A0N(n192), .A1N(n779), .B0(n496), .Y(n1052) );
  AOI22X1 U453 ( .A0(str_reg_w[104]), .A1(n158), .B0(n771), .B1(n112), .Y(n496) );
  OAI2BB1X1 U454 ( .A0N(n190), .A1N(n763), .B0(n512), .Y(n1068) );
  AOI22X1 U455 ( .A0(str_reg_w[88]), .A1(n135), .B0(n755), .B1(n351), .Y(n512)
         );
  OAI2BB1X1 U456 ( .A0N(n190), .A1N(n755), .B0(n520), .Y(n1076) );
  AOI22X1 U457 ( .A0(str_reg_w[80]), .A1(n163), .B0(n747), .B1(n90), .Y(n520)
         );
  OAI2BB1X1 U458 ( .A0N(n189), .A1N(n747), .B0(n528), .Y(n1084) );
  AOI22X1 U459 ( .A0(str_reg_w[72]), .A1(n126), .B0(n739), .B1(n113), .Y(n528)
         );
  OAI2BB1X1 U460 ( .A0N(n189), .A1N(n739), .B0(n536), .Y(n1092) );
  AOI22X1 U461 ( .A0(str_reg_w[64]), .A1(n137), .B0(n731), .B1(n115), .Y(n536)
         );
  OAI2BB1X1 U462 ( .A0N(n187), .A1N(n731), .B0(n544), .Y(n1100) );
  AOI22X1 U463 ( .A0(str_reg_w[56]), .A1(n137), .B0(n723), .B1(n87), .Y(n544)
         );
  OAI2BB1X1 U464 ( .A0N(n187), .A1N(n723), .B0(n552), .Y(n1108) );
  AOI22X1 U465 ( .A0(str_reg_w[48]), .A1(n166), .B0(n715), .B1(n80), .Y(n552)
         );
  OAI2BB1X1 U466 ( .A0N(n187), .A1N(n715), .B0(n560), .Y(n1116) );
  AOI22X1 U467 ( .A0(str_reg_w[40]), .A1(n163), .B0(n707), .B1(n125), .Y(n560)
         );
  OAI2BB1X1 U468 ( .A0N(n186), .A1N(n707), .B0(n568), .Y(n1124) );
  AOI22X1 U469 ( .A0(str_reg_w[32]), .A1(n158), .B0(n699), .B1(n108), .Y(n568)
         );
  OAI2BB1X1 U470 ( .A0N(n186), .A1N(n699), .B0(n576), .Y(n1132) );
  AOI22X1 U471 ( .A0(str_reg_w[24]), .A1(n130), .B0(n691), .B1(n108), .Y(n576)
         );
  OAI2BB1X1 U472 ( .A0N(n186), .A1N(n691), .B0(n584), .Y(n1140) );
  AOI22X1 U473 ( .A0(str_reg_w[16]), .A1(n135), .B0(n683), .B1(n79), .Y(n584)
         );
  OAI2BB1X1 U474 ( .A0N(n185), .A1N(n683), .B0(n592), .Y(n1148) );
  AOI22X1 U475 ( .A0(str_reg_w[8]), .A1(n134), .B0(n675), .B1(n80), .Y(n592)
         );
  OAI21XL U476 ( .A0(n220), .A1(n41), .B0(n363), .Y(n919) );
  AOI22X1 U477 ( .A0(str_reg_w[252]), .A1(n159), .B0(n109), .B1(n867), .Y(n363) );
  OAI21XL U478 ( .A0(n243), .A1(n46), .B0(n377), .Y(n933) );
  AOI22X1 U479 ( .A0(str_reg_w[236]), .A1(n126), .B0(n88), .B1(
        \str_buf[28][4] ), .Y(n377) );
  OAI21XL U480 ( .A0(n236), .A1(n50), .B0(n384), .Y(n940) );
  AOI22X1 U481 ( .A0(str_reg_w[228]), .A1(n126), .B0(n88), .B1(
        \str_buf[27][4] ), .Y(n384) );
  OAI21XL U482 ( .A0(n220), .A1(n22), .B0(n355), .Y(n911) );
  AOI22X1 U483 ( .A0(str_reg_w[259]), .A1(n159), .B0(n110), .B1(
        \str_buf[31][3] ), .Y(n355) );
  OAI21XL U484 ( .A0(n222), .A1(n32), .B0(n369), .Y(n925) );
  AOI22X1 U485 ( .A0(str_reg_w[243]), .A1(n160), .B0(n115), .B1(
        \str_buf[29][3] ), .Y(n369) );
  OAI21XL U486 ( .A0(n236), .A1(n6), .B0(n365), .Y(n921) );
  AOI22X1 U487 ( .A0(str_reg_w[254]), .A1(n160), .B0(n90), .B1(n869), .Y(n365)
         );
  OAI21XL U488 ( .A0(n220), .A1(n9), .B0(n379), .Y(n935) );
  AOI22X1 U489 ( .A0(str_reg_w[238]), .A1(n126), .B0(n88), .B1(
        \str_buf[28][6] ), .Y(n379) );
  OAI21XL U490 ( .A0(n243), .A1(n11), .B0(n386), .Y(n942) );
  AOI22X1 U491 ( .A0(str_reg_w[230]), .A1(n126), .B0(n88), .B1(
        \str_buf[27][6] ), .Y(n386) );
  OAI21XL U492 ( .A0(n220), .A1(n7), .B0(n354), .Y(n910) );
  AOI22X1 U493 ( .A0(str_reg_w[258]), .A1(n159), .B0(n108), .B1(
        \str_buf[31][2] ), .Y(n354) );
  OAI21XL U494 ( .A0(n236), .A1(n12), .B0(n368), .Y(n924) );
  AOI22X1 U495 ( .A0(str_reg_w[242]), .A1(n160), .B0(n125), .B1(
        \str_buf[29][2] ), .Y(n368) );
  OAI21XL U496 ( .A0(n236), .A1(n38), .B0(n360), .Y(n916) );
  AOI22X1 U497 ( .A0(str_reg_w[249]), .A1(n159), .B0(n112), .B1(n865), .Y(n360) );
  OAI21XL U498 ( .A0(n243), .A1(n43), .B0(n374), .Y(n930) );
  AOI22X1 U499 ( .A0(str_reg_w[233]), .A1(n160), .B0(n109), .B1(
        \str_buf[28][1] ), .Y(n374) );
  OAI21XL U500 ( .A0(n236), .A1(n45), .B0(n381), .Y(n937) );
  AOI22X1 U501 ( .A0(str_reg_w[225]), .A1(n126), .B0(n88), .B1(
        \str_buf[27][1] ), .Y(n381) );
  OAI21XL U502 ( .A0(n220), .A1(n18), .B0(n359), .Y(n915) );
  AOI22X1 U503 ( .A0(str_reg_w[248]), .A1(n159), .B0(n90), .B1(n866), .Y(n359)
         );
  OAI21XL U504 ( .A0(n243), .A1(n23), .B0(n373), .Y(n929) );
  AOI22X1 U505 ( .A0(str_reg_w[232]), .A1(n160), .B0(n88), .B1(
        \str_buf[28][0] ), .Y(n373) );
  OAI21XL U506 ( .A0(n220), .A1(n25), .B0(n380), .Y(n936) );
  AOI22X1 U507 ( .A0(str_reg_w[224]), .A1(n126), .B0(n88), .B1(
        \str_buf[27][0] ), .Y(n380) );
  OAI21XL U508 ( .A0(n220), .A1(n24), .B0(n387), .Y(n943) );
  AOI22X1 U509 ( .A0(str_reg_w[216]), .A1(n126), .B0(n88), .B1(n872), .Y(n387)
         );
  OAI21XL U510 ( .A0(n220), .A1(n40), .B0(n353), .Y(n909) );
  AOI22X1 U511 ( .A0(str_reg_w[257]), .A1(n163), .B0(n79), .B1(
        \str_buf[31][1] ), .Y(n353) );
  OAI21XL U512 ( .A0(n236), .A1(n52), .B0(n367), .Y(n923) );
  AOI22X1 U513 ( .A0(str_reg_w[241]), .A1(n160), .B0(n115), .B1(
        \str_buf[29][1] ), .Y(n367) );
  OAI21XL U514 ( .A0(n220), .A1(n19), .B0(n358), .Y(n914) );
  AOI22X1 U515 ( .A0(str_reg_w[262]), .A1(n159), .B0(n110), .B1(
        \str_buf[31][6] ), .Y(n358) );
  OAI21XL U516 ( .A0(n243), .A1(n30), .B0(n372), .Y(n928) );
  AOI22X1 U517 ( .A0(str_reg_w[246]), .A1(n160), .B0(n115), .B1(
        \str_buf[29][6] ), .Y(n372) );
  OAI21XL U518 ( .A0(n243), .A1(n49), .B0(n391), .Y(n947) );
  AOI22X1 U519 ( .A0(str_reg_w[220]), .A1(n162), .B0(n87), .B1(n873), .Y(n391)
         );
  OAI21XL U520 ( .A0(n243), .A1(n26), .B0(n619), .Y(n1175) );
  AOI22X1 U521 ( .A0(str_reg_w[239]), .A1(n134), .B0(n112), .B1(
        \str_buf[28][7] ), .Y(n619) );
  OAI21XL U522 ( .A0(n236), .A1(n29), .B0(n620), .Y(n1176) );
  AOI22X1 U523 ( .A0(str_reg_w[231]), .A1(n131), .B0(n125), .B1(
        \str_buf[27][7] ), .Y(n620) );
  OAI21XL U524 ( .A0(n236), .A1(n28), .B0(n621), .Y(n1177) );
  AOI22X1 U525 ( .A0(str_reg_w[223]), .A1(n159), .B0(n109), .B1(n874), .Y(n621) );
  OAI21XL U526 ( .A0(n236), .A1(n33), .B0(n397), .Y(n953) );
  AOI22X1 U527 ( .A0(str_reg_w[211]), .A1(n162), .B0(n87), .B1(
        \str_buf[25][3] ), .Y(n397) );
  OAI21XL U528 ( .A0(n223), .A1(n51), .B0(n622), .Y(n1178) );
  AOI22X1 U529 ( .A0(str_reg_w[215]), .A1(n159), .B0(n108), .B1(
        \str_buf[25][7] ), .Y(n622) );
  OAI21XL U530 ( .A0(n243), .A1(n10), .B0(n393), .Y(n949) );
  AOI22X1 U531 ( .A0(str_reg_w[222]), .A1(n162), .B0(n87), .B1(n875), .Y(n393)
         );
  OAI21XL U532 ( .A0(n243), .A1(n13), .B0(n396), .Y(n952) );
  AOI22X1 U533 ( .A0(str_reg_w[210]), .A1(n162), .B0(n87), .B1(
        \str_buf[25][2] ), .Y(n396) );
  OAI21XL U534 ( .A0(n220), .A1(n44), .B0(n388), .Y(n944) );
  AOI22X1 U535 ( .A0(str_reg_w[217]), .A1(n130), .B0(n87), .B1(n871), .Y(n388)
         );
  OAI21XL U536 ( .A0(n243), .A1(n8), .B0(n404), .Y(n960) );
  AOI22X1 U537 ( .A0(str_reg_w[204]), .A1(n130), .B0(n113), .B1(
        \str_buf[24][4] ), .Y(n404) );
  OAI21XL U538 ( .A0(n220), .A1(n53), .B0(n395), .Y(n951) );
  AOI22X1 U539 ( .A0(str_reg_w[209]), .A1(n162), .B0(n87), .B1(
        \str_buf[25][1] ), .Y(n395) );
  OAI21XL U540 ( .A0(n243), .A1(n27), .B0(n401), .Y(n957) );
  AOI22X1 U541 ( .A0(str_reg_w[207]), .A1(n162), .B0(n87), .B1(
        \str_buf[24][7] ), .Y(n401) );
  OAI21XL U542 ( .A0(n236), .A1(n48), .B0(n402), .Y(n958) );
  AOI22X1 U543 ( .A0(str_reg_w[206]), .A1(n162), .B0(n116), .B1(
        \str_buf[24][6] ), .Y(n402) );
  OAI21XL U544 ( .A0(n243), .A1(n20), .B0(n407), .Y(n963) );
  AOI22X1 U545 ( .A0(str_reg_w[201]), .A1(n135), .B0(n78), .B1(
        \str_buf[24][1] ), .Y(n407) );
  OAI21XL U546 ( .A0(n243), .A1(n31), .B0(n400), .Y(n956) );
  AOI22X1 U547 ( .A0(str_reg_w[214]), .A1(n162), .B0(n90), .B1(
        \str_buf[25][6] ), .Y(n400) );
  OAI2BB1X1 U548 ( .A0N(n190), .A1N(n772), .B0(n503), .Y(n1059) );
  AOI22X1 U549 ( .A0(str_reg_w[111]), .A1(n132), .B0(n764), .B1(n80), .Y(n503)
         );
  OAI2BB1X1 U550 ( .A0N(n190), .A1N(n764), .B0(n511), .Y(n1067) );
  AOI22X1 U551 ( .A0(str_reg_w[103]), .A1(n158), .B0(n756), .B1(n125), .Y(n511) );
  OAI2BB1X1 U552 ( .A0N(n190), .A1N(n773), .B0(n502), .Y(n1058) );
  AOI22X1 U553 ( .A0(str_reg_w[110]), .A1(n126), .B0(n765), .B1(n112), .Y(n502) );
  OAI2BB1X1 U554 ( .A0N(n190), .A1N(n765), .B0(n510), .Y(n1066) );
  AOI22X1 U555 ( .A0(str_reg_w[102]), .A1(n131), .B0(n757), .B1(n113), .Y(n510) );
  OAI2BB1X1 U556 ( .A0N(n190), .A1N(n766), .B0(n509), .Y(n1065) );
  AOI22X1 U557 ( .A0(str_reg_w[101]), .A1(n134), .B0(n758), .B1(n125), .Y(n509) );
  OAI2BB1X1 U558 ( .A0N(n190), .A1N(n767), .B0(n508), .Y(n1064) );
  AOI22X1 U559 ( .A0(str_reg_w[100]), .A1(n126), .B0(n759), .B1(n87), .Y(n508)
         );
  OAI2BB1X1 U560 ( .A0N(n190), .A1N(n768), .B0(n507), .Y(n1063) );
  AOI22X1 U561 ( .A0(str_reg_w[99]), .A1(n162), .B0(n760), .B1(n116), .Y(n507)
         );
  OAI2BB1X1 U562 ( .A0N(n190), .A1N(n769), .B0(n506), .Y(n1062) );
  AOI22X1 U563 ( .A0(str_reg_w[98]), .A1(n135), .B0(n761), .B1(n78), .Y(n506)
         );
  OAI2BB1X1 U564 ( .A0N(n190), .A1N(n770), .B0(n505), .Y(n1061) );
  AOI22X1 U565 ( .A0(str_reg_w[97]), .A1(n131), .B0(n762), .B1(n113), .Y(n505)
         );
  OAI2BB1X1 U566 ( .A0N(n190), .A1N(n771), .B0(n504), .Y(n1060) );
  AOI22X1 U567 ( .A0(str_reg_w[96]), .A1(n137), .B0(n763), .B1(n125), .Y(n504)
         );
  OAI2BB1X1 U568 ( .A0N(n219), .A1N(\str_buf[29][2] ), .B0(n375), .Y(n931) );
  AOI22X1 U569 ( .A0(str_reg_w[234]), .A1(n160), .B0(n113), .B1(
        \str_buf[28][2] ), .Y(n375) );
  OAI2BB1X1 U570 ( .A0N(n219), .A1N(\str_buf[28][2] ), .B0(n382), .Y(n938) );
  AOI22X1 U571 ( .A0(str_reg_w[226]), .A1(n131), .B0(n88), .B1(
        \str_buf[27][2] ), .Y(n382) );
  OAI2BB1X1 U572 ( .A0N(n219), .A1N(\str_buf[29][3] ), .B0(n376), .Y(n932) );
  AOI22X1 U573 ( .A0(str_reg_w[235]), .A1(n160), .B0(n87), .B1(
        \str_buf[28][3] ), .Y(n376) );
  OAI2BB1X1 U574 ( .A0N(n219), .A1N(\str_buf[28][3] ), .B0(n383), .Y(n939) );
  AOI22X1 U575 ( .A0(str_reg_w[227]), .A1(n134), .B0(n88), .B1(
        \str_buf[27][3] ), .Y(n383) );
  OAI2BB1X1 U576 ( .A0N(n219), .A1N(\str_buf[32][5] ), .B0(n357), .Y(n913) );
  AOI22X1 U577 ( .A0(str_reg_w[261]), .A1(n159), .B0(n108), .B1(
        \str_buf[31][5] ), .Y(n357) );
  OAI2BB1X1 U578 ( .A0N(n219), .A1N(\str_buf[31][5] ), .B0(n364), .Y(n920) );
  AOI22X1 U579 ( .A0(str_reg_w[253]), .A1(n160), .B0(n112), .B1(
        \str_buf[30][5] ), .Y(n364) );
  OAI2BB1X1 U580 ( .A0N(n219), .A1N(\str_buf[30][5] ), .B0(n371), .Y(n927) );
  AOI22X1 U581 ( .A0(str_reg_w[245]), .A1(n160), .B0(n116), .B1(
        \str_buf[29][5] ), .Y(n371) );
  OAI2BB1X1 U582 ( .A0N(n219), .A1N(\str_buf[29][5] ), .B0(n378), .Y(n934) );
  AOI22X1 U583 ( .A0(str_reg_w[237]), .A1(n132), .B0(n88), .B1(
        \str_buf[28][5] ), .Y(n378) );
  OAI2BB1X1 U584 ( .A0N(n219), .A1N(\str_buf[28][5] ), .B0(n385), .Y(n941) );
  AOI22X1 U585 ( .A0(str_reg_w[229]), .A1(n56), .B0(n88), .B1(\str_buf[27][5] ), .Y(n385) );
  OAI2BB1X1 U586 ( .A0N(n219), .A1N(n862), .B0(n356), .Y(n912) );
  AOI22X1 U587 ( .A0(str_reg_w[260]), .A1(n159), .B0(n113), .B1(
        \str_buf[31][4] ), .Y(n356) );
  OAI2BB1X1 U588 ( .A0N(n219), .A1N(n867), .B0(n370), .Y(n926) );
  AOI22X1 U589 ( .A0(str_reg_w[244]), .A1(n160), .B0(n77), .B1(
        \str_buf[29][4] ), .Y(n370) );
  OAI2BB1X1 U590 ( .A0N(n185), .A1N(n861), .B0(n349), .Y(n908) );
  AOI22X1 U591 ( .A0(str_reg_w[256]), .A1(n132), .B0(n88), .B1(
        \str_buf[31][0] ), .Y(n349) );
  OAI2BB1X1 U592 ( .A0N(n219), .A1N(n866), .B0(n366), .Y(n922) );
  AOI22X1 U593 ( .A0(str_reg_w[240]), .A1(n160), .B0(n78), .B1(
        \str_buf[29][0] ), .Y(n366) );
  OAI2BB1X1 U594 ( .A0N(n219), .A1N(\str_buf[31][2] ), .B0(n361), .Y(n917) );
  AOI22X1 U595 ( .A0(str_reg_w[250]), .A1(n159), .B0(n78), .B1(
        \str_buf[30][2] ), .Y(n361) );
  OAI2BB1X1 U596 ( .A0N(n219), .A1N(\str_buf[31][3] ), .B0(n362), .Y(n918) );
  AOI22X1 U597 ( .A0(str_reg_w[251]), .A1(n159), .B0(n115), .B1(
        \str_buf[30][3] ), .Y(n362) );
  OAI21XL U598 ( .A0(n236), .A1(n1), .B0(n601), .Y(n1164) );
  AOI22X1 U599 ( .A0(str_reg_w[264]), .A1(n132), .B0(n77), .B1(n861), .Y(n601)
         );
  OAI21XL U600 ( .A0(n243), .A1(n21), .B0(n617), .Y(n1173) );
  AOI22X1 U601 ( .A0(str_reg_w[255]), .A1(n130), .B0(n125), .B1(n868), .Y(n617) );
  OAI21XL U602 ( .A0(n236), .A1(n39), .B0(n616), .Y(n1172) );
  AOI22X1 U603 ( .A0(str_reg_w[263]), .A1(n132), .B0(n79), .B1(
        \str_buf[31][7] ), .Y(n616) );
  OAI21XL U604 ( .A0(n236), .A1(n47), .B0(n618), .Y(n1174) );
  AOI22X1 U605 ( .A0(str_reg_w[247]), .A1(n134), .B0(n78), .B1(
        \str_buf[29][7] ), .Y(n618) );
  OAI21XL U606 ( .A0(n220), .A1(n3), .B0(n615), .Y(n1171) );
  AOI22X1 U607 ( .A0(str_reg_w[271]), .A1(n160), .B0(n116), .B1(n863), .Y(n615) );
  OAI21XL U608 ( .A0(n243), .A1(n4), .B0(n607), .Y(n1167) );
  AOI22X1 U609 ( .A0(str_reg_w[267]), .A1(n132), .B0(n79), .B1(
        \str_buf[32][3] ), .Y(n607) );
  OAI21XL U610 ( .A0(n243), .A1(n2), .B0(n613), .Y(n1170) );
  AOI22X1 U611 ( .A0(str_reg_w[270]), .A1(n130), .B0(n125), .B1(n864), .Y(n613) );
  OAI21XL U612 ( .A0(n243), .A1(n15), .B0(n605), .Y(n1166) );
  AOI22X1 U613 ( .A0(str_reg_w[266]), .A1(n162), .B0(n125), .B1(
        \str_buf[32][2] ), .Y(n605) );
  OAI21XL U614 ( .A0(n243), .A1(n14), .B0(n611), .Y(n1169) );
  AOI22X1 U615 ( .A0(str_reg_w[269]), .A1(n130), .B0(n125), .B1(
        \str_buf[32][5] ), .Y(n611) );
  OAI21XL U616 ( .A0(n220), .A1(n34), .B0(n603), .Y(n1165) );
  AOI22X1 U617 ( .A0(str_reg_w[265]), .A1(n159), .B0(n78), .B1(n860), .Y(n603)
         );
  OAI21XL U618 ( .A0(n236), .A1(n35), .B0(n609), .Y(n1168) );
  AOI22X1 U619 ( .A0(str_reg_w[268]), .A1(n135), .B0(n80), .B1(n862), .Y(n609)
         );
  OAI21XL U620 ( .A0(n223), .A1(n42), .B0(n623), .Y(n1179) );
  AOI22X1 U621 ( .A0(str_reg_w[200]), .A1(n159), .B0(n113), .B1(
        \str_buf[24][0] ), .Y(n623) );
  OAI2BB1X1 U622 ( .A0N(n218), .A1N(\str_buf[25][2] ), .B0(n406), .Y(n962) );
  AOI22X1 U623 ( .A0(str_reg_w[202]), .A1(n158), .B0(n77), .B1(
        \str_buf[24][2] ), .Y(n406) );
  OAI2BB1X1 U624 ( .A0N(n219), .A1N(\str_buf[25][3] ), .B0(n405), .Y(n961) );
  AOI22X1 U625 ( .A0(str_reg_w[203]), .A1(n131), .B0(n116), .B1(
        \str_buf[24][3] ), .Y(n405) );
  OAI2BB1X1 U626 ( .A0N(n219), .A1N(\str_buf[26][5] ), .B0(n399), .Y(n955) );
  AOI22X1 U627 ( .A0(str_reg_w[213]), .A1(n162), .B0(n87), .B1(
        \str_buf[25][5] ), .Y(n399) );
  OAI2BB1X1 U628 ( .A0N(n219), .A1N(\str_buf[25][5] ), .B0(n403), .Y(n959) );
  AOI22X1 U629 ( .A0(str_reg_w[205]), .A1(n134), .B0(n109), .B1(
        \str_buf[24][5] ), .Y(n403) );
  OAI2BB1X1 U630 ( .A0N(n219), .A1N(\str_buf[27][5] ), .B0(n392), .Y(n948) );
  AOI22X1 U631 ( .A0(str_reg_w[221]), .A1(n162), .B0(n87), .B1(
        \str_buf[26][5] ), .Y(n392) );
  OAI2BB1X1 U632 ( .A0N(n219), .A1N(n873), .B0(n398), .Y(n954) );
  AOI22X1 U633 ( .A0(str_reg_w[212]), .A1(n162), .B0(n87), .B1(
        \str_buf[25][4] ), .Y(n398) );
  OAI2BB1X1 U634 ( .A0N(n219), .A1N(n872), .B0(n394), .Y(n950) );
  AOI22X1 U635 ( .A0(str_reg_w[208]), .A1(n162), .B0(n87), .B1(
        \str_buf[25][0] ), .Y(n394) );
  OAI2BB1X1 U636 ( .A0N(n219), .A1N(\str_buf[27][2] ), .B0(n389), .Y(n945) );
  AOI22X1 U637 ( .A0(str_reg_w[218]), .A1(n56), .B0(n87), .B1(\str_buf[26][2] ), .Y(n389) );
  OAI2BB1X1 U638 ( .A0N(n219), .A1N(\str_buf[27][3] ), .B0(n390), .Y(n946) );
  AOI22X1 U639 ( .A0(str_reg_w[219]), .A1(n162), .B0(n87), .B1(
        \str_buf[26][3] ), .Y(n390) );
  NAND4X1 U640 ( .A(\str_buf[33][5] ), .B(n1), .C(n659), .D(n660), .Y(n625) );
  NOR2X1 U641 ( .A(\str_buf[33][2] ), .B(\str_buf[33][1] ), .Y(n659) );
  NOR4X1 U642 ( .A(\str_buf[33][7] ), .B(\str_buf[33][6] ), .C(
        \str_buf[33][4] ), .D(\str_buf[33][3] ), .Y(n660) );
  AO22X1 U643 ( .A0(n185), .A1(n670), .B0(str_reg_w[5]), .B1(n56), .Y(n1161)
         );
  AO22X1 U644 ( .A0(n185), .A1(n668), .B0(str_reg_w[7]), .B1(n350), .Y(n1163)
         );
  AO22X1 U645 ( .A0(n185), .A1(n669), .B0(str_reg_w[6]), .B1(n130), .Y(n1162)
         );
  AO22X1 U646 ( .A0(n185), .A1(n671), .B0(str_reg_w[4]), .B1(n132), .Y(n1160)
         );
  AO22X1 U647 ( .A0(n185), .A1(n672), .B0(str_reg_w[3]), .B1(n350), .Y(n1159)
         );
  AO22X1 U648 ( .A0(n185), .A1(n673), .B0(str_reg_w[2]), .B1(n137), .Y(n1158)
         );
  AO22X1 U649 ( .A0(n185), .A1(n674), .B0(str_reg_w[1]), .B1(n158), .Y(n1157)
         );
  AO22X1 U650 ( .A0(n185), .A1(n675), .B0(str_reg_w[0]), .B1(n158), .Y(n1156)
         );
  OAI211X1 U651 ( .A0(n319), .A1(n84), .B0(n86), .C0(n320), .Y(n907) );
  AO21X1 U652 ( .A0(n250), .A1(n249), .B0(n889), .Y(n320) );
  AOI211X1 U653 ( .A0(n208), .A1(n610), .B0(n322), .C0(n276), .Y(n319) );
  OAI32X1 U654 ( .A0(n323), .A1(pat_reg_w[8]), .A2(pat_reg_w[15]), .B0(n324), 
        .B1(n325), .Y(n322) );
  NAND4X1 U655 ( .A(\str_buf[25][5] ), .B(n342), .C(n42), .D(n20), .Y(n337) );
  OAI33X1 U656 ( .A0(n336), .A1(pat_reg_w[9]), .A2(pat_reg_w[11]), .B0(n345), 
        .B1(n282), .B2(n281), .Y(n342) );
  NAND3BX1 U657 ( .AN(pat_reg_w[13]), .B(pat_reg_w[9]), .C(pat_reg_w[11]), .Y(
        n345) );
  OAI21XL U658 ( .A0(n334), .A1(n335), .B0(pat_reg_w[10]), .Y(n323) );
  NOR4BBX1 U659 ( .AN(pat_reg_w[11]), .BN(pat_reg_w[9]), .C(n55), .D(n336), 
        .Y(n335) );
  NOR4X1 U660 ( .A(n337), .B(n338), .C(\str_buf[25][3] ), .D(\str_buf[25][2] ), 
        .Y(n334) );
  NAND3X1 U661 ( .A(n48), .B(n27), .C(n8), .Y(n338) );
  OAI221XL U662 ( .A0(n83), .A1(n84), .B0(n888), .B1(n85), .C0(n86), .Y(n899)
         );
  AOI211X1 U663 ( .A0(n608), .A1(n610), .B0(n89), .C0(n276), .Y(n83) );
  OAI32X1 U664 ( .A0(n91), .A1(pat_reg_w[7]), .A2(pat_reg_w[0]), .B0(n92), 
        .B1(n93), .Y(n89) );
  NAND4X1 U665 ( .A(n98), .B(n99), .C(n100), .D(n101), .Y(n92) );
  NAND4X1 U666 ( .A(\str_buf[24][5] ), .B(n111), .C(n36), .D(n16), .Y(n106) );
  OAI33X1 U667 ( .A0(n105), .A1(pat_reg_w[3]), .A2(pat_reg_w[1]), .B0(n114), 
        .B1(n279), .B2(n278), .Y(n111) );
  NAND3BX1 U668 ( .AN(pat_reg_w[5]), .B(pat_reg_w[1]), .C(pat_reg_w[3]), .Y(
        n114) );
  OAI21XL U669 ( .A0(n102), .A1(n103), .B0(pat_reg_w[2]), .Y(n91) );
  NOR4BBX1 U670 ( .AN(pat_reg_w[3]), .BN(pat_reg_w[1]), .C(n55), .D(n105), .Y(
        n103) );
  NOR4X1 U671 ( .A(n106), .B(n107), .C(\str_buf[24][3] ), .D(\str_buf[24][2] ), 
        .Y(n102) );
  NAND3X1 U672 ( .A(n37), .B(n17), .C(n5), .Y(n107) );
  NAND4X1 U673 ( .A(\str_buf[26][5] ), .B(n133), .C(n31), .D(n51), .Y(n128) );
  OAI33X1 U674 ( .A0(n127), .A1(pat_reg_w[19]), .A2(pat_reg_w[17]), .B0(n136), 
        .B1(n299), .B2(n303), .Y(n133) );
  NAND3BX1 U675 ( .AN(pat_reg_w[21]), .B(pat_reg_w[22]), .C(pat_reg_w[20]), 
        .Y(n136) );
  OAI221XL U676 ( .A0(n117), .A1(n118), .B0(n890), .B1(n85), .C0(n86), .Y(n900) );
  AOI211X1 U677 ( .A0(n119), .A1(n120), .B0(n276), .C0(n121), .Y(n117) );
  NOR4X1 U678 ( .A(n138), .B(n139), .C(n140), .D(n141), .Y(n120) );
  NOR4X1 U679 ( .A(n142), .B(n143), .C(n144), .D(n145), .Y(n119) );
  NOR4BX1 U680 ( .AN(pat_reg_w[18]), .B(pat_reg_w[23]), .C(pat_reg_w[16]), .D(
        n122), .Y(n121) );
  NOR2X1 U681 ( .A(n123), .B(n124), .Y(n122) );
  NOR4X1 U682 ( .A(n55), .B(n299), .C(n303), .D(n127), .Y(n124) );
  NOR4X1 U683 ( .A(n128), .B(n129), .C(n872), .D(n873), .Y(n123) );
  NAND3BX1 U684 ( .AN(pat_reg_w[20]), .B(pat_reg_w[21]), .C(n298), .Y(n127) );
  CLKINVX1 U685 ( .A(pat_reg_w[22]), .Y(n298) );
  NAND4X1 U686 ( .A(\str_buf[30][5] ), .B(n251), .C(n30), .D(n47), .Y(n246) );
  OAI33X1 U687 ( .A0(n245), .A1(pat_reg_w[51]), .A2(pat_reg_w[49]), .B0(n254), 
        .B1(n340), .B2(n341), .Y(n251) );
  NAND3BX1 U688 ( .AN(pat_reg_w[53]), .B(pat_reg_w[54]), .C(pat_reg_w[52]), 
        .Y(n254) );
  OAI221XL U689 ( .A0(n235), .A1(n118), .B0(n85), .B1(n54), .C0(n86), .Y(n904)
         );
  AOI211X1 U690 ( .A0(n237), .A1(n238), .B0(n239), .C0(n206), .Y(n235) );
  NOR4X1 U691 ( .A(n256), .B(n257), .C(n258), .D(n259), .Y(n238) );
  NOR4BX1 U692 ( .AN(pat_reg_w[50]), .B(pat_reg_w[55]), .C(pat_reg_w[48]), .D(
        n240), .Y(n239) );
  NOR2X1 U693 ( .A(n241), .B(n242), .Y(n240) );
  NOR4X1 U694 ( .A(n55), .B(n340), .C(n341), .D(n245), .Y(n242) );
  NOR4X1 U695 ( .A(n246), .B(n247), .C(n866), .D(n867), .Y(n241) );
  NAND3BX1 U696 ( .AN(pat_reg_w[52]), .B(pat_reg_w[53]), .C(n339), .Y(n245) );
  CLKINVX1 U697 ( .A(pat_reg_w[54]), .Y(n339) );
  OAI221XL U698 ( .A0(n291), .A1(n118), .B0(n895), .B1(n85), .C0(n86), .Y(n906) );
  AOI221XL U699 ( .A0(n206), .A1(n608), .B0(n292), .B1(n293), .C0(n294), .Y(
        n291) );
  NOR4X1 U700 ( .A(n311), .B(n312), .C(n313), .D(n314), .Y(n293) );
  NOR4X1 U701 ( .A(n315), .B(n316), .C(n317), .D(n318), .Y(n292) );
  NOR4BX1 U702 ( .AN(pat_reg_w[66]), .B(pat_reg_w[71]), .C(pat_reg_w[64]), .D(
        n295), .Y(n294) );
  NOR2X1 U703 ( .A(n296), .B(n297), .Y(n295) );
  NOR4X1 U704 ( .A(n55), .B(n347), .C(n352), .D(n300), .Y(n297) );
  NOR4X1 U705 ( .A(n301), .B(n302), .C(n861), .D(n862), .Y(n296) );
  NAND3BX1 U706 ( .AN(pat_reg_w[68]), .B(pat_reg_w[69]), .C(n346), .Y(n300) );
  NAND4X1 U707 ( .A(\str_buf[32][5] ), .B(n306), .C(n19), .D(n39), .Y(n301) );
  OAI33X1 U708 ( .A0(n300), .A1(pat_reg_w[67]), .A2(pat_reg_w[65]), .B0(n309), 
        .B1(n347), .B2(n352), .Y(n306) );
  NAND3BX1 U709 ( .AN(pat_reg_w[69]), .B(pat_reg_w[70]), .C(pat_reg_w[68]), 
        .Y(n309) );
  CLKINVX1 U710 ( .A(pat_reg_w[70]), .Y(n346) );
  OAI221XL U711 ( .A0(n146), .A1(n84), .B0(n891), .B1(n85), .C0(n147), .Y(n901) );
  AOI221XL U712 ( .A0(n148), .A1(n276), .B0(n149), .B1(n150), .C0(n151), .Y(
        n146) );
  NOR4X1 U713 ( .A(n167), .B(n168), .C(n169), .D(n170), .Y(n150) );
  NOR4X1 U714 ( .A(n171), .B(n172), .C(n173), .D(n174), .Y(n149) );
  OAI221XL U715 ( .A0(n175), .A1(n84), .B0(n892), .B1(n85), .C0(n147), .Y(n902) );
  AOI221XL U716 ( .A0(n608), .A1(n276), .B0(n176), .B1(n177), .C0(n178), .Y(
        n175) );
  NOR4X1 U717 ( .A(n194), .B(n195), .C(n196), .D(n197), .Y(n177) );
  NOR4X1 U718 ( .A(n198), .B(n199), .C(n200), .D(n201), .Y(n176) );
  OAI221XL U719 ( .A0(n202), .A1(n84), .B0(n893), .B1(n85), .C0(n147), .Y(n903) );
  AOI221XL U720 ( .A0(n208), .A1(n276), .B0(n209), .B1(n210), .C0(n211), .Y(
        n202) );
  NOR4X1 U721 ( .A(n227), .B(n228), .C(n229), .D(n230), .Y(n210) );
  NOR4X1 U722 ( .A(n231), .B(n232), .C(n233), .D(n234), .Y(n209) );
  OAI221XL U723 ( .A0(n264), .A1(n84), .B0(n894), .B1(n85), .C0(n86), .Y(n905)
         );
  AOI221XL U724 ( .A0(n206), .A1(n148), .B0(n265), .B1(n266), .C0(n267), .Y(
        n264) );
  NOR4X1 U725 ( .A(n283), .B(n284), .C(n285), .D(n286), .Y(n266) );
  NOR4X1 U726 ( .A(n287), .B(n288), .C(n289), .D(n290), .Y(n265) );
  NOR4BX1 U727 ( .AN(pat_reg_w[26]), .B(pat_reg_w[31]), .C(pat_reg_w[24]), .D(
        n152), .Y(n151) );
  NOR2X1 U728 ( .A(n153), .B(n154), .Y(n152) );
  NOR4BBX1 U729 ( .AN(pat_reg_w[27]), .BN(pat_reg_w[25]), .C(n55), .D(n155), 
        .Y(n154) );
  NOR4X1 U730 ( .A(n156), .B(n157), .C(\str_buf[27][3] ), .D(\str_buf[27][2] ), 
        .Y(n153) );
  NOR4BX1 U731 ( .AN(pat_reg_w[34]), .B(pat_reg_w[39]), .C(pat_reg_w[32]), .D(
        n179), .Y(n178) );
  NOR2X1 U732 ( .A(n180), .B(n181), .Y(n179) );
  NOR4BBX1 U733 ( .AN(pat_reg_w[35]), .BN(pat_reg_w[33]), .C(n55), .D(n182), 
        .Y(n181) );
  NOR4X1 U734 ( .A(n183), .B(n184), .C(\str_buf[28][3] ), .D(\str_buf[28][2] ), 
        .Y(n180) );
  NOR4BX1 U735 ( .AN(pat_reg_w[42]), .B(pat_reg_w[47]), .C(pat_reg_w[40]), .D(
        n212), .Y(n211) );
  NOR2X1 U736 ( .A(n213), .B(n214), .Y(n212) );
  NOR4BBX1 U737 ( .AN(pat_reg_w[43]), .BN(pat_reg_w[41]), .C(n55), .D(n215), 
        .Y(n214) );
  NOR4X1 U738 ( .A(n216), .B(n217), .C(\str_buf[29][3] ), .D(\str_buf[29][2] ), 
        .Y(n213) );
  NOR4BX1 U739 ( .AN(pat_reg_w[58]), .B(pat_reg_w[63]), .C(pat_reg_w[56]), .D(
        n268), .Y(n267) );
  NOR2X1 U740 ( .A(n269), .B(n270), .Y(n268) );
  NOR4BBX1 U741 ( .AN(pat_reg_w[59]), .BN(pat_reg_w[57]), .C(n55), .D(n271), 
        .Y(n270) );
  NOR4X1 U742 ( .A(n272), .B(n273), .C(\str_buf[31][3] ), .D(\str_buf[31][2] ), 
        .Y(n269) );
  NAND4X1 U743 ( .A(\str_buf[27][5] ), .B(n161), .C(n24), .D(n44), .Y(n156) );
  OAI33X1 U744 ( .A0(n155), .A1(pat_reg_w[27]), .A2(pat_reg_w[25]), .B0(n164), 
        .B1(n305), .B2(n304), .Y(n161) );
  NAND3BX1 U745 ( .AN(pat_reg_w[29]), .B(pat_reg_w[25]), .C(pat_reg_w[27]), 
        .Y(n164) );
  NAND4X1 U746 ( .A(\str_buf[28][5] ), .B(n188), .C(n25), .D(n45), .Y(n183) );
  OAI33X1 U747 ( .A0(n182), .A1(pat_reg_w[35]), .A2(pat_reg_w[33]), .B0(n191), 
        .B1(n308), .B2(n307), .Y(n188) );
  NAND3BX1 U748 ( .AN(pat_reg_w[37]), .B(pat_reg_w[33]), .C(pat_reg_w[35]), 
        .Y(n191) );
  NAND4X1 U749 ( .A(\str_buf[29][5] ), .B(n221), .C(n23), .D(n43), .Y(n216) );
  OAI33X1 U750 ( .A0(n215), .A1(pat_reg_w[43]), .A2(pat_reg_w[41]), .B0(n224), 
        .B1(n321), .B2(n310), .Y(n221) );
  NAND3BX1 U751 ( .AN(pat_reg_w[45]), .B(pat_reg_w[41]), .C(pat_reg_w[43]), 
        .Y(n224) );
  NAND4X1 U752 ( .A(\str_buf[31][5] ), .B(n277), .C(n18), .D(n38), .Y(n272) );
  OAI33X1 U753 ( .A0(n271), .A1(pat_reg_w[59]), .A2(pat_reg_w[57]), .B0(n280), 
        .B1(n344), .B2(n343), .Y(n277) );
  NAND3BX1 U754 ( .AN(pat_reg_w[61]), .B(pat_reg_w[57]), .C(pat_reg_w[59]), 
        .Y(n280) );
  NAND3X1 U755 ( .A(n282), .B(n281), .C(pat_reg_w[13]), .Y(n336) );
  CLKINVX1 U756 ( .A(pat_reg_w[14]), .Y(n281) );
  NAND3X1 U757 ( .A(n279), .B(n278), .C(pat_reg_w[5]), .Y(n105) );
  CLKINVX1 U758 ( .A(pat_reg_w[6]), .Y(n278) );
  CLKINVX1 U759 ( .A(pat_reg_w[12]), .Y(n282) );
  CLKINVX1 U760 ( .A(pat_reg_w[4]), .Y(n279) );
  NAND3X1 U761 ( .A(n305), .B(n304), .C(pat_reg_w[29]), .Y(n155) );
  NAND3X1 U762 ( .A(n308), .B(n307), .C(pat_reg_w[37]), .Y(n182) );
  NAND3X1 U763 ( .A(n321), .B(n310), .C(pat_reg_w[45]), .Y(n215) );
  NAND3X1 U764 ( .A(n344), .B(n343), .C(pat_reg_w[61]), .Y(n271) );
  CLKINVX1 U765 ( .A(pat_reg_w[30]), .Y(n304) );
  CLKINVX1 U766 ( .A(pat_reg_w[38]), .Y(n307) );
  CLKINVX1 U767 ( .A(pat_reg_w[46]), .Y(n310) );
  CLKINVX1 U768 ( .A(pat_reg_w[62]), .Y(n343) );
  CLKINVX1 U769 ( .A(pat_reg_w[28]), .Y(n305) );
  CLKINVX1 U770 ( .A(pat_reg_w[36]), .Y(n308) );
  CLKINVX1 U771 ( .A(pat_reg_w[44]), .Y(n321) );
  CLKINVX1 U772 ( .A(pat_reg_w[60]), .Y(n344) );
  NAND4BX1 U773 ( .AN(pat_reg_w[78]), .B(pat_reg_w[77]), .C(n645), .D(n600), 
        .Y(n636) );
  OAI33X1 U774 ( .A0(n625), .A1(pat_reg_w[75]), .A2(pat_reg_w[73]), .B0(n606), 
        .B1(n55), .B2(n602), .Y(n645) );
  OAI221XL U775 ( .A0(n627), .A1(n118), .B0(n896), .B1(n85), .C0(n86), .Y(
        n1180) );
  AOI221XL U776 ( .A0(n208), .A1(n206), .B0(n633), .B1(n634), .C0(n635), .Y(
        n627) );
  NOR4X1 U777 ( .A(n647), .B(n648), .C(n649), .D(n650), .Y(n634) );
  NOR4X1 U778 ( .A(n651), .B(n652), .C(n653), .D(n654), .Y(n633) );
  AOI211X1 U779 ( .A0(n636), .A1(n637), .B0(n638), .C0(n604), .Y(n635) );
  CLKINVX1 U780 ( .A(pat_reg_w[74]), .Y(n604) );
  OR2X1 U781 ( .A(pat_reg_w[79]), .B(pat_reg_w[72]), .Y(n638) );
  NAND4BX1 U782 ( .AN(pat_reg_w[77]), .B(n274), .C(pat_reg_w[78]), .D(n641), 
        .Y(n637) );
  CLKINVX1 U783 ( .A(pat_reg_w[19]), .Y(n299) );
  CLKINVX1 U784 ( .A(pat_reg_w[17]), .Y(n303) );
  CLKINVX1 U785 ( .A(pat_reg_w[51]), .Y(n340) );
  CLKINVX1 U786 ( .A(pat_reg_w[67]), .Y(n347) );
  CLKINVX1 U787 ( .A(pat_reg_w[49]), .Y(n341) );
  CLKINVX1 U788 ( .A(pat_reg_w[65]), .Y(n352) );
  NAND3BX1 U789 ( .AN(c_state[2]), .B(c_state[0]), .C(c_state[1]), .Y(n656) );
  CLKBUFX3 U790 ( .A(n104), .Y(n55) );
  AND4X1 U791 ( .A(n876), .B(n877), .C(n646), .D(n878), .Y(n104) );
  AND2X2 U792 ( .A(n881), .B(n879), .Y(n646) );
  NAND4BBXL U793 ( .AN(n892), .BN(n891), .C(n664), .D(n665), .Y(n655) );
  NOR3X1 U794 ( .A(n890), .B(n888), .C(n889), .Y(n664) );
  NOR4X1 U795 ( .A(n666), .B(n895), .C(n893), .D(n894), .Y(n665) );
  NAND2BX1 U796 ( .AN(n896), .B(n870), .Y(n666) );
  NAND2X1 U797 ( .A(n897), .B(n249), .Y(n118) );
  CLKINVX1 U798 ( .A(pat_reg_w[75]), .Y(n602) );
  CLKINVX1 U799 ( .A(pat_reg_w[73]), .Y(n606) );
  XNOR2X1 U800 ( .A(pat_reg_w[13]), .B(\str_buf[25][5] ), .Y(n328) );
  NAND4X1 U801 ( .A(n326), .B(n327), .C(n328), .D(n329), .Y(n325) );
  XNOR2X1 U802 ( .A(pat_reg_w[15]), .B(\str_buf[25][7] ), .Y(n326) );
  XNOR2X1 U803 ( .A(pat_reg_w[14]), .B(\str_buf[25][6] ), .Y(n327) );
  XNOR2X1 U804 ( .A(pat_reg_w[12]), .B(\str_buf[25][4] ), .Y(n329) );
  XNOR2X1 U805 ( .A(pat_reg_w[10]), .B(\str_buf[25][2] ), .Y(n331) );
  NAND4X1 U806 ( .A(n330), .B(n331), .C(n332), .D(n333), .Y(n324) );
  XNOR2X1 U807 ( .A(pat_reg_w[9]), .B(\str_buf[25][1] ), .Y(n332) );
  XNOR2X1 U808 ( .A(pat_reg_w[8]), .B(\str_buf[25][0] ), .Y(n333) );
  XNOR2X1 U809 ( .A(pat_reg_w[11]), .B(\str_buf[25][3] ), .Y(n330) );
  XNOR2X1 U810 ( .A(pat_reg_w[5]), .B(\str_buf[24][5] ), .Y(n96) );
  NAND4X1 U811 ( .A(n94), .B(n95), .C(n96), .D(n97), .Y(n93) );
  XNOR2X1 U812 ( .A(pat_reg_w[7]), .B(\str_buf[24][7] ), .Y(n94) );
  XNOR2X1 U813 ( .A(pat_reg_w[6]), .B(\str_buf[24][6] ), .Y(n95) );
  XNOR2X1 U814 ( .A(pat_reg_w[4]), .B(\str_buf[24][4] ), .Y(n97) );
  XNOR2X1 U815 ( .A(pat_reg_w[2]), .B(\str_buf[24][2] ), .Y(n99) );
  XNOR2X1 U816 ( .A(pat_reg_w[3]), .B(\str_buf[24][3] ), .Y(n98) );
  CLKINVX1 U817 ( .A(pat_reg_w[76]), .Y(n600) );
  XNOR2X1 U818 ( .A(pat_reg_w[0]), .B(\str_buf[24][0] ), .Y(n101) );
  XNOR2X1 U819 ( .A(pat_reg_w[72]), .B(n1), .Y(n654) );
  XNOR2X1 U820 ( .A(pat_reg_w[1]), .B(\str_buf[24][1] ), .Y(n100) );
  OAI2BB2XL U821 ( .B0(n876), .B1(n81), .A0N(N1223), .A1N(n82), .Y(n882) );
  OAI2BB2XL U822 ( .B0(n877), .B1(n81), .A0N(N1221), .A1N(n82), .Y(n883) );
  OAI2BB2XL U823 ( .B0(n878), .B1(n81), .A0N(N1220), .A1N(n82), .Y(n884) );
  OAI2BB2XL U824 ( .B0(n879), .B1(n81), .A0N(N1222), .A1N(n82), .Y(n885) );
  OAI2BB2XL U825 ( .B0(n881), .B1(n81), .A0N(n881), .A1N(n82), .Y(n887) );
  ADDHXL U826 ( .A(match_index[1]), .B(match_index[0]), .CO(\add_153/carry[2] ), .S(N1220) );
  ADDHXL U827 ( .A(match_index[2]), .B(\add_153/carry[2] ), .CO(
        \add_153/carry[3] ), .S(N1221) );
  ADDHXL U828 ( .A(match_index[3]), .B(\add_153/carry[3] ), .CO(
        \add_153/carry[4] ), .S(N1222) );
  XNOR2X1 U829 ( .A(n35), .B(pat_reg_w[76]), .Y(n650) );
  XNOR2X1 U830 ( .A(n28), .B(pat_reg_w[31]), .Y(n174) );
  XNOR2X1 U831 ( .A(n29), .B(pat_reg_w[39]), .Y(n201) );
  XNOR2X1 U832 ( .A(n26), .B(pat_reg_w[47]), .Y(n234) );
  XNOR2X1 U833 ( .A(n21), .B(pat_reg_w[63]), .Y(n290) );
  XNOR2X1 U834 ( .A(n352), .B(n860), .Y(n317) );
  XOR2X1 U835 ( .A(\str_buf[27][3] ), .B(pat_reg_w[27]), .Y(n170) );
  XOR2X1 U836 ( .A(\str_buf[28][3] ), .B(pat_reg_w[35]), .Y(n197) );
  XOR2X1 U837 ( .A(\str_buf[29][3] ), .B(pat_reg_w[43]), .Y(n230) );
  XOR2X1 U838 ( .A(\str_buf[31][3] ), .B(pat_reg_w[59]), .Y(n286) );
  XOR2X1 U839 ( .A(pat_reg_w[64]), .B(n861), .Y(n318) );
  XOR2X1 U840 ( .A(pat_reg_w[68]), .B(n862), .Y(n314) );
  XNOR2X1 U841 ( .A(n341), .B(n865), .Y(n262) );
  XNOR2X1 U842 ( .A(n303), .B(n871), .Y(n144) );
  NOR4X1 U843 ( .A(n260), .B(n261), .C(n262), .D(n263), .Y(n237) );
  XNOR2X1 U844 ( .A(n32), .B(pat_reg_w[51]), .Y(n260) );
  XNOR2X1 U845 ( .A(n12), .B(pat_reg_w[50]), .Y(n261) );
  XOR2X1 U846 ( .A(pat_reg_w[48]), .B(n866), .Y(n263) );
  XNOR2X1 U847 ( .A(n34), .B(pat_reg_w[73]), .Y(n653) );
  XNOR2X1 U848 ( .A(n10), .B(pat_reg_w[30]), .Y(n173) );
  XNOR2X1 U849 ( .A(n11), .B(pat_reg_w[38]), .Y(n200) );
  XNOR2X1 U850 ( .A(n9), .B(pat_reg_w[46]), .Y(n233) );
  XNOR2X1 U851 ( .A(n6), .B(pat_reg_w[62]), .Y(n289) );
  OAI31XL U852 ( .A0(n626), .A1(n274), .A2(n656), .B0(n657), .Y(N1214) );
  OAI21XL U853 ( .A0(n897), .A1(n658), .B0(n624), .Y(n657) );
  XNOR2X1 U854 ( .A(n14), .B(pat_reg_w[77]), .Y(n649) );
  XOR2X1 U855 ( .A(pat_reg_w[16]), .B(n872), .Y(n145) );
  XOR2X1 U856 ( .A(pat_reg_w[52]), .B(n867), .Y(n259) );
  XOR2X1 U857 ( .A(pat_reg_w[20]), .B(n873), .Y(n141) );
  XNOR2X1 U858 ( .A(n2), .B(pat_reg_w[78]), .Y(n648) );
  XNOR2X1 U859 ( .A(n15), .B(pat_reg_w[74]), .Y(n652) );
  XNOR2X1 U860 ( .A(n7), .B(pat_reg_w[66]), .Y(n316) );
  XNOR2X1 U861 ( .A(n44), .B(pat_reg_w[25]), .Y(n168) );
  XNOR2X1 U862 ( .A(n45), .B(pat_reg_w[33]), .Y(n195) );
  XNOR2X1 U863 ( .A(n43), .B(pat_reg_w[41]), .Y(n228) );
  XNOR2X1 U864 ( .A(n38), .B(pat_reg_w[57]), .Y(n284) );
  XOR2X1 U865 ( .A(\str_buf[32][5] ), .B(pat_reg_w[69]), .Y(n313) );
  XNOR2X1 U866 ( .A(pat_reg_w[71]), .B(n39), .Y(n311) );
  XNOR2X1 U867 ( .A(n13), .B(pat_reg_w[18]), .Y(n143) );
  XNOR2X1 U868 ( .A(n346), .B(n864), .Y(n312) );
  XOR2X1 U869 ( .A(\str_buf[27][2] ), .B(pat_reg_w[26]), .Y(n169) );
  XOR2X1 U870 ( .A(\str_buf[28][2] ), .B(pat_reg_w[34]), .Y(n196) );
  XOR2X1 U871 ( .A(\str_buf[29][2] ), .B(pat_reg_w[42]), .Y(n229) );
  XOR2X1 U872 ( .A(\str_buf[31][2] ), .B(pat_reg_w[58]), .Y(n285) );
  XOR2X1 U873 ( .A(\str_buf[30][5] ), .B(pat_reg_w[53]), .Y(n258) );
  XOR2X1 U874 ( .A(\str_buf[26][5] ), .B(pat_reg_w[21]), .Y(n140) );
  XNOR2X1 U875 ( .A(pat_reg_w[55]), .B(n47), .Y(n256) );
  XNOR2X1 U876 ( .A(pat_reg_w[23]), .B(n51), .Y(n138) );
  XOR2X1 U877 ( .A(\str_buf[27][5] ), .B(pat_reg_w[29]), .Y(n172) );
  XOR2X1 U878 ( .A(\str_buf[28][5] ), .B(pat_reg_w[37]), .Y(n199) );
  XOR2X1 U879 ( .A(\str_buf[29][5] ), .B(pat_reg_w[45]), .Y(n232) );
  XOR2X1 U880 ( .A(\str_buf[31][5] ), .B(pat_reg_w[61]), .Y(n288) );
  XNOR2X1 U881 ( .A(n4), .B(pat_reg_w[75]), .Y(n651) );
  XNOR2X1 U882 ( .A(n3), .B(pat_reg_w[79]), .Y(n647) );
  XNOR2X1 U883 ( .A(n339), .B(n869), .Y(n257) );
  XNOR2X1 U884 ( .A(n298), .B(n875), .Y(n139) );
  XNOR2X1 U885 ( .A(n22), .B(pat_reg_w[67]), .Y(n315) );
  XNOR2X1 U886 ( .A(n49), .B(pat_reg_w[28]), .Y(n171) );
  XNOR2X1 U887 ( .A(n50), .B(pat_reg_w[36]), .Y(n198) );
  XNOR2X1 U888 ( .A(n46), .B(pat_reg_w[44]), .Y(n231) );
  XNOR2X1 U889 ( .A(n41), .B(pat_reg_w[60]), .Y(n287) );
  XNOR2X1 U890 ( .A(n24), .B(pat_reg_w[24]), .Y(n167) );
  XNOR2X1 U891 ( .A(n25), .B(pat_reg_w[32]), .Y(n194) );
  XNOR2X1 U892 ( .A(n23), .B(pat_reg_w[40]), .Y(n227) );
  XNOR2X1 U893 ( .A(n18), .B(pat_reg_w[56]), .Y(n283) );
  XNOR2X1 U894 ( .A(n33), .B(pat_reg_w[19]), .Y(n142) );
  CLKINVX1 U895 ( .A(pat_len[2]), .Y(n610) );
  NOR3X1 U896 ( .A(n255), .B(n880), .C(n250), .Y(n1181) );
  XOR2X1 U897 ( .A(\add_153/carry[4] ), .B(match_index[4]), .Y(N1223) );
endmodule


module SME ( clk, reset, chardata, isstring, ispattern, valid, match, 
        match_index );
  input [7:0] chardata;
  output [4:0] match_index;
  input clk, reset, isstring, ispattern;
  output valid, match;
  wire   ready, \str_reg[33][7] , \str_reg[33][6] , \str_reg[33][5] ,
         \str_reg[33][4] , \str_reg[33][3] , \str_reg[33][2] ,
         \str_reg[33][1] , \str_reg[33][0] , \str_reg[32][7] ,
         \str_reg[32][6] , \str_reg[32][5] , \str_reg[32][4] ,
         \str_reg[32][3] , \str_reg[32][2] , \str_reg[32][1] ,
         \str_reg[32][0] , \str_reg[31][7] , \str_reg[31][6] ,
         \str_reg[31][5] , \str_reg[31][4] , \str_reg[31][3] ,
         \str_reg[31][2] , \str_reg[31][1] , \str_reg[31][0] ,
         \str_reg[30][7] , \str_reg[30][6] , \str_reg[30][5] ,
         \str_reg[30][4] , \str_reg[30][3] , \str_reg[30][2] ,
         \str_reg[30][1] , \str_reg[30][0] , \str_reg[29][7] ,
         \str_reg[29][6] , \str_reg[29][5] , \str_reg[29][4] ,
         \str_reg[29][3] , \str_reg[29][2] , \str_reg[29][1] ,
         \str_reg[29][0] , \str_reg[28][7] , \str_reg[28][6] ,
         \str_reg[28][5] , \str_reg[28][4] , \str_reg[28][3] ,
         \str_reg[28][2] , \str_reg[28][1] , \str_reg[28][0] ,
         \str_reg[27][7] , \str_reg[27][6] , \str_reg[27][5] ,
         \str_reg[27][4] , \str_reg[27][3] , \str_reg[27][2] ,
         \str_reg[27][1] , \str_reg[27][0] , \str_reg[26][7] ,
         \str_reg[26][6] , \str_reg[26][5] , \str_reg[26][4] ,
         \str_reg[26][3] , \str_reg[26][2] , \str_reg[26][1] ,
         \str_reg[26][0] , \str_reg[25][7] , \str_reg[25][6] ,
         \str_reg[25][5] , \str_reg[25][4] , \str_reg[25][3] ,
         \str_reg[25][2] , \str_reg[25][1] , \str_reg[25][0] ,
         \str_reg[24][7] , \str_reg[24][6] , \str_reg[24][5] ,
         \str_reg[24][4] , \str_reg[24][3] , \str_reg[24][2] ,
         \str_reg[24][1] , \str_reg[24][0] , \str_reg[23][7] ,
         \str_reg[23][6] , \str_reg[23][5] , \str_reg[23][4] ,
         \str_reg[23][3] , \str_reg[23][2] , \str_reg[23][1] ,
         \str_reg[23][0] , \str_reg[22][7] , \str_reg[22][6] ,
         \str_reg[22][5] , \str_reg[22][4] , \str_reg[22][3] ,
         \str_reg[22][2] , \str_reg[22][1] , \str_reg[22][0] ,
         \str_reg[21][7] , \str_reg[21][6] , \str_reg[21][5] ,
         \str_reg[21][4] , \str_reg[21][3] , \str_reg[21][2] ,
         \str_reg[21][1] , \str_reg[21][0] , \str_reg[20][7] ,
         \str_reg[20][6] , \str_reg[20][5] , \str_reg[20][4] ,
         \str_reg[20][3] , \str_reg[20][2] , \str_reg[20][1] ,
         \str_reg[20][0] , \str_reg[19][7] , \str_reg[19][6] ,
         \str_reg[19][5] , \str_reg[19][4] , \str_reg[19][3] ,
         \str_reg[19][2] , \str_reg[19][1] , \str_reg[19][0] ,
         \str_reg[18][7] , \str_reg[18][6] , \str_reg[18][5] ,
         \str_reg[18][4] , \str_reg[18][3] , \str_reg[18][2] ,
         \str_reg[18][1] , \str_reg[18][0] , \str_reg[17][7] ,
         \str_reg[17][6] , \str_reg[17][5] , \str_reg[17][4] ,
         \str_reg[17][3] , \str_reg[17][2] , \str_reg[17][1] ,
         \str_reg[17][0] , \str_reg[16][7] , \str_reg[16][6] ,
         \str_reg[16][5] , \str_reg[16][4] , \str_reg[16][3] ,
         \str_reg[16][2] , \str_reg[16][1] , \str_reg[16][0] ,
         \str_reg[15][7] , \str_reg[15][6] , \str_reg[15][5] ,
         \str_reg[15][4] , \str_reg[15][3] , \str_reg[15][2] ,
         \str_reg[15][1] , \str_reg[15][0] , \str_reg[14][7] ,
         \str_reg[14][6] , \str_reg[14][5] , \str_reg[14][4] ,
         \str_reg[14][3] , \str_reg[14][2] , \str_reg[14][1] ,
         \str_reg[14][0] , \str_reg[13][7] , \str_reg[13][6] ,
         \str_reg[13][5] , \str_reg[13][4] , \str_reg[13][3] ,
         \str_reg[13][2] , \str_reg[13][1] , \str_reg[13][0] ,
         \str_reg[12][7] , \str_reg[12][6] , \str_reg[12][5] ,
         \str_reg[12][4] , \str_reg[12][3] , \str_reg[12][2] ,
         \str_reg[12][1] , \str_reg[12][0] , \str_reg[11][7] ,
         \str_reg[11][6] , \str_reg[11][5] , \str_reg[11][4] ,
         \str_reg[11][3] , \str_reg[11][2] , \str_reg[11][1] ,
         \str_reg[11][0] , \str_reg[10][7] , \str_reg[10][6] ,
         \str_reg[10][5] , \str_reg[10][4] , \str_reg[10][3] ,
         \str_reg[10][2] , \str_reg[10][1] , \str_reg[10][0] , \str_reg[9][7] ,
         \str_reg[9][6] , \str_reg[9][5] , \str_reg[9][4] , \str_reg[9][3] ,
         \str_reg[9][2] , \str_reg[9][1] , \str_reg[9][0] , \str_reg[8][7] ,
         \str_reg[8][6] , \str_reg[8][5] , \str_reg[8][4] , \str_reg[8][3] ,
         \str_reg[8][2] , \str_reg[8][1] , \str_reg[8][0] , \str_reg[7][7] ,
         \str_reg[7][6] , \str_reg[7][5] , \str_reg[7][4] , \str_reg[7][3] ,
         \str_reg[7][2] , \str_reg[7][1] , \str_reg[7][0] , \str_reg[6][7] ,
         \str_reg[6][6] , \str_reg[6][5] , \str_reg[6][4] , \str_reg[6][3] ,
         \str_reg[6][2] , \str_reg[6][1] , \str_reg[6][0] , \str_reg[5][7] ,
         \str_reg[5][6] , \str_reg[5][5] , \str_reg[5][4] , \str_reg[5][3] ,
         \str_reg[5][2] , \str_reg[5][1] , \str_reg[5][0] , \str_reg[4][7] ,
         \str_reg[4][6] , \str_reg[4][5] , \str_reg[4][4] , \str_reg[4][3] ,
         \str_reg[4][2] , \str_reg[4][1] , \str_reg[4][0] , \str_reg[3][7] ,
         \str_reg[3][6] , \str_reg[3][5] , \str_reg[3][4] , \str_reg[3][3] ,
         \str_reg[3][2] , \str_reg[3][1] , \str_reg[3][0] , \str_reg[2][7] ,
         \str_reg[2][6] , \str_reg[2][5] , \str_reg[2][4] , \str_reg[2][3] ,
         \str_reg[2][2] , \str_reg[2][1] , \str_reg[2][0] , \str_reg[1][7] ,
         \str_reg[1][6] , \str_reg[1][5] , \str_reg[1][4] , \str_reg[1][3] ,
         \str_reg[1][2] , \str_reg[1][1] , \str_reg[1][0] , N815, N816, N817,
         N818, N819, N821, N822, N823, N824, N825, \pat_reg[9][7] ,
         \pat_reg[9][6] , \pat_reg[9][5] , \pat_reg[9][4] , \pat_reg[9][3] ,
         \pat_reg[9][2] , \pat_reg[9][1] , \pat_reg[9][0] , \pat_reg[8][7] ,
         \pat_reg[8][6] , \pat_reg[8][5] , \pat_reg[8][4] , \pat_reg[8][3] ,
         \pat_reg[8][2] , \pat_reg[8][1] , \pat_reg[8][0] , \pat_reg[7][7] ,
         \pat_reg[7][6] , \pat_reg[7][5] , \pat_reg[7][4] , \pat_reg[7][3] ,
         \pat_reg[7][2] , \pat_reg[7][1] , \pat_reg[7][0] , \pat_reg[6][7] ,
         \pat_reg[6][6] , \pat_reg[6][5] , \pat_reg[6][4] , \pat_reg[6][3] ,
         \pat_reg[6][2] , \pat_reg[6][1] , \pat_reg[6][0] , \pat_reg[5][7] ,
         \pat_reg[5][6] , \pat_reg[5][5] , \pat_reg[5][4] , \pat_reg[5][3] ,
         \pat_reg[5][2] , \pat_reg[5][1] , \pat_reg[5][0] , \pat_reg[4][7] ,
         \pat_reg[4][6] , \pat_reg[4][5] , \pat_reg[4][4] , \pat_reg[4][3] ,
         \pat_reg[4][2] , \pat_reg[4][1] , \pat_reg[4][0] , \pat_reg[3][7] ,
         \pat_reg[3][6] , \pat_reg[3][5] , \pat_reg[3][4] , \pat_reg[3][3] ,
         \pat_reg[3][2] , \pat_reg[3][1] , \pat_reg[3][0] , \pat_reg[2][7] ,
         \pat_reg[2][6] , \pat_reg[2][5] , \pat_reg[2][4] , \pat_reg[2][3] ,
         \pat_reg[2][2] , \pat_reg[2][1] , \pat_reg[2][0] , \pat_reg[1][7] ,
         \pat_reg[1][6] , \pat_reg[1][5] , \pat_reg[1][4] , \pat_reg[1][3] ,
         \pat_reg[1][2] , \pat_reg[1][1] , \pat_reg[1][0] , \pat_reg[0][7] ,
         \pat_reg[0][6] , \pat_reg[0][5] , \pat_reg[0][4] , \pat_reg[0][3] ,
         \pat_reg[0][2] , \pat_reg[0][1] , \pat_reg[0][0] , N1131, match_w,
         N1148, N1156, N1157, N1158, N1159, N1160, N1161, N1162, N1163, N1164,
         N1165, \eq_193_G10/B[3] , \eq_193_G10/B[2] , \eq_193_G10/B[1] ,
         \eq_193_G10/B[0] , n99, n100, n101, n102, n103, n104, n105, n106,
         n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117,
         n118, n119, n120, n121, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n150,
         n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n207, n208, n209, n210, n211, n212, n213, n214, n215, n216,
         n217, n218, n219, n220, n221, n222, n223, n224, n225, n226, n227,
         n228, n229, n230, n231, n232, n233, n234, n235, n236, n237, n238,
         n239, n240, n241, n242, n243, n244, n245, n246, n247, n248, n249,
         n250, n251, n252, n253, n254, n255, n256, n257, n258, n259, n260,
         n261, n262, n263, n264, n265, n266, n267, n268, n269, n270, n271,
         n272, n273, n274, n275, n276, n277, n278, n279, n280, n281, n282,
         n283, n284, n285, n286, n287, n288, n289, n290, n291, n292, n293,
         n294, n295, n296, n297, n298, n299, n300, n301, n302, n303, n304,
         n305, n306, n307, n308, n309, n310, n311, n312, n313, n314, n315,
         n316, n317, n318, n319, n320, n321, n322, n323, n324, n325, n326,
         n327, n328, n329, n330, n331, n332, n333, n334, n335, n336, n337,
         n338, n339, n340, n341, n342, n343, n344, n345, n346, n347, n348,
         n349, n350, n351, n352, n353, n354, n355, n356, n359, n360, n361,
         n372, n373, n374, n375, n376, n377, n378, n379, n380, n381, n382,
         n383, n384, n385, n386, n387, n388, n389, n390, n391, n392, n393,
         n394, n395, n396, n397, n398, n399, n400, n401, n402, n403, n404,
         n405, n406, n407, n408, n409, n410, n411, n412, n413, n414, n415,
         n416, n417, n418, n419, n420, n421, n422, n423, n424, n425, n426,
         n427, n428, n429, n430, n431, n432, n433, n434, n435, n436, n437,
         n438, n439, n440, n441, n442, n443, n444, n445, n446, n447, n448,
         n449, n450, n451, n452, n453, n454, n455, n456, n457, n458, n459,
         n460, n461, n462, n463, n464, n465, n466, n467, n468, n469, n470,
         n471, n472, n473, n474, n475, n476, n477, n478, n479, n480, n481,
         n482, n483, n484, n485, n486, n487, n488, n489, n490, n491, n492,
         n493, n494, n495, n496, n497, n498, n499, n500, n501, n502, n503,
         n504, n505, n506, n507, n508, n509, n510, n511, n512, n513, n514,
         n515, n516, n517, n518, n519, n520, n521, n522, n523, n524, n525,
         n526, n527, n528, n529, n530, n531, n532, n533, n534, n535, n536,
         n537, n538, n539, n540, n541, n542, n543, n544, n545, n546, n547,
         n548, n549, n550, n551, n552, n553, n554, n555, n556, n557, n558,
         n559, n560, n561, n562, n563, n564, n565, n566, n567, n568, n569,
         n570, n571, n572, n573, n574, n575, n576, n577, n578, n579, n580,
         n581, n582, n583, n584, n585, n586, n587, n588, n589, n590, n591,
         n592, n593, n594, n595, n596, n597, n598, n599, n600, n601, n602,
         n603, n604, n605, n606, n607, n608, n609, n610, n611, n612, n613,
         n614, n615, n616, n617, n618, n619, n620, n621, n622, n623, n624,
         n625, n626, n627, n628, n629, n630, n631, n632, n633, n634, n635,
         n636, n637, n638, n639, n640, n641, n642, n643, n644, n645, n646,
         n647, n648, n649, n650, n651, n652, n653, n654, n655, n656, n657,
         n658, n659, n660, n661, n662, n663, n664, n665, n666, n667, n668,
         n669, n670, n671, n672, n673, n674, n675, n676, n677, n678, n679,
         n680, n681, n682, n683, n684, n685, n686, n687, n688, n689, n690,
         n691, n692, n693, n694, n695, n696, n697, n698, n699, n700, n701,
         n702, n703, n704, n705, n706, n707, n708, n709, n710, n711, n712,
         n713, n714, n715, n716, n717, n718, n719, n720, n721, n722, n723,
         n724, n725, n726, n727, n728, n729, n730, n731, n732, n733, n734,
         n735, n736, n737, n738, n739, n740, n741, n742, n743, n744, n745,
         n746, n747, n748, n749, n750, n751, n752, n753, n754, n755, n756,
         n757, n758, n759, n760, n761, n762, n763, n764, n765, n766, n767,
         n768, n769, n770, n771, n772, n773, n774, N1151, \r521/carry[3] ,
         n775, n776, n777, n778, n779, n780, n781, n782, n783, n791, n792,
         n793, n794, n795, n796, n797, n798, n799, n800, n801, n802, n803,
         n804, n805, n806, n807, n808, n809, n810, n811, n812, n813, n814,
         n815, n816, n817, n818, n819, n820, n821, n822, n823, n824, n825,
         n826, n827, n828, n829, n830, n831, n832, n833, n834, n835, n836,
         n837, n838, n839, n840, n841, n842, n843, n844, n845, n846, n847,
         n848, n849, n850, n851, n852, n853, n854, n855, n856, n857, n858,
         n859, n860, n861, n862, n863, n864, n865, n866, n867, n868, n869,
         n870, n871, n872, n873, n874, n875, n876, n877, n878, n879, n880,
         n881;
  wire   [2:0] c_state;
  wire   [2:0] n_state;
  wire   [5:0] str_len;
  wire   [3:0] pat_len;
  wire   [4:0] match_index_w;
  wire   [5:2] \add_178/carry ;
  wire   [4:1] \add_0_root_add_0_root_add_272/carry ;

  SME_COMP u1 ( .reset(reset), .clk(clk), .str_reg_w({\str_reg[33][7] , 
        \str_reg[33][6] , \str_reg[33][5] , \str_reg[33][4] , \str_reg[33][3] , 
        \str_reg[33][2] , \str_reg[33][1] , \str_reg[33][0] , \str_reg[32][7] , 
        \str_reg[32][6] , \str_reg[32][5] , \str_reg[32][4] , \str_reg[32][3] , 
        \str_reg[32][2] , \str_reg[32][1] , \str_reg[32][0] , \str_reg[31][7] , 
        \str_reg[31][6] , \str_reg[31][5] , \str_reg[31][4] , \str_reg[31][3] , 
        \str_reg[31][2] , \str_reg[31][1] , \str_reg[31][0] , \str_reg[30][7] , 
        \str_reg[30][6] , \str_reg[30][5] , \str_reg[30][4] , \str_reg[30][3] , 
        \str_reg[30][2] , \str_reg[30][1] , \str_reg[30][0] , \str_reg[29][7] , 
        \str_reg[29][6] , \str_reg[29][5] , \str_reg[29][4] , \str_reg[29][3] , 
        \str_reg[29][2] , \str_reg[29][1] , \str_reg[29][0] , \str_reg[28][7] , 
        \str_reg[28][6] , \str_reg[28][5] , \str_reg[28][4] , \str_reg[28][3] , 
        \str_reg[28][2] , \str_reg[28][1] , \str_reg[28][0] , \str_reg[27][7] , 
        \str_reg[27][6] , \str_reg[27][5] , \str_reg[27][4] , \str_reg[27][3] , 
        \str_reg[27][2] , \str_reg[27][1] , \str_reg[27][0] , \str_reg[26][7] , 
        \str_reg[26][6] , \str_reg[26][5] , \str_reg[26][4] , \str_reg[26][3] , 
        \str_reg[26][2] , \str_reg[26][1] , \str_reg[26][0] , \str_reg[25][7] , 
        \str_reg[25][6] , \str_reg[25][5] , \str_reg[25][4] , \str_reg[25][3] , 
        \str_reg[25][2] , \str_reg[25][1] , \str_reg[25][0] , \str_reg[24][7] , 
        \str_reg[24][6] , \str_reg[24][5] , \str_reg[24][4] , \str_reg[24][3] , 
        \str_reg[24][2] , \str_reg[24][1] , \str_reg[24][0] , \str_reg[23][7] , 
        \str_reg[23][6] , \str_reg[23][5] , \str_reg[23][4] , \str_reg[23][3] , 
        \str_reg[23][2] , \str_reg[23][1] , \str_reg[23][0] , \str_reg[22][7] , 
        \str_reg[22][6] , \str_reg[22][5] , \str_reg[22][4] , \str_reg[22][3] , 
        \str_reg[22][2] , \str_reg[22][1] , \str_reg[22][0] , \str_reg[21][7] , 
        \str_reg[21][6] , \str_reg[21][5] , \str_reg[21][4] , \str_reg[21][3] , 
        \str_reg[21][2] , \str_reg[21][1] , \str_reg[21][0] , \str_reg[20][7] , 
        \str_reg[20][6] , \str_reg[20][5] , \str_reg[20][4] , \str_reg[20][3] , 
        \str_reg[20][2] , \str_reg[20][1] , \str_reg[20][0] , \str_reg[19][7] , 
        \str_reg[19][6] , \str_reg[19][5] , \str_reg[19][4] , \str_reg[19][3] , 
        \str_reg[19][2] , \str_reg[19][1] , \str_reg[19][0] , \str_reg[18][7] , 
        \str_reg[18][6] , \str_reg[18][5] , \str_reg[18][4] , \str_reg[18][3] , 
        \str_reg[18][2] , \str_reg[18][1] , \str_reg[18][0] , \str_reg[17][7] , 
        \str_reg[17][6] , \str_reg[17][5] , \str_reg[17][4] , \str_reg[17][3] , 
        \str_reg[17][2] , \str_reg[17][1] , \str_reg[17][0] , \str_reg[16][7] , 
        \str_reg[16][6] , \str_reg[16][5] , \str_reg[16][4] , \str_reg[16][3] , 
        \str_reg[16][2] , \str_reg[16][1] , \str_reg[16][0] , \str_reg[15][7] , 
        \str_reg[15][6] , \str_reg[15][5] , \str_reg[15][4] , \str_reg[15][3] , 
        \str_reg[15][2] , \str_reg[15][1] , \str_reg[15][0] , \str_reg[14][7] , 
        \str_reg[14][6] , \str_reg[14][5] , \str_reg[14][4] , \str_reg[14][3] , 
        \str_reg[14][2] , \str_reg[14][1] , \str_reg[14][0] , \str_reg[13][7] , 
        \str_reg[13][6] , \str_reg[13][5] , \str_reg[13][4] , \str_reg[13][3] , 
        \str_reg[13][2] , \str_reg[13][1] , \str_reg[13][0] , \str_reg[12][7] , 
        \str_reg[12][6] , \str_reg[12][5] , \str_reg[12][4] , \str_reg[12][3] , 
        \str_reg[12][2] , \str_reg[12][1] , \str_reg[12][0] , \str_reg[11][7] , 
        \str_reg[11][6] , \str_reg[11][5] , \str_reg[11][4] , \str_reg[11][3] , 
        \str_reg[11][2] , \str_reg[11][1] , \str_reg[11][0] , \str_reg[10][7] , 
        \str_reg[10][6] , \str_reg[10][5] , \str_reg[10][4] , \str_reg[10][3] , 
        \str_reg[10][2] , \str_reg[10][1] , \str_reg[10][0] , \str_reg[9][7] , 
        \str_reg[9][6] , \str_reg[9][5] , \str_reg[9][4] , \str_reg[9][3] , 
        \str_reg[9][2] , \str_reg[9][1] , \str_reg[9][0] , \str_reg[8][7] , 
        \str_reg[8][6] , \str_reg[8][5] , \str_reg[8][4] , \str_reg[8][3] , 
        \str_reg[8][2] , \str_reg[8][1] , \str_reg[8][0] , \str_reg[7][7] , 
        \str_reg[7][6] , \str_reg[7][5] , \str_reg[7][4] , \str_reg[7][3] , 
        \str_reg[7][2] , \str_reg[7][1] , \str_reg[7][0] , \str_reg[6][7] , 
        \str_reg[6][6] , \str_reg[6][5] , \str_reg[6][4] , \str_reg[6][3] , 
        \str_reg[6][2] , \str_reg[6][1] , \str_reg[6][0] , \str_reg[5][7] , 
        \str_reg[5][6] , \str_reg[5][5] , \str_reg[5][4] , \str_reg[5][3] , 
        \str_reg[5][2] , \str_reg[5][1] , \str_reg[5][0] , \str_reg[4][7] , 
        \str_reg[4][6] , \str_reg[4][5] , \str_reg[4][4] , \str_reg[4][3] , 
        \str_reg[4][2] , \str_reg[4][1] , \str_reg[4][0] , \str_reg[3][7] , 
        \str_reg[3][6] , \str_reg[3][5] , \str_reg[3][4] , \str_reg[3][3] , 
        \str_reg[3][2] , \str_reg[3][1] , \str_reg[3][0] , \str_reg[2][7] , 
        \str_reg[2][6] , \str_reg[2][5] , \str_reg[2][4] , \str_reg[2][3] , 
        \str_reg[2][2] , \str_reg[2][1] , \str_reg[2][0] , \str_reg[1][7] , 
        \str_reg[1][6] , \str_reg[1][5] , \str_reg[1][4] , \str_reg[1][3] , 
        \str_reg[1][2] , \str_reg[1][1] , \str_reg[1][0] , 1'b0, 1'b0, 1'b1, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .pat_reg_w({\pat_reg[9][7] , 
        \pat_reg[9][6] , \pat_reg[9][5] , \pat_reg[9][4] , \pat_reg[9][3] , 
        \pat_reg[9][2] , \pat_reg[9][1] , \pat_reg[9][0] , \pat_reg[8][7] , 
        \pat_reg[8][6] , \pat_reg[8][5] , \pat_reg[8][4] , \pat_reg[8][3] , 
        \pat_reg[8][2] , \pat_reg[8][1] , \pat_reg[8][0] , \pat_reg[7][7] , 
        \pat_reg[7][6] , \pat_reg[7][5] , \pat_reg[7][4] , \pat_reg[7][3] , 
        \pat_reg[7][2] , \pat_reg[7][1] , \pat_reg[7][0] , \pat_reg[6][7] , 
        \pat_reg[6][6] , \pat_reg[6][5] , \pat_reg[6][4] , \pat_reg[6][3] , 
        \pat_reg[6][2] , \pat_reg[6][1] , \pat_reg[6][0] , \pat_reg[5][7] , 
        \pat_reg[5][6] , \pat_reg[5][5] , \pat_reg[5][4] , \pat_reg[5][3] , 
        \pat_reg[5][2] , \pat_reg[5][1] , \pat_reg[5][0] , \pat_reg[4][7] , 
        \pat_reg[4][6] , \pat_reg[4][5] , \pat_reg[4][4] , \pat_reg[4][3] , 
        \pat_reg[4][2] , \pat_reg[4][1] , \pat_reg[4][0] , \pat_reg[3][7] , 
        \pat_reg[3][6] , \pat_reg[3][5] , \pat_reg[3][4] , \pat_reg[3][3] , 
        \pat_reg[3][2] , \pat_reg[3][1] , \pat_reg[3][0] , \pat_reg[2][7] , 
        \pat_reg[2][6] , \pat_reg[2][5] , \pat_reg[2][4] , \pat_reg[2][3] , 
        \pat_reg[2][2] , \pat_reg[2][1] , \pat_reg[2][0] , \pat_reg[1][7] , 
        \pat_reg[1][6] , \pat_reg[1][5] , \pat_reg[1][4] , \pat_reg[1][3] , 
        \pat_reg[1][2] , \pat_reg[1][1] , \pat_reg[1][0] , \pat_reg[0][7] , 
        \pat_reg[0][6] , \pat_reg[0][5] , \pat_reg[0][4] , \pat_reg[0][3] , 
        \pat_reg[0][2] , \pat_reg[0][1] , \pat_reg[0][0] }), .str_len(str_len), 
        .pat_len({pat_len[3:2], n801, n802}), .c_state(c_state), .ready(ready), 
        .match(match_w), .match_index(match_index_w) );
  DFFRX1 \str_reg_reg[1][0]  ( .D(n764), .CK(clk), .RN(n820), .Q(
        \str_reg[1][0] ), .QN(n107) );
  DFFRX1 \str_reg_reg[2][0]  ( .D(n763), .CK(clk), .RN(n820), .Q(
        \str_reg[2][0] ), .QN(n115) );
  DFFRX1 \str_reg_reg[3][0]  ( .D(n755), .CK(clk), .RN(n820), .Q(
        \str_reg[3][0] ), .QN(n123) );
  DFFRX1 \str_reg_reg[4][0]  ( .D(n747), .CK(clk), .RN(n820), .Q(
        \str_reg[4][0] ), .QN(n131) );
  DFFRX1 \str_reg_reg[5][0]  ( .D(n739), .CK(clk), .RN(n820), .Q(
        \str_reg[5][0] ), .QN(n139) );
  DFFRX1 \str_reg_reg[6][0]  ( .D(n731), .CK(clk), .RN(n820), .Q(
        \str_reg[6][0] ), .QN(n147) );
  DFFRX1 \str_reg_reg[7][0]  ( .D(n723), .CK(clk), .RN(n820), .Q(
        \str_reg[7][0] ), .QN(n155) );
  DFFRX1 \str_reg_reg[8][0]  ( .D(n715), .CK(clk), .RN(n820), .Q(
        \str_reg[8][0] ), .QN(n163) );
  DFFRX1 \str_reg_reg[9][0]  ( .D(n707), .CK(clk), .RN(n820), .Q(
        \str_reg[9][0] ), .QN(n171) );
  DFFRX1 \str_reg_reg[10][0]  ( .D(n699), .CK(clk), .RN(n819), .Q(
        \str_reg[10][0] ), .QN(n179) );
  DFFRX1 \str_reg_reg[11][0]  ( .D(n691), .CK(clk), .RN(n819), .Q(
        \str_reg[11][0] ), .QN(n187) );
  DFFRX1 \str_reg_reg[12][0]  ( .D(n683), .CK(clk), .RN(n819), .Q(
        \str_reg[12][0] ), .QN(n195) );
  DFFRX1 \str_reg_reg[13][0]  ( .D(n675), .CK(clk), .RN(n819), .Q(
        \str_reg[13][0] ), .QN(n203) );
  DFFRX1 \str_reg_reg[14][0]  ( .D(n667), .CK(clk), .RN(n819), .Q(
        \str_reg[14][0] ), .QN(n211) );
  DFFRX1 \str_reg_reg[15][0]  ( .D(n659), .CK(clk), .RN(n819), .Q(
        \str_reg[15][0] ), .QN(n219) );
  DFFRX1 \str_reg_reg[16][0]  ( .D(n651), .CK(clk), .RN(n819), .Q(
        \str_reg[16][0] ), .QN(n227) );
  DFFRX1 \str_reg_reg[17][0]  ( .D(n643), .CK(clk), .RN(n819), .Q(
        \str_reg[17][0] ), .QN(n235) );
  DFFRX1 \str_reg_reg[18][0]  ( .D(n635), .CK(clk), .RN(n819), .Q(
        \str_reg[18][0] ), .QN(n243) );
  DFFRX1 \str_reg_reg[19][0]  ( .D(n627), .CK(clk), .RN(n819), .Q(
        \str_reg[19][0] ), .QN(n251) );
  DFFRX1 \str_reg_reg[20][0]  ( .D(n619), .CK(clk), .RN(n819), .Q(
        \str_reg[20][0] ), .QN(n259) );
  DFFRX1 \str_reg_reg[21][0]  ( .D(n611), .CK(clk), .RN(n819), .Q(
        \str_reg[21][0] ), .QN(n267) );
  DFFRX1 \str_reg_reg[22][0]  ( .D(n603), .CK(clk), .RN(n818), .Q(
        \str_reg[22][0] ), .QN(n275) );
  DFFRX1 \str_reg_reg[23][0]  ( .D(n595), .CK(clk), .RN(n818), .Q(
        \str_reg[23][0] ), .QN(n283) );
  DFFRX1 \str_reg_reg[26][0]  ( .D(n571), .CK(clk), .RN(n818), .Q(
        \str_reg[26][0] ), .QN(n307) );
  DFFRX1 \str_reg_reg[30][0]  ( .D(n539), .CK(clk), .RN(n818), .Q(
        \str_reg[30][0] ), .QN(n339) );
  DFFRX1 \str_reg_reg[32][0]  ( .D(n523), .CK(clk), .RN(n818), .Q(
        \str_reg[32][0] ), .QN(n355) );
  DFFRX1 \str_reg_reg[1][1]  ( .D(n765), .CK(clk), .RN(n817), .Q(
        \str_reg[1][1] ), .QN(n106) );
  DFFRX1 \str_reg_reg[2][1]  ( .D(n762), .CK(clk), .RN(n817), .Q(
        \str_reg[2][1] ), .QN(n114) );
  DFFRX1 \str_reg_reg[3][1]  ( .D(n754), .CK(clk), .RN(n817), .Q(
        \str_reg[3][1] ), .QN(n122) );
  DFFRX1 \str_reg_reg[4][1]  ( .D(n746), .CK(clk), .RN(n817), .Q(
        \str_reg[4][1] ), .QN(n130) );
  DFFRX1 \str_reg_reg[5][1]  ( .D(n738), .CK(clk), .RN(n817), .Q(
        \str_reg[5][1] ), .QN(n138) );
  DFFRX1 \str_reg_reg[6][1]  ( .D(n730), .CK(clk), .RN(n817), .Q(
        \str_reg[6][1] ), .QN(n146) );
  DFFRX1 \str_reg_reg[7][1]  ( .D(n722), .CK(clk), .RN(n817), .Q(
        \str_reg[7][1] ), .QN(n154) );
  DFFRX1 \str_reg_reg[8][1]  ( .D(n714), .CK(clk), .RN(n817), .Q(
        \str_reg[8][1] ), .QN(n162) );
  DFFRX1 \str_reg_reg[9][1]  ( .D(n706), .CK(clk), .RN(n817), .Q(
        \str_reg[9][1] ), .QN(n170) );
  DFFRX1 \str_reg_reg[10][1]  ( .D(n698), .CK(clk), .RN(n817), .Q(
        \str_reg[10][1] ), .QN(n178) );
  DFFRX1 \str_reg_reg[11][1]  ( .D(n690), .CK(clk), .RN(n817), .Q(
        \str_reg[11][1] ), .QN(n186) );
  DFFRX1 \str_reg_reg[12][1]  ( .D(n682), .CK(clk), .RN(n817), .Q(
        \str_reg[12][1] ), .QN(n194) );
  DFFRX1 \str_reg_reg[13][1]  ( .D(n674), .CK(clk), .RN(n816), .Q(
        \str_reg[13][1] ), .QN(n202) );
  DFFRX1 \str_reg_reg[14][1]  ( .D(n666), .CK(clk), .RN(n816), .Q(
        \str_reg[14][1] ), .QN(n210) );
  DFFRX1 \str_reg_reg[15][1]  ( .D(n658), .CK(clk), .RN(n816), .Q(
        \str_reg[15][1] ), .QN(n218) );
  DFFRX1 \str_reg_reg[16][1]  ( .D(n650), .CK(clk), .RN(n816), .Q(
        \str_reg[16][1] ), .QN(n226) );
  DFFRX1 \str_reg_reg[17][1]  ( .D(n642), .CK(clk), .RN(n816), .Q(
        \str_reg[17][1] ), .QN(n234) );
  DFFRX1 \str_reg_reg[18][1]  ( .D(n634), .CK(clk), .RN(n816), .Q(
        \str_reg[18][1] ), .QN(n242) );
  DFFRX1 \str_reg_reg[19][1]  ( .D(n626), .CK(clk), .RN(n816), .Q(
        \str_reg[19][1] ), .QN(n250) );
  DFFRX1 \str_reg_reg[20][1]  ( .D(n618), .CK(clk), .RN(n816), .Q(
        \str_reg[20][1] ), .QN(n258) );
  DFFRX1 \str_reg_reg[21][1]  ( .D(n610), .CK(clk), .RN(n816), .Q(
        \str_reg[21][1] ), .QN(n266) );
  DFFRX1 \str_reg_reg[22][1]  ( .D(n602), .CK(clk), .RN(n816), .Q(
        \str_reg[22][1] ), .QN(n274) );
  DFFRX1 \str_reg_reg[23][1]  ( .D(n594), .CK(clk), .RN(n816), .Q(
        \str_reg[23][1] ), .QN(n282) );
  DFFRX1 \str_reg_reg[1][2]  ( .D(n766), .CK(clk), .RN(n815), .Q(
        \str_reg[1][2] ), .QN(n105) );
  DFFRX1 \str_reg_reg[2][2]  ( .D(n761), .CK(clk), .RN(n815), .Q(
        \str_reg[2][2] ), .QN(n113) );
  DFFRX1 \str_reg_reg[3][2]  ( .D(n753), .CK(clk), .RN(n815), .Q(
        \str_reg[3][2] ), .QN(n121) );
  DFFRX1 \str_reg_reg[4][2]  ( .D(n745), .CK(clk), .RN(n814), .Q(
        \str_reg[4][2] ), .QN(n129) );
  DFFRX1 \str_reg_reg[5][2]  ( .D(n737), .CK(clk), .RN(n814), .Q(
        \str_reg[5][2] ), .QN(n137) );
  DFFRX1 \str_reg_reg[6][2]  ( .D(n729), .CK(clk), .RN(n814), .Q(
        \str_reg[6][2] ), .QN(n145) );
  DFFRX1 \str_reg_reg[7][2]  ( .D(n721), .CK(clk), .RN(n814), .Q(
        \str_reg[7][2] ), .QN(n153) );
  DFFRX1 \str_reg_reg[8][2]  ( .D(n713), .CK(clk), .RN(n814), .Q(
        \str_reg[8][2] ), .QN(n161) );
  DFFRX1 \str_reg_reg[9][2]  ( .D(n705), .CK(clk), .RN(n814), .Q(
        \str_reg[9][2] ), .QN(n169) );
  DFFRX1 \str_reg_reg[10][2]  ( .D(n697), .CK(clk), .RN(n814), .Q(
        \str_reg[10][2] ), .QN(n177) );
  DFFRX1 \str_reg_reg[11][2]  ( .D(n689), .CK(clk), .RN(n814), .Q(
        \str_reg[11][2] ), .QN(n185) );
  DFFRX1 \str_reg_reg[12][2]  ( .D(n681), .CK(clk), .RN(n814), .Q(
        \str_reg[12][2] ), .QN(n193) );
  DFFRX1 \str_reg_reg[13][2]  ( .D(n673), .CK(clk), .RN(n814), .Q(
        \str_reg[13][2] ), .QN(n201) );
  DFFRX1 \str_reg_reg[14][2]  ( .D(n665), .CK(clk), .RN(n814), .Q(
        \str_reg[14][2] ), .QN(n209) );
  DFFRX1 \str_reg_reg[15][2]  ( .D(n657), .CK(clk), .RN(n814), .Q(
        \str_reg[15][2] ), .QN(n217) );
  DFFRX1 \str_reg_reg[16][2]  ( .D(n649), .CK(clk), .RN(n813), .Q(
        \str_reg[16][2] ), .QN(n225) );
  DFFRX1 \str_reg_reg[17][2]  ( .D(n641), .CK(clk), .RN(n813), .Q(
        \str_reg[17][2] ), .QN(n233) );
  DFFRX1 \str_reg_reg[18][2]  ( .D(n633), .CK(clk), .RN(n813), .Q(
        \str_reg[18][2] ), .QN(n241) );
  DFFRX1 \str_reg_reg[19][2]  ( .D(n625), .CK(clk), .RN(n813), .Q(
        \str_reg[19][2] ), .QN(n249) );
  DFFRX1 \str_reg_reg[20][2]  ( .D(n617), .CK(clk), .RN(n813), .Q(
        \str_reg[20][2] ), .QN(n257) );
  DFFRX1 \str_reg_reg[21][2]  ( .D(n609), .CK(clk), .RN(n813), .Q(
        \str_reg[21][2] ), .QN(n265) );
  DFFRX1 \str_reg_reg[22][2]  ( .D(n601), .CK(clk), .RN(n813), .Q(
        \str_reg[22][2] ), .QN(n273) );
  DFFRX1 \str_reg_reg[23][2]  ( .D(n593), .CK(clk), .RN(n813), .Q(
        \str_reg[23][2] ), .QN(n281) );
  DFFRX1 \str_reg_reg[24][2]  ( .D(n585), .CK(clk), .RN(n813), .Q(
        \str_reg[24][2] ), .QN(n289) );
  DFFRX1 \str_reg_reg[25][2]  ( .D(n577), .CK(clk), .RN(n813), .Q(
        \str_reg[25][2] ), .QN(n297) );
  DFFRX1 \str_reg_reg[27][2]  ( .D(n561), .CK(clk), .RN(n812), .Q(
        \str_reg[27][2] ), .QN(n313) );
  DFFRX1 \str_reg_reg[28][2]  ( .D(n553), .CK(clk), .RN(n812), .Q(
        \str_reg[28][2] ), .QN(n321) );
  DFFRX1 \str_reg_reg[29][2]  ( .D(n545), .CK(clk), .RN(n812), .Q(
        \str_reg[29][2] ), .QN(n329) );
  DFFRX1 \str_reg_reg[31][2]  ( .D(n529), .CK(clk), .RN(n812), .Q(
        \str_reg[31][2] ), .QN(n345) );
  DFFRX1 \str_reg_reg[1][3]  ( .D(n767), .CK(clk), .RN(n812), .Q(
        \str_reg[1][3] ), .QN(n104) );
  DFFRX1 \str_reg_reg[2][3]  ( .D(n760), .CK(clk), .RN(n812), .Q(
        \str_reg[2][3] ), .QN(n112) );
  DFFRX1 \str_reg_reg[3][3]  ( .D(n752), .CK(clk), .RN(n812), .Q(
        \str_reg[3][3] ), .QN(n120) );
  DFFRX1 \str_reg_reg[4][3]  ( .D(n744), .CK(clk), .RN(n812), .Q(
        \str_reg[4][3] ), .QN(n128) );
  DFFRX1 \str_reg_reg[5][3]  ( .D(n736), .CK(clk), .RN(n812), .Q(
        \str_reg[5][3] ), .QN(n136) );
  DFFRX1 \str_reg_reg[6][3]  ( .D(n728), .CK(clk), .RN(n811), .Q(
        \str_reg[6][3] ), .QN(n144) );
  DFFRX1 \str_reg_reg[7][3]  ( .D(n720), .CK(clk), .RN(n811), .Q(
        \str_reg[7][3] ), .QN(n152) );
  DFFRX1 \str_reg_reg[8][3]  ( .D(n712), .CK(clk), .RN(n811), .Q(
        \str_reg[8][3] ), .QN(n160) );
  DFFRX1 \str_reg_reg[9][3]  ( .D(n704), .CK(clk), .RN(n811), .Q(
        \str_reg[9][3] ), .QN(n168) );
  DFFRX1 \str_reg_reg[10][3]  ( .D(n696), .CK(clk), .RN(n811), .Q(
        \str_reg[10][3] ), .QN(n176) );
  DFFRX1 \str_reg_reg[11][3]  ( .D(n688), .CK(clk), .RN(n811), .Q(
        \str_reg[11][3] ), .QN(n184) );
  DFFRX1 \str_reg_reg[12][3]  ( .D(n680), .CK(clk), .RN(n811), .Q(
        \str_reg[12][3] ), .QN(n192) );
  DFFRX1 \str_reg_reg[13][3]  ( .D(n672), .CK(clk), .RN(n811), .Q(
        \str_reg[13][3] ), .QN(n200) );
  DFFRX1 \str_reg_reg[14][3]  ( .D(n664), .CK(clk), .RN(n811), .Q(
        \str_reg[14][3] ), .QN(n208) );
  DFFRX1 \str_reg_reg[15][3]  ( .D(n656), .CK(clk), .RN(n811), .Q(
        \str_reg[15][3] ), .QN(n216) );
  DFFRX1 \str_reg_reg[16][3]  ( .D(n648), .CK(clk), .RN(n811), .Q(
        \str_reg[16][3] ), .QN(n224) );
  DFFRX1 \str_reg_reg[17][3]  ( .D(n640), .CK(clk), .RN(n811), .Q(
        \str_reg[17][3] ), .QN(n232) );
  DFFRX1 \str_reg_reg[18][3]  ( .D(n632), .CK(clk), .RN(n810), .Q(
        \str_reg[18][3] ), .QN(n240) );
  DFFRX1 \str_reg_reg[19][3]  ( .D(n624), .CK(clk), .RN(n810), .Q(
        \str_reg[19][3] ), .QN(n248) );
  DFFRX1 \str_reg_reg[20][3]  ( .D(n616), .CK(clk), .RN(n810), .Q(
        \str_reg[20][3] ), .QN(n256) );
  DFFRX1 \str_reg_reg[21][3]  ( .D(n608), .CK(clk), .RN(n810), .Q(
        \str_reg[21][3] ), .QN(n264) );
  DFFRX1 \str_reg_reg[22][3]  ( .D(n600), .CK(clk), .RN(n810), .Q(
        \str_reg[22][3] ), .QN(n272) );
  DFFRX1 \str_reg_reg[23][3]  ( .D(n592), .CK(clk), .RN(n810), .Q(
        \str_reg[23][3] ), .QN(n280) );
  DFFRX1 \str_reg_reg[24][3]  ( .D(n584), .CK(clk), .RN(n810), .Q(
        \str_reg[24][3] ), .QN(n288) );
  DFFRX1 \str_reg_reg[25][3]  ( .D(n576), .CK(clk), .RN(n810), .Q(
        \str_reg[25][3] ), .QN(n296) );
  DFFRX1 \str_reg_reg[27][3]  ( .D(n560), .CK(clk), .RN(n810), .Q(
        \str_reg[27][3] ), .QN(n312) );
  DFFRX1 \str_reg_reg[28][3]  ( .D(n552), .CK(clk), .RN(n810), .Q(
        \str_reg[28][3] ), .QN(n320) );
  DFFRX1 \str_reg_reg[29][3]  ( .D(n544), .CK(clk), .RN(n810), .Q(
        \str_reg[29][3] ), .QN(n328) );
  DFFRX1 \str_reg_reg[31][3]  ( .D(n528), .CK(clk), .RN(n809), .Q(
        \str_reg[31][3] ), .QN(n344) );
  DFFRX1 \str_reg_reg[1][4]  ( .D(n768), .CK(clk), .RN(n809), .Q(
        \str_reg[1][4] ), .QN(n103) );
  DFFRX1 \str_reg_reg[2][4]  ( .D(n759), .CK(clk), .RN(n809), .Q(
        \str_reg[2][4] ), .QN(n111) );
  DFFRX1 \str_reg_reg[3][4]  ( .D(n751), .CK(clk), .RN(n809), .Q(
        \str_reg[3][4] ), .QN(n119) );
  DFFRX1 \str_reg_reg[4][4]  ( .D(n743), .CK(clk), .RN(n809), .Q(
        \str_reg[4][4] ), .QN(n127) );
  DFFRX1 \str_reg_reg[5][4]  ( .D(n735), .CK(clk), .RN(n809), .Q(
        \str_reg[5][4] ), .QN(n135) );
  DFFRX1 \str_reg_reg[6][4]  ( .D(n727), .CK(clk), .RN(n809), .Q(
        \str_reg[6][4] ), .QN(n143) );
  DFFRX1 \str_reg_reg[7][4]  ( .D(n719), .CK(clk), .RN(n809), .Q(
        \str_reg[7][4] ), .QN(n151) );
  DFFRX1 \str_reg_reg[8][4]  ( .D(n711), .CK(clk), .RN(n809), .Q(
        \str_reg[8][4] ), .QN(n159) );
  DFFRX1 \str_reg_reg[9][4]  ( .D(n703), .CK(clk), .RN(n808), .Q(
        \str_reg[9][4] ), .QN(n167) );
  DFFRX1 \str_reg_reg[10][4]  ( .D(n695), .CK(clk), .RN(n808), .Q(
        \str_reg[10][4] ), .QN(n175) );
  DFFRX1 \str_reg_reg[11][4]  ( .D(n687), .CK(clk), .RN(n808), .Q(
        \str_reg[11][4] ), .QN(n183) );
  DFFRX1 \str_reg_reg[12][4]  ( .D(n679), .CK(clk), .RN(n808), .Q(
        \str_reg[12][4] ), .QN(n191) );
  DFFRX1 \str_reg_reg[13][4]  ( .D(n671), .CK(clk), .RN(n808), .Q(
        \str_reg[13][4] ), .QN(n199) );
  DFFRX1 \str_reg_reg[14][4]  ( .D(n663), .CK(clk), .RN(n808), .Q(
        \str_reg[14][4] ), .QN(n207) );
  DFFRX1 \str_reg_reg[15][4]  ( .D(n655), .CK(clk), .RN(n808), .Q(
        \str_reg[15][4] ), .QN(n215) );
  DFFRX1 \str_reg_reg[16][4]  ( .D(n647), .CK(clk), .RN(n808), .Q(
        \str_reg[16][4] ), .QN(n223) );
  DFFRX1 \str_reg_reg[17][4]  ( .D(n639), .CK(clk), .RN(n808), .Q(
        \str_reg[17][4] ), .QN(n231) );
  DFFRX1 \str_reg_reg[18][4]  ( .D(n631), .CK(clk), .RN(n808), .Q(
        \str_reg[18][4] ), .QN(n239) );
  DFFRX1 \str_reg_reg[19][4]  ( .D(n623), .CK(clk), .RN(n808), .Q(
        \str_reg[19][4] ), .QN(n247) );
  DFFRX1 \str_reg_reg[20][4]  ( .D(n615), .CK(clk), .RN(n808), .Q(
        \str_reg[20][4] ), .QN(n255) );
  DFFRX1 \str_reg_reg[21][4]  ( .D(n607), .CK(clk), .RN(n807), .Q(
        \str_reg[21][4] ), .QN(n263) );
  DFFRX1 \str_reg_reg[22][4]  ( .D(n599), .CK(clk), .RN(n807), .Q(
        \str_reg[22][4] ), .QN(n271) );
  DFFRX1 \str_reg_reg[23][4]  ( .D(n591), .CK(clk), .RN(n807), .Q(
        \str_reg[23][4] ), .QN(n279) );
  DFFRX1 \str_reg_reg[26][4]  ( .D(n567), .CK(clk), .RN(n807), .Q(
        \str_reg[26][4] ), .QN(n303) );
  DFFRX1 \str_reg_reg[30][4]  ( .D(n535), .CK(clk), .RN(n807), .Q(
        \str_reg[30][4] ), .QN(n335) );
  DFFRX1 \str_reg_reg[32][4]  ( .D(n519), .CK(clk), .RN(n807), .Q(
        \str_reg[32][4] ), .QN(n351) );
  DFFRX1 \str_reg_reg[2][5]  ( .D(n758), .CK(clk), .RN(n806), .Q(
        \str_reg[2][5] ), .QN(n110) );
  DFFRX1 \str_reg_reg[3][5]  ( .D(n750), .CK(clk), .RN(n806), .Q(
        \str_reg[3][5] ), .QN(n118) );
  DFFRX1 \str_reg_reg[4][5]  ( .D(n742), .CK(clk), .RN(n806), .Q(
        \str_reg[4][5] ), .QN(n126) );
  DFFRX1 \str_reg_reg[5][5]  ( .D(n734), .CK(clk), .RN(n806), .Q(
        \str_reg[5][5] ), .QN(n134) );
  DFFRX1 \str_reg_reg[6][5]  ( .D(n726), .CK(clk), .RN(n806), .Q(
        \str_reg[6][5] ), .QN(n142) );
  DFFRX1 \str_reg_reg[7][5]  ( .D(n718), .CK(clk), .RN(n806), .Q(
        \str_reg[7][5] ), .QN(n150) );
  DFFRX1 \str_reg_reg[8][5]  ( .D(n710), .CK(clk), .RN(n806), .Q(
        \str_reg[8][5] ), .QN(n158) );
  DFFRX1 \str_reg_reg[9][5]  ( .D(n702), .CK(clk), .RN(n806), .Q(
        \str_reg[9][5] ), .QN(n166) );
  DFFRX1 \str_reg_reg[10][5]  ( .D(n694), .CK(clk), .RN(n806), .Q(
        \str_reg[10][5] ), .QN(n174) );
  DFFRX1 \str_reg_reg[11][5]  ( .D(n686), .CK(clk), .RN(n806), .Q(
        \str_reg[11][5] ), .QN(n182) );
  DFFRX1 \str_reg_reg[12][5]  ( .D(n678), .CK(clk), .RN(n813), .Q(
        \str_reg[12][5] ), .QN(n190) );
  DFFRX1 \str_reg_reg[13][5]  ( .D(n670), .CK(clk), .RN(n868), .Q(
        \str_reg[13][5] ), .QN(n198) );
  DFFRX1 \str_reg_reg[14][5]  ( .D(n662), .CK(clk), .RN(n868), .Q(
        \str_reg[14][5] ), .QN(n206) );
  DFFRX1 \str_reg_reg[15][5]  ( .D(n654), .CK(clk), .RN(n868), .Q(
        \str_reg[15][5] ), .QN(n214) );
  DFFRX1 \str_reg_reg[16][5]  ( .D(n646), .CK(clk), .RN(n868), .Q(
        \str_reg[16][5] ), .QN(n222) );
  DFFRX1 \str_reg_reg[17][5]  ( .D(n638), .CK(clk), .RN(n835), .Q(
        \str_reg[17][5] ), .QN(n230) );
  DFFRX1 \str_reg_reg[18][5]  ( .D(n630), .CK(clk), .RN(n835), .Q(
        \str_reg[18][5] ), .QN(n238) );
  DFFRX1 \str_reg_reg[19][5]  ( .D(n622), .CK(clk), .RN(n835), .Q(
        \str_reg[19][5] ), .QN(n246) );
  DFFRX1 \str_reg_reg[20][5]  ( .D(n614), .CK(clk), .RN(n835), .Q(
        \str_reg[20][5] ), .QN(n254) );
  DFFRX1 \str_reg_reg[21][5]  ( .D(n606), .CK(clk), .RN(n835), .Q(
        \str_reg[21][5] ), .QN(n262) );
  DFFRX1 \str_reg_reg[22][5]  ( .D(n598), .CK(clk), .RN(n835), .Q(
        \str_reg[22][5] ), .QN(n270) );
  DFFRX1 \str_reg_reg[23][5]  ( .D(n590), .CK(clk), .RN(n835), .Q(
        \str_reg[23][5] ), .QN(n278) );
  DFFRX1 \str_reg_reg[24][5]  ( .D(n582), .CK(clk), .RN(n835), .Q(
        \str_reg[24][5] ), .QN(n286) );
  DFFRX1 \str_reg_reg[25][5]  ( .D(n574), .CK(clk), .RN(n835), .Q(
        \str_reg[25][5] ), .QN(n294) );
  DFFRX1 \str_reg_reg[26][5]  ( .D(n566), .CK(clk), .RN(n835), .Q(
        \str_reg[26][5] ), .QN(n302) );
  DFFRX1 \str_reg_reg[27][5]  ( .D(n558), .CK(clk), .RN(n835), .Q(
        \str_reg[27][5] ), .QN(n310) );
  DFFRX1 \str_reg_reg[28][5]  ( .D(n550), .CK(clk), .RN(n835), .Q(
        \str_reg[28][5] ), .QN(n318) );
  DFFRX1 \str_reg_reg[29][5]  ( .D(n542), .CK(clk), .RN(n834), .Q(
        \str_reg[29][5] ), .QN(n326) );
  DFFRX1 \str_reg_reg[30][5]  ( .D(n534), .CK(clk), .RN(n834), .Q(
        \str_reg[30][5] ), .QN(n334) );
  DFFRX1 \str_reg_reg[31][5]  ( .D(n526), .CK(clk), .RN(n834), .Q(
        \str_reg[31][5] ), .QN(n342) );
  DFFRX1 \str_reg_reg[32][5]  ( .D(n518), .CK(clk), .RN(n834), .Q(
        \str_reg[32][5] ), .QN(n350) );
  DFFRX1 \str_reg_reg[1][6]  ( .D(n770), .CK(clk), .RN(n834), .Q(
        \str_reg[1][6] ), .QN(n101) );
  DFFRX1 \str_reg_reg[2][6]  ( .D(n757), .CK(clk), .RN(n834), .Q(
        \str_reg[2][6] ), .QN(n109) );
  DFFRX1 \str_reg_reg[3][6]  ( .D(n749), .CK(clk), .RN(n834), .Q(
        \str_reg[3][6] ), .QN(n117) );
  DFFRX1 \str_reg_reg[4][6]  ( .D(n741), .CK(clk), .RN(n834), .Q(
        \str_reg[4][6] ), .QN(n125) );
  DFFRX1 \str_reg_reg[5][6]  ( .D(n733), .CK(clk), .RN(n834), .Q(
        \str_reg[5][6] ), .QN(n133) );
  DFFRX1 \str_reg_reg[6][6]  ( .D(n725), .CK(clk), .RN(n834), .Q(
        \str_reg[6][6] ), .QN(n141) );
  DFFRX1 \str_reg_reg[7][6]  ( .D(n717), .CK(clk), .RN(n834), .Q(
        \str_reg[7][6] ), .QN(n149) );
  DFFRX1 \str_reg_reg[8][6]  ( .D(n709), .CK(clk), .RN(n833), .Q(
        \str_reg[8][6] ), .QN(n157) );
  DFFRX1 \str_reg_reg[9][6]  ( .D(n701), .CK(clk), .RN(n833), .Q(
        \str_reg[9][6] ), .QN(n165) );
  DFFRX1 \str_reg_reg[10][6]  ( .D(n693), .CK(clk), .RN(n833), .Q(
        \str_reg[10][6] ), .QN(n173) );
  DFFRX1 \str_reg_reg[11][6]  ( .D(n685), .CK(clk), .RN(n833), .Q(
        \str_reg[11][6] ), .QN(n181) );
  DFFRX1 \str_reg_reg[12][6]  ( .D(n677), .CK(clk), .RN(n833), .Q(
        \str_reg[12][6] ), .QN(n189) );
  DFFRX1 \str_reg_reg[13][6]  ( .D(n669), .CK(clk), .RN(n833), .Q(
        \str_reg[13][6] ), .QN(n197) );
  DFFRX1 \str_reg_reg[14][6]  ( .D(n661), .CK(clk), .RN(n833), .Q(
        \str_reg[14][6] ), .QN(n205) );
  DFFRX1 \str_reg_reg[15][6]  ( .D(n653), .CK(clk), .RN(n833), .Q(
        \str_reg[15][6] ), .QN(n213) );
  DFFRX1 \str_reg_reg[16][6]  ( .D(n645), .CK(clk), .RN(n833), .Q(
        \str_reg[16][6] ), .QN(n221) );
  DFFRX1 \str_reg_reg[17][6]  ( .D(n637), .CK(clk), .RN(n833), .Q(
        \str_reg[17][6] ), .QN(n229) );
  DFFRX1 \str_reg_reg[18][6]  ( .D(n629), .CK(clk), .RN(n833), .Q(
        \str_reg[18][6] ), .QN(n237) );
  DFFRX1 \str_reg_reg[19][6]  ( .D(n621), .CK(clk), .RN(n833), .Q(
        \str_reg[19][6] ), .QN(n245) );
  DFFRX1 \str_reg_reg[20][6]  ( .D(n613), .CK(clk), .RN(n832), .Q(
        \str_reg[20][6] ), .QN(n253) );
  DFFRX1 \str_reg_reg[21][6]  ( .D(n605), .CK(clk), .RN(n832), .Q(
        \str_reg[21][6] ), .QN(n261) );
  DFFRX1 \str_reg_reg[22][6]  ( .D(n597), .CK(clk), .RN(n832), .Q(
        \str_reg[22][6] ), .QN(n269) );
  DFFRX1 \str_reg_reg[23][6]  ( .D(n589), .CK(clk), .RN(n832), .Q(
        \str_reg[23][6] ), .QN(n277) );
  DFFRX1 \str_reg_reg[1][7]  ( .D(n771), .CK(clk), .RN(n831), .Q(
        \str_reg[1][7] ), .QN(n100) );
  DFFRX1 \str_reg_reg[2][7]  ( .D(n756), .CK(clk), .RN(n831), .Q(
        \str_reg[2][7] ), .QN(n108) );
  DFFRX1 \str_reg_reg[3][7]  ( .D(n748), .CK(clk), .RN(n831), .Q(
        \str_reg[3][7] ), .QN(n116) );
  DFFRX1 \str_reg_reg[4][7]  ( .D(n740), .CK(clk), .RN(n831), .Q(
        \str_reg[4][7] ), .QN(n124) );
  DFFRX1 \str_reg_reg[5][7]  ( .D(n732), .CK(clk), .RN(n831), .Q(
        \str_reg[5][7] ), .QN(n132) );
  DFFRX1 \str_reg_reg[6][7]  ( .D(n724), .CK(clk), .RN(n831), .Q(
        \str_reg[6][7] ), .QN(n140) );
  DFFRX1 \str_reg_reg[7][7]  ( .D(n716), .CK(clk), .RN(n831), .Q(
        \str_reg[7][7] ), .QN(n148) );
  DFFRX1 \str_reg_reg[8][7]  ( .D(n708), .CK(clk), .RN(n831), .Q(
        \str_reg[8][7] ), .QN(n156) );
  DFFRX1 \str_reg_reg[9][7]  ( .D(n700), .CK(clk), .RN(n831), .Q(
        \str_reg[9][7] ), .QN(n164) );
  DFFRX1 \str_reg_reg[10][7]  ( .D(n692), .CK(clk), .RN(n831), .Q(
        \str_reg[10][7] ), .QN(n172) );
  DFFRX1 \str_reg_reg[11][7]  ( .D(n684), .CK(clk), .RN(n830), .Q(
        \str_reg[11][7] ), .QN(n180) );
  DFFRX1 \str_reg_reg[12][7]  ( .D(n676), .CK(clk), .RN(n830), .Q(
        \str_reg[12][7] ), .QN(n188) );
  DFFRX1 \str_reg_reg[13][7]  ( .D(n668), .CK(clk), .RN(n830), .Q(
        \str_reg[13][7] ), .QN(n196) );
  DFFRX1 \str_reg_reg[14][7]  ( .D(n660), .CK(clk), .RN(n830), .Q(
        \str_reg[14][7] ), .QN(n204) );
  DFFRX1 \str_reg_reg[15][7]  ( .D(n652), .CK(clk), .RN(n830), .Q(
        \str_reg[15][7] ), .QN(n212) );
  DFFRX1 \str_reg_reg[16][7]  ( .D(n644), .CK(clk), .RN(n830), .Q(
        \str_reg[16][7] ), .QN(n220) );
  DFFRX1 \str_reg_reg[17][7]  ( .D(n636), .CK(clk), .RN(n830), .Q(
        \str_reg[17][7] ), .QN(n228) );
  DFFRX1 \str_reg_reg[18][7]  ( .D(n628), .CK(clk), .RN(n830), .Q(
        \str_reg[18][7] ), .QN(n236) );
  DFFRX1 \str_reg_reg[19][7]  ( .D(n620), .CK(clk), .RN(n830), .Q(
        \str_reg[19][7] ), .QN(n244) );
  DFFRX1 \str_reg_reg[20][7]  ( .D(n612), .CK(clk), .RN(n830), .Q(
        \str_reg[20][7] ), .QN(n252) );
  DFFRX1 \str_reg_reg[21][7]  ( .D(n604), .CK(clk), .RN(n830), .Q(
        \str_reg[21][7] ), .QN(n260) );
  DFFRX1 \str_reg_reg[22][7]  ( .D(n596), .CK(clk), .RN(n830), .Q(
        \str_reg[22][7] ), .QN(n268) );
  DFFRX1 \str_reg_reg[23][7]  ( .D(n588), .CK(clk), .RN(n829), .Q(
        \str_reg[23][7] ), .QN(n276) );
  DFFSX1 \str_reg_reg[1][5]  ( .D(n769), .CK(clk), .SN(n868), .Q(
        \str_reg[1][5] ), .QN(n102) );
  DFFRX1 \str_reg_reg[24][0]  ( .D(n587), .CK(clk), .RN(n818), .Q(
        \str_reg[24][0] ), .QN(n291) );
  DFFRX1 \str_reg_reg[25][0]  ( .D(n579), .CK(clk), .RN(n818), .Q(
        \str_reg[25][0] ), .QN(n299) );
  DFFRX1 \str_reg_reg[27][0]  ( .D(n563), .CK(clk), .RN(n818), .Q(
        \str_reg[27][0] ), .QN(n315) );
  DFFRX1 \str_reg_reg[28][0]  ( .D(n555), .CK(clk), .RN(n818), .Q(
        \str_reg[28][0] ), .QN(n323) );
  DFFRX1 \str_reg_reg[29][0]  ( .D(n547), .CK(clk), .RN(n818), .Q(
        \str_reg[29][0] ), .QN(n331) );
  DFFRX1 \str_reg_reg[31][0]  ( .D(n531), .CK(clk), .RN(n818), .Q(
        \str_reg[31][0] ), .QN(n347) );
  DFFRX1 \str_reg_reg[24][1]  ( .D(n586), .CK(clk), .RN(n816), .Q(
        \str_reg[24][1] ), .QN(n290) );
  DFFRX1 \str_reg_reg[25][1]  ( .D(n578), .CK(clk), .RN(n815), .Q(
        \str_reg[25][1] ), .QN(n298) );
  DFFRX1 \str_reg_reg[26][1]  ( .D(n570), .CK(clk), .RN(n815), .Q(
        \str_reg[26][1] ), .QN(n306) );
  DFFRX1 \str_reg_reg[27][1]  ( .D(n562), .CK(clk), .RN(n815), .Q(
        \str_reg[27][1] ), .QN(n314) );
  DFFRX1 \str_reg_reg[28][1]  ( .D(n554), .CK(clk), .RN(n815), .Q(
        \str_reg[28][1] ), .QN(n322) );
  DFFRX1 \str_reg_reg[29][1]  ( .D(n546), .CK(clk), .RN(n815), .Q(
        \str_reg[29][1] ), .QN(n330) );
  DFFRX1 \str_reg_reg[30][1]  ( .D(n538), .CK(clk), .RN(n815), .Q(
        \str_reg[30][1] ), .QN(n338) );
  DFFRX1 \str_reg_reg[31][1]  ( .D(n530), .CK(clk), .RN(n815), .Q(
        \str_reg[31][1] ), .QN(n346) );
  DFFRX1 \str_reg_reg[32][1]  ( .D(n522), .CK(clk), .RN(n815), .Q(
        \str_reg[32][1] ), .QN(n354) );
  DFFRX1 \str_reg_reg[26][2]  ( .D(n569), .CK(clk), .RN(n813), .Q(
        \str_reg[26][2] ), .QN(n305) );
  DFFRX1 \str_reg_reg[30][2]  ( .D(n537), .CK(clk), .RN(n812), .Q(
        \str_reg[30][2] ), .QN(n337) );
  DFFRX1 \str_reg_reg[32][2]  ( .D(n521), .CK(clk), .RN(n812), .Q(
        \str_reg[32][2] ), .QN(n353) );
  DFFRX1 \str_reg_reg[26][3]  ( .D(n568), .CK(clk), .RN(n810), .Q(
        \str_reg[26][3] ), .QN(n304) );
  DFFRX1 \str_reg_reg[30][3]  ( .D(n536), .CK(clk), .RN(n809), .Q(
        \str_reg[30][3] ), .QN(n336) );
  DFFRX1 \str_reg_reg[32][3]  ( .D(n520), .CK(clk), .RN(n809), .Q(
        \str_reg[32][3] ), .QN(n352) );
  DFFRX1 \str_reg_reg[24][4]  ( .D(n583), .CK(clk), .RN(n807), .Q(
        \str_reg[24][4] ), .QN(n287) );
  DFFRX1 \str_reg_reg[25][4]  ( .D(n575), .CK(clk), .RN(n807), .Q(
        \str_reg[25][4] ), .QN(n295) );
  DFFRX1 \str_reg_reg[27][4]  ( .D(n559), .CK(clk), .RN(n807), .Q(
        \str_reg[27][4] ), .QN(n311) );
  DFFRX1 \str_reg_reg[28][4]  ( .D(n551), .CK(clk), .RN(n807), .Q(
        \str_reg[28][4] ), .QN(n319) );
  DFFRX1 \str_reg_reg[29][4]  ( .D(n543), .CK(clk), .RN(n807), .Q(
        \str_reg[29][4] ), .QN(n327) );
  DFFRX1 \str_reg_reg[31][4]  ( .D(n527), .CK(clk), .RN(n807), .Q(
        \str_reg[31][4] ), .QN(n343) );
  DFFRX1 \str_reg_reg[24][6]  ( .D(n581), .CK(clk), .RN(n832), .Q(
        \str_reg[24][6] ), .QN(n285) );
  DFFRX1 \str_reg_reg[25][6]  ( .D(n573), .CK(clk), .RN(n832), .Q(
        \str_reg[25][6] ), .QN(n293) );
  DFFRX1 \str_reg_reg[26][6]  ( .D(n565), .CK(clk), .RN(n832), .Q(
        \str_reg[26][6] ), .QN(n301) );
  DFFRX1 \str_reg_reg[27][6]  ( .D(n557), .CK(clk), .RN(n832), .Q(
        \str_reg[27][6] ), .QN(n309) );
  DFFRX1 \str_reg_reg[28][6]  ( .D(n549), .CK(clk), .RN(n832), .Q(
        \str_reg[28][6] ), .QN(n317) );
  DFFRX1 \str_reg_reg[29][6]  ( .D(n541), .CK(clk), .RN(n832), .Q(
        \str_reg[29][6] ), .QN(n325) );
  DFFRX1 \str_reg_reg[30][6]  ( .D(n533), .CK(clk), .RN(n832), .Q(
        \str_reg[30][6] ), .QN(n333) );
  DFFRX1 \str_reg_reg[31][6]  ( .D(n525), .CK(clk), .RN(n832), .Q(
        \str_reg[31][6] ), .QN(n341) );
  DFFRX1 \str_reg_reg[32][6]  ( .D(n517), .CK(clk), .RN(n831), .Q(
        \str_reg[32][6] ), .QN(n349) );
  DFFRX1 \str_reg_reg[24][7]  ( .D(n580), .CK(clk), .RN(n829), .Q(
        \str_reg[24][7] ), .QN(n284) );
  DFFRX1 \str_reg_reg[25][7]  ( .D(n572), .CK(clk), .RN(n829), .Q(
        \str_reg[25][7] ), .QN(n292) );
  DFFRX1 \str_reg_reg[26][7]  ( .D(n564), .CK(clk), .RN(n829), .Q(
        \str_reg[26][7] ), .QN(n300) );
  DFFRX1 \str_reg_reg[27][7]  ( .D(n556), .CK(clk), .RN(n829), .Q(
        \str_reg[27][7] ), .QN(n308) );
  DFFRX1 \str_reg_reg[28][7]  ( .D(n548), .CK(clk), .RN(n829), .Q(
        \str_reg[28][7] ), .QN(n316) );
  DFFRX1 \str_reg_reg[29][7]  ( .D(n540), .CK(clk), .RN(n829), .Q(
        \str_reg[29][7] ), .QN(n324) );
  DFFRX1 \str_reg_reg[30][7]  ( .D(n532), .CK(clk), .RN(n829), .Q(
        \str_reg[30][7] ), .QN(n332) );
  DFFRX1 \str_reg_reg[31][7]  ( .D(n524), .CK(clk), .RN(n829), .Q(
        \str_reg[31][7] ), .QN(n340) );
  DFFRX1 \str_reg_reg[32][7]  ( .D(n516), .CK(clk), .RN(n829), .Q(
        \str_reg[32][7] ), .QN(n348) );
  DFFRX1 \str_reg_reg[33][0]  ( .D(n515), .CK(clk), .RN(n818), .Q(
        \str_reg[33][0] ) );
  DFFRX1 \str_reg_reg[33][1]  ( .D(n514), .CK(clk), .RN(n815), .Q(
        \str_reg[33][1] ) );
  DFFRX1 \str_reg_reg[33][2]  ( .D(n513), .CK(clk), .RN(n812), .Q(
        \str_reg[33][2] ) );
  DFFRX1 \str_reg_reg[33][3]  ( .D(n512), .CK(clk), .RN(n809), .Q(
        \str_reg[33][3] ) );
  DFFRX1 \str_reg_reg[33][4]  ( .D(n511), .CK(clk), .RN(n806), .Q(
        \str_reg[33][4] ) );
  DFFRX1 \str_reg_reg[33][5]  ( .D(n510), .CK(clk), .RN(n834), .Q(
        \str_reg[33][5] ) );
  DFFRX1 \str_reg_reg[33][6]  ( .D(n509), .CK(clk), .RN(n831), .Q(
        \str_reg[33][6] ) );
  DFFRX1 \str_reg_reg[33][7]  ( .D(n508), .CK(clk), .RN(n829), .Q(
        \str_reg[33][7] ) );
  DFFRX1 \str_len_reg[5]  ( .D(N825), .CK(clk), .RN(n828), .Q(str_len[5]) );
  DFFRX1 \str_len_reg[4]  ( .D(N824), .CK(clk), .RN(n828), .Q(str_len[4]) );
  DFFRX1 \pat_reg_reg[2][7]  ( .D(n444), .CK(clk), .RN(n827), .Q(
        \pat_reg[2][7] ) );
  DFFRX1 \pat_reg_reg[6][7]  ( .D(n476), .CK(clk), .RN(n824), .Q(
        \pat_reg[6][7] ) );
  DFFRX1 \pat_reg_reg[8][7]  ( .D(n492), .CK(clk), .RN(n823), .Q(
        \pat_reg[8][7] ) );
  DFFRX1 \str_len_reg[3]  ( .D(N823), .CK(clk), .RN(n828), .Q(str_len[3]) );
  DFFRX1 \pat_reg_reg[9][7]  ( .D(n500), .CK(clk), .RN(n822), .Q(
        \pat_reg[9][7] ) );
  DFFRX1 \pat_reg_reg[3][0]  ( .D(n458), .CK(clk), .RN(n826), .Q(
        \pat_reg[3][0] ) );
  DFFRX1 \pat_reg_reg[4][0]  ( .D(n466), .CK(clk), .RN(n825), .Q(
        \pat_reg[4][0] ) );
  DFFRX1 \pat_reg_reg[5][0]  ( .D(n474), .CK(clk), .RN(n824), .Q(
        \pat_reg[5][0] ) );
  DFFRX1 \pat_reg_reg[7][0]  ( .D(n491), .CK(clk), .RN(n823), .Q(
        \pat_reg[7][0] ) );
  DFFRX1 \pat_reg_reg[2][2]  ( .D(n449), .CK(clk), .RN(n826), .Q(
        \pat_reg[2][2] ) );
  DFFRX1 \pat_reg_reg[6][2]  ( .D(n481), .CK(clk), .RN(n824), .Q(
        \pat_reg[6][2] ) );
  DFFRX1 \pat_reg_reg[8][2]  ( .D(n497), .CK(clk), .RN(n822), .Q(
        \pat_reg[8][2] ) );
  DFFRX1 \pat_reg_reg[2][0]  ( .D(n450), .CK(clk), .RN(n826), .Q(
        \pat_reg[2][0] ) );
  DFFRX1 \pat_reg_reg[6][0]  ( .D(n483), .CK(clk), .RN(n823), .Q(
        \pat_reg[6][0] ) );
  DFFRX1 \pat_reg_reg[9][2]  ( .D(n505), .CK(clk), .RN(n822), .Q(
        \pat_reg[9][2] ) );
  DFFRX1 \pat_reg_reg[9][0]  ( .D(n507), .CK(clk), .RN(n821), .Q(
        \pat_reg[9][0] ) );
  DFFRX1 \pat_reg_reg[8][0]  ( .D(n499), .CK(clk), .RN(n822), .Q(
        \pat_reg[8][0] ) );
  DFFRX1 \pat_reg_reg[3][2]  ( .D(n457), .CK(clk), .RN(n826), .Q(
        \pat_reg[3][2] ) );
  DFFRX1 \pat_reg_reg[4][2]  ( .D(n465), .CK(clk), .RN(n825), .Q(
        \pat_reg[4][2] ) );
  DFFRX1 \pat_reg_reg[5][2]  ( .D(n473), .CK(clk), .RN(n824), .Q(
        \pat_reg[5][2] ) );
  DFFRX1 \pat_reg_reg[7][2]  ( .D(n489), .CK(clk), .RN(n823), .Q(
        \pat_reg[7][2] ) );
  DFFRX1 \pat_reg_reg[9][6]  ( .D(n501), .CK(clk), .RN(n822), .Q(
        \pat_reg[9][6] ) );
  DFFRX1 \pat_reg_reg[3][7]  ( .D(n452), .CK(clk), .RN(n826), .Q(
        \pat_reg[3][7] ) );
  DFFRX1 \pat_reg_reg[4][7]  ( .D(n460), .CK(clk), .RN(n825), .Q(
        \pat_reg[4][7] ) );
  DFFRX1 \pat_reg_reg[5][7]  ( .D(n468), .CK(clk), .RN(n825), .Q(
        \pat_reg[5][7] ) );
  DFFRX1 \pat_reg_reg[7][7]  ( .D(n484), .CK(clk), .RN(n823), .Q(
        \pat_reg[7][7] ) );
  DFFRX1 \pat_reg_reg[0][7]  ( .D(n772), .CK(clk), .RN(n821), .Q(
        \pat_reg[0][7] ) );
  DFFRX1 \pat_reg_reg[9][5]  ( .D(n502), .CK(clk), .RN(n822), .Q(
        \pat_reg[9][5] ) );
  DFFRX1 \pat_reg_reg[1][7]  ( .D(n436), .CK(clk), .RN(n827), .Q(
        \pat_reg[1][7] ) );
  DFFRX1 \pat_reg_reg[0][2]  ( .D(n430), .CK(clk), .RN(n828), .Q(
        \pat_reg[0][2] ) );
  DFFRX1 \pat_reg_reg[1][2]  ( .D(n441), .CK(clk), .RN(n827), .Q(
        \pat_reg[1][2] ) );
  DFFRX1 \pat_reg_reg[0][0]  ( .D(n435), .CK(clk), .RN(n827), .Q(
        \pat_reg[0][0] ) );
  DFFRX1 \pat_reg_reg[1][0]  ( .D(n442), .CK(clk), .RN(n827), .Q(
        \pat_reg[1][0] ) );
  DFFRX1 \str_len_reg[2]  ( .D(N822), .CK(clk), .RN(n828), .Q(str_len[2]) );
  DFFRX1 \pat_reg_reg[9][4]  ( .D(n503), .CK(clk), .RN(n822), .Q(
        \pat_reg[9][4] ) );
  DFFRX1 \str_len_reg[0]  ( .D(n877), .CK(clk), .RN(n829), .Q(str_len[0]), 
        .QN(n783) );
  DFFRX1 \str_len_reg[1]  ( .D(N821), .CK(clk), .RN(n828), .Q(str_len[1]) );
  DFFRX1 \pat_reg_reg[9][1]  ( .D(n506), .CK(clk), .RN(n822), .Q(
        \pat_reg[9][1] ) );
  DFFRX1 \pat_reg_reg[9][3]  ( .D(n504), .CK(clk), .RN(n822), .Q(
        \pat_reg[9][3] ) );
  DFFRX1 \pat_reg_reg[8][1]  ( .D(n498), .CK(clk), .RN(n822), .Q(
        \pat_reg[8][1] ) );
  DFFRX1 \pat_reg_reg[6][1]  ( .D(n482), .CK(clk), .RN(n824), .Q(
        \pat_reg[6][1] ) );
  DFFRX1 \pat_reg_reg[8][3]  ( .D(n496), .CK(clk), .RN(n822), .Q(
        \pat_reg[8][3] ) );
  DFFRX1 \pat_reg_reg[6][3]  ( .D(n480), .CK(clk), .RN(n824), .Q(
        \pat_reg[6][3] ) );
  DFFRX1 \pat_reg_reg[2][1]  ( .D(n451), .CK(clk), .RN(n826), .Q(
        \pat_reg[2][1] ) );
  DFFRX1 \pat_reg_reg[2][3]  ( .D(n448), .CK(clk), .RN(n826), .Q(
        \pat_reg[2][3] ) );
  DFFRX1 \pat_reg_reg[0][1]  ( .D(n429), .CK(clk), .RN(n828), .Q(
        \pat_reg[0][1] ) );
  DFFRX1 \pat_reg_reg[0][3]  ( .D(n431), .CK(clk), .RN(n828), .Q(
        \pat_reg[0][3] ) );
  DFFRX1 \pat_reg_reg[1][1]  ( .D(n443), .CK(clk), .RN(n827), .Q(
        \pat_reg[1][1] ) );
  DFFRX1 \pat_reg_reg[1][3]  ( .D(n440), .CK(clk), .RN(n827), .Q(
        \pat_reg[1][3] ) );
  DFFRX1 \pat_reg_reg[3][4]  ( .D(n455), .CK(clk), .RN(n826), .Q(
        \pat_reg[3][4] ) );
  DFFRX1 \pat_reg_reg[4][4]  ( .D(n463), .CK(clk), .RN(n825), .Q(
        \pat_reg[4][4] ) );
  DFFRX1 \pat_reg_reg[5][4]  ( .D(n471), .CK(clk), .RN(n824), .Q(
        \pat_reg[5][4] ) );
  DFFRX1 \pat_reg_reg[7][4]  ( .D(n487), .CK(clk), .RN(n823), .Q(
        \pat_reg[7][4] ) );
  DFFRX1 \pat_reg_reg[3][6]  ( .D(n453), .CK(clk), .RN(n826), .Q(
        \pat_reg[3][6] ) );
  DFFRX1 \pat_reg_reg[4][6]  ( .D(n461), .CK(clk), .RN(n825), .Q(
        \pat_reg[4][6] ) );
  DFFRX1 \pat_reg_reg[5][6]  ( .D(n469), .CK(clk), .RN(n825), .Q(
        \pat_reg[5][6] ) );
  DFFRX1 \pat_reg_reg[7][6]  ( .D(n485), .CK(clk), .RN(n823), .Q(
        \pat_reg[7][6] ) );
  DFFRX1 \pat_reg_reg[0][4]  ( .D(n432), .CK(clk), .RN(n828), .Q(
        \pat_reg[0][4] ) );
  DFFRX1 \pat_reg_reg[8][5]  ( .D(n494), .CK(clk), .RN(n823), .Q(
        \pat_reg[8][5] ) );
  DFFRX1 \pat_reg_reg[1][4]  ( .D(n439), .CK(clk), .RN(n827), .Q(
        \pat_reg[1][4] ) );
  DFFRX1 \pat_reg_reg[6][5]  ( .D(n478), .CK(clk), .RN(n824), .Q(
        \pat_reg[6][5] ) );
  DFFRX1 \pat_reg_reg[0][6]  ( .D(n434), .CK(clk), .RN(n828), .Q(
        \pat_reg[0][6] ) );
  DFFRX1 \pat_reg_reg[1][6]  ( .D(n437), .CK(clk), .RN(n827), .Q(
        \pat_reg[1][6] ) );
  DFFRX1 \pat_reg_reg[8][4]  ( .D(n495), .CK(clk), .RN(n822), .Q(
        \pat_reg[8][4] ) );
  DFFRX1 \pat_reg_reg[3][5]  ( .D(n454), .CK(clk), .RN(n826), .Q(
        \pat_reg[3][5] ) );
  DFFRX1 \pat_reg_reg[4][5]  ( .D(n462), .CK(clk), .RN(n825), .Q(
        \pat_reg[4][5] ) );
  DFFRX1 \pat_reg_reg[5][5]  ( .D(n470), .CK(clk), .RN(n825), .Q(
        \pat_reg[5][5] ) );
  DFFRX1 \pat_reg_reg[7][5]  ( .D(n486), .CK(clk), .RN(n823), .Q(
        \pat_reg[7][5] ) );
  DFFRX1 \pat_reg_reg[8][6]  ( .D(n493), .CK(clk), .RN(n823), .Q(
        \pat_reg[8][6] ) );
  DFFRX1 \pat_reg_reg[6][4]  ( .D(n479), .CK(clk), .RN(n824), .Q(
        \pat_reg[6][4] ) );
  DFFRX1 \pat_reg_reg[6][6]  ( .D(n477), .CK(clk), .RN(n824), .Q(
        \pat_reg[6][6] ) );
  DFFRX1 \pat_reg_reg[2][5]  ( .D(n446), .CK(clk), .RN(n827), .Q(
        \pat_reg[2][5] ) );
  DFFRX1 \pat_reg_reg[2][4]  ( .D(n447), .CK(clk), .RN(n826), .Q(
        \pat_reg[2][4] ) );
  DFFRX1 \pat_reg_reg[2][6]  ( .D(n445), .CK(clk), .RN(n827), .Q(
        \pat_reg[2][6] ) );
  DFFRX1 \pat_reg_reg[0][5]  ( .D(n433), .CK(clk), .RN(n828), .Q(
        \pat_reg[0][5] ) );
  DFFRX1 \pat_reg_reg[1][5]  ( .D(n438), .CK(clk), .RN(n827), .Q(
        \pat_reg[1][5] ) );
  DFFRX1 \pat_len_reg[0]  ( .D(n774), .CK(clk), .RN(n821), .Q(pat_len[0]), 
        .QN(n361) );
  DFFRX1 flag_head_reg ( .D(N1131), .CK(clk), .RN(n821), .Q(N1151) );
  DFFRX1 \pat_len_reg[3]  ( .D(n773), .CK(clk), .RN(n821), .Q(pat_len[3]), 
        .QN(n356) );
  DFFRX1 \pat_len_reg[1]  ( .D(n427), .CK(clk), .RN(n821), .Q(
        \eq_193_G10/B[1] ), .QN(n360) );
  DFFRX1 \pat_reg_reg[3][1]  ( .D(n459), .CK(clk), .RN(n825), .Q(
        \pat_reg[3][1] ) );
  DFFRX1 \pat_reg_reg[4][1]  ( .D(n467), .CK(clk), .RN(n825), .Q(
        \pat_reg[4][1] ) );
  DFFRX1 \pat_reg_reg[5][1]  ( .D(n475), .CK(clk), .RN(n824), .Q(
        \pat_reg[5][1] ) );
  DFFRX1 \pat_reg_reg[7][1]  ( .D(n490), .CK(clk), .RN(n823), .Q(
        \pat_reg[7][1] ) );
  DFFRX1 \pat_reg_reg[3][3]  ( .D(n456), .CK(clk), .RN(n826), .Q(
        \pat_reg[3][3] ) );
  DFFRX1 \pat_reg_reg[4][3]  ( .D(n464), .CK(clk), .RN(n825), .Q(
        \pat_reg[4][3] ) );
  DFFRX1 \pat_reg_reg[5][3]  ( .D(n472), .CK(clk), .RN(n824), .Q(
        \pat_reg[5][3] ) );
  DFFRX1 \pat_reg_reg[7][3]  ( .D(n488), .CK(clk), .RN(n823), .Q(
        \pat_reg[7][3] ) );
  DFFRX1 \pat_len_reg[2]  ( .D(n428), .CK(clk), .RN(n821), .Q(pat_len[2]), 
        .QN(n359) );
  DFFRX1 \c_state_reg[0]  ( .D(n_state[0]), .CK(clk), .RN(n820), .Q(c_state[0]) );
  DFFRX1 \c_state_reg[1]  ( .D(n_state[1]), .CK(clk), .RN(n820), .Q(c_state[1]), .QN(n99) );
  DFFRX1 \c_state_reg[2]  ( .D(n867), .CK(clk), .RN(n820), .Q(c_state[2]) );
  DFFRXL valid_reg ( .D(n867), .CK(clk), .RN(n868), .QN(n782) );
  DFFRXL match_reg ( .D(N1148), .CK(clk), .RN(n868), .QN(n781) );
  DFFRXL \match_index_reg[4]  ( .D(N1165), .CK(clk), .RN(n868), .QN(n780) );
  DFFRXL \match_index_reg[3]  ( .D(N1164), .CK(clk), .RN(n868), .QN(n779) );
  DFFRXL \match_index_reg[2]  ( .D(N1163), .CK(clk), .RN(n868), .QN(n778) );
  DFFRXL \match_index_reg[1]  ( .D(N1162), .CK(clk), .RN(n868), .QN(n777) );
  DFFRXL \match_index_reg[0]  ( .D(N1161), .CK(clk), .RN(n868), .QN(n776) );
  NOR2X1 U448 ( .A(n356), .B(\r521/carry[3] ), .Y(n775) );
  INVX3 U449 ( .A(reset), .Y(n868) );
  INVX12 U450 ( .A(n776), .Y(match_index[0]) );
  INVX12 U451 ( .A(n777), .Y(match_index[1]) );
  INVX12 U452 ( .A(n778), .Y(match_index[2]) );
  INVX12 U453 ( .A(n779), .Y(match_index[3]) );
  INVX12 U454 ( .A(n780), .Y(match_index[4]) );
  INVX12 U455 ( .A(n781), .Y(match) );
  INVX12 U456 ( .A(n782), .Y(valid) );
  CLKBUFX3 U457 ( .A(n850), .Y(n849) );
  NOR2X1 U458 ( .A(n880), .B(n867), .Y(n414) );
  CLKINVX1 U459 ( .A(n409), .Y(n851) );
  NAND3X1 U460 ( .A(c_state[1]), .B(n881), .C(ready), .Y(n415) );
  CLKBUFX3 U461 ( .A(n860), .Y(n852) );
  CLKBUFX3 U462 ( .A(n860), .Y(n853) );
  CLKBUFX3 U463 ( .A(n860), .Y(n854) );
  CLKBUFX3 U464 ( .A(n859), .Y(n855) );
  CLKBUFX3 U465 ( .A(n859), .Y(n856) );
  CLKBUFX3 U466 ( .A(n858), .Y(n857) );
  CLKBUFX3 U467 ( .A(n861), .Y(n860) );
  CLKBUFX3 U468 ( .A(n862), .Y(n859) );
  CLKBUFX3 U469 ( .A(n863), .Y(n858) );
  CLKBUFX3 U470 ( .A(n864), .Y(n861) );
  CLKBUFX3 U471 ( .A(n864), .Y(n862) );
  CLKBUFX3 U472 ( .A(n803), .Y(n822) );
  CLKBUFX3 U473 ( .A(n805), .Y(n823) );
  CLKBUFX3 U474 ( .A(n803), .Y(n824) );
  CLKBUFX3 U475 ( .A(n805), .Y(n825) );
  CLKBUFX3 U476 ( .A(n803), .Y(n826) );
  CLKBUFX3 U477 ( .A(n804), .Y(n827) );
  CLKBUFX3 U478 ( .A(n804), .Y(n828) );
  CLKBUFX3 U479 ( .A(n803), .Y(n829) );
  CLKBUFX3 U480 ( .A(n804), .Y(n830) );
  CLKBUFX3 U481 ( .A(n804), .Y(n831) );
  CLKBUFX3 U482 ( .A(n805), .Y(n832) );
  CLKBUFX3 U483 ( .A(n803), .Y(n833) );
  CLKBUFX3 U484 ( .A(n805), .Y(n834) );
  CLKBUFX3 U485 ( .A(n805), .Y(n835) );
  CLKBUFX3 U486 ( .A(n804), .Y(n807) );
  CLKBUFX3 U487 ( .A(n803), .Y(n808) );
  CLKBUFX3 U488 ( .A(n803), .Y(n809) );
  CLKBUFX3 U489 ( .A(n803), .Y(n810) );
  CLKBUFX3 U490 ( .A(n804), .Y(n811) );
  CLKBUFX3 U491 ( .A(n804), .Y(n812) );
  CLKBUFX3 U492 ( .A(n805), .Y(n813) );
  CLKBUFX3 U493 ( .A(n803), .Y(n814) );
  CLKBUFX3 U494 ( .A(n803), .Y(n815) );
  CLKBUFX3 U495 ( .A(n805), .Y(n816) );
  CLKBUFX3 U496 ( .A(n804), .Y(n817) );
  CLKBUFX3 U497 ( .A(n804), .Y(n818) );
  CLKBUFX3 U498 ( .A(n805), .Y(n819) );
  CLKBUFX3 U499 ( .A(n805), .Y(n820) );
  CLKBUFX3 U500 ( .A(n805), .Y(n821) );
  INVX3 U501 ( .A(n849), .Y(n848) );
  CLKBUFX3 U502 ( .A(n408), .Y(n863) );
  CLKBUFX3 U503 ( .A(n408), .Y(n864) );
  INVX3 U504 ( .A(n850), .Y(n847) );
  INVX3 U505 ( .A(n849), .Y(n846) );
  INVX3 U506 ( .A(n850), .Y(n845) );
  INVX3 U507 ( .A(n850), .Y(n844) );
  INVX3 U508 ( .A(n850), .Y(n843) );
  INVX3 U509 ( .A(n851), .Y(n842) );
  INVX3 U510 ( .A(n851), .Y(n841) );
  INVX3 U511 ( .A(n851), .Y(n840) );
  AND2X2 U512 ( .A(n848), .B(n881), .Y(n791) );
  CLKINVX1 U513 ( .A(n791), .Y(n408) );
  INVX4 U514 ( .A(n414), .Y(n866) );
  OAI21X2 U515 ( .A0(n407), .A1(n866), .B0(n792), .Y(n406) );
  OAI21X2 U516 ( .A0(n404), .A1(n866), .B0(n792), .Y(n403) );
  OAI21X2 U517 ( .A0(n401), .A1(n866), .B0(n792), .Y(n400) );
  OAI21X2 U518 ( .A0(n399), .A1(n866), .B0(n792), .Y(n398) );
  OAI21X2 U519 ( .A0(n397), .A1(n866), .B0(n792), .Y(n396) );
  OAI21X2 U520 ( .A0(n394), .A1(n866), .B0(n792), .Y(n393) );
  OAI21X2 U521 ( .A0(n392), .A1(n866), .B0(n792), .Y(n391) );
  OAI21X2 U522 ( .A0(n390), .A1(n866), .B0(n792), .Y(n389) );
  OAI21X2 U523 ( .A0(n385), .A1(n866), .B0(n792), .Y(n384) );
  OAI21X2 U524 ( .A0(n376), .A1(n866), .B0(n792), .Y(n375) );
  INVX3 U525 ( .A(n850), .Y(n839) );
  INVX3 U526 ( .A(n850), .Y(n838) );
  INVX3 U527 ( .A(n850), .Y(n837) );
  INVX3 U528 ( .A(n850), .Y(n836) );
  NOR2BX1 U529 ( .AN(n402), .B(\eq_193_G10/B[2] ), .Y(n388) );
  AND3X2 U530 ( .A(n388), .B(n360), .C(\eq_193_G10/B[0] ), .Y(n385) );
  NOR2X1 U531 ( .A(\eq_193_G10/B[3] ), .B(n775), .Y(n402) );
  AND3X2 U532 ( .A(n395), .B(\eq_193_G10/B[0] ), .C(n360), .Y(n397) );
  AND2X2 U533 ( .A(\eq_193_G10/B[2] ), .B(n402), .Y(n395) );
  AND2X2 U534 ( .A(n405), .B(\eq_193_G10/B[0] ), .Y(n407) );
  CLKBUFX3 U535 ( .A(n804), .Y(n806) );
  CLKBUFX3 U536 ( .A(n805), .Y(n803) );
  OA21X2 U537 ( .A0(n850), .A1(n412), .B0(n863), .Y(n410) );
  CLKBUFX3 U538 ( .A(n851), .Y(n850) );
  OAI21XL U539 ( .A0(n801), .A1(n866), .B0(n372), .Y(n374) );
  OA21XL U540 ( .A0(n802), .A1(n866), .B0(n792), .Y(n372) );
  CLKBUFX3 U541 ( .A(n387), .Y(n792) );
  NAND2X1 U542 ( .A(n866), .B(n415), .Y(n387) );
  CLKBUFX3 U543 ( .A(n383), .Y(n794) );
  NOR2X1 U544 ( .A(n876), .B(n866), .Y(n383) );
  CLKBUFX3 U545 ( .A(n378), .Y(n796) );
  NOR2X1 U546 ( .A(n874), .B(n866), .Y(n378) );
  CLKBUFX3 U547 ( .A(n379), .Y(n797) );
  NOR2X1 U548 ( .A(n873), .B(n866), .Y(n379) );
  CLKBUFX3 U549 ( .A(n380), .Y(n798) );
  NOR2X1 U550 ( .A(n872), .B(n866), .Y(n380) );
  CLKBUFX3 U551 ( .A(n381), .Y(n799) );
  NOR2X1 U552 ( .A(n871), .B(n866), .Y(n381) );
  CLKBUFX3 U553 ( .A(n382), .Y(n800) );
  NOR2X1 U554 ( .A(n870), .B(n866), .Y(n382) );
  CLKBUFX3 U555 ( .A(n386), .Y(n793) );
  NOR2X1 U556 ( .A(n869), .B(n866), .Y(n386) );
  CLKBUFX3 U557 ( .A(n377), .Y(n795) );
  NOR2X1 U558 ( .A(n875), .B(n866), .Y(n377) );
  NAND3X1 U559 ( .A(n802), .B(n414), .C(n801), .Y(n373) );
  NOR2X1 U560 ( .A(n879), .B(n420), .Y(n422) );
  AND3X2 U561 ( .A(n388), .B(\eq_193_G10/B[0] ), .C(n801), .Y(n392) );
  CLKINVX1 U562 ( .A(n801), .Y(n865) );
  AND3X2 U563 ( .A(n388), .B(n802), .C(n801), .Y(n390) );
  AND3X2 U564 ( .A(n388), .B(n802), .C(n360), .Y(n376) );
  AND3X2 U565 ( .A(n395), .B(n801), .C(\eq_193_G10/B[0] ), .Y(n401) );
  AND3X2 U566 ( .A(n395), .B(n801), .C(n802), .Y(n399) );
  AND3X2 U567 ( .A(n395), .B(n802), .C(n360), .Y(n394) );
  NOR4BX1 U568 ( .AN(\eq_193_G10/B[3] ), .B(n801), .C(\eq_193_G10/B[2] ), .D(
        n775), .Y(n405) );
  AND2X2 U569 ( .A(n405), .B(n802), .Y(n404) );
  CLKINVX1 U570 ( .A(n421), .Y(n881) );
  INVX3 U571 ( .A(n415), .Y(n867) );
  CLKBUFX3 U572 ( .A(n868), .Y(n805) );
  CLKBUFX3 U573 ( .A(n868), .Y(n804) );
  OAI222XL U574 ( .A0(n410), .A1(n102), .B0(n851), .B1(n411), .C0(n848), .C1(
        n110), .Y(n758) );
  AOI211X1 U575 ( .A0(c_state[0]), .A1(c_state[2]), .B0(c_state[1]), .C0(n879), 
        .Y(n409) );
  INVX3 U576 ( .A(isstring), .Y(n879) );
  OAI22XL U577 ( .A0(n843), .A1(n108), .B0(n410), .B1(n100), .Y(n756) );
  OAI22XL U578 ( .A0(n838), .A1(n109), .B0(n410), .B1(n101), .Y(n757) );
  OAI22XL U579 ( .A0(n847), .A1(n111), .B0(n410), .B1(n103), .Y(n759) );
  OAI22XL U580 ( .A0(n839), .A1(n112), .B0(n410), .B1(n104), .Y(n760) );
  OAI22XL U581 ( .A0(n846), .A1(n113), .B0(n410), .B1(n105), .Y(n761) );
  OAI22XL U582 ( .A0(n842), .A1(n114), .B0(n410), .B1(n106), .Y(n762) );
  OAI22XL U583 ( .A0(n845), .A1(n115), .B0(n410), .B1(n107), .Y(n763) );
  OAI22XL U584 ( .A0(n846), .A1(n348), .B0(n858), .B1(n340), .Y(n516) );
  OAI22XL U585 ( .A0(n836), .A1(n349), .B0(n858), .B1(n341), .Y(n517) );
  OAI22XL U586 ( .A0(n845), .A1(n350), .B0(n861), .B1(n342), .Y(n518) );
  OAI22XL U587 ( .A0(n844), .A1(n351), .B0(n852), .B1(n343), .Y(n519) );
  OAI22XL U588 ( .A0(n844), .A1(n352), .B0(n858), .B1(n344), .Y(n520) );
  OAI22XL U589 ( .A0(n840), .A1(n340), .B0(n852), .B1(n332), .Y(n524) );
  OAI22XL U590 ( .A0(n846), .A1(n332), .B0(n852), .B1(n324), .Y(n532) );
  OAI22XL U591 ( .A0(n843), .A1(n324), .B0(n853), .B1(n316), .Y(n540) );
  OAI22XL U592 ( .A0(n843), .A1(n316), .B0(n853), .B1(n308), .Y(n548) );
  OAI22XL U593 ( .A0(n843), .A1(n308), .B0(n853), .B1(n300), .Y(n556) );
  OAI22XL U594 ( .A0(n842), .A1(n300), .B0(n854), .B1(n292), .Y(n564) );
  OAI22XL U595 ( .A0(n839), .A1(n292), .B0(n852), .B1(n284), .Y(n572) );
  OAI22XL U596 ( .A0(n838), .A1(n284), .B0(n854), .B1(n276), .Y(n580) );
  OAI22XL U597 ( .A0(n842), .A1(n276), .B0(n857), .B1(n268), .Y(n588) );
  OAI22XL U598 ( .A0(n839), .A1(n268), .B0(n861), .B1(n260), .Y(n596) );
  OAI22XL U599 ( .A0(n839), .A1(n260), .B0(n858), .B1(n252), .Y(n604) );
  OAI22XL U600 ( .A0(n838), .A1(n252), .B0(n855), .B1(n244), .Y(n612) );
  OAI22XL U601 ( .A0(n837), .A1(n244), .B0(n855), .B1(n236), .Y(n620) );
  OAI22XL U602 ( .A0(n837), .A1(n236), .B0(n855), .B1(n228), .Y(n628) );
  OAI22XL U603 ( .A0(n836), .A1(n228), .B0(n859), .B1(n220), .Y(n636) );
  OAI22XL U604 ( .A0(n838), .A1(n220), .B0(n856), .B1(n212), .Y(n644) );
  OAI22XL U605 ( .A0(n847), .A1(n212), .B0(n859), .B1(n204), .Y(n652) );
  OAI22XL U606 ( .A0(n846), .A1(n204), .B0(n862), .B1(n196), .Y(n660) );
  OAI22XL U607 ( .A0(n846), .A1(n196), .B0(n861), .B1(n188), .Y(n668) );
  OAI22XL U608 ( .A0(n845), .A1(n188), .B0(n862), .B1(n180), .Y(n676) );
  OAI22XL U609 ( .A0(n844), .A1(n180), .B0(n862), .B1(n172), .Y(n684) );
  OAI22XL U610 ( .A0(n844), .A1(n172), .B0(n858), .B1(n164), .Y(n692) );
  OAI22XL U611 ( .A0(n843), .A1(n164), .B0(n858), .B1(n156), .Y(n700) );
  OAI22XL U612 ( .A0(n843), .A1(n156), .B0(n857), .B1(n148), .Y(n708) );
  OAI22XL U613 ( .A0(n842), .A1(n148), .B0(n863), .B1(n140), .Y(n716) );
  OAI22XL U614 ( .A0(n841), .A1(n140), .B0(n853), .B1(n132), .Y(n724) );
  OAI22XL U615 ( .A0(n841), .A1(n132), .B0(n860), .B1(n124), .Y(n732) );
  OAI22XL U616 ( .A0(n843), .A1(n124), .B0(n861), .B1(n116), .Y(n740) );
  OAI22XL U617 ( .A0(n843), .A1(n341), .B0(n852), .B1(n333), .Y(n525) );
  OAI22XL U618 ( .A0(n842), .A1(n333), .B0(n852), .B1(n325), .Y(n533) );
  OAI22XL U619 ( .A0(n846), .A1(n325), .B0(n854), .B1(n317), .Y(n541) );
  OAI22XL U620 ( .A0(n842), .A1(n317), .B0(n853), .B1(n309), .Y(n549) );
  OAI22XL U621 ( .A0(n841), .A1(n309), .B0(n853), .B1(n301), .Y(n557) );
  OAI22XL U622 ( .A0(n840), .A1(n301), .B0(n860), .B1(n293), .Y(n565) );
  OAI22XL U623 ( .A0(n837), .A1(n293), .B0(n854), .B1(n285), .Y(n573) );
  OAI22XL U624 ( .A0(n844), .A1(n285), .B0(n854), .B1(n277), .Y(n581) );
  OAI22XL U625 ( .A0(n841), .A1(n277), .B0(n857), .B1(n269), .Y(n589) );
  OAI22XL U626 ( .A0(n839), .A1(n269), .B0(n864), .B1(n261), .Y(n597) );
  OAI22XL U627 ( .A0(n839), .A1(n261), .B0(n862), .B1(n253), .Y(n605) );
  OAI22XL U628 ( .A0(n838), .A1(n253), .B0(n855), .B1(n245), .Y(n613) );
  OAI22XL U629 ( .A0(n837), .A1(n245), .B0(n855), .B1(n237), .Y(n621) );
  OAI22XL U630 ( .A0(n837), .A1(n237), .B0(n859), .B1(n229), .Y(n629) );
  OAI22XL U631 ( .A0(n836), .A1(n229), .B0(n852), .B1(n221), .Y(n637) );
  OAI22XL U632 ( .A0(n847), .A1(n221), .B0(n856), .B1(n213), .Y(n645) );
  OAI22XL U633 ( .A0(n847), .A1(n213), .B0(n863), .B1(n205), .Y(n653) );
  OAI22XL U634 ( .A0(n846), .A1(n205), .B0(n858), .B1(n197), .Y(n661) );
  OAI22XL U635 ( .A0(n846), .A1(n197), .B0(n862), .B1(n189), .Y(n669) );
  OAI22XL U636 ( .A0(n845), .A1(n189), .B0(n854), .B1(n181), .Y(n677) );
  OAI22XL U637 ( .A0(n844), .A1(n181), .B0(n862), .B1(n173), .Y(n685) );
  OAI22XL U638 ( .A0(n844), .A1(n173), .B0(n858), .B1(n165), .Y(n693) );
  OAI22XL U639 ( .A0(n843), .A1(n165), .B0(n858), .B1(n157), .Y(n701) );
  OAI22XL U640 ( .A0(n842), .A1(n157), .B0(n857), .B1(n149), .Y(n709) );
  OAI22XL U641 ( .A0(n842), .A1(n149), .B0(n862), .B1(n141), .Y(n717) );
  OAI22XL U642 ( .A0(n841), .A1(n141), .B0(n864), .B1(n133), .Y(n725) );
  OAI22XL U643 ( .A0(n841), .A1(n133), .B0(n863), .B1(n125), .Y(n733) );
  OAI22XL U644 ( .A0(n840), .A1(n125), .B0(n861), .B1(n117), .Y(n741) );
  OAI22XL U645 ( .A0(n842), .A1(n342), .B0(n852), .B1(n334), .Y(n526) );
  OAI22XL U646 ( .A0(n847), .A1(n334), .B0(n853), .B1(n326), .Y(n534) );
  OAI22XL U647 ( .A0(n844), .A1(n326), .B0(n860), .B1(n318), .Y(n542) );
  OAI22XL U648 ( .A0(n841), .A1(n318), .B0(n853), .B1(n310), .Y(n550) );
  OAI22XL U649 ( .A0(n839), .A1(n310), .B0(n853), .B1(n302), .Y(n558) );
  OAI22XL U650 ( .A0(n838), .A1(n302), .B0(n861), .B1(n294), .Y(n566) );
  OAI22XL U651 ( .A0(n836), .A1(n294), .B0(n854), .B1(n286), .Y(n574) );
  OAI22XL U652 ( .A0(n840), .A1(n286), .B0(n854), .B1(n278), .Y(n582) );
  OAI22XL U653 ( .A0(n837), .A1(n278), .B0(n857), .B1(n270), .Y(n590) );
  OAI22XL U654 ( .A0(n839), .A1(n270), .B0(n862), .B1(n262), .Y(n598) );
  OAI22XL U655 ( .A0(n838), .A1(n262), .B0(n854), .B1(n254), .Y(n606) );
  OAI22XL U656 ( .A0(n838), .A1(n254), .B0(n855), .B1(n246), .Y(n614) );
  OAI22XL U657 ( .A0(n837), .A1(n246), .B0(n855), .B1(n238), .Y(n622) );
  OAI22XL U658 ( .A0(n837), .A1(n238), .B0(n855), .B1(n230), .Y(n630) );
  OAI22XL U659 ( .A0(n836), .A1(n230), .B0(n856), .B1(n222), .Y(n638) );
  OAI22XL U660 ( .A0(n847), .A1(n222), .B0(n856), .B1(n214), .Y(n646) );
  OAI22XL U661 ( .A0(n847), .A1(n214), .B0(n864), .B1(n206), .Y(n654) );
  OAI22XL U662 ( .A0(n846), .A1(n206), .B0(n863), .B1(n198), .Y(n662) );
  OAI22XL U663 ( .A0(n846), .A1(n198), .B0(n860), .B1(n190), .Y(n670) );
  OAI22XL U664 ( .A0(n845), .A1(n190), .B0(n861), .B1(n182), .Y(n678) );
  OAI22XL U665 ( .A0(n844), .A1(n182), .B0(n864), .B1(n174), .Y(n686) );
  OAI22XL U666 ( .A0(n844), .A1(n174), .B0(n858), .B1(n166), .Y(n694) );
  OAI22XL U667 ( .A0(n843), .A1(n166), .B0(n855), .B1(n158), .Y(n702) );
  OAI22XL U668 ( .A0(n842), .A1(n158), .B0(n857), .B1(n150), .Y(n710) );
  OAI22XL U669 ( .A0(n842), .A1(n150), .B0(n863), .B1(n142), .Y(n718) );
  OAI22XL U670 ( .A0(n841), .A1(n142), .B0(n864), .B1(n134), .Y(n726) );
  OAI22XL U671 ( .A0(n841), .A1(n134), .B0(n863), .B1(n126), .Y(n734) );
  OAI22XL U672 ( .A0(n841), .A1(n343), .B0(n852), .B1(n335), .Y(n527) );
  OAI22XL U673 ( .A0(n846), .A1(n335), .B0(n860), .B1(n327), .Y(n535) );
  OAI22XL U674 ( .A0(n847), .A1(n327), .B0(n863), .B1(n319), .Y(n543) );
  OAI22XL U675 ( .A0(n840), .A1(n319), .B0(n853), .B1(n311), .Y(n551) );
  OAI22XL U676 ( .A0(n837), .A1(n311), .B0(n853), .B1(n303), .Y(n559) );
  OAI22XL U677 ( .A0(n836), .A1(n303), .B0(n861), .B1(n295), .Y(n567) );
  OAI22XL U678 ( .A0(n847), .A1(n295), .B0(n854), .B1(n287), .Y(n575) );
  OAI22XL U679 ( .A0(n844), .A1(n287), .B0(n854), .B1(n279), .Y(n583) );
  OAI22XL U680 ( .A0(n837), .A1(n279), .B0(n858), .B1(n271), .Y(n591) );
  OAI22XL U681 ( .A0(n839), .A1(n271), .B0(n858), .B1(n263), .Y(n599) );
  OAI22XL U682 ( .A0(n838), .A1(n263), .B0(n861), .B1(n255), .Y(n607) );
  OAI22XL U683 ( .A0(n838), .A1(n255), .B0(n855), .B1(n247), .Y(n615) );
  OAI22XL U684 ( .A0(n837), .A1(n247), .B0(n855), .B1(n239), .Y(n623) );
  OAI22XL U685 ( .A0(n837), .A1(n239), .B0(n864), .B1(n231), .Y(n631) );
  OAI22XL U686 ( .A0(n836), .A1(n231), .B0(n856), .B1(n223), .Y(n639) );
  OAI22XL U687 ( .A0(n847), .A1(n223), .B0(n856), .B1(n215), .Y(n647) );
  OAI22XL U688 ( .A0(n847), .A1(n215), .B0(n855), .B1(n207), .Y(n655) );
  OAI22XL U689 ( .A0(n846), .A1(n207), .B0(n853), .B1(n199), .Y(n663) );
  OAI22XL U690 ( .A0(n845), .A1(n199), .B0(n862), .B1(n191), .Y(n671) );
  OAI22XL U691 ( .A0(n845), .A1(n191), .B0(n864), .B1(n183), .Y(n679) );
  OAI22XL U692 ( .A0(n844), .A1(n183), .B0(n864), .B1(n175), .Y(n687) );
  OAI22XL U693 ( .A0(n844), .A1(n175), .B0(n858), .B1(n167), .Y(n695) );
  OAI22XL U694 ( .A0(n843), .A1(n167), .B0(n857), .B1(n159), .Y(n703) );
  OAI22XL U695 ( .A0(n842), .A1(n159), .B0(n857), .B1(n151), .Y(n711) );
  OAI22XL U696 ( .A0(n842), .A1(n151), .B0(n408), .B1(n143), .Y(n719) );
  OAI22XL U697 ( .A0(n841), .A1(n143), .B0(n408), .B1(n135), .Y(n727) );
  OAI22XL U698 ( .A0(n840), .A1(n135), .B0(n852), .B1(n127), .Y(n735) );
  OAI22XL U699 ( .A0(n836), .A1(n344), .B0(n852), .B1(n336), .Y(n528) );
  OAI22XL U700 ( .A0(n845), .A1(n336), .B0(n857), .B1(n328), .Y(n536) );
  OAI22XL U701 ( .A0(n846), .A1(n328), .B0(n861), .B1(n320), .Y(n544) );
  OAI22XL U702 ( .A0(n839), .A1(n320), .B0(n853), .B1(n312), .Y(n552) );
  OAI22XL U703 ( .A0(n847), .A1(n312), .B0(n863), .B1(n304), .Y(n560) );
  OAI22XL U704 ( .A0(n846), .A1(n304), .B0(n861), .B1(n296), .Y(n568) );
  OAI22XL U705 ( .A0(n845), .A1(n296), .B0(n854), .B1(n288), .Y(n576) );
  OAI22XL U706 ( .A0(n847), .A1(n288), .B0(n854), .B1(n280), .Y(n584) );
  OAI22XL U707 ( .A0(n840), .A1(n280), .B0(n864), .B1(n272), .Y(n592) );
  OAI22XL U708 ( .A0(n839), .A1(n272), .B0(n864), .B1(n264), .Y(n600) );
  OAI22XL U709 ( .A0(n838), .A1(n264), .B0(n858), .B1(n256), .Y(n608) );
  OAI22XL U710 ( .A0(n838), .A1(n256), .B0(n855), .B1(n248), .Y(n616) );
  OAI22XL U711 ( .A0(n837), .A1(n248), .B0(n855), .B1(n240), .Y(n624) );
  OAI22XL U712 ( .A0(n836), .A1(n240), .B0(n856), .B1(n232), .Y(n632) );
  OAI22XL U713 ( .A0(n836), .A1(n232), .B0(n856), .B1(n224), .Y(n640) );
  OAI22XL U714 ( .A0(n847), .A1(n224), .B0(n856), .B1(n216), .Y(n648) );
  OAI22XL U715 ( .A0(n847), .A1(n216), .B0(n859), .B1(n208), .Y(n656) );
  OAI22XL U716 ( .A0(n846), .A1(n208), .B0(n860), .B1(n200), .Y(n664) );
  OAI22XL U717 ( .A0(n845), .A1(n200), .B0(n860), .B1(n192), .Y(n672) );
  OAI22XL U718 ( .A0(n845), .A1(n192), .B0(n864), .B1(n184), .Y(n680) );
  OAI22XL U719 ( .A0(n844), .A1(n184), .B0(n862), .B1(n176), .Y(n688) );
  OAI22XL U720 ( .A0(n844), .A1(n176), .B0(n855), .B1(n168), .Y(n696) );
  OAI22XL U721 ( .A0(n843), .A1(n168), .B0(n857), .B1(n160), .Y(n704) );
  OAI22XL U722 ( .A0(n842), .A1(n160), .B0(n857), .B1(n152), .Y(n712) );
  OAI22XL U723 ( .A0(n842), .A1(n152), .B0(n408), .B1(n144), .Y(n720) );
  OAI22XL U724 ( .A0(n841), .A1(n144), .B0(n408), .B1(n136), .Y(n728) );
  OAI22XL U725 ( .A0(n840), .A1(n136), .B0(n856), .B1(n128), .Y(n736) );
  OAI22XL U726 ( .A0(n839), .A1(n353), .B0(n852), .B1(n345), .Y(n521) );
  OAI22XL U727 ( .A0(n845), .A1(n345), .B0(n852), .B1(n337), .Y(n529) );
  OAI22XL U728 ( .A0(n844), .A1(n337), .B0(n863), .B1(n329), .Y(n537) );
  OAI22XL U729 ( .A0(n845), .A1(n329), .B0(n862), .B1(n321), .Y(n545) );
  OAI22XL U730 ( .A0(n838), .A1(n321), .B0(n853), .B1(n313), .Y(n553) );
  OAI22XL U731 ( .A0(n846), .A1(n313), .B0(n863), .B1(n305), .Y(n561) );
  OAI22XL U732 ( .A0(n844), .A1(n305), .B0(n857), .B1(n297), .Y(n569) );
  OAI22XL U733 ( .A0(n843), .A1(n297), .B0(n854), .B1(n289), .Y(n577) );
  OAI22XL U734 ( .A0(n847), .A1(n289), .B0(n854), .B1(n281), .Y(n585) );
  OAI22XL U735 ( .A0(n839), .A1(n281), .B0(n857), .B1(n273), .Y(n593) );
  OAI22XL U736 ( .A0(n839), .A1(n273), .B0(n864), .B1(n265), .Y(n601) );
  OAI22XL U737 ( .A0(n838), .A1(n265), .B0(n858), .B1(n257), .Y(n609) );
  OAI22XL U738 ( .A0(n838), .A1(n257), .B0(n855), .B1(n249), .Y(n617) );
  OAI22XL U739 ( .A0(n837), .A1(n249), .B0(n856), .B1(n241), .Y(n625) );
  OAI22XL U740 ( .A0(n836), .A1(n241), .B0(n862), .B1(n233), .Y(n633) );
  OAI22XL U741 ( .A0(n836), .A1(n233), .B0(n856), .B1(n225), .Y(n641) );
  OAI22XL U742 ( .A0(n847), .A1(n225), .B0(n856), .B1(n217), .Y(n649) );
  OAI22XL U743 ( .A0(n847), .A1(n217), .B0(n862), .B1(n209), .Y(n657) );
  OAI22XL U744 ( .A0(n846), .A1(n209), .B0(n859), .B1(n201), .Y(n665) );
  OAI22XL U745 ( .A0(n845), .A1(n201), .B0(n860), .B1(n193), .Y(n673) );
  OAI22XL U746 ( .A0(n845), .A1(n193), .B0(n861), .B1(n185), .Y(n681) );
  OAI22XL U747 ( .A0(n844), .A1(n185), .B0(n862), .B1(n177), .Y(n689) );
  OAI22XL U748 ( .A0(n843), .A1(n177), .B0(n858), .B1(n169), .Y(n697) );
  OAI22XL U749 ( .A0(n843), .A1(n169), .B0(n857), .B1(n161), .Y(n705) );
  OAI22XL U750 ( .A0(n842), .A1(n161), .B0(n857), .B1(n153), .Y(n713) );
  OAI22XL U751 ( .A0(n842), .A1(n153), .B0(n408), .B1(n145), .Y(n721) );
  OAI22XL U752 ( .A0(n841), .A1(n145), .B0(n855), .B1(n137), .Y(n729) );
  OAI22XL U753 ( .A0(n840), .A1(n137), .B0(n859), .B1(n129), .Y(n737) );
  OAI22XL U754 ( .A0(n838), .A1(n354), .B0(n852), .B1(n346), .Y(n522) );
  OAI22XL U755 ( .A0(n841), .A1(n346), .B0(n852), .B1(n338), .Y(n530) );
  OAI22XL U756 ( .A0(n840), .A1(n338), .B0(n857), .B1(n330), .Y(n538) );
  OAI22XL U757 ( .A0(n841), .A1(n330), .B0(n858), .B1(n322), .Y(n546) );
  OAI22XL U758 ( .A0(n837), .A1(n322), .B0(n853), .B1(n314), .Y(n554) );
  OAI22XL U759 ( .A0(n845), .A1(n314), .B0(n855), .B1(n306), .Y(n562) );
  OAI22XL U760 ( .A0(n842), .A1(n306), .B0(n852), .B1(n298), .Y(n570) );
  OAI22XL U761 ( .A0(n841), .A1(n298), .B0(n854), .B1(n290), .Y(n578) );
  OAI22XL U762 ( .A0(n836), .A1(n290), .B0(n861), .B1(n282), .Y(n586) );
  OAI22XL U763 ( .A0(n839), .A1(n282), .B0(n852), .B1(n274), .Y(n594) );
  OAI22XL U764 ( .A0(n839), .A1(n274), .B0(n864), .B1(n266), .Y(n602) );
  OAI22XL U765 ( .A0(n838), .A1(n266), .B0(n858), .B1(n258), .Y(n610) );
  OAI22XL U766 ( .A0(n838), .A1(n258), .B0(n855), .B1(n250), .Y(n618) );
  OAI22XL U767 ( .A0(n837), .A1(n250), .B0(n862), .B1(n242), .Y(n626) );
  OAI22XL U768 ( .A0(n836), .A1(n242), .B0(n853), .B1(n234), .Y(n634) );
  OAI22XL U769 ( .A0(n836), .A1(n234), .B0(n856), .B1(n226), .Y(n642) );
  OAI22XL U770 ( .A0(n847), .A1(n226), .B0(n856), .B1(n218), .Y(n650) );
  OAI22XL U771 ( .A0(n846), .A1(n218), .B0(n863), .B1(n210), .Y(n658) );
  OAI22XL U772 ( .A0(n846), .A1(n210), .B0(n859), .B1(n202), .Y(n666) );
  OAI22XL U773 ( .A0(n845), .A1(n202), .B0(n860), .B1(n194), .Y(n674) );
  OAI22XL U774 ( .A0(n845), .A1(n194), .B0(n861), .B1(n186), .Y(n682) );
  OAI22XL U775 ( .A0(n844), .A1(n186), .B0(n854), .B1(n178), .Y(n690) );
  OAI22XL U776 ( .A0(n843), .A1(n178), .B0(n861), .B1(n170), .Y(n698) );
  OAI22XL U777 ( .A0(n843), .A1(n170), .B0(n857), .B1(n162), .Y(n706) );
  OAI22XL U778 ( .A0(n842), .A1(n162), .B0(n857), .B1(n154), .Y(n714) );
  OAI22XL U779 ( .A0(n841), .A1(n154), .B0(n863), .B1(n146), .Y(n722) );
  OAI22XL U780 ( .A0(n841), .A1(n146), .B0(n864), .B1(n138), .Y(n730) );
  OAI22XL U781 ( .A0(n840), .A1(n138), .B0(n861), .B1(n130), .Y(n738) );
  OAI22XL U782 ( .A0(n837), .A1(n355), .B0(n852), .B1(n347), .Y(n523) );
  OAI22XL U783 ( .A0(n845), .A1(n347), .B0(n852), .B1(n339), .Y(n531) );
  OAI22XL U784 ( .A0(n843), .A1(n339), .B0(n863), .B1(n331), .Y(n539) );
  OAI22XL U785 ( .A0(n836), .A1(n331), .B0(n853), .B1(n323), .Y(n547) );
  OAI22XL U786 ( .A0(n844), .A1(n323), .B0(n853), .B1(n315), .Y(n555) );
  OAI22XL U787 ( .A0(n843), .A1(n315), .B0(n861), .B1(n307), .Y(n563) );
  OAI22XL U788 ( .A0(n840), .A1(n307), .B0(n863), .B1(n299), .Y(n571) );
  OAI22XL U789 ( .A0(n839), .A1(n299), .B0(n854), .B1(n291), .Y(n579) );
  OAI22XL U790 ( .A0(n836), .A1(n291), .B0(n864), .B1(n283), .Y(n587) );
  OAI22XL U791 ( .A0(n839), .A1(n283), .B0(n857), .B1(n275), .Y(n595) );
  OAI22XL U792 ( .A0(n839), .A1(n275), .B0(n864), .B1(n267), .Y(n603) );
  OAI22XL U793 ( .A0(n838), .A1(n267), .B0(n858), .B1(n259), .Y(n611) );
  OAI22XL U794 ( .A0(n837), .A1(n259), .B0(n855), .B1(n251), .Y(n619) );
  OAI22XL U795 ( .A0(n837), .A1(n251), .B0(n854), .B1(n243), .Y(n627) );
  OAI22XL U796 ( .A0(n836), .A1(n243), .B0(n853), .B1(n235), .Y(n635) );
  OAI22XL U797 ( .A0(n836), .A1(n235), .B0(n856), .B1(n227), .Y(n643) );
  OAI22XL U798 ( .A0(n847), .A1(n227), .B0(n862), .B1(n219), .Y(n651) );
  OAI22XL U799 ( .A0(n846), .A1(n219), .B0(n852), .B1(n211), .Y(n659) );
  OAI22XL U800 ( .A0(n846), .A1(n211), .B0(n859), .B1(n203), .Y(n667) );
  OAI22XL U801 ( .A0(n845), .A1(n203), .B0(n860), .B1(n195), .Y(n675) );
  OAI22XL U802 ( .A0(n845), .A1(n195), .B0(n862), .B1(n187), .Y(n683) );
  OAI22XL U803 ( .A0(n844), .A1(n187), .B0(n856), .B1(n179), .Y(n691) );
  OAI22XL U804 ( .A0(n843), .A1(n179), .B0(n859), .B1(n171), .Y(n699) );
  OAI22XL U805 ( .A0(n843), .A1(n171), .B0(n857), .B1(n163), .Y(n707) );
  OAI22XL U806 ( .A0(n842), .A1(n163), .B0(n857), .B1(n155), .Y(n715) );
  OAI22XL U807 ( .A0(n841), .A1(n155), .B0(n864), .B1(n147), .Y(n723) );
  OAI22XL U808 ( .A0(n841), .A1(n147), .B0(n862), .B1(n139), .Y(n731) );
  OAI22XL U809 ( .A0(n840), .A1(n139), .B0(n863), .B1(n131), .Y(n739) );
  OAI22XL U810 ( .A0(n840), .A1(n116), .B0(n853), .B1(n108), .Y(n748) );
  OAI22XL U811 ( .A0(n838), .A1(n117), .B0(n856), .B1(n109), .Y(n749) );
  OAI22XL U812 ( .A0(n840), .A1(n126), .B0(n858), .B1(n118), .Y(n742) );
  OAI22XL U813 ( .A0(n840), .A1(n127), .B0(n863), .B1(n119), .Y(n743) );
  OAI22XL U814 ( .A0(n841), .A1(n119), .B0(n856), .B1(n111), .Y(n751) );
  OAI22XL U815 ( .A0(n840), .A1(n128), .B0(n863), .B1(n120), .Y(n744) );
  OAI22XL U816 ( .A0(n837), .A1(n120), .B0(n861), .B1(n112), .Y(n752) );
  OAI22XL U817 ( .A0(n840), .A1(n129), .B0(n861), .B1(n121), .Y(n745) );
  OAI22XL U818 ( .A0(n836), .A1(n121), .B0(n862), .B1(n113), .Y(n753) );
  OAI22XL U819 ( .A0(n840), .A1(n130), .B0(n863), .B1(n122), .Y(n746) );
  OAI22XL U820 ( .A0(n847), .A1(n122), .B0(n860), .B1(n114), .Y(n754) );
  OAI22XL U821 ( .A0(n840), .A1(n131), .B0(n859), .B1(n123), .Y(n747) );
  OAI22XL U822 ( .A0(n839), .A1(n118), .B0(n862), .B1(n110), .Y(n750) );
  OAI2BB2XL U823 ( .B0(n348), .B1(n861), .A0N(\str_reg[33][7] ), .A1N(n849), 
        .Y(n508) );
  OAI2BB2XL U824 ( .B0(n349), .B1(n856), .A0N(\str_reg[33][6] ), .A1N(n850), 
        .Y(n509) );
  OAI2BB2XL U825 ( .B0(n350), .B1(n864), .A0N(\str_reg[33][5] ), .A1N(n849), 
        .Y(n510) );
  OAI2BB2XL U826 ( .B0(n351), .B1(n856), .A0N(\str_reg[33][4] ), .A1N(n850), 
        .Y(n511) );
  OAI2BB2XL U827 ( .B0(n352), .B1(n854), .A0N(\str_reg[33][3] ), .A1N(n849), 
        .Y(n512) );
  OAI2BB2XL U828 ( .B0(n353), .B1(n859), .A0N(\str_reg[33][2] ), .A1N(n849), 
        .Y(n513) );
  OAI2BB2XL U829 ( .B0(n354), .B1(n864), .A0N(\str_reg[33][1] ), .A1N(n850), 
        .Y(n514) );
  OAI2BB2XL U830 ( .B0(n355), .B1(n855), .A0N(\str_reg[33][0] ), .A1N(n849), 
        .Y(n515) );
  OAI22XL U831 ( .A0(n842), .A1(n123), .B0(n863), .B1(n115), .Y(n755) );
  OAI32X1 U832 ( .A0(n359), .A1(pat_len[3]), .A2(n373), .B0(n413), .B1(n356), 
        .Y(n773) );
  AOI21X1 U833 ( .A0(n359), .A1(n414), .B0(n374), .Y(n413) );
  CLKINVX1 U834 ( .A(ispattern), .Y(n880) );
  AO22X1 U835 ( .A0(\pat_reg[9][0] ), .A1(n406), .B0(n407), .B1(n794), .Y(n507) );
  AO22X1 U836 ( .A0(\pat_reg[9][1] ), .A1(n406), .B0(n407), .B1(n795), .Y(n506) );
  AO22X1 U837 ( .A0(\pat_reg[9][2] ), .A1(n406), .B0(n407), .B1(n796), .Y(n505) );
  AO22X1 U838 ( .A0(\pat_reg[9][3] ), .A1(n406), .B0(n407), .B1(n797), .Y(n504) );
  AO22X1 U839 ( .A0(\pat_reg[9][4] ), .A1(n406), .B0(n407), .B1(n798), .Y(n503) );
  AO22X1 U840 ( .A0(\pat_reg[9][5] ), .A1(n406), .B0(n407), .B1(n799), .Y(n502) );
  AO22X1 U841 ( .A0(\pat_reg[9][6] ), .A1(n406), .B0(n407), .B1(n800), .Y(n501) );
  AO22X1 U842 ( .A0(\pat_reg[9][7] ), .A1(n406), .B0(n407), .B1(n793), .Y(n500) );
  AO22X1 U843 ( .A0(\pat_reg[8][0] ), .A1(n403), .B0(n404), .B1(n794), .Y(n499) );
  AO22X1 U844 ( .A0(\pat_reg[8][1] ), .A1(n403), .B0(n404), .B1(n795), .Y(n498) );
  AO22X1 U845 ( .A0(\pat_reg[8][2] ), .A1(n403), .B0(n404), .B1(n796), .Y(n497) );
  AO22X1 U846 ( .A0(\pat_reg[8][3] ), .A1(n403), .B0(n404), .B1(n797), .Y(n496) );
  AO22X1 U847 ( .A0(\pat_reg[8][4] ), .A1(n403), .B0(n404), .B1(n798), .Y(n495) );
  AO22X1 U848 ( .A0(\pat_reg[8][5] ), .A1(n403), .B0(n404), .B1(n799), .Y(n494) );
  AO22X1 U849 ( .A0(\pat_reg[8][6] ), .A1(n403), .B0(n404), .B1(n800), .Y(n493) );
  AO22X1 U850 ( .A0(\pat_reg[8][7] ), .A1(n403), .B0(n404), .B1(n793), .Y(n492) );
  AO22X1 U851 ( .A0(\pat_reg[7][0] ), .A1(n400), .B0(n401), .B1(n794), .Y(n491) );
  AO22X1 U852 ( .A0(\pat_reg[7][1] ), .A1(n400), .B0(n401), .B1(n795), .Y(n490) );
  AO22X1 U853 ( .A0(\pat_reg[7][2] ), .A1(n400), .B0(n401), .B1(n796), .Y(n489) );
  AO22X1 U854 ( .A0(\pat_reg[7][3] ), .A1(n400), .B0(n401), .B1(n797), .Y(n488) );
  AO22X1 U855 ( .A0(\pat_reg[7][4] ), .A1(n400), .B0(n401), .B1(n798), .Y(n487) );
  AO22X1 U856 ( .A0(\pat_reg[7][5] ), .A1(n400), .B0(n401), .B1(n799), .Y(n486) );
  AO22X1 U857 ( .A0(\pat_reg[7][6] ), .A1(n400), .B0(n401), .B1(n800), .Y(n485) );
  AO22X1 U858 ( .A0(\pat_reg[7][7] ), .A1(n400), .B0(n401), .B1(n793), .Y(n484) );
  AO22X1 U859 ( .A0(\pat_reg[6][0] ), .A1(n398), .B0(n399), .B1(n794), .Y(n483) );
  AO22X1 U860 ( .A0(\pat_reg[6][1] ), .A1(n398), .B0(n399), .B1(n795), .Y(n482) );
  AO22X1 U861 ( .A0(\pat_reg[6][2] ), .A1(n398), .B0(n399), .B1(n796), .Y(n481) );
  AO22X1 U862 ( .A0(\pat_reg[6][3] ), .A1(n398), .B0(n399), .B1(n797), .Y(n480) );
  AO22X1 U863 ( .A0(\pat_reg[6][4] ), .A1(n398), .B0(n399), .B1(n798), .Y(n479) );
  AO22X1 U864 ( .A0(\pat_reg[6][5] ), .A1(n398), .B0(n399), .B1(n799), .Y(n478) );
  AO22X1 U865 ( .A0(\pat_reg[6][6] ), .A1(n398), .B0(n399), .B1(n800), .Y(n477) );
  AO22X1 U866 ( .A0(\pat_reg[6][7] ), .A1(n398), .B0(n399), .B1(n793), .Y(n476) );
  AO22X1 U867 ( .A0(\pat_reg[5][1] ), .A1(n396), .B0(n397), .B1(n795), .Y(n475) );
  AO22X1 U868 ( .A0(\pat_reg[5][0] ), .A1(n396), .B0(n397), .B1(n794), .Y(n474) );
  AO22X1 U869 ( .A0(\pat_reg[5][2] ), .A1(n396), .B0(n397), .B1(n796), .Y(n473) );
  AO22X1 U870 ( .A0(\pat_reg[5][3] ), .A1(n396), .B0(n397), .B1(n797), .Y(n472) );
  AO22X1 U871 ( .A0(\pat_reg[5][4] ), .A1(n396), .B0(n397), .B1(n798), .Y(n471) );
  AO22X1 U872 ( .A0(\pat_reg[5][5] ), .A1(n396), .B0(n397), .B1(n799), .Y(n470) );
  AO22X1 U873 ( .A0(\pat_reg[5][6] ), .A1(n396), .B0(n397), .B1(n800), .Y(n469) );
  AO22X1 U874 ( .A0(\pat_reg[5][7] ), .A1(n396), .B0(n397), .B1(n793), .Y(n468) );
  AO22X1 U875 ( .A0(\pat_reg[4][1] ), .A1(n393), .B0(n394), .B1(n795), .Y(n467) );
  AO22X1 U876 ( .A0(\pat_reg[4][0] ), .A1(n393), .B0(n394), .B1(n794), .Y(n466) );
  AO22X1 U877 ( .A0(\pat_reg[4][2] ), .A1(n393), .B0(n394), .B1(n796), .Y(n465) );
  AO22X1 U878 ( .A0(\pat_reg[4][3] ), .A1(n393), .B0(n394), .B1(n797), .Y(n464) );
  AO22X1 U879 ( .A0(\pat_reg[4][4] ), .A1(n393), .B0(n394), .B1(n798), .Y(n463) );
  AO22X1 U880 ( .A0(\pat_reg[4][5] ), .A1(n393), .B0(n394), .B1(n799), .Y(n462) );
  AO22X1 U881 ( .A0(\pat_reg[4][6] ), .A1(n393), .B0(n394), .B1(n800), .Y(n461) );
  AO22X1 U882 ( .A0(\pat_reg[4][7] ), .A1(n393), .B0(n394), .B1(n793), .Y(n460) );
  AO22X1 U883 ( .A0(\pat_reg[3][1] ), .A1(n391), .B0(n392), .B1(n795), .Y(n459) );
  AO22X1 U884 ( .A0(\pat_reg[3][0] ), .A1(n391), .B0(n392), .B1(n794), .Y(n458) );
  AO22X1 U885 ( .A0(\pat_reg[3][2] ), .A1(n391), .B0(n392), .B1(n796), .Y(n457) );
  AO22X1 U886 ( .A0(\pat_reg[3][3] ), .A1(n391), .B0(n392), .B1(n797), .Y(n456) );
  AO22X1 U887 ( .A0(\pat_reg[3][4] ), .A1(n391), .B0(n392), .B1(n798), .Y(n455) );
  AO22X1 U888 ( .A0(\pat_reg[3][5] ), .A1(n391), .B0(n392), .B1(n799), .Y(n454) );
  AO22X1 U889 ( .A0(\pat_reg[3][6] ), .A1(n391), .B0(n392), .B1(n800), .Y(n453) );
  AO22X1 U890 ( .A0(\pat_reg[3][7] ), .A1(n391), .B0(n392), .B1(n793), .Y(n452) );
  AO22X1 U891 ( .A0(\pat_reg[2][1] ), .A1(n389), .B0(n390), .B1(n795), .Y(n451) );
  AO22X1 U892 ( .A0(\pat_reg[2][0] ), .A1(n389), .B0(n390), .B1(n794), .Y(n450) );
  AO22X1 U893 ( .A0(\pat_reg[2][2] ), .A1(n389), .B0(n390), .B1(n796), .Y(n449) );
  AO22X1 U894 ( .A0(\pat_reg[2][3] ), .A1(n389), .B0(n390), .B1(n797), .Y(n448) );
  AO22X1 U895 ( .A0(\pat_reg[2][4] ), .A1(n389), .B0(n390), .B1(n798), .Y(n447) );
  AO22X1 U896 ( .A0(\pat_reg[2][5] ), .A1(n389), .B0(n390), .B1(n799), .Y(n446) );
  AO22X1 U897 ( .A0(\pat_reg[2][6] ), .A1(n389), .B0(n390), .B1(n800), .Y(n445) );
  AO22X1 U898 ( .A0(\pat_reg[2][7] ), .A1(n389), .B0(n390), .B1(n793), .Y(n444) );
  AO22X1 U899 ( .A0(\pat_reg[1][1] ), .A1(n384), .B0(n385), .B1(n795), .Y(n443) );
  AO22X1 U900 ( .A0(\pat_reg[1][0] ), .A1(n384), .B0(n385), .B1(n794), .Y(n442) );
  AO22X1 U901 ( .A0(\pat_reg[1][2] ), .A1(n384), .B0(n385), .B1(n796), .Y(n441) );
  AO22X1 U902 ( .A0(\pat_reg[1][3] ), .A1(n384), .B0(n385), .B1(n797), .Y(n440) );
  AO22X1 U903 ( .A0(\pat_reg[1][4] ), .A1(n384), .B0(n385), .B1(n798), .Y(n439) );
  AO22X1 U904 ( .A0(\pat_reg[1][5] ), .A1(n384), .B0(n385), .B1(n799), .Y(n438) );
  AO22X1 U905 ( .A0(\pat_reg[1][6] ), .A1(n384), .B0(n385), .B1(n800), .Y(n437) );
  AO22X1 U906 ( .A0(\pat_reg[1][7] ), .A1(n384), .B0(n385), .B1(n793), .Y(n436) );
  AO22X1 U907 ( .A0(\pat_reg[0][0] ), .A1(n375), .B0(n794), .B1(n376), .Y(n435) );
  AO22X1 U908 ( .A0(\pat_reg[0][1] ), .A1(n375), .B0(n376), .B1(n795), .Y(n429) );
  AO22X1 U909 ( .A0(\pat_reg[0][2] ), .A1(n375), .B0(n796), .B1(n376), .Y(n430) );
  AO22X1 U910 ( .A0(\pat_reg[0][3] ), .A1(n375), .B0(n797), .B1(n376), .Y(n431) );
  AO22X1 U911 ( .A0(\pat_reg[0][4] ), .A1(n375), .B0(n798), .B1(n376), .Y(n432) );
  AO22X1 U912 ( .A0(\pat_reg[0][5] ), .A1(n375), .B0(n799), .B1(n376), .Y(n433) );
  AO22X1 U913 ( .A0(\pat_reg[0][6] ), .A1(n375), .B0(n800), .B1(n376), .Y(n434) );
  AO22X1 U914 ( .A0(\pat_reg[0][7] ), .A1(n375), .B0(n793), .B1(n376), .Y(n772) );
  OAI2BB2XL U915 ( .B0(pat_len[2]), .B1(n373), .A0N(n374), .A1N(pat_len[2]), 
        .Y(n428) );
  OAI22XL U916 ( .A0(n869), .A1(n850), .B0(n848), .B1(n100), .Y(n771) );
  OAI22XL U917 ( .A0(n870), .A1(n850), .B0(n848), .B1(n101), .Y(n770) );
  OAI22XL U918 ( .A0(n872), .A1(n850), .B0(n848), .B1(n103), .Y(n768) );
  OAI22XL U919 ( .A0(n873), .A1(n851), .B0(n848), .B1(n104), .Y(n767) );
  OAI22XL U920 ( .A0(n874), .A1(n850), .B0(n848), .B1(n105), .Y(n766) );
  OAI22XL U921 ( .A0(n875), .A1(n849), .B0(n848), .B1(n106), .Y(n765) );
  OAI22XL U922 ( .A0(n876), .A1(n849), .B0(n848), .B1(n107), .Y(n764) );
  OAI22XL U923 ( .A0(n871), .A1(n850), .B0(n848), .B1(n102), .Y(n769) );
  OAI32X1 U924 ( .A0(n361), .A1(n801), .A2(n866), .B0(n372), .B1(n360), .Y(
        n427) );
  OAI22XL U925 ( .A0(n361), .A1(n792), .B0(n802), .B1(n866), .Y(n774) );
  CLKINVX1 U926 ( .A(n423), .Y(n877) );
  AOI221XL U927 ( .A0(n783), .A1(n422), .B0(str_len[0]), .B1(n879), .C0(n420), 
        .Y(n423) );
  NOR3X1 U928 ( .A(n879), .B(c_state[1]), .C(n411), .Y(n420) );
  CLKINVX1 U929 ( .A(chardata[6]), .Y(n870) );
  OAI2BB1X1 U930 ( .A0N(N1151), .A1N(n415), .B0(n424), .Y(N1131) );
  NAND4X1 U931 ( .A(chardata[1]), .B(n414), .C(n425), .D(n426), .Y(n424) );
  NOR3X1 U932 ( .A(chardata[0]), .B(chardata[7]), .C(chardata[5]), .Y(n425) );
  NOR4X1 U933 ( .A(n874), .B(n873), .C(n872), .D(n870), .Y(n426) );
  CLKINVX1 U934 ( .A(chardata[4]), .Y(n872) );
  AO22X1 U935 ( .A0(N819), .A1(n422), .B0(str_len[5]), .B1(n879), .Y(N825) );
  AO22X1 U936 ( .A0(N818), .A1(n422), .B0(str_len[4]), .B1(n879), .Y(N824) );
  AO22X1 U937 ( .A0(N817), .A1(n422), .B0(str_len[3]), .B1(n879), .Y(N823) );
  AO22X1 U938 ( .A0(N816), .A1(n422), .B0(str_len[2]), .B1(n879), .Y(N822) );
  AO22X1 U939 ( .A0(N815), .A1(n422), .B0(str_len[1]), .B1(n879), .Y(N821) );
  CLKINVX1 U940 ( .A(chardata[3]), .Y(n873) );
  OAI32X1 U941 ( .A0(n416), .A1(isstring), .A2(c_state[1]), .B0(n417), .B1(n99), .Y(n_state[1]) );
  OA21XL U942 ( .A0(c_state[2]), .A1(ready), .B0(n412), .Y(n417) );
  AOI2BB1X1 U943 ( .A0N(n411), .A1N(n880), .B0(n881), .Y(n416) );
  CLKINVX1 U944 ( .A(chardata[2]), .Y(n874) );
  OAI221XL U945 ( .A0(c_state[1]), .A1(n418), .B0(n419), .B1(n99), .C0(n878), 
        .Y(n_state[0]) );
  CLKINVX1 U946 ( .A(n420), .Y(n878) );
  OA22X1 U947 ( .A0(n879), .A1(n421), .B0(reset), .B1(n412), .Y(n418) );
  OA22X1 U948 ( .A0(n421), .A1(ready), .B0(n412), .B1(ispattern), .Y(n419) );
  CLKINVX1 U949 ( .A(chardata[0]), .Y(n876) );
  CLKINVX1 U950 ( .A(chardata[5]), .Y(n871) );
  CLKINVX1 U951 ( .A(chardata[7]), .Y(n869) );
  CLKINVX1 U952 ( .A(chardata[1]), .Y(n875) );
  CLKBUFX3 U953 ( .A(\eq_193_G10/B[1] ), .Y(n801) );
  NAND2BX1 U954 ( .AN(c_state[2]), .B(c_state[0]), .Y(n421) );
  AND2X2 U955 ( .A(N1160), .B(n867), .Y(N1165) );
  CLKBUFX3 U956 ( .A(pat_len[0]), .Y(n802) );
  AND2X2 U957 ( .A(N1159), .B(n867), .Y(N1164) );
  AND2X2 U958 ( .A(N1158), .B(n867), .Y(N1163) );
  ADDHXL U959 ( .A(str_len[1]), .B(str_len[0]), .CO(\add_178/carry [2]), .S(
        N815) );
  ADDHXL U960 ( .A(str_len[2]), .B(\add_178/carry [2]), .CO(\add_178/carry [3]), .S(N816) );
  ADDHXL U961 ( .A(str_len[3]), .B(\add_178/carry [3]), .CO(\add_178/carry [4]), .S(N817) );
  ADDHXL U962 ( .A(str_len[4]), .B(\add_178/carry [4]), .CO(\add_178/carry [5]), .S(N818) );
  OR2X1 U963 ( .A(c_state[0]), .B(c_state[2]), .Y(n412) );
  NAND2BX1 U964 ( .AN(c_state[0]), .B(c_state[2]), .Y(n411) );
  AND2X2 U965 ( .A(N1156), .B(n867), .Y(N1161) );
  AND2X2 U966 ( .A(N1157), .B(n867), .Y(N1162) );
  AND2X2 U967 ( .A(match_w), .B(n867), .Y(N1148) );
  XNOR2X1 U968 ( .A(match_index_w[4]), .B(
        \add_0_root_add_0_root_add_272/carry [4]), .Y(N1160) );
  OR2X1 U969 ( .A(match_index_w[3]), .B(
        \add_0_root_add_0_root_add_272/carry [3]), .Y(
        \add_0_root_add_0_root_add_272/carry [4]) );
  XNOR2X1 U970 ( .A(\add_0_root_add_0_root_add_272/carry [3]), .B(
        match_index_w[3]), .Y(N1159) );
  OR2X1 U971 ( .A(match_index_w[2]), .B(
        \add_0_root_add_0_root_add_272/carry [2]), .Y(
        \add_0_root_add_0_root_add_272/carry [3]) );
  XNOR2X1 U972 ( .A(\add_0_root_add_0_root_add_272/carry [2]), .B(
        match_index_w[2]), .Y(N1158) );
  OR2X1 U973 ( .A(match_index_w[1]), .B(
        \add_0_root_add_0_root_add_272/carry [1]), .Y(
        \add_0_root_add_0_root_add_272/carry [2]) );
  XNOR2X1 U974 ( .A(\add_0_root_add_0_root_add_272/carry [1]), .B(
        match_index_w[1]), .Y(N1157) );
  AND2X1 U975 ( .A(match_index_w[0]), .B(N1151), .Y(
        \add_0_root_add_0_root_add_272/carry [1]) );
  XOR2X1 U976 ( .A(N1151), .B(match_index_w[0]), .Y(N1156) );
  XNOR2X1 U977 ( .A(\r521/carry[3] ), .B(n356), .Y(\eq_193_G10/B[3] ) );
  AND2X1 U978 ( .A(n865), .B(n359), .Y(\r521/carry[3] ) );
  XOR2X1 U979 ( .A(n359), .B(n865), .Y(\eq_193_G10/B[2] ) );
  CLKINVX1 U980 ( .A(n802), .Y(\eq_193_G10/B[0] ) );
  XOR2X1 U981 ( .A(\add_178/carry [5]), .B(str_len[5]), .Y(N819) );
endmodule

