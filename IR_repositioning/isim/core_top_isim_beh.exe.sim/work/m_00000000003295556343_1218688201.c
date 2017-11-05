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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Nickj/Documents/GitHub/ECE-3710/IR_repositioning/VGA_SIGNAL_GENERATOR.v";
static unsigned int ng1[] = {1U, 0U};
static unsigned int ng2[] = {0U, 0U};
static unsigned int ng3[] = {48U, 0U};
static unsigned int ng4[] = {688U, 0U};
static unsigned int ng5[] = {32U, 0U};
static unsigned int ng6[] = {513U, 0U};



static void Cont_54_0(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;

LAB0:    t1 = (t0 + 5536U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(54, ng0);
    t2 = (t0 + 4296);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    memset(t3, 0, 8);
    t6 = (t5 + 4);
    t7 = *((unsigned int *)t5);
    t8 = *((unsigned int *)t6);
    t9 = (t7 | t8);
    if (t9 != 3U)
        goto LAB5;

LAB4:    if (*((unsigned int *)t6) == 0)
        goto LAB6;

LAB7:    t10 = (t3 + 4);
    *((unsigned int *)t3) = 1;
    *((unsigned int *)t10) = 1;

LAB5:    t11 = (t0 + 7256);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memset(t15, 0, 8);
    t16 = 1U;
    t17 = t16;
    t18 = (t3 + 4);
    t19 = *((unsigned int *)t3);
    t16 = (t16 & t19);
    t20 = *((unsigned int *)t18);
    t17 = (t17 & t20);
    t21 = (t15 + 4);
    t22 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t22 | t16);
    t23 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t23 | t17);
    xsi_driver_vfirst_trans(t11, 0, 0);
    t24 = (t0 + 7096);
    *((int *)t24) = 1;

LAB1:    return;
LAB6:    *((unsigned int *)t3) = 1;
    goto LAB5;

}

static void Cont_57_1(char *t0)
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

LAB0:    t1 = (t0 + 5784U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(57, ng0);
    t2 = (t0 + 4456);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
    memset(t6, 0, 8);
    xsi_vlog_unsigned_add(t6, 10, t4, 10, t5, 10);
    t7 = (t0 + 7320);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    memset(t11, 0, 8);
    t12 = 1023U;
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
    xsi_driver_vfirst_trans(t7, 0, 9);
    t20 = (t0 + 7112);
    *((int *)t20) = 1;

LAB1:    return;
}

static void Cont_60_2(char *t0)
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

LAB0:    t1 = (t0 + 6032U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(60, ng0);
    t2 = (t0 + 4616);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
    memset(t6, 0, 8);
    xsi_vlog_unsigned_add(t6, 10, t4, 10, t5, 10);
    t7 = (t0 + 7384);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    memset(t11, 0, 8);
    t12 = 1023U;
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
    xsi_driver_vfirst_trans(t7, 0, 9);
    t20 = (t0 + 7128);
    *((int *)t20) = 1;

LAB1:    return;
}

static void Cont_63_3(char *t0)
{
    char t3[8];
    char t4[8];
    char t8[8];
    char t9[8];
    char *t1;
    char *t2;
    char *t5;
    char *t6;
    char *t7;
    char *t10;
    char *t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    char *t36;
    unsigned int t37;
    unsigned int t38;
    char *t39;
    unsigned int t40;
    unsigned int t41;
    char *t42;

LAB0:    t1 = (t0 + 6280U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(63, ng0);
    t2 = (t0 + 2296U);
    t5 = *((char **)t2);
    t2 = (t0 + 472);
    t6 = *((char **)t2);
    t2 = (t0 + 1016);
    t7 = *((char **)t2);
    memset(t8, 0, 8);
    xsi_vlog_unsigned_minus(t8, 32, t6, 32, t7, 32);
    memset(t9, 0, 8);
    t2 = (t5 + 4);
    if (*((unsigned int *)t2) != 0)
        goto LAB5;

LAB4:    t10 = (t8 + 4);
    if (*((unsigned int *)t10) != 0)
        goto LAB5;

LAB8:    if (*((unsigned int *)t5) < *((unsigned int *)t8))
        goto LAB6;

LAB7:    memset(t4, 0, 8);
    t12 = (t9 + 4);
    t13 = *((unsigned int *)t12);
    t14 = (~(t13));
    t15 = *((unsigned int *)t9);
    t16 = (t15 & t14);
    t17 = (t16 & 1U);
    if (t17 != 0)
        goto LAB9;

LAB10:    if (*((unsigned int *)t12) != 0)
        goto LAB11;

LAB12:    t19 = (t4 + 4);
    t20 = *((unsigned int *)t4);
    t21 = *((unsigned int *)t19);
    t22 = (t20 || t21);
    if (t22 > 0)
        goto LAB13;

LAB14:    t24 = *((unsigned int *)t4);
    t25 = (~(t24));
    t26 = *((unsigned int *)t19);
    t27 = (t25 || t26);
    if (t27 > 0)
        goto LAB15;

LAB16:    if (*((unsigned int *)t19) > 0)
        goto LAB17;

LAB18:    if (*((unsigned int *)t4) > 0)
        goto LAB19;

LAB20:    memcpy(t3, t28, 8);

LAB21:    t29 = (t0 + 7448);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    t32 = (t31 + 56U);
    t33 = *((char **)t32);
    memset(t33, 0, 8);
    t34 = 1U;
    t35 = t34;
    t36 = (t3 + 4);
    t37 = *((unsigned int *)t3);
    t34 = (t34 & t37);
    t38 = *((unsigned int *)t36);
    t35 = (t35 & t38);
    t39 = (t33 + 4);
    t40 = *((unsigned int *)t33);
    *((unsigned int *)t33) = (t40 | t34);
    t41 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t41 | t35);
    xsi_driver_vfirst_trans(t29, 0, 0);
    t42 = (t0 + 7144);
    *((int *)t42) = 1;

LAB1:    return;
LAB5:    t11 = (t9 + 4);
    *((unsigned int *)t9) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB7;

LAB6:    *((unsigned int *)t9) = 1;
    goto LAB7;

LAB9:    *((unsigned int *)t4) = 1;
    goto LAB12;

LAB11:    t18 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t18) = 1;
    goto LAB12;

LAB13:    t23 = ((char*)((ng1)));
    goto LAB14;

LAB15:    t28 = ((char*)((ng2)));
    goto LAB16;

LAB17:    xsi_vlog_unsigned_bit_combine(t3, 1, t23, 1, t28, 1);
    goto LAB21;

LAB19:    memcpy(t3, t23, 8);
    goto LAB21;

}

static void Cont_66_4(char *t0)
{
    char t3[8];
    char t4[8];
    char t8[8];
    char t9[8];
    char *t1;
    char *t2;
    char *t5;
    char *t6;
    char *t7;
    char *t10;
    char *t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    char *t36;
    unsigned int t37;
    unsigned int t38;
    char *t39;
    unsigned int t40;
    unsigned int t41;
    char *t42;

LAB0:    t1 = (t0 + 6528U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(66, ng0);
    t2 = (t0 + 2456U);
    t5 = *((char **)t2);
    t2 = (t0 + 608);
    t6 = *((char **)t2);
    t2 = (t0 + 1424);
    t7 = *((char **)t2);
    memset(t8, 0, 8);
    xsi_vlog_unsigned_minus(t8, 32, t6, 32, t7, 32);
    memset(t9, 0, 8);
    t2 = (t5 + 4);
    if (*((unsigned int *)t2) != 0)
        goto LAB5;

LAB4:    t10 = (t8 + 4);
    if (*((unsigned int *)t10) != 0)
        goto LAB5;

LAB8:    if (*((unsigned int *)t5) < *((unsigned int *)t8))
        goto LAB6;

LAB7:    memset(t4, 0, 8);
    t12 = (t9 + 4);
    t13 = *((unsigned int *)t12);
    t14 = (~(t13));
    t15 = *((unsigned int *)t9);
    t16 = (t15 & t14);
    t17 = (t16 & 1U);
    if (t17 != 0)
        goto LAB9;

LAB10:    if (*((unsigned int *)t12) != 0)
        goto LAB11;

LAB12:    t19 = (t4 + 4);
    t20 = *((unsigned int *)t4);
    t21 = *((unsigned int *)t19);
    t22 = (t20 || t21);
    if (t22 > 0)
        goto LAB13;

LAB14:    t24 = *((unsigned int *)t4);
    t25 = (~(t24));
    t26 = *((unsigned int *)t19);
    t27 = (t25 || t26);
    if (t27 > 0)
        goto LAB15;

LAB16:    if (*((unsigned int *)t19) > 0)
        goto LAB17;

LAB18:    if (*((unsigned int *)t4) > 0)
        goto LAB19;

LAB20:    memcpy(t3, t28, 8);

LAB21:    t29 = (t0 + 7512);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    t32 = (t31 + 56U);
    t33 = *((char **)t32);
    memset(t33, 0, 8);
    t34 = 1U;
    t35 = t34;
    t36 = (t3 + 4);
    t37 = *((unsigned int *)t3);
    t34 = (t34 & t37);
    t38 = *((unsigned int *)t36);
    t35 = (t35 & t38);
    t39 = (t33 + 4);
    t40 = *((unsigned int *)t33);
    *((unsigned int *)t33) = (t40 | t34);
    t41 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t41 | t35);
    xsi_driver_vfirst_trans(t29, 0, 0);
    t42 = (t0 + 7160);
    *((int *)t42) = 1;

LAB1:    return;
LAB5:    t11 = (t9 + 4);
    *((unsigned int *)t9) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB7;

LAB6:    *((unsigned int *)t9) = 1;
    goto LAB7;

LAB9:    *((unsigned int *)t4) = 1;
    goto LAB12;

LAB11:    t18 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t18) = 1;
    goto LAB12;

LAB13:    t23 = ((char*)((ng1)));
    goto LAB14;

LAB15:    t28 = ((char*)((ng2)));
    goto LAB16;

LAB17:    xsi_vlog_unsigned_bit_combine(t3, 1, t23, 1, t28, 1);
    goto LAB21;

LAB19:    memcpy(t3, t23, 8);
    goto LAB21;

}

static void Always_69_5(char *t0)
{
    char t8[8];
    char t10[8];
    char t19[8];
    char t20[8];
    char t23[8];
    char t41[8];
    char t59[8];
    char t60[8];
    char t72[8];
    char t95[8];
    char t100[8];
    char t132[8];
    char t148[8];
    char t152[8];
    char t160[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t9;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t21;
    char *t22;
    char *t24;
    char *t25;
    char *t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    char *t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    char *t52;
    char *t53;
    char *t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    char *t69;
    char *t70;
    char *t71;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    char *t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    char *t82;
    char *t83;
    char *t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    char *t89;
    char *t90;
    char *t91;
    char *t92;
    int t93;
    int t94;
    char *t96;
    unsigned int t97;
    unsigned int t98;
    char *t99;
    unsigned int t101;
    unsigned int t102;
    unsigned int t103;
    char *t104;
    char *t105;
    char *t106;
    unsigned int t107;
    unsigned int t108;
    unsigned int t109;
    unsigned int t110;
    unsigned int t111;
    unsigned int t112;
    unsigned int t113;
    char *t114;
    char *t115;
    unsigned int t116;
    unsigned int t117;
    unsigned int t118;
    unsigned int t119;
    unsigned int t120;
    unsigned int t121;
    unsigned int t122;
    unsigned int t123;
    int t124;
    int t125;
    unsigned int t126;
    unsigned int t127;
    unsigned int t128;
    unsigned int t129;
    unsigned int t130;
    unsigned int t131;
    char *t133;
    unsigned int t134;
    unsigned int t135;
    unsigned int t136;
    unsigned int t137;
    unsigned int t138;
    char *t139;
    char *t140;
    unsigned int t141;
    unsigned int t142;
    unsigned int t143;
    char *t144;
    char *t145;
    char *t146;
    char *t147;
    char *t149;
    char *t150;
    char *t151;
    char *t153;
    unsigned int t154;
    unsigned int t155;
    unsigned int t156;
    unsigned int t157;
    unsigned int t158;
    char *t159;
    unsigned int t161;
    unsigned int t162;
    unsigned int t163;
    char *t164;
    char *t165;
    char *t166;
    unsigned int t167;
    unsigned int t168;
    unsigned int t169;
    unsigned int t170;
    unsigned int t171;
    unsigned int t172;
    unsigned int t173;
    char *t174;
    char *t175;
    unsigned int t176;
    unsigned int t177;
    unsigned int t178;
    unsigned int t179;
    unsigned int t180;
    unsigned int t181;
    unsigned int t182;
    unsigned int t183;
    int t184;
    int t185;
    unsigned int t186;
    unsigned int t187;
    unsigned int t188;
    unsigned int t189;
    unsigned int t190;
    unsigned int t191;
    char *t192;
    unsigned int t193;
    unsigned int t194;
    unsigned int t195;
    unsigned int t196;
    unsigned int t197;
    char *t198;
    char *t199;
    unsigned int t200;
    unsigned int t201;
    unsigned int t202;
    char *t203;
    unsigned int t204;
    unsigned int t205;
    unsigned int t206;
    unsigned int t207;
    char *t208;
    char *t209;

LAB0:    t1 = (t0 + 6776U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(69, ng0);
    t2 = (t0 + 7176);
    *((int *)t2) = 1;
    t3 = (t0 + 6808);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(70, ng0);

LAB5:    xsi_set_current_line(71, ng0);
    t4 = (t0 + 4296);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = ((char*)((ng1)));
    memset(t8, 0, 8);
    xsi_vlog_unsigned_add(t8, 2, t6, 2, t7, 2);
    t9 = (t0 + 4296);
    xsi_vlogvar_wait_assign_value(t9, t8, 0, 0, 2, 0LL);
    xsi_set_current_line(72, ng0);
    t2 = (t0 + 2936U);
    t3 = *((char **)t2);
    memset(t10, 0, 8);
    t2 = (t3 + 4);
    t11 = *((unsigned int *)t2);
    t12 = (~(t11));
    t13 = *((unsigned int *)t3);
    t14 = (t13 & t12);
    t15 = (t14 & 1U);
    if (t15 != 0)
        goto LAB6;

LAB7:    if (*((unsigned int *)t2) != 0)
        goto LAB8;

LAB9:    t5 = (t10 + 4);
    t16 = *((unsigned int *)t10);
    t17 = *((unsigned int *)t5);
    t18 = (t16 || t17);
    if (t18 > 0)
        goto LAB10;

LAB11:    t47 = *((unsigned int *)t10);
    t48 = (~(t47));
    t49 = *((unsigned int *)t5);
    t50 = (t48 || t49);
    if (t50 > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t5) > 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t10) > 0)
        goto LAB16;

LAB17:    memcpy(t8, t53, 8);

LAB18:    t54 = (t0 + 4456);
    xsi_vlogvar_wait_assign_value(t54, t8, 0, 0, 10, 0LL);
    xsi_set_current_line(73, ng0);
    t2 = (t0 + 2936U);
    t3 = *((char **)t2);
    memset(t10, 0, 8);
    t2 = (t3 + 4);
    t11 = *((unsigned int *)t2);
    t12 = (~(t11));
    t13 = *((unsigned int *)t3);
    t14 = (t13 & t12);
    t15 = (t14 & 1U);
    if (t15 != 0)
        goto LAB37;

LAB38:    if (*((unsigned int *)t2) != 0)
        goto LAB39;

LAB40:    t5 = (t10 + 4);
    t16 = *((unsigned int *)t10);
    t17 = *((unsigned int *)t5);
    t18 = (t16 || t17);
    if (t18 > 0)
        goto LAB41;

LAB42:    t85 = *((unsigned int *)t10);
    t86 = (~(t85));
    t87 = *((unsigned int *)t5);
    t88 = (t86 || t87);
    if (t88 > 0)
        goto LAB43;

LAB44:    if (*((unsigned int *)t5) > 0)
        goto LAB45;

LAB46:    if (*((unsigned int *)t10) > 0)
        goto LAB47;

LAB48:    memcpy(t8, t91, 8);

LAB49:    t92 = (t0 + 4616);
    xsi_vlogvar_wait_assign_value(t92, t8, 0, 0, 10, 0LL);
    xsi_set_current_line(76, ng0);
    t2 = (t0 + 3656);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    memset(t19, 0, 8);
    t6 = (t4 + 4);
    if (*((unsigned int *)t6) != 0)
        goto LAB86;

LAB85:    t7 = (t5 + 4);
    if (*((unsigned int *)t7) != 0)
        goto LAB86;

LAB89:    if (*((unsigned int *)t4) > *((unsigned int *)t5))
        goto LAB87;

LAB88:    memset(t20, 0, 8);
    t21 = (t19 + 4);
    t11 = *((unsigned int *)t21);
    t12 = (~(t11));
    t13 = *((unsigned int *)t19);
    t14 = (t13 & t12);
    t15 = (t14 & 1U);
    if (t15 != 0)
        goto LAB90;

LAB91:    if (*((unsigned int *)t21) != 0)
        goto LAB92;

LAB93:    t24 = (t20 + 4);
    t16 = *((unsigned int *)t20);
    t17 = *((unsigned int *)t24);
    t18 = (t16 || t17);
    if (t18 > 0)
        goto LAB94;

LAB95:    memcpy(t59, t20, 8);

LAB96:    memset(t60, 0, 8);
    t70 = (t59 + 4);
    t74 = *((unsigned int *)t70);
    t75 = (~(t74));
    t76 = *((unsigned int *)t59);
    t78 = (t76 & t75);
    t79 = (t78 & 1U);
    if (t79 != 0)
        goto LAB109;

LAB110:    if (*((unsigned int *)t70) != 0)
        goto LAB111;

LAB112:    t77 = (t60 + 4);
    t80 = *((unsigned int *)t60);
    t81 = *((unsigned int *)t77);
    t85 = (t80 || t81);
    if (t85 > 0)
        goto LAB113;

LAB114:    memcpy(t100, t60, 8);

LAB115:    memset(t132, 0, 8);
    t133 = (t100 + 4);
    t134 = *((unsigned int *)t133);
    t135 = (~(t134));
    t136 = *((unsigned int *)t100);
    t137 = (t136 & t135);
    t138 = (t137 & 1U);
    if (t138 != 0)
        goto LAB128;

LAB129:    if (*((unsigned int *)t133) != 0)
        goto LAB130;

LAB131:    t140 = (t132 + 4);
    t141 = *((unsigned int *)t132);
    t142 = *((unsigned int *)t140);
    t143 = (t141 || t142);
    if (t143 > 0)
        goto LAB132;

LAB133:    memcpy(t160, t132, 8);

LAB134:    memset(t10, 0, 8);
    t192 = (t160 + 4);
    t193 = *((unsigned int *)t192);
    t194 = (~(t193));
    t195 = *((unsigned int *)t160);
    t196 = (t195 & t194);
    t197 = (t196 & 1U);
    if (t197 != 0)
        goto LAB147;

LAB148:    if (*((unsigned int *)t192) != 0)
        goto LAB149;

LAB150:    t199 = (t10 + 4);
    t200 = *((unsigned int *)t10);
    t201 = *((unsigned int *)t199);
    t202 = (t200 || t201);
    if (t202 > 0)
        goto LAB151;

LAB152:    t204 = *((unsigned int *)t10);
    t205 = (~(t204));
    t206 = *((unsigned int *)t199);
    t207 = (t205 || t206);
    if (t207 > 0)
        goto LAB153;

LAB154:    if (*((unsigned int *)t199) > 0)
        goto LAB155;

LAB156:    if (*((unsigned int *)t10) > 0)
        goto LAB157;

LAB158:    memcpy(t8, t208, 8);

LAB159:    t209 = (t0 + 3496);
    xsi_vlogvar_wait_assign_value(t209, t8, 0, 0, 1, 0LL);
    xsi_set_current_line(78, ng0);
    t2 = (t0 + 2616U);
    t3 = *((char **)t2);
    t2 = (t0 + 3976);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(79, ng0);
    t2 = (t0 + 2776U);
    t3 = *((char **)t2);
    t2 = (t0 + 4136);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(81, ng0);
    t2 = (t0 + 2296U);
    t3 = *((char **)t2);
    t2 = (t0 + 3656);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 10, 0LL);
    xsi_set_current_line(82, ng0);
    t2 = (t0 + 2456U);
    t3 = *((char **)t2);
    t2 = (t0 + 3816);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 10, 0LL);
    xsi_set_current_line(88, ng0);
    t2 = (t0 + 2936U);
    t3 = *((char **)t2);
    t2 = (t0 + 3336);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    goto LAB2;

LAB6:    *((unsigned int *)t10) = 1;
    goto LAB9;

LAB8:    t4 = (t10 + 4);
    *((unsigned int *)t10) = 1;
    *((unsigned int *)t4) = 1;
    goto LAB9;

LAB10:    t6 = (t0 + 4456);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    t21 = (t0 + 472);
    t22 = *((char **)t21);
    memset(t23, 0, 8);
    t21 = (t9 + 4);
    if (*((unsigned int *)t21) != 0)
        goto LAB20;

LAB19:    t24 = (t22 + 4);
    if (*((unsigned int *)t24) != 0)
        goto LAB20;

LAB23:    if (*((unsigned int *)t9) < *((unsigned int *)t22))
        goto LAB21;

LAB22:    memset(t20, 0, 8);
    t26 = (t23 + 4);
    t27 = *((unsigned int *)t26);
    t28 = (~(t27));
    t29 = *((unsigned int *)t23);
    t30 = (t29 & t28);
    t31 = (t30 & 1U);
    if (t31 != 0)
        goto LAB24;

LAB25:    if (*((unsigned int *)t26) != 0)
        goto LAB26;

LAB27:    t33 = (t20 + 4);
    t34 = *((unsigned int *)t20);
    t35 = *((unsigned int *)t33);
    t36 = (t34 || t35);
    if (t36 > 0)
        goto LAB28;

LAB29:    t42 = *((unsigned int *)t20);
    t43 = (~(t42));
    t44 = *((unsigned int *)t33);
    t45 = (t43 || t44);
    if (t45 > 0)
        goto LAB30;

LAB31:    if (*((unsigned int *)t33) > 0)
        goto LAB32;

LAB33:    if (*((unsigned int *)t20) > 0)
        goto LAB34;

LAB35:    memcpy(t19, t46, 8);

LAB36:    goto LAB11;

LAB12:    t51 = (t0 + 4456);
    t52 = (t51 + 56U);
    t53 = *((char **)t52);
    goto LAB13;

LAB14:    xsi_vlog_unsigned_bit_combine(t8, 10, t19, 10, t53, 10);
    goto LAB18;

LAB16:    memcpy(t8, t19, 8);
    goto LAB18;

LAB20:    t25 = (t23 + 4);
    *((unsigned int *)t23) = 1;
    *((unsigned int *)t25) = 1;
    goto LAB22;

LAB21:    *((unsigned int *)t23) = 1;
    goto LAB22;

LAB24:    *((unsigned int *)t20) = 1;
    goto LAB27;

LAB26:    t32 = (t20 + 4);
    *((unsigned int *)t20) = 1;
    *((unsigned int *)t32) = 1;
    goto LAB27;

LAB28:    t37 = (t0 + 4456);
    t38 = (t37 + 56U);
    t39 = *((char **)t38);
    t40 = ((char*)((ng1)));
    memset(t41, 0, 8);
    xsi_vlog_unsigned_add(t41, 10, t39, 10, t40, 10);
    goto LAB29;

LAB30:    t46 = ((char*)((ng2)));
    goto LAB31;

LAB32:    xsi_vlog_unsigned_bit_combine(t19, 10, t41, 10, t46, 10);
    goto LAB36;

LAB34:    memcpy(t19, t41, 8);
    goto LAB36;

LAB37:    *((unsigned int *)t10) = 1;
    goto LAB40;

LAB39:    t4 = (t10 + 4);
    *((unsigned int *)t10) = 1;
    *((unsigned int *)t4) = 1;
    goto LAB40;

LAB41:    t6 = (t0 + 2296U);
    t7 = *((char **)t6);
    t6 = (t0 + 472);
    t9 = *((char **)t6);
    memset(t23, 0, 8);
    t6 = (t7 + 4);
    t21 = (t9 + 4);
    t27 = *((unsigned int *)t7);
    t28 = *((unsigned int *)t9);
    t29 = (t27 ^ t28);
    t30 = *((unsigned int *)t6);
    t31 = *((unsigned int *)t21);
    t34 = (t30 ^ t31);
    t35 = (t29 | t34);
    t36 = *((unsigned int *)t6);
    t42 = *((unsigned int *)t21);
    t43 = (t36 | t42);
    t44 = (~(t43));
    t45 = (t35 & t44);
    if (t45 != 0)
        goto LAB53;

LAB50:    if (t43 != 0)
        goto LAB52;

LAB51:    *((unsigned int *)t23) = 1;

LAB53:    memset(t20, 0, 8);
    t24 = (t23 + 4);
    t47 = *((unsigned int *)t24);
    t48 = (~(t47));
    t49 = *((unsigned int *)t23);
    t50 = (t49 & t48);
    t55 = (t50 & 1U);
    if (t55 != 0)
        goto LAB54;

LAB55:    if (*((unsigned int *)t24) != 0)
        goto LAB56;

LAB57:    t26 = (t20 + 4);
    t56 = *((unsigned int *)t20);
    t57 = *((unsigned int *)t26);
    t58 = (t56 || t57);
    if (t58 > 0)
        goto LAB58;

LAB59:    t78 = *((unsigned int *)t20);
    t79 = (~(t78));
    t80 = *((unsigned int *)t26);
    t81 = (t79 || t80);
    if (t81 > 0)
        goto LAB60;

LAB61:    if (*((unsigned int *)t26) > 0)
        goto LAB62;

LAB63:    if (*((unsigned int *)t20) > 0)
        goto LAB64;

LAB65:    memcpy(t19, t84, 8);

LAB66:    goto LAB42;

LAB43:    t89 = (t0 + 4616);
    t90 = (t89 + 56U);
    t91 = *((char **)t90);
    goto LAB44;

LAB45:    xsi_vlog_unsigned_bit_combine(t8, 10, t19, 10, t91, 10);
    goto LAB49;

LAB47:    memcpy(t8, t19, 8);
    goto LAB49;

LAB52:    t22 = (t23 + 4);
    *((unsigned int *)t23) = 1;
    *((unsigned int *)t22) = 1;
    goto LAB53;

LAB54:    *((unsigned int *)t20) = 1;
    goto LAB57;

LAB56:    t25 = (t20 + 4);
    *((unsigned int *)t20) = 1;
    *((unsigned int *)t25) = 1;
    goto LAB57;

LAB58:    t32 = (t0 + 4616);
    t33 = (t32 + 56U);
    t37 = *((char **)t33);
    t38 = (t0 + 608);
    t39 = *((char **)t38);
    memset(t60, 0, 8);
    t38 = (t37 + 4);
    if (*((unsigned int *)t38) != 0)
        goto LAB68;

LAB67:    t40 = (t39 + 4);
    if (*((unsigned int *)t40) != 0)
        goto LAB68;

LAB71:    if (*((unsigned int *)t37) < *((unsigned int *)t39))
        goto LAB69;

LAB70:    memset(t59, 0, 8);
    t51 = (t60 + 4);
    t61 = *((unsigned int *)t51);
    t62 = (~(t61));
    t63 = *((unsigned int *)t60);
    t64 = (t63 & t62);
    t65 = (t64 & 1U);
    if (t65 != 0)
        goto LAB72;

LAB73:    if (*((unsigned int *)t51) != 0)
        goto LAB74;

LAB75:    t53 = (t59 + 4);
    t66 = *((unsigned int *)t59);
    t67 = *((unsigned int *)t53);
    t68 = (t66 || t67);
    if (t68 > 0)
        goto LAB76;

LAB77:    t73 = *((unsigned int *)t59);
    t74 = (~(t73));
    t75 = *((unsigned int *)t53);
    t76 = (t74 || t75);
    if (t76 > 0)
        goto LAB78;

LAB79:    if (*((unsigned int *)t53) > 0)
        goto LAB80;

LAB81:    if (*((unsigned int *)t59) > 0)
        goto LAB82;

LAB83:    memcpy(t41, t77, 8);

LAB84:    goto LAB59;

LAB60:    t82 = (t0 + 4616);
    t83 = (t82 + 56U);
    t84 = *((char **)t83);
    goto LAB61;

LAB62:    xsi_vlog_unsigned_bit_combine(t19, 10, t41, 10, t84, 10);
    goto LAB66;

LAB64:    memcpy(t19, t41, 8);
    goto LAB66;

LAB68:    t46 = (t60 + 4);
    *((unsigned int *)t60) = 1;
    *((unsigned int *)t46) = 1;
    goto LAB70;

LAB69:    *((unsigned int *)t60) = 1;
    goto LAB70;

LAB72:    *((unsigned int *)t59) = 1;
    goto LAB75;

LAB74:    t52 = (t59 + 4);
    *((unsigned int *)t59) = 1;
    *((unsigned int *)t52) = 1;
    goto LAB75;

LAB76:    t54 = (t0 + 4616);
    t69 = (t54 + 56U);
    t70 = *((char **)t69);
    t71 = ((char*)((ng1)));
    memset(t72, 0, 8);
    xsi_vlog_unsigned_add(t72, 10, t70, 10, t71, 10);
    goto LAB77;

LAB78:    t77 = ((char*)((ng2)));
    goto LAB79;

LAB80:    xsi_vlog_unsigned_bit_combine(t41, 10, t72, 10, t77, 10);
    goto LAB84;

LAB82:    memcpy(t41, t72, 8);
    goto LAB84;

LAB86:    t9 = (t19 + 4);
    *((unsigned int *)t19) = 1;
    *((unsigned int *)t9) = 1;
    goto LAB88;

LAB87:    *((unsigned int *)t19) = 1;
    goto LAB88;

LAB90:    *((unsigned int *)t20) = 1;
    goto LAB93;

LAB92:    t22 = (t20 + 4);
    *((unsigned int *)t20) = 1;
    *((unsigned int *)t22) = 1;
    goto LAB93;

LAB94:    t25 = (t0 + 3656);
    t26 = (t25 + 56U);
    t32 = *((char **)t26);
    t33 = ((char*)((ng4)));
    memset(t23, 0, 8);
    t37 = (t32 + 4);
    if (*((unsigned int *)t37) != 0)
        goto LAB98;

LAB97:    t38 = (t33 + 4);
    if (*((unsigned int *)t38) != 0)
        goto LAB98;

LAB101:    if (*((unsigned int *)t32) < *((unsigned int *)t33))
        goto LAB99;

LAB100:    memset(t41, 0, 8);
    t40 = (t23 + 4);
    t27 = *((unsigned int *)t40);
    t28 = (~(t27));
    t29 = *((unsigned int *)t23);
    t30 = (t29 & t28);
    t31 = (t30 & 1U);
    if (t31 != 0)
        goto LAB102;

LAB103:    if (*((unsigned int *)t40) != 0)
        goto LAB104;

LAB105:    t34 = *((unsigned int *)t20);
    t35 = *((unsigned int *)t41);
    t36 = (t34 & t35);
    *((unsigned int *)t59) = t36;
    t51 = (t20 + 4);
    t52 = (t41 + 4);
    t53 = (t59 + 4);
    t42 = *((unsigned int *)t51);
    t43 = *((unsigned int *)t52);
    t44 = (t42 | t43);
    *((unsigned int *)t53) = t44;
    t45 = *((unsigned int *)t53);
    t47 = (t45 != 0);
    if (t47 == 1)
        goto LAB106;

LAB107:
LAB108:    goto LAB96;

LAB98:    t39 = (t23 + 4);
    *((unsigned int *)t23) = 1;
    *((unsigned int *)t39) = 1;
    goto LAB100;

LAB99:    *((unsigned int *)t23) = 1;
    goto LAB100;

LAB102:    *((unsigned int *)t41) = 1;
    goto LAB105;

LAB104:    t46 = (t41 + 4);
    *((unsigned int *)t41) = 1;
    *((unsigned int *)t46) = 1;
    goto LAB105;

LAB106:    t48 = *((unsigned int *)t59);
    t49 = *((unsigned int *)t53);
    *((unsigned int *)t59) = (t48 | t49);
    t54 = (t20 + 4);
    t69 = (t41 + 4);
    t50 = *((unsigned int *)t20);
    t55 = (~(t50));
    t56 = *((unsigned int *)t54);
    t57 = (~(t56));
    t58 = *((unsigned int *)t41);
    t61 = (~(t58));
    t62 = *((unsigned int *)t69);
    t63 = (~(t62));
    t93 = (t55 & t57);
    t94 = (t61 & t63);
    t64 = (~(t93));
    t65 = (~(t94));
    t66 = *((unsigned int *)t53);
    *((unsigned int *)t53) = (t66 & t64);
    t67 = *((unsigned int *)t53);
    *((unsigned int *)t53) = (t67 & t65);
    t68 = *((unsigned int *)t59);
    *((unsigned int *)t59) = (t68 & t64);
    t73 = *((unsigned int *)t59);
    *((unsigned int *)t59) = (t73 & t65);
    goto LAB108;

LAB109:    *((unsigned int *)t60) = 1;
    goto LAB112;

LAB111:    t71 = (t60 + 4);
    *((unsigned int *)t60) = 1;
    *((unsigned int *)t71) = 1;
    goto LAB112;

LAB113:    t82 = (t0 + 3816);
    t83 = (t82 + 56U);
    t84 = *((char **)t83);
    t89 = ((char*)((ng5)));
    memset(t72, 0, 8);
    t90 = (t84 + 4);
    if (*((unsigned int *)t90) != 0)
        goto LAB117;

LAB116:    t91 = (t89 + 4);
    if (*((unsigned int *)t91) != 0)
        goto LAB117;

LAB120:    if (*((unsigned int *)t84) > *((unsigned int *)t89))
        goto LAB118;

LAB119:    memset(t95, 0, 8);
    t96 = (t72 + 4);
    t86 = *((unsigned int *)t96);
    t87 = (~(t86));
    t88 = *((unsigned int *)t72);
    t97 = (t88 & t87);
    t98 = (t97 & 1U);
    if (t98 != 0)
        goto LAB121;

LAB122:    if (*((unsigned int *)t96) != 0)
        goto LAB123;

LAB124:    t101 = *((unsigned int *)t60);
    t102 = *((unsigned int *)t95);
    t103 = (t101 & t102);
    *((unsigned int *)t100) = t103;
    t104 = (t60 + 4);
    t105 = (t95 + 4);
    t106 = (t100 + 4);
    t107 = *((unsigned int *)t104);
    t108 = *((unsigned int *)t105);
    t109 = (t107 | t108);
    *((unsigned int *)t106) = t109;
    t110 = *((unsigned int *)t106);
    t111 = (t110 != 0);
    if (t111 == 1)
        goto LAB125;

LAB126:
LAB127:    goto LAB115;

LAB117:    t92 = (t72 + 4);
    *((unsigned int *)t72) = 1;
    *((unsigned int *)t92) = 1;
    goto LAB119;

LAB118:    *((unsigned int *)t72) = 1;
    goto LAB119;

LAB121:    *((unsigned int *)t95) = 1;
    goto LAB124;

LAB123:    t99 = (t95 + 4);
    *((unsigned int *)t95) = 1;
    *((unsigned int *)t99) = 1;
    goto LAB124;

LAB125:    t112 = *((unsigned int *)t100);
    t113 = *((unsigned int *)t106);
    *((unsigned int *)t100) = (t112 | t113);
    t114 = (t60 + 4);
    t115 = (t95 + 4);
    t116 = *((unsigned int *)t60);
    t117 = (~(t116));
    t118 = *((unsigned int *)t114);
    t119 = (~(t118));
    t120 = *((unsigned int *)t95);
    t121 = (~(t120));
    t122 = *((unsigned int *)t115);
    t123 = (~(t122));
    t124 = (t117 & t119);
    t125 = (t121 & t123);
    t126 = (~(t124));
    t127 = (~(t125));
    t128 = *((unsigned int *)t106);
    *((unsigned int *)t106) = (t128 & t126);
    t129 = *((unsigned int *)t106);
    *((unsigned int *)t106) = (t129 & t127);
    t130 = *((unsigned int *)t100);
    *((unsigned int *)t100) = (t130 & t126);
    t131 = *((unsigned int *)t100);
    *((unsigned int *)t100) = (t131 & t127);
    goto LAB127;

LAB128:    *((unsigned int *)t132) = 1;
    goto LAB131;

LAB130:    t139 = (t132 + 4);
    *((unsigned int *)t132) = 1;
    *((unsigned int *)t139) = 1;
    goto LAB131;

LAB132:    t144 = (t0 + 3816);
    t145 = (t144 + 56U);
    t146 = *((char **)t145);
    t147 = ((char*)((ng6)));
    memset(t148, 0, 8);
    t149 = (t146 + 4);
    if (*((unsigned int *)t149) != 0)
        goto LAB136;

LAB135:    t150 = (t147 + 4);
    if (*((unsigned int *)t150) != 0)
        goto LAB136;

LAB139:    if (*((unsigned int *)t146) < *((unsigned int *)t147))
        goto LAB137;

LAB138:    memset(t152, 0, 8);
    t153 = (t148 + 4);
    t154 = *((unsigned int *)t153);
    t155 = (~(t154));
    t156 = *((unsigned int *)t148);
    t157 = (t156 & t155);
    t158 = (t157 & 1U);
    if (t158 != 0)
        goto LAB140;

LAB141:    if (*((unsigned int *)t153) != 0)
        goto LAB142;

LAB143:    t161 = *((unsigned int *)t132);
    t162 = *((unsigned int *)t152);
    t163 = (t161 & t162);
    *((unsigned int *)t160) = t163;
    t164 = (t132 + 4);
    t165 = (t152 + 4);
    t166 = (t160 + 4);
    t167 = *((unsigned int *)t164);
    t168 = *((unsigned int *)t165);
    t169 = (t167 | t168);
    *((unsigned int *)t166) = t169;
    t170 = *((unsigned int *)t166);
    t171 = (t170 != 0);
    if (t171 == 1)
        goto LAB144;

LAB145:
LAB146:    goto LAB134;

LAB136:    t151 = (t148 + 4);
    *((unsigned int *)t148) = 1;
    *((unsigned int *)t151) = 1;
    goto LAB138;

LAB137:    *((unsigned int *)t148) = 1;
    goto LAB138;

LAB140:    *((unsigned int *)t152) = 1;
    goto LAB143;

LAB142:    t159 = (t152 + 4);
    *((unsigned int *)t152) = 1;
    *((unsigned int *)t159) = 1;
    goto LAB143;

LAB144:    t172 = *((unsigned int *)t160);
    t173 = *((unsigned int *)t166);
    *((unsigned int *)t160) = (t172 | t173);
    t174 = (t132 + 4);
    t175 = (t152 + 4);
    t176 = *((unsigned int *)t132);
    t177 = (~(t176));
    t178 = *((unsigned int *)t174);
    t179 = (~(t178));
    t180 = *((unsigned int *)t152);
    t181 = (~(t180));
    t182 = *((unsigned int *)t175);
    t183 = (~(t182));
    t184 = (t177 & t179);
    t185 = (t181 & t183);
    t186 = (~(t184));
    t187 = (~(t185));
    t188 = *((unsigned int *)t166);
    *((unsigned int *)t166) = (t188 & t186);
    t189 = *((unsigned int *)t166);
    *((unsigned int *)t166) = (t189 & t187);
    t190 = *((unsigned int *)t160);
    *((unsigned int *)t160) = (t190 & t186);
    t191 = *((unsigned int *)t160);
    *((unsigned int *)t160) = (t191 & t187);
    goto LAB146;

LAB147:    *((unsigned int *)t10) = 1;
    goto LAB150;

LAB149:    t198 = (t10 + 4);
    *((unsigned int *)t10) = 1;
    *((unsigned int *)t198) = 1;
    goto LAB150;

LAB151:    t203 = ((char*)((ng1)));
    goto LAB152;

LAB153:    t208 = ((char*)((ng2)));
    goto LAB154;

LAB155:    xsi_vlog_unsigned_bit_combine(t8, 1, t203, 1, t208, 1);
    goto LAB159;

LAB157:    memcpy(t8, t203, 8);
    goto LAB159;

}


extern void work_m_00000000003295556343_1218688201_init()
{
	static char *pe[] = {(void *)Cont_54_0,(void *)Cont_57_1,(void *)Cont_60_2,(void *)Cont_63_3,(void *)Cont_66_4,(void *)Always_69_5};
	xsi_register_didat("work_m_00000000003295556343_1218688201", "isim/core_top_isim_beh.exe.sim/work/m_00000000003295556343_1218688201.didat");
	xsi_register_executes(pe);
}
