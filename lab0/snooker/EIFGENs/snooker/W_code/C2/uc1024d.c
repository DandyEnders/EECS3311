/*
 * Class UC_UTF32_ROUTINES
 */

#include "eif_macros.h"


#ifdef __cplusplus
extern "C" {
#endif

static const EIF_TYPE_INDEX egt_0_1024 [] = {0xFF01,232,0xFFFF};
static const EIF_TYPE_INDEX egt_1_1024 [] = {0xFF01,246,1023,0xFFFF};
static const EIF_TYPE_INDEX egt_2_1024 [] = {0xFF01,1023,0xFFFF};
static const EIF_TYPE_INDEX egt_3_1024 [] = {0,0xFFFF};
static const EIF_TYPE_INDEX egt_4_1024 [] = {0,0xFFFF};
static const EIF_TYPE_INDEX egt_5_1024 [] = {0xFF01,1023,0xFFFF};
static const EIF_TYPE_INDEX egt_6_1024 [] = {0xFF01,1023,0xFFFF};
static const EIF_TYPE_INDEX egt_7_1024 [] = {0,0xFFFF};
static const EIF_TYPE_INDEX egt_8_1024 [] = {0xFF01,15,0xFFFF};
static const EIF_TYPE_INDEX egt_9_1024 [] = {0xFF01,232,0xFFFF};
static const EIF_TYPE_INDEX egt_10_1024 [] = {0xFF01,232,0xFFFF};
static const EIF_TYPE_INDEX egt_11_1024 [] = {0xFF01,25,0xFFFF};
static const EIF_TYPE_INDEX egt_12_1024 [] = {0xFF01,1023,0xFFFF};
static const EIF_TYPE_INDEX egt_13_1024 [] = {0xFF01,1003,0xFFFF};
static const EIF_TYPE_INDEX egt_14_1024 [] = {0xFF01,1057,0xFFFF};
static const EIF_TYPE_INDEX egt_15_1024 [] = {0xFF01,962,0xFFFF};
static const EIF_TYPE_INDEX egt_16_1024 [] = {0xFF01,1025,0xFFFF};
static const EIF_TYPE_INDEX egt_17_1024 [] = {0xFF01,232,0xFFFF};
static const EIF_TYPE_INDEX egt_18_1024 [] = {0xFF01,232,0xFFFF};


static const struct desc_info desc_1024[] = {
	{EIF_GENERIC(NULL), 0xFFFFFFFF, 0xFFFFFFFF},
	{EIF_GENERIC(egt_0_1024), 0, 0xFFFFFFFF},
	{EIF_GENERIC(egt_1_1024), 1, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0191 /*200*/), 2, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0191 /*200*/), 3, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0191 /*200*/), 4, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0191 /*200*/), 5, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0191 /*200*/), 6, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0191 /*200*/), 7, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0191 /*200*/), 8, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0191 /*200*/), 9, 0xFFFFFFFF},
	{EIF_GENERIC(egt_2_1024), 10, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 11, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 12, 0xFFFFFFFF},
	{EIF_GENERIC(egt_3_1024), 13, 0xFFFFFFFF},
	{EIF_GENERIC(egt_4_1024), 14, 0xFFFFFFFF},
	{EIF_GENERIC(egt_5_1024), 15, 0xFFFFFFFF},
	{EIF_GENERIC(egt_6_1024), 16, 0xFFFFFFFF},
	{EIF_GENERIC(egt_7_1024), 17, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 18, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 19, 0xFFFFFFFF},
	{EIF_GENERIC(egt_8_1024), 20, 0xFFFFFFFF},
	{EIF_GENERIC(egt_9_1024), 21, 0xFFFFFFFF},
	{EIF_GENERIC(egt_10_1024), 22, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 23, 0xFFFFFFFF},
	{EIF_GENERIC(egt_11_1024), 24, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 25, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 26, 0xFFFFFFFF},
	{EIF_GENERIC(NULL), 27, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x07FF /*1023*/), 28, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01C7 /*227*/), 29, 0xFFFFFFFF},
	{EIF_GENERIC(egt_12_1024), 30, 0xFFFFFFFF},
	{EIF_GENERIC(egt_13_1024), 13629, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13658, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13659, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13660, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13661, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13662, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13663, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13664, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0185 /*194*/), 13665, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0185 /*194*/), 13666, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13667, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13668, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13669, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13670, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13671, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13672, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13673, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13674, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13675, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13676, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13677, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13678, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13679, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13680, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13681, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13682, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13683, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13684, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13685, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13686, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13687, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13688, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13689, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13690, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13691, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13636, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13637, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13638, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13639, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13640, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13641, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13642, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13643, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13644, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13645, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13646, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13647, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13648, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13649, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13650, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13651, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13652, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13653, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13654, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13655, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13656, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 13657, 0xFFFFFFFF},
	{EIF_GENERIC(egt_14_1024), 14294, 0xFFFFFFFF},
	{EIF_GENERIC(egt_15_1024), 14396, 0xFFFFFFFF},
	{EIF_GENERIC(egt_16_1024), 14395, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0191 /*200*/), 14442, 0xFFFFFFFF},
	{EIF_GENERIC(egt_17_1024), 14443, 0xFFFFFFFF},
	{EIF_GENERIC(egt_18_1024), 14444, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0191 /*200*/), 14445, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0191 /*200*/), 14446, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x0191 /*200*/), 14447, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 14448, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 14449, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 14450, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 14451, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 14452, 0xFFFFFFFF},
	{EIF_NON_GENERIC(0x01BB /*221*/), 14453, 0xFFFFFFFF},
};
void Init1024(void)
{
	IDSC(desc_1024, 0, 1023);
	IDSC(desc_1024 + 1, 1, 1023);
	IDSC(desc_1024 + 32, 402, 1023);
	IDSC(desc_1024 + 33, 488, 1023);
	IDSC(desc_1024 + 89, 450, 1023);
	IDSC(desc_1024 + 90, 386, 1023);
	IDSC(desc_1024 + 91, 399, 1023);
	IDSC(desc_1024 + 92, 475, 1023);
}


#ifdef __cplusplus
}
#endif
