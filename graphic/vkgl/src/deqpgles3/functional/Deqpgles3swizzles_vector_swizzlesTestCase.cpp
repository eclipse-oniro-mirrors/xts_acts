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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30003TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002846,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec2_x_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002847,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec2_x_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002848,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec2_xx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002849,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec2_xx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002850,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec2_xy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002851,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec2_xy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002852,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec2_yx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002853,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec2_yx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002854,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec2_yxy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002855,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec2_yxy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002856,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec2_xyxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002857,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec2_xyxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002858,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec2_yyyy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002859,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec2_yyyy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002860,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec2_s_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002861,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec2_s_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002862,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec2_ss_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002863,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec2_ss_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002864,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec2_st_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002865,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec2_st_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002866,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec2_ts_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002867,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec2_ts_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002868,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec2_tst_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002869,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec2_tst_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002870,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec2_stss_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002871,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec2_stss_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002872,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec2_tttt_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002873,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec2_tttt_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002874,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec2_r_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002875,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec2_r_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002876,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec2_rr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002877,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec2_rr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002878,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec2_rg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002879,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec2_rg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002880,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec2_gr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002881,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec2_gr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002882,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec2_grg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002883,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec2_grg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002884,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec2_rgrr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002885,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec2_rgrr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002886,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec2_gggg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002887,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec2_gggg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002888,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec3_x_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002889,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_x_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002890,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec3_z_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002891,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_z_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002892,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec3_xz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002893,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_xz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002894,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec3_zz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002895,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_zz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002896,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_xyz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002897,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_xyz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002898,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_zyx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002899,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_zyx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002900,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_xxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002901,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_xxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002902,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_zzz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002903,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_zzz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002904,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_zzy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002905,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_zzy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002906,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_yxy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002907,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_yxy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002908,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_xzx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002909,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_xzx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002910,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_xyyx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002911,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_xyyx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002912,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_zzzz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002913,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_zzzz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002914,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec3_s_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002915,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_s_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002916,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec3_p_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002917,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_p_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002918,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec3_sp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002919,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_sp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002920,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec3_pp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002921,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_pp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002922,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_stp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002923,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_stp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002924,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_pts_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002925,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_pts_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002926,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_sss_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002927,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_sss_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002928,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_ppp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002929,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_ppp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002930,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_ppt_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002931,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_ppt_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002932,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_tst_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002933,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_tst_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002934,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_sps_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002935,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_sps_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002936,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_stts_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002937,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_stts_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002938,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_pppp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002939,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_pppp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002940,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec3_r_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002941,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_r_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002942,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec3_b_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002943,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_b_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002944,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec3_rb_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002945,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_rb_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002946,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec3_bb_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002947,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_bb_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002948,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_rgb_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002949,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_rgb_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002950,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_bgr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002951,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_bgr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002952,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_rrr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002953,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_rrr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002954,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_bbb_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002955,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_bbb_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002956,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_bbg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002957,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_bbg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002958,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_grg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002959,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_grg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002960,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_rbr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002961,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_rbr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002962,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_rggr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002963,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_rggr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002964,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_bbbb_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002965,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_bbbb_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002966,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec4_x_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002967,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_x_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002968,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec4_w_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002969,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_w_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002970,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec4_wx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002971,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_wx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002972,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec4_wz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002973,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_wz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002974,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_www_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002975,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_www_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002976,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_yyw_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002977,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_yyw_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002978,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_wzy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002979,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_wzy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002980,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_xyzw_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002981,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_xyzw_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002982,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_wzyx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002983,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_wzyx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002984,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_xxxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002985,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_xxxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002986,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_yyyy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002987,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_yyyy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002988,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_wwww_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002989,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_wwww_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002990,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_wzzw_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002991,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_wzzw_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002992,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_wwwy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002993,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_wwwy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002994,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_xyxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002995,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_xyxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002996,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_zzwz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002997,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_zzwz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002998,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec4_s_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002999,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_s_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003000,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec4_q_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003001,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_q_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003002,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec4_qs_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003003,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_qs_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003004,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec4_qp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003005,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_qp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003006,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_qqq_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003007,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_qqq_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003008,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_ttq_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003009,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_ttq_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003010,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_qpt_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003011,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_qpt_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003012,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_stpq_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003013,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_stpq_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003014,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_qpts_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003015,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_qpts_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003016,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_ssss_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003017,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_ssss_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003018,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_tttt_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003019,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_tttt_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003020,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_qqqq_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003021,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_qqqq_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003022,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_qppq_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003023,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_qppq_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003024,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_qqqt_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003025,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_qqqt_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003026,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_stss_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003027,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_stss_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003028,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_ppqp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003029,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_ppqp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003030,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec4_r_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003031,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_r_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003032,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec4_a_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003033,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_a_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003034,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec4_ar_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003035,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_ar_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003036,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec4_ab_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003037,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_ab_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003038,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_aaa_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003039,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_aaa_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003040,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_gga_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003041,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_gga_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003042,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_abg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003043,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_abg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003044,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_rgba_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003045,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_rgba_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003046,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_abgr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003047,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_abgr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003048,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_rrrr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003049,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_rrrr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003050,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_gggg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003051,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_gggg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003052,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_aaaa_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003053,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_aaaa_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003054,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_abba_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003055,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_abba_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003056,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_aaag_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003057,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_aaag_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003058,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_rgrr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003059,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_rgrr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003060,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_bbab_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003061,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_bbab_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003062,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_ivec2_x_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003063,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec2_x_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003064,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec2_xx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003065,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec2_xx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003066,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec2_xy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003067,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec2_xy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003068,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec2_yx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003069,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec2_yx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003070,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec2_yxy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003071,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec2_yxy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003072,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec2_xyxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003073,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec2_xyxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003074,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec2_yyyy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003075,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec2_yyyy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003076,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_ivec2_s_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003077,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec2_s_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003078,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec2_ss_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003079,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec2_ss_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003080,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec2_st_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003081,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec2_st_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003082,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec2_ts_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003083,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec2_ts_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003084,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec2_tst_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003085,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec2_tst_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003086,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec2_stss_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003087,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec2_stss_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003088,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec2_tttt_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003089,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec2_tttt_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003090,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_ivec2_r_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003091,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec2_r_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003092,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec2_rr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003093,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec2_rr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003094,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec2_rg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003095,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec2_rg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003096,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec2_gr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003097,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec2_gr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003098,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec2_grg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003099,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec2_grg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003100,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec2_rgrr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003101,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec2_rgrr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003102,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec2_gggg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003103,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec2_gggg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003104,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_ivec3_x_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003105,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_x_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003106,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_ivec3_z_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003107,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_z_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003108,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_xz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003109,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_xz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003110,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_zz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003111,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_zz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003112,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_xyz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003113,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_xyz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003114,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_zyx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003115,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_zyx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003116,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_xxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003117,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_xxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003118,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_zzz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003119,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_zzz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003120,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_zzy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003121,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_zzy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003122,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_yxy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003123,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_yxy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003124,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_xzx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003125,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_xzx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003126,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_xyyx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003127,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec3_xyyx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003128,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_zzzz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003129,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec3_zzzz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003130,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_ivec3_s_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003131,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_s_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003132,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_ivec3_p_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003133,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_p_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003134,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_sp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003135,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_sp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003136,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_pp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003137,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_pp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003138,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_stp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003139,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_stp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003140,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_pts_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003141,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_pts_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003142,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_sss_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003143,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_sss_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003144,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_ppp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003145,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_ppp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003146,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_ppt_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003147,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_ppt_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003148,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_tst_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003149,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_tst_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003150,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_sps_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003151,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_sps_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003152,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_stts_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003153,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec3_stts_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003154,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_pppp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003155,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec3_pppp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003156,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_ivec3_r_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003157,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_r_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003158,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_ivec3_b_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003159,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_b_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003160,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_rb_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003161,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_rb_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003162,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_bb_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003163,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_bb_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003164,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_rgb_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003165,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_rgb_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003166,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_bgr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003167,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_bgr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003168,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_rrr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003169,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_rrr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003170,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_bbb_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003171,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_bbb_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003172,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_bbg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003173,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_bbg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003174,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_grg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003175,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_grg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003176,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_rbr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003177,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_rbr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003178,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_rggr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003179,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec3_rggr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003180,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_bbbb_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003181,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec3_bbbb_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003182,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_ivec4_x_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003183,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec4_x_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003184,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_ivec4_w_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003185,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec4_w_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003186,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec4_wx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003187,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_wx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003188,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec4_wz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003189,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_wz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003190,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec4_www_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003191,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_www_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003192,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec4_yyw_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003193,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_yyw_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003194,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec4_wzy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003195,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_wzy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003196,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_xyzw_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003197,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_xyzw_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003198,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_wzyx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003199,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_wzyx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003200,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_xxxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003201,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_xxxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003202,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_yyyy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003203,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_yyyy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003204,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_wwww_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003205,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_wwww_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003206,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_wzzw_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003207,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_wzzw_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003208,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_wwwy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003209,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_wwwy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003210,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_xyxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003211,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_xyxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003212,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_zzwz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003213,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_zzwz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003214,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_ivec4_s_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003215,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec4_s_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003216,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_ivec4_q_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003217,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec4_q_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003218,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec4_qs_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003219,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_qs_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003220,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec4_qp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003221,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_qp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003222,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec4_qqq_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003223,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_qqq_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003224,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec4_ttq_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003225,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_ttq_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003226,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec4_qpt_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003227,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_qpt_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003228,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_stpq_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003229,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_stpq_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003230,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_qpts_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003231,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_qpts_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003232,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_ssss_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003233,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_ssss_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003234,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_tttt_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003235,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_tttt_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003236,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_qqqq_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003237,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_qqqq_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003238,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_qppq_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003239,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_qppq_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003240,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_qqqt_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003241,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_qqqt_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003242,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_stss_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003243,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_stss_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003244,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_ppqp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003245,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_ppqp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003246,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_ivec4_r_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003247,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec4_r_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003248,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_ivec4_a_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003249,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec4_a_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003250,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec4_ar_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003251,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_ar_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003252,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec4_ab_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003253,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_ab_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003254,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec4_aaa_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003255,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_aaa_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003256,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec4_gga_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003257,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_gga_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003258,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec4_abg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003259,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_abg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003260,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_rgba_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003261,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_rgba_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003262,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_abgr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003263,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_abgr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003264,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_rrrr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003265,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_rrrr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003266,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_gggg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003267,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_gggg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003268,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_aaaa_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003269,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_aaaa_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003270,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_abba_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003271,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_abba_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003272,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_aaag_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003273,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_aaag_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003274,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_rgrr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003275,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_rgrr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003276,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_bbab_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003277,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_bbab_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003278,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_bvec2_x_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003279,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec2_x_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003280,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec2_xx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003281,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec2_xx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003282,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec2_xy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003283,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec2_xy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003284,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec2_yx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003285,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec2_yx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003286,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec2_yxy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003287,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec2_yxy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003288,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec2_xyxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003289,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec2_xyxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003290,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec2_yyyy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003291,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec2_yyyy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003292,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_bvec2_s_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003293,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec2_s_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003294,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec2_ss_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003295,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec2_ss_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003296,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec2_st_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003297,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec2_st_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003298,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec2_ts_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003299,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec2_ts_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003300,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec2_tst_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003301,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec2_tst_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003302,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec2_stss_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003303,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec2_stss_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003304,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec2_tttt_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003305,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec2_tttt_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003306,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_bvec2_r_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003307,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec2_r_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003308,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec2_rr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003309,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec2_rr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003310,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec2_rg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003311,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec2_rg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003312,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec2_gr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003313,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec2_gr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003314,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec2_grg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003315,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec2_grg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003316,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec2_rgrr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003317,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec2_rgrr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003318,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec2_gggg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003319,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec2_gggg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003320,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_bvec3_x_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003321,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_x_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003322,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_bvec3_z_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003323,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_z_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003324,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_xz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003325,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_xz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003326,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_zz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003327,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_zz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003328,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_xyz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003329,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_xyz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003330,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_zyx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003331,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_zyx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003332,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_xxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003333,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_xxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003334,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_zzz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003335,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_zzz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003336,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_zzy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003337,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_zzy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003338,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_yxy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003339,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_yxy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003340,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_xzx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003341,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_xzx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003342,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_xyyx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003343,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec3_xyyx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003344,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_zzzz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003345,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec3_zzzz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003346,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_bvec3_s_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003347,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_s_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003348,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_bvec3_p_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003349,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_p_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003350,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_sp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003351,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_sp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003352,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_pp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003353,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_pp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003354,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_stp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003355,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_stp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003356,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_pts_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003357,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_pts_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003358,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_sss_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003359,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_sss_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003360,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_ppp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003361,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_ppp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003362,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_ppt_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003363,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_ppt_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003364,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_tst_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003365,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_tst_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003366,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_sps_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003367,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_sps_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003368,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_stts_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003369,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec3_stts_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003370,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_pppp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003371,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec3_pppp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003372,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_bvec3_r_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003373,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_r_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003374,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_bvec3_b_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003375,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_b_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003376,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_rb_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003377,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_rb_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003378,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_bb_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003379,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_bb_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003380,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_rgb_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003381,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_rgb_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003382,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_bgr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003383,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_bgr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003384,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_rrr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003385,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_rrr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003386,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_bbb_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003387,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_bbb_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003388,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_bbg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003389,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_bbg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003390,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_grg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003391,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_grg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003392,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_rbr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003393,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_rbr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003394,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_rggr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003395,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec3_rggr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003396,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_bbbb_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003397,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec3_bbbb_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003398,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_bvec4_x_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003399,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec4_x_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003400,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_bvec4_w_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003401,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec4_w_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003402,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec4_wx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003403,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_wx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003404,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec4_wz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003405,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_wz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003406,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec4_www_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003407,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_www_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003408,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec4_yyw_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003409,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_yyw_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003410,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec4_wzy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003411,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_wzy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003412,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_xyzw_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003413,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_xyzw_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003414,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_wzyx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003415,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_wzyx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003416,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_xxxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003417,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_xxxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003418,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_yyyy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003419,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_yyyy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003420,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_wwww_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003421,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_wwww_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003422,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_wzzw_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003423,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_wzzw_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003424,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_wwwy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003425,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_wwwy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003426,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_xyxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003427,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_xyxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003428,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_zzwz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003429,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_zzwz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003430,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_bvec4_s_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003431,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec4_s_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003432,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_bvec4_q_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003433,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec4_q_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003434,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec4_qs_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003435,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_qs_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003436,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec4_qp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003437,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_qp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003438,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec4_qqq_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003439,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_qqq_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003440,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec4_ttq_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003441,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_ttq_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003442,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec4_qpt_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003443,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_qpt_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003444,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_stpq_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003445,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_stpq_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003446,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_qpts_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003447,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_qpts_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003448,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_ssss_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003449,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_ssss_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003450,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_tttt_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003451,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_tttt_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003452,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_qqqq_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003453,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_qqqq_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003454,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_qppq_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003455,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_qppq_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003456,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_qqqt_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003457,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_qqqt_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003458,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_stss_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003459,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_stss_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003460,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_ppqp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003461,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_ppqp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003462,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_bvec4_r_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003463,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec4_r_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003464,
        "dEQP-GLES3.functional.shaders.swizzles",
        ".vector_swizzles.mediump_bvec4_a_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003465,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec4_a_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003466,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec4_ar_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003467,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_ar_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003468,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec4_ab_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003469,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_ab_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003470,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec4_aaa_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003471,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_aaa_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003472,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec4_gga_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003473,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_gga_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003474,
        "dEQP-GLES3.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec4_abg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003475,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_abg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003476,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_rgba_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003477,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_rgba_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003478,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_abgr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003479,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_abgr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003480,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_rrrr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003481,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_rrrr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003482,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_gggg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003483,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_gggg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003484,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_aaaa_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003485,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_aaaa_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003486,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_abba_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003487,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_abba_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003488,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_aaag_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003489,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_aaag_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003490,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_rgrr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003491,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_rgrr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003492,
        "dEQP-GLES3.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_bbab_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003493,
        "dEQP-GLES3.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_bbab_fragment");
