/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/jorgep/OneDrive/Faculdade/Mestrado/PSD/labs/project2/src/verilog-tb/profir_tb.v";
static int ng1[] = {778593656, 0, 1952541038, 0, 1630495841, 0, 1835295092, 0, 774861673, 0, 46, 0};
static int ng2[] = {0, 0};
static unsigned int ng3[] = {65535U, 65535U};
static int ng4[] = {1, 0};
static const char *ng5 = "Read %d samples from input file %s";
static int ng6[] = {778593656, 0, 1634694516, 0, 795107700, 0, 1684108385, 0, 796092781, 0, 11822, 0};
static const char *ng7 = "Read %d samples from output file %s";
static const char *ng8 = "filterWaveforms.vcd";
static int ng9[] = {5, 0};
static int ng10[] = {2, 0};
static int ng11[] = {127, 0};
static int ng12[] = {20, 0};
static const char *ng13 = "[TEST RESULT] Both vectors match!";
static const char *ng14 = "[TEST RESULT] %d samples differ from expected!";
static int ng15[] = {1000, 0};
static unsigned int ng16[] = {0U, 0U};
static unsigned int ng17[] = {0U, 0U, 0U, 0U};



static void Initial_42_0(char *t0)
{
    char t6[8];
    char t15[8];
    char t26[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t14;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;

LAB0:    xsi_set_current_line(43, ng0);

LAB2:    xsi_set_current_line(44, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 5808);
    xsi_vlogfile_readmemh(t1, 168, t2, 0, 0, 0, 0);
    xsi_set_current_line(45, ng0);
    xsi_set_current_line(45, ng0);
    t1 = ((char*)((ng2)));
    t2 = (t0 + 6128);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 32);

LAB3:    t1 = (t0 + 6128);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t0 + 472);
    t5 = *((char **)t4);
    memset(t6, 0, 8);
    xsi_vlog_signed_less(t6, 32, t3, 32, t5, 32);
    t4 = (t6 + 4);
    t7 = *((unsigned int *)t4);
    t8 = (~(t7));
    t9 = *((unsigned int *)t6);
    t10 = (t9 & t8);
    t11 = (t10 != 0);
    if (t11 > 0)
        goto LAB4;

LAB5:    xsi_set_current_line(48, ng0);
    t1 = (t0 + 6288);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = ((char*)((ng1)));
    xsi_vlogfile_write(1, 0, 0, ng5, 3, t0, (char)119, t3, 32, (char)118, t4, 168);
    xsi_set_current_line(50, ng0);
    t1 = ((char*)((ng6)));
    t2 = (t0 + 5968);
    xsi_vlogfile_readmemh(t1, 176, t2, 0, 0, 0, 0);
    xsi_set_current_line(51, ng0);
    xsi_set_current_line(51, ng0);
    t1 = ((char*)((ng2)));
    t2 = (t0 + 6128);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 32);

LAB12:    t1 = (t0 + 6128);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t0 + 472);
    t5 = *((char **)t4);
    memset(t6, 0, 8);
    xsi_vlog_signed_less(t6, 32, t3, 32, t5, 32);
    t4 = (t6 + 4);
    t7 = *((unsigned int *)t4);
    t8 = (~(t7));
    t9 = *((unsigned int *)t6);
    t10 = (t9 & t8);
    t11 = (t10 != 0);
    if (t11 > 0)
        goto LAB13;

LAB14:    xsi_set_current_line(54, ng0);
    t1 = (t0 + 6448);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = ((char*)((ng6)));
    xsi_vlogfile_write(1, 0, 0, ng7, 3, t0, (char)119, t3, 32, (char)118, t4, 176);

LAB1:    return;
LAB4:    xsi_set_current_line(46, ng0);
    t12 = (t0 + 5808);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t16 = (t0 + 5808);
    t17 = (t16 + 72U);
    t18 = *((char **)t17);
    t19 = (t0 + 5808);
    t20 = (t19 + 64U);
    t21 = *((char **)t20);
    t22 = (t0 + 6128);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    xsi_vlog_generic_get_array_select_value(t15, 16, t14, t18, t21, 2, 1, t24, 32, 1);
    t25 = ((char*)((ng3)));
    memset(t26, 0, 8);
    if (*((unsigned int *)t15) != *((unsigned int *)t25))
        goto LAB7;

LAB6:    t27 = (t15 + 4);
    t28 = (t25 + 4);
    if (*((unsigned int *)t27) != *((unsigned int *)t28))
        goto LAB7;

LAB8:    t29 = (t26 + 4);
    t30 = *((unsigned int *)t29);
    t31 = (~(t30));
    t32 = *((unsigned int *)t26);
    t33 = (t32 & t31);
    t34 = (t33 != 0);
    if (t34 > 0)
        goto LAB9;

LAB10:
LAB11:    xsi_set_current_line(45, ng0);
    t1 = (t0 + 6128);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = ((char*)((ng4)));
    memset(t6, 0, 8);
    xsi_vlog_signed_add(t6, 32, t3, 32, t4, 32);
    t5 = (t0 + 6128);
    xsi_vlogvar_assign_value(t5, t6, 0, 0, 32);
    goto LAB3;

LAB7:    *((unsigned int *)t26) = 1;
    goto LAB8;

LAB9:    xsi_set_current_line(47, ng0);
    t35 = (t0 + 6128);
    t36 = (t35 + 56U);
    t37 = *((char **)t36);
    t38 = (t0 + 6288);
    xsi_vlogvar_assign_value(t38, t37, 0, 0, 32);
    goto LAB11;

LAB13:    xsi_set_current_line(52, ng0);
    t12 = (t0 + 5968);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t16 = (t0 + 5968);
    t17 = (t16 + 72U);
    t18 = *((char **)t17);
    t19 = (t0 + 5968);
    t20 = (t19 + 64U);
    t21 = *((char **)t20);
    t22 = (t0 + 6128);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    xsi_vlog_generic_get_array_select_value(t15, 16, t14, t18, t21, 2, 1, t24, 32, 1);
    t25 = ((char*)((ng3)));
    memset(t26, 0, 8);
    if (*((unsigned int *)t15) != *((unsigned int *)t25))
        goto LAB16;

LAB15:    t27 = (t15 + 4);
    t28 = (t25 + 4);
    if (*((unsigned int *)t27) != *((unsigned int *)t28))
        goto LAB16;

LAB17:    t29 = (t26 + 4);
    t30 = *((unsigned int *)t29);
    t31 = (~(t30));
    t32 = *((unsigned int *)t26);
    t33 = (t32 & t31);
    t34 = (t33 != 0);
    if (t34 > 0)
        goto LAB18;

LAB19:
LAB20:    xsi_set_current_line(51, ng0);
    t1 = (t0 + 6128);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = ((char*)((ng4)));
    memset(t6, 0, 8);
    xsi_vlog_signed_add(t6, 32, t3, 32, t4, 32);
    t5 = (t0 + 6128);
    xsi_vlogvar_assign_value(t5, t6, 0, 0, 32);
    goto LAB12;

LAB16:    *((unsigned int *)t26) = 1;
    goto LAB17;

LAB18:    xsi_set_current_line(53, ng0);
    t35 = (t0 + 6128);
    t36 = (t35 + 56U);
    t37 = *((char **)t36);
    t38 = (t0 + 6448);
    xsi_vlogvar_assign_value(t38, t37, 0, 0, 32);
    goto LAB20;

}

static void Initial_58_1(char *t0)
{
    char t4[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;

LAB0:    t1 = (t0 + 8568U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(59, ng0);

LAB4:    xsi_set_current_line(60, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 5328);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(61, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 5488);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(62, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 5648);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(64, ng0);

LAB5:    xsi_set_current_line(64, ng0);
    t2 = (t0 + 8376);
    xsi_process_wait(t2, 2000LL);
    *((char **)t1) = &&LAB6;

LAB1:    return;
LAB6:    xsi_set_current_line(64, ng0);
    t3 = (t0 + 5328);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB10;

LAB8:    if (*((unsigned int *)t7) == 0)
        goto LAB7;

LAB9:    t13 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t13) = 1;

LAB10:    t14 = (t4 + 4);
    t15 = (t6 + 4);
    t16 = *((unsigned int *)t6);
    t17 = (~(t16));
    *((unsigned int *)t4) = t17;
    *((unsigned int *)t14) = 0;
    if (*((unsigned int *)t15) != 0)
        goto LAB12;

LAB11:    t22 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t22 & 1U);
    t23 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t23 & 1U);
    t24 = (t0 + 5328);
    xsi_vlogvar_assign_value(t24, t4, 0, 0, 1);
    goto LAB5;

LAB7:    *((unsigned int *)t4) = 1;
    goto LAB10;

LAB12:    t18 = *((unsigned int *)t4);
    t19 = *((unsigned int *)t15);
    *((unsigned int *)t4) = (t18 | t19);
    t20 = *((unsigned int *)t14);
    t21 = *((unsigned int *)t15);
    *((unsigned int *)t14) = (t20 | t21);
    goto LAB11;

LAB13:    goto LAB1;

}

static void Initial_69_2(char *t0)
{
    char *t1;

LAB0:    xsi_set_current_line(70, ng0);

LAB2:    xsi_set_current_line(71, ng0);
    xsi_vcd_dumpfile(ng8);
    xsi_set_current_line(72, ng0);
    t1 = ((char*)((ng2)));
    xsi_vcd_dumpvars_args(*((unsigned int *)t1), t0, (char)109, t0, (char)101);

LAB1:    return;
}

static void Initial_80_3(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    unsigned int t5;
    unsigned int t6;
    unsigned int t7;
    int t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    t1 = (t0 + 9064U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(81, ng0);

LAB4:    xsi_set_current_line(82, ng0);
    t2 = (t0 + 8872);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(83, ng0);
    t3 = (t0 + 10872);
    *((int *)t3) = 1;
    t4 = (t0 + 9096);
    *((char **)t4) = t3;
    *((char **)t1) = &&LAB6;
    goto LAB1;

LAB6:    xsi_set_current_line(84, ng0);
    t2 = ((char*)((ng9)));
    t3 = (t2 + 4);
    t5 = *((unsigned int *)t3);
    t6 = (~(t5));
    t7 = *((unsigned int *)t2);
    t8 = (t7 & t6);
    t4 = (t0 + 14112);
    *((int *)t4) = t8;

LAB7:    t9 = (t0 + 14112);
    if (*((int *)t9) > 0)
        goto LAB8;

LAB9:    xsi_set_current_line(86, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 5488);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(87, ng0);
    t2 = ((char*)((ng10)));
    t3 = (t2 + 4);
    t5 = *((unsigned int *)t3);
    t6 = (~(t5));
    t7 = *((unsigned int *)t2);
    t8 = (t7 & t6);
    t4 = (t0 + 14116);
    *((int *)t4) = t8;

LAB11:    t9 = (t0 + 14116);
    if (*((int *)t9) > 0)
        goto LAB12;

LAB13:    xsi_set_current_line(89, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 5488);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB1;

LAB8:    xsi_set_current_line(85, ng0);
    t10 = (t0 + 10888);
    *((int *)t10) = 1;
    t11 = (t0 + 9096);
    *((char **)t11) = t10;
    *((char **)t1) = &&LAB10;
    goto LAB1;

LAB10:    t2 = (t0 + 14112);
    t8 = *((int *)t2);
    *((int *)t2) = (t8 - 1);
    goto LAB7;

LAB12:    xsi_set_current_line(88, ng0);
    t10 = (t0 + 10904);
    *((int *)t10) = 1;
    t11 = (t0 + 9096);
    *((char **)t11) = t10;
    *((char **)t1) = &&LAB14;
    goto LAB1;

LAB14:    t2 = (t0 + 14116);
    t8 = *((int *)t2);
    *((int *)t2) = (t8 - 1);
    goto LAB11;

}

static void Always_96_4(char *t0)
{
    char t15[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;

LAB0:    t1 = (t0 + 9312U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(96, ng0);
    t2 = (t0 + 10920);
    *((int *)t2) = 1;
    t3 = (t0 + 9344);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(97, ng0);

LAB5:    xsi_set_current_line(98, ng0);
    t4 = (t0 + 5488);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(103, ng0);

LAB10:    xsi_set_current_line(104, ng0);
    t2 = (t0 + 6608);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng11)));
    memset(t15, 0, 8);
    xsi_vlog_signed_equal(t15, 32, t4, 32, t5, 32);
    t6 = (t15 + 4);
    t8 = *((unsigned int *)t6);
    t9 = (~(t8));
    t10 = *((unsigned int *)t15);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB11;

LAB12:    xsi_set_current_line(107, ng0);
    t2 = (t0 + 6608);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng4)));
    memset(t15, 0, 8);
    xsi_vlog_signed_add(t15, 32, t4, 32, t5, 32);
    t6 = (t0 + 6608);
    xsi_vlogvar_wait_assign_value(t6, t15, 0, 0, 32, 0LL);

LAB13:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(99, ng0);

LAB9:    xsi_set_current_line(100, ng0);
    t13 = ((char*)((ng2)));
    t14 = (t0 + 6608);
    xsi_vlogvar_wait_assign_value(t14, t13, 0, 0, 32, 0LL);
    goto LAB8;

LAB11:    xsi_set_current_line(105, ng0);
    t7 = ((char*)((ng2)));
    t13 = (t0 + 6608);
    xsi_vlogvar_wait_assign_value(t13, t7, 0, 0, 32, 0LL);
    goto LAB13;

}

static void Cont_111_5(char *t0)
{
    char t6[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;

LAB0:    t1 = (t0 + 9560U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(111, ng0);
    t2 = (t0 + 6608);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng11)));
    memset(t6, 0, 8);
    xsi_vlog_signed_equal(t6, 32, t4, 32, t5, 32);
    t7 = (t0 + 11048);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    memset(t11, 0, 8);
    t12 = 1U;
    t13 = t12;
    t14 = (t6 + 4);
    t15 = *((unsigned int *)t6);
    t12 = (t12 & t15);
    t16 = *((unsigned int *)t14);
    t13 = (t13 & t16);
    t17 = (t11 + 4);
    t18 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t18 | t12);
    t19 = *((unsigned int *)t17);
    *((unsigned int *)t17) = (t19 | t13);
    xsi_driver_vfirst_trans_delayed(t7, 0, 0, 1000LL, 0);
    t20 = (t0 + 10936);
    *((int *)t20) = 1;

LAB1:    return;
}

static void Always_128_6(char *t0)
{
    char t7[8];
    char t23[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t24;
    char *t25;
    char *t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;

LAB0:    t1 = (t0 + 9808U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(128, ng0);
    t2 = (t0 + 10952);
    *((int *)t2) = 1;
    t3 = (t0 + 9840);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(129, ng0);

LAB5:    xsi_set_current_line(131, ng0);
    t4 = (t0 + 5808);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t0 + 5808);
    t9 = (t8 + 72U);
    t10 = *((char **)t9);
    t11 = (t0 + 5808);
    t12 = (t11 + 64U);
    t13 = *((char **)t12);
    t14 = (t0 + 6768);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    xsi_vlog_generic_get_array_select_value(t7, 16, t6, t10, t13, 2, 1, t16, 32, 1);
    t17 = (t0 + 5648);
    xsi_vlogvar_wait_assign_value(t17, t7, 0, 0, 16, 0LL);
    xsi_set_current_line(132, ng0);
    t2 = (t0 + 6928);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t7, 0, 8);
    xsi_vlog_signed_greatereq(t7, 32, t4, 32, t5, 32);
    t6 = (t7 + 4);
    t18 = *((unsigned int *)t6);
    t19 = (~(t18));
    t20 = *((unsigned int *)t7);
    t21 = (t20 & t19);
    t22 = (t21 != 0);
    if (t22 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(135, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 7088);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 16, 0LL);

LAB8:    xsi_set_current_line(136, ng0);
    t2 = (t0 + 6928);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng4)));
    memset(t7, 0, 8);
    xsi_vlog_signed_add(t7, 32, t4, 32, t5, 32);
    t6 = (t0 + 6928);
    xsi_vlogvar_assign_value(t6, t7, 0, 0, 32);
    xsi_set_current_line(139, ng0);
    t2 = (t0 + 6768);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng12)));
    memset(t7, 0, 8);
    xsi_vlog_signed_equal(t7, 32, t4, 32, t5, 32);
    t6 = (t7 + 4);
    t18 = *((unsigned int *)t6);
    t19 = (~(t18));
    t20 = *((unsigned int *)t7);
    t21 = (t20 & t19);
    t22 = (t21 != 0);
    if (t22 > 0)
        goto LAB9;

LAB10:    xsi_set_current_line(151, ng0);
    t2 = (t0 + 6768);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng4)));
    memset(t7, 0, 8);
    xsi_vlog_signed_add(t7, 32, t4, 32, t5, 32);
    t6 = (t0 + 6768);
    xsi_vlogvar_wait_assign_value(t6, t7, 0, 0, 32, 0LL);

LAB11:    xsi_set_current_line(155, ng0);
    t2 = (t0 + 3328U);
    t3 = *((char **)t2);
    t2 = (t0 + 7088);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    memset(t7, 0, 8);
    t6 = (t3 + 4);
    t8 = (t5 + 4);
    t18 = *((unsigned int *)t3);
    t19 = *((unsigned int *)t5);
    t20 = (t18 ^ t19);
    t21 = *((unsigned int *)t6);
    t22 = *((unsigned int *)t8);
    t27 = (t21 ^ t22);
    t28 = (t20 | t27);
    t29 = *((unsigned int *)t6);
    t30 = *((unsigned int *)t8);
    t31 = (t29 | t30);
    t33 = (~(t31));
    t34 = (t28 & t33);
    if (t34 != 0)
        goto LAB21;

LAB20:    if (t31 != 0)
        goto LAB22;

LAB23:    t10 = (t7 + 4);
    t35 = *((unsigned int *)t10);
    t36 = (~(t35));
    t37 = *((unsigned int *)t7);
    t38 = (t37 & t36);
    t39 = (t38 != 0);
    if (t39 > 0)
        goto LAB24;

LAB25:
LAB26:    goto LAB2;

LAB6:    xsi_set_current_line(133, ng0);
    t8 = (t0 + 5968);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t0 + 5968);
    t12 = (t11 + 72U);
    t13 = *((char **)t12);
    t14 = (t0 + 5968);
    t15 = (t14 + 64U);
    t16 = *((char **)t15);
    t17 = (t0 + 6928);
    t24 = (t17 + 56U);
    t25 = *((char **)t24);
    xsi_vlog_generic_get_array_select_value(t23, 16, t10, t13, t16, 2, 1, t25, 32, 1);
    t26 = (t0 + 7088);
    xsi_vlogvar_wait_assign_value(t26, t23, 0, 0, 16, 0LL);
    goto LAB8;

LAB9:    xsi_set_current_line(140, ng0);

LAB12:    xsi_set_current_line(142, ng0);
    t8 = (t0 + 7408);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = ((char*)((ng2)));
    memset(t23, 0, 8);
    xsi_vlog_signed_equal(t23, 32, t10, 32, t11, 32);
    t12 = (t23 + 4);
    t27 = *((unsigned int *)t12);
    t28 = (~(t27));
    t29 = *((unsigned int *)t23);
    t30 = (t29 & t28);
    t31 = (t30 != 0);
    if (t31 > 0)
        goto LAB13;

LAB14:    xsi_set_current_line(145, ng0);
    t2 = (t0 + 7408);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    xsi_vlogfile_write(1, 0, 0, ng14, 2, t0, (char)119, t4, 32);

LAB15:    xsi_set_current_line(146, ng0);
    t2 = ((char*)((ng15)));
    t3 = (t2 + 4);
    t18 = *((unsigned int *)t3);
    t19 = (~(t18));
    t20 = *((unsigned int *)t2);
    t32 = (t20 & t19);
    t4 = (t0 + 14120);
    *((int *)t4) = t32;

LAB16:    t5 = (t0 + 14120);
    if (*((int *)t5) > 0)
        goto LAB17;

LAB18:    xsi_set_current_line(148, ng0);
    xsi_vlog_stop(1);
    goto LAB11;

LAB13:    xsi_set_current_line(143, ng0);
    xsi_vlogfile_write(1, 0, 0, ng13, 1, t0);
    goto LAB15;

LAB17:    xsi_set_current_line(147, ng0);
    t6 = (t0 + 10968);
    *((int *)t6) = 1;
    t8 = (t0 + 9840);
    *((char **)t8) = t6;
    *((char **)t1) = &&LAB19;
    goto LAB1;

LAB19:    t2 = (t0 + 14120);
    t32 = *((int *)t2);
    *((int *)t2) = (t32 - 1);
    goto LAB16;

LAB21:    *((unsigned int *)t7) = 1;
    goto LAB23;

LAB22:    t9 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t9) = 1;
    goto LAB23;

LAB24:    xsi_set_current_line(156, ng0);
    t11 = (t0 + 7408);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = ((char*)((ng4)));
    memset(t23, 0, 8);
    xsi_vlog_signed_add(t23, 32, t13, 32, t14, 32);
    t15 = (t0 + 7408);
    xsi_vlogvar_wait_assign_value(t15, t23, 0, 0, 32, 0LL);
    goto LAB26;

}

static void implSig1_execute(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;

LAB0:    t1 = (t0 + 10056U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = ((char*)((ng16)));
    t3 = (t0 + 11112);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memset(t7, 0, 8);
    t8 = 511U;
    t9 = t8;
    t10 = (t2 + 4);
    t11 = *((unsigned int *)t2);
    t8 = (t8 & t11);
    t12 = *((unsigned int *)t10);
    t9 = (t9 & t12);
    t13 = (t7 + 4);
    t14 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t14 | t8);
    t15 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t15 | t9);
    xsi_driver_vfirst_trans(t3, 0, 8);

LAB1:    return;
}

static void implSig2_execute(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    t1 = (t0 + 10304U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = ((char*)((ng17)));
    t3 = (t0 + 11176);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    xsi_vlog_bit_copy(t7, 0, t2, 0, 36);
    xsi_driver_vfirst_trans(t3, 0, 35);

LAB1:    return;
}

static void implSig3_execute(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;

LAB0:    t1 = (t0 + 10552U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = ((char*)((ng16)));
    t3 = (t0 + 11240);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memset(t7, 0, 8);
    t8 = 1U;
    t9 = t8;
    t10 = (t2 + 4);
    t11 = *((unsigned int *)t2);
    t8 = (t8 & t11);
    t12 = *((unsigned int *)t10);
    t9 = (t9 & t12);
    t13 = (t7 + 4);
    t14 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t14 | t8);
    t15 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t15 | t9);
    xsi_driver_vfirst_trans(t3, 0, 0);

LAB1:    return;
}


extern void work_m_18101230665884918396_3409812232_init()
{
	static char *pe[] = {(void *)Initial_42_0,(void *)Initial_58_1,(void *)Initial_69_2,(void *)Initial_80_3,(void *)Always_96_4,(void *)Cont_111_5,(void *)Always_128_6,(void *)implSig1_execute,(void *)implSig2_execute,(void *)implSig3_execute};
	xsi_register_didat("work_m_18101230665884918396_3409812232", "isim/profir_tb_isim_beh.exe.sim/work/m_18101230665884918396_3409812232.didat");
	xsi_register_executes(pe);
}
