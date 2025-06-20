/*
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <climits>
#include <gtest/gtest.h>
#include "../Gl43gtfmasterBaseFunc.h"
#include "../ActsGl43gtfmaster0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000830,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_xyzw_1vec4_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000831,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_xyzw_1vec4_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000832,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_zwxy_1vec4_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000833,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_zwxy_1vec4_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000834,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_yxwz_1vec4_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000835,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_yxwz_1vec4_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000836,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_wxzy_1vec4_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000837,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_wxzy_1vec4_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000838,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_xyz_w_1vec3_1float_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000839,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_xyz_w_1vec3_1float_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000840,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_zwx_y_1vec3_1float_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000841,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_zwx_y_1vec3_1float_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000842,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_yxw_z_1vec3_1float_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000843,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_yxw_z_1vec3_1float_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000844,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_wxz_y_1vec3_1float_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000845,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_wxz_y_1vec3_1float_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000846,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_xy_zw_2vec2_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000847,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_xy_zw_2vec2_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000848,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_zx_wy_2vec2_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000849,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_zx_wy_2vec2_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000850,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_yx_wz_2vec2_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000851,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_yx_wz_2vec2_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000852,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_wx_zy_2vec2_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000853,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_wx_zy_2vec2_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000854,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_x_y_z_w_4float_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000855,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_x_y_z_w_4float_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000856,
    "GTF-GL43.gtf21.GL.swizzlers.vec3_xyz_1vec3_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000857,
    "GTF-GL43.gtf21.GL.swizzlers.vec3_xyz_1vec3_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000858,
    "GTF-GL43.gtf21.GL.swizzlers.vec3_yxz_1vec3_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000859,
    "GTF-GL43.gtf21.GL.swizzlers.vec3_yxz_1vec3_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000860,
    "GTF-GL43.gtf21.GL.swizzlers.vec3_zyx_1vec3_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000861,
    "GTF-GL43.gtf21.GL.swizzlers.vec3_zyx_1vec3_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000862,
    "GTF-GL43.gtf21.GL.swizzlers.vec3_xy_z_1vec2_1float_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000863,
    "GTF-GL43.gtf21.GL.swizzlers.vec3_xy_z_1vec2_1float_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000864,
    "GTF-GL43.gtf21.GL.swizzlers.vec3_xz_y_1vec2_1float_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000865,
    "GTF-GL43.gtf21.GL.swizzlers.vec3_xz_y_1vec2_1float_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000866,
    "GTF-GL43.gtf21.GL.swizzlers.vec3_yz_x_1vec2_1float_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000867,
    "GTF-GL43.gtf21.GL.swizzlers.vec3_yz_x_1vec2_1float_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000868,
    "GTF-GL43.gtf21.GL.swizzlers.vec3_zx_y_1vec2_1float_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000869,
    "GTF-GL43.gtf21.GL.swizzlers.vec3_zx_y_1vec2_1float_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000870,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_rgba_1vec4_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000871,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_rgba_1vec4_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000872,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_barg_1vec4_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000873,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_barg_1vec4_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000874,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_grab_1vec4_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000875,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_grab_1vec4_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000876,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_arbg_1vec4_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000877,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_arbg_1vec4_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000878,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_rgb_a_1vec3_1float_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000879,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_rgb_a_1vec3_1float_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000880,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_bar_g_1vec3_1float_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000881,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_bar_g_1vec3_1float_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000882,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_gra_b_1vec3_1float_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000883,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_gra_b_1vec3_1float_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000884,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_arb_g_1vec3_1float_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000885,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_arb_g_1vec3_1float_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000886,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_rg_ba_2vec2_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000887,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_rg_ba_2vec2_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000888,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_br_ag_2vec2_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000889,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_br_ag_2vec2_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000890,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_gr_ab_2vec2_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000891,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_gr_ab_2vec2_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000892,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_ar_bg_2vec2_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000893,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_ar_bg_2vec2_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000894,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_r_g_b_a_4float_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000895,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_r_g_b_a_4float_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000896,
    "GTF-GL43.gtf21.GL.swizzlers.vec3_rgb_1vec3_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000897,
    "GTF-GL43.gtf21.GL.swizzlers.vec3_rgb_1vec3_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000898,
    "GTF-GL43.gtf21.GL.swizzlers.vec3_grb_1vec3_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000899,
    "GTF-GL43.gtf21.GL.swizzlers.vec3_grb_1vec3_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000900,
    "GTF-GL43.gtf21.GL.swizzlers.vec3_bgr_1vec3_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000901,
    "GTF-GL43.gtf21.GL.swizzlers.vec3_bgr_1vec3_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000902,
    "GTF-GL43.gtf21.GL.swizzlers.vec3_rg_b_1vec2_1float_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000903,
    "GTF-GL43.gtf21.GL.swizzlers.vec3_rg_b_1vec2_1float_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000904,
    "GTF-GL43.gtf21.GL.swizzlers.vec3_rb_g_1vec2_1float_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000905,
    "GTF-GL43.gtf21.GL.swizzlers.vec3_rb_g_1vec2_1float_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000906,
    "GTF-GL43.gtf21.GL.swizzlers.vec3_gb_r_1vec2_1float_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000907,
    "GTF-GL43.gtf21.GL.swizzlers.vec3_gb_r_1vec2_1float_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000908,
    "GTF-GL43.gtf21.GL.swizzlers.vec3_br_g_1vec2_1float_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000909,
    "GTF-GL43.gtf21.GL.swizzlers.vec3_br_g_1vec2_1float_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000910,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_stpq_1vec4_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000911,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_stpq_1vec4_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000912,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_pqst_1vec4_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000913,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_pqst_1vec4_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000914,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_tsqp_1vec4_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000915,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_tsqp_1vec4_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000916,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_qspt_1vec4_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000917,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_qspt_1vec4_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000918,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_stp_q_1vec3_1float_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000919,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_stp_q_1vec3_1float_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000920,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_pqs_t_1vec3_1float_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000921,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_pqs_t_1vec3_1float_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000922,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_tsq_p_1vec3_1float_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000923,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_tsq_p_1vec3_1float_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000924,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_qsp_t_1vec3_1float_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000925,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_qsp_t_1vec3_1float_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000926,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_st_pq_2vec2_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000927,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_st_pq_2vec2_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000928,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_ps_qt_2vec2_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000929,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_ps_qt_2vec2_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000930,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_ts_qp_2vec2_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000931,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_ts_qp_2vec2_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000932,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_qs_pt_2vec2_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000933,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_qs_pt_2vec2_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000934,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_s_t_p_q_4float_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000935,
    "GTF-GL43.gtf21.GL.swizzlers.vec4_s_t_p_q_4float_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000936,
    "GTF-GL43.gtf21.GL.swizzlers.vec3_stp_1vec3_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000937,
    "GTF-GL43.gtf21.GL.swizzlers.vec3_stp_1vec3_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000938,
    "GTF-GL43.gtf21.GL.swizzlers.vec3_tsp_1vec3_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000939,
    "GTF-GL43.gtf21.GL.swizzlers.vec3_tsp_1vec3_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000940,
    "GTF-GL43.gtf21.GL.swizzlers.vec3_pts_1vec3_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000941,
    "GTF-GL43.gtf21.GL.swizzlers.vec3_pts_1vec3_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000942,
    "GTF-GL43.gtf21.GL.swizzlers.vec3_st_p_1vec2_1float_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000943,
    "GTF-GL43.gtf21.GL.swizzlers.vec3_st_p_1vec2_1float_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000944,
    "GTF-GL43.gtf21.GL.swizzlers.vec3_sp_t_1vec2_1float_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000945,
    "GTF-GL43.gtf21.GL.swizzlers.vec3_sp_t_1vec2_1float_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000946,
    "GTF-GL43.gtf21.GL.swizzlers.vec3_tp_s_1vec2_1float_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000947,
    "GTF-GL43.gtf21.GL.swizzlers.vec3_tp_s_1vec2_1float_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000948,
    "GTF-GL43.gtf21.GL.swizzlers.vec3_ps_t_1vec2_1float_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000949,
    "GTF-GL43.gtf21.GL.swizzlers.vec3_ps_t_1vec2_1float_vert");
