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

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000001850492359_1642943618_init();
    work_m_00000000000652348051_3316370692_init();
    xilinxcorelib_ver_m_00000000001358910285_4092421252_init();
    xilinxcorelib_ver_m_00000000001687936702_0984770168_init();
    xilinxcorelib_ver_m_00000000000277421008_1128127435_init();
    xilinxcorelib_ver_m_00000000001603977570_2672402416_init();
    work_m_00000000003289761879_3169216681_init();
    work_m_00000000002331340622_3544446753_init();
    work_m_00000000003295556343_1218688201_init();
    work_m_00000000003279631993_3529897436_init();
    work_m_00000000000602407986_3039186061_init();
    work_m_00000000002675414092_2511408442_init();
    work_m_00000000000564426406_0404767958_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000000564426406_0404767958");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
