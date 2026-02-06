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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20002TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001348,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec2_x_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001349,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec2_x_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001350,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec2_xx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001351,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec2_xx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001352,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec2_xy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001353,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec2_xy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001354,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec2_yx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001355,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec2_yx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001356,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec2_yxy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001357,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec2_yxy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001358,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec2_xyxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001359,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec2_xyxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001360,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec2_yyyy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001361,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec2_yyyy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001362,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec2_s_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001363,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec2_s_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001364,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec2_ss_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001365,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec2_ss_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001366,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec2_st_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001367,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec2_st_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001368,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec2_ts_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001369,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec2_ts_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001370,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec2_tst_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001371,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec2_tst_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001372,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec2_stss_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001373,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec2_stss_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001374,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec2_tttt_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001375,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec2_tttt_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001376,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec2_r_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001377,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec2_r_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001378,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec2_rr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001379,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec2_rr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001380,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec2_rg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001381,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec2_rg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001382,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec2_gr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001383,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec2_gr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001384,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec2_grg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001385,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec2_grg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001386,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec2_rgrr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001387,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec2_rgrr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001388,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec2_gggg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001389,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec2_gggg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001390,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec3_x_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001391,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_x_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001392,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec3_z_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001393,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_z_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001394,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec3_xz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001395,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_xz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001396,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec3_zz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001397,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_zz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001398,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_xyz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001399,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_xyz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001400,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_zyx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001401,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_zyx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001402,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_xxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001403,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_xxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001404,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_zzz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001405,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_zzz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001406,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_zzy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001407,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_zzy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001408,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_yxy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001409,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_yxy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001410,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_xzx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001411,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_xzx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001412,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_xyyx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001413,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_xyyx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001414,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_zzzz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001415,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_zzzz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001416,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec3_s_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001417,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_s_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001418,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec3_p_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001419,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_p_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001420,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec3_sp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001421,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_sp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001422,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec3_pp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001423,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_pp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001424,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_stp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001425,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_stp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001426,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_pts_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001427,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_pts_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001428,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_sss_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001429,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_sss_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001430,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_ppp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001431,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_ppp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001432,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_ppt_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001433,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_ppt_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001434,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_tst_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001435,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_tst_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001436,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_sps_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001437,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_sps_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001438,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_stts_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001439,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_stts_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001440,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_pppp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001441,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_pppp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001442,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec3_r_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001443,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_r_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001444,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec3_b_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001445,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_b_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001446,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec3_rb_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001447,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_rb_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001448,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec3_bb_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001449,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_bb_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001450,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_rgb_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001451,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_rgb_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001452,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_bgr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001453,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_bgr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001454,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_rrr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001455,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_rrr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001456,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_bbb_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001457,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_bbb_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001458,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_bbg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001459,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_bbg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001460,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_grg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001461,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_grg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001462,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_rbr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001463,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_rbr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001464,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_rggr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001465,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_rggr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001466,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec3_bbbb_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001467,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec3_bbbb_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001468,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec4_x_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001469,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_x_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001470,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec4_w_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001471,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_w_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001472,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec4_wx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001473,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_wx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001474,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec4_wz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001475,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_wz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001476,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_www_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001477,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_www_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001478,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_yyw_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001479,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_yyw_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001480,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_wzy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001481,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_wzy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001482,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_xyzw_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001483,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_xyzw_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001484,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_wzyx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001485,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_wzyx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001486,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_xxxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001487,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_xxxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001488,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_yyyy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001489,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_yyyy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001490,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_wwww_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001491,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_wwww_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001492,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_wzzw_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001493,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_wzzw_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001494,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_wwwy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001495,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_wwwy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001496,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_xyxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001497,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_xyxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001498,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_zzwz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001499,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_zzwz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001500,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec4_s_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001501,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_s_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001502,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec4_q_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001503,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_q_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001504,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec4_qs_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001505,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_qs_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001506,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec4_qp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001507,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_qp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001508,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_qqq_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001509,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_qqq_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001510,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_ttq_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001511,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_ttq_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001512,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_qpt_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001513,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_qpt_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001514,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_stpq_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001515,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_stpq_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001516,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_qpts_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001517,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_qpts_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001518,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_ssss_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001519,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_ssss_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001520,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_tttt_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001521,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_tttt_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001522,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_qqqq_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001523,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_qqqq_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001524,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_qppq_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001525,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_qppq_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001526,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_qqqt_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001527,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_qqqt_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001528,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_stss_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001529,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_stss_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001530,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_ppqp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001531,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_ppqp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001532,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec4_r_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001533,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_r_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001534,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec4_a_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001535,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_a_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001536,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec4_ar_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001537,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_ar_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001538,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_vec4_ab_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001539,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_ab_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001540,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_aaa_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001541,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_aaa_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001542,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_gga_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001543,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_gga_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001544,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_abg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001545,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_abg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001546,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_rgba_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001547,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_rgba_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001548,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_abgr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001549,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_abgr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001550,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_rrrr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001551,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_rrrr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001552,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_gggg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001553,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_gggg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001554,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_aaaa_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001555,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_aaaa_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001556,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_abba_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001557,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_abba_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001558,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_aaag_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001559,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_aaag_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001560,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_rgrr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001561,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_rgrr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001562,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_vec4_bbab_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001563,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_vec4_bbab_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001564,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_ivec2_x_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001565,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec2_x_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001566,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec2_xx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001567,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec2_xx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001568,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec2_xy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001569,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec2_xy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001570,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec2_yx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001571,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec2_yx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001572,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec2_yxy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001573,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec2_yxy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001574,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec2_xyxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001575,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec2_xyxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001576,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec2_yyyy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001577,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec2_yyyy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001578,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_ivec2_s_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001579,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec2_s_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001580,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec2_ss_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001581,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec2_ss_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001582,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec2_st_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001583,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec2_st_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001584,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec2_ts_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001585,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec2_ts_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001586,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec2_tst_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001587,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec2_tst_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001588,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec2_stss_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001589,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec2_stss_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001590,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec2_tttt_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001591,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec2_tttt_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001592,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_ivec2_r_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001593,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec2_r_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001594,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec2_rr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001595,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec2_rr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001596,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec2_rg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001597,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec2_rg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001598,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec2_gr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001599,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec2_gr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001600,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec2_grg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001601,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec2_grg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001602,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec2_rgrr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001603,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec2_rgrr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001604,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec2_gggg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001605,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec2_gggg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001606,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_ivec3_x_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001607,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_x_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001608,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_ivec3_z_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001609,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_z_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001610,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_xz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001611,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_xz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001612,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_zz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001613,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_zz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001614,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_xyz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001615,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_xyz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001616,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_zyx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001617,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_zyx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001618,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_xxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001619,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_xxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001620,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_zzz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001621,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_zzz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001622,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_zzy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001623,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_zzy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001624,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_yxy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001625,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_yxy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001626,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_xzx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001627,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_xzx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001628,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_xyyx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001629,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec3_xyyx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001630,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_zzzz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001631,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec3_zzzz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001632,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_ivec3_s_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001633,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_s_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001634,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_ivec3_p_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001635,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_p_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001636,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_sp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001637,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_sp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001638,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_pp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001639,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_pp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001640,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_stp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001641,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_stp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001642,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_pts_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001643,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_pts_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001644,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_sss_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001645,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_sss_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001646,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_ppp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001647,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_ppp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001648,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_ppt_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001649,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_ppt_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001650,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_tst_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001651,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_tst_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001652,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_sps_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001653,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_sps_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001654,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_stts_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001655,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec3_stts_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001656,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_pppp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001657,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec3_pppp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001658,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_ivec3_r_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001659,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_r_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001660,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_ivec3_b_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001661,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_b_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001662,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_rb_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001663,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_rb_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001664,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_bb_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001665,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_bb_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001666,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_rgb_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001667,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_rgb_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001668,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_bgr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001669,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_bgr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001670,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_rrr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001671,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_rrr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001672,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_bbb_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001673,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_bbb_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001674,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_bbg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001675,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_bbg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001676,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_grg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001677,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_grg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001678,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec3_rbr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001679,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_rbr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001680,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_rggr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001681,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec3_rggr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001682,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec3_bbbb_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001683,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec3_bbbb_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001684,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_ivec4_x_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001685,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec4_x_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001686,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_ivec4_w_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001687,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec4_w_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001688,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec4_wx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001689,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_wx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001690,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec4_wz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001691,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_wz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001692,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec4_www_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001693,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_www_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001694,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec4_yyw_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001695,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_yyw_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001696,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec4_wzy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001697,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_wzy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001698,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_xyzw_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001699,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_xyzw_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001700,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_wzyx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001701,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_wzyx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001702,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_xxxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001703,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_xxxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001704,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_yyyy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001705,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_yyyy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001706,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_wwww_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001707,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_wwww_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001708,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_wzzw_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001709,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_wzzw_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001710,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_wwwy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001711,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_wwwy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001712,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_xyxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001713,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_xyxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001714,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_zzwz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001715,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_zzwz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001716,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_ivec4_s_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001717,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec4_s_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001718,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_ivec4_q_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001719,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec4_q_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001720,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec4_qs_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001721,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_qs_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001722,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec4_qp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001723,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_qp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001724,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec4_qqq_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001725,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_qqq_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001726,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec4_ttq_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001727,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_ttq_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001728,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec4_qpt_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001729,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_qpt_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001730,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_stpq_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001731,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_stpq_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001732,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_qpts_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001733,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_qpts_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001734,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_ssss_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001735,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_ssss_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001736,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_tttt_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001737,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_tttt_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001738,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_qqqq_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001739,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_qqqq_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001740,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_qppq_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001741,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_qppq_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001742,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_qqqt_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001743,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_qqqt_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001744,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_stss_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001745,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_stss_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001746,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_ppqp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001747,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_ppqp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001748,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_ivec4_r_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001749,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec4_r_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001750,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_ivec4_a_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001751,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec4_a_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001752,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec4_ar_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001753,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_ar_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001754,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec4_ab_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001755,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_ab_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001756,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec4_aaa_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001757,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_aaa_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001758,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec4_gga_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001759,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_gga_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001760,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_ivec4_abg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001761,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_abg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001762,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_rgba_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001763,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_rgba_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001764,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_abgr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001765,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_abgr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001766,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_rrrr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001767,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_rrrr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001768,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_gggg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001769,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_gggg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001770,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_aaaa_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001771,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_aaaa_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001772,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_abba_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001773,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_abba_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001774,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_aaag_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001775,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_aaag_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001776,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_rgrr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001777,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_rgrr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001778,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_ivec4_bbab_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001779,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_ivec4_bbab_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001780,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_bvec2_x_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001781,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec2_x_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001782,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec2_xx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001783,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec2_xx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001784,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec2_xy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001785,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec2_xy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001786,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec2_yx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001787,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec2_yx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001788,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec2_yxy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001789,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec2_yxy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001790,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec2_xyxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001791,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec2_xyxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001792,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec2_yyyy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001793,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec2_yyyy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001794,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_bvec2_s_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001795,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec2_s_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001796,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec2_ss_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001797,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec2_ss_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001798,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec2_st_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001799,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec2_st_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001800,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec2_ts_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001801,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec2_ts_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001802,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec2_tst_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001803,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec2_tst_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001804,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec2_stss_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001805,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec2_stss_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001806,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec2_tttt_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001807,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec2_tttt_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001808,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_bvec2_r_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001809,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec2_r_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001810,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec2_rr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001811,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec2_rr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001812,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec2_rg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001813,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec2_rg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001814,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec2_gr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001815,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec2_gr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001816,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec2_grg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001817,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec2_grg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001818,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec2_rgrr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001819,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec2_rgrr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001820,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec2_gggg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001821,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec2_gggg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001822,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_bvec3_x_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001823,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_x_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001824,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_bvec3_z_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001825,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_z_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001826,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_xz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001827,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_xz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001828,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_zz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001829,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_zz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001830,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_xyz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001831,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_xyz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001832,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_zyx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001833,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_zyx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001834,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_xxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001835,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_xxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001836,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_zzz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001837,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_zzz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001838,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_zzy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001839,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_zzy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001840,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_yxy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001841,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_yxy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001842,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_xzx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001843,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_xzx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001844,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_xyyx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001845,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec3_xyyx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001846,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_zzzz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001847,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec3_zzzz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001848,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_bvec3_s_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001849,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_s_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001850,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_bvec3_p_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001851,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_p_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001852,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_sp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001853,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_sp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001854,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_pp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001855,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_pp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001856,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_stp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001857,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_stp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001858,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_pts_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001859,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_pts_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001860,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_sss_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001861,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_sss_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001862,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_ppp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001863,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_ppp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001864,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_ppt_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001865,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_ppt_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001866,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_tst_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001867,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_tst_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001868,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_sps_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001869,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_sps_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001870,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_stts_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001871,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec3_stts_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001872,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_pppp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001873,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec3_pppp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001874,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_bvec3_r_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001875,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_r_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001876,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_bvec3_b_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001877,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_b_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001878,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_rb_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001879,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_rb_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001880,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_bb_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001881,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_bb_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001882,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_rgb_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001883,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_rgb_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001884,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_bgr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001885,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_bgr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001886,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_rrr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001887,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_rrr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001888,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_bbb_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001889,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_bbb_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001890,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_bbg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001891,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_bbg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001892,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_grg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001893,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_grg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001894,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec3_rbr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001895,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_rbr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001896,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_rggr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001897,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec3_rggr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001898,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec3_bbbb_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001899,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec3_bbbb_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001900,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_bvec4_x_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001901,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec4_x_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001902,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_bvec4_w_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001903,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec4_w_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001904,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec4_wx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001905,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_wx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001906,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec4_wz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001907,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_wz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001908,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec4_www_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001909,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_www_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001910,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec4_yyw_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001911,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_yyw_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001912,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec4_wzy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001913,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_wzy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001914,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_xyzw_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001915,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_xyzw_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001916,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_wzyx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001917,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_wzyx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001918,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_xxxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001919,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_xxxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001920,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_yyyy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001921,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_yyyy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001922,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_wwww_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001923,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_wwww_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001924,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_wzzw_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001925,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_wzzw_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001926,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_wwwy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001927,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_wwwy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001928,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_xyxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001929,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_xyxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001930,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_zzwz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001931,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_zzwz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001932,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_bvec4_s_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001933,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec4_s_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001934,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_bvec4_q_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001935,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec4_q_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001936,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec4_qs_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001937,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_qs_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001938,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec4_qp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001939,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_qp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001940,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec4_qqq_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001941,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_qqq_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001942,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec4_ttq_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001943,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_ttq_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001944,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec4_qpt_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001945,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_qpt_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001946,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_stpq_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001947,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_stpq_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001948,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_qpts_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001949,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_qpts_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001950,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_ssss_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001951,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_ssss_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001952,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_tttt_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001953,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_tttt_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001954,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_qqqq_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001955,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_qqqq_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001956,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_qppq_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001957,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_qppq_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001958,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_qqqt_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001959,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_qqqt_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001960,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_stss_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001961,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_stss_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001962,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_ppqp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001963,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_ppqp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001964,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_bvec4_r_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001965,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec4_r_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001966,
        "dEQP-GLES2.functional.shaders.swizzles",
        ".vector_swizzles.mediump_bvec4_a_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001967,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec4_a_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001968,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec4_ar_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001969,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_ar_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001970,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec4_ab_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001971,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_ab_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001972,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec4_aaa_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001973,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_aaa_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001974,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec4_gga_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001975,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_gga_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001976,
        "dEQP-GLES2.functional.shaders.swizzles.",
        "vector_swizzles.mediump_bvec4_abg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001977,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_abg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001978,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_rgba_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001979,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_rgba_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001980,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_abgr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001981,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_abgr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001982,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_rrrr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001983,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_rrrr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001984,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_gggg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001985,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_gggg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001986,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_aaaa_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001987,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_aaaa_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001988,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_abba_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001989,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_abba_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001990,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_aaag_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001991,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_aaag_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001992,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_rgrr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001993,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_rgrr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001994,
        "dEQP-GLES2.functional.shaders.swizzles.v",
        "ector_swizzles.mediump_bvec4_bbab_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001995,
        "dEQP-GLES2.functional.shaders.swizzles.ve",
        "ctor_swizzles.mediump_bvec4_bbab_fragment");
