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
#include "../ActsDeqpgles30004TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003494,
        "dEQP-GLES3.functional.shaders.swizzle_math_o",
        "perations.vector_add.mediump_vec2_x_x_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003495,
        "dEQP-GLES3.functional.shaders.swizzle_math_op",
        "erations.vector_add.mediump_vec2_x_x_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003496,
        "dEQP-GLES3.functional.shaders.swizzle_math_op",
        "erations.vector_add.mediump_vec2_xx_xx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003497,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_add.mediump_vec2_xx_xx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003498,
        "dEQP-GLES3.functional.shaders.swizzle_math_op",
        "erations.vector_add.mediump_vec2_xy_yx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003499,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_add.mediump_vec2_xy_yx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003500,
        "dEQP-GLES3.functional.shaders.swizzle_math_op",
        "erations.vector_add.mediump_vec2_yx_xy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003501,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_add.mediump_vec2_yx_xy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003502,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_add.mediump_vec2_yxy_xyy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003503,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_add.mediump_vec2_yxy_xyy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003504,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_add.mediump_vec2_xyxx_yxxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003505,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_add.mediump_vec2_xyxx_yxxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003506,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_add.mediump_vec2_yxyx_xyxy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003507,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_add.mediump_vec2_yxyx_xyxy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003508,
        "dEQP-GLES3.functional.shaders.swizzle_math_o",
        "perations.vector_add.mediump_vec3_x_x_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003509,
        "dEQP-GLES3.functional.shaders.swizzle_math_op",
        "erations.vector_add.mediump_vec3_x_x_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003510,
        "dEQP-GLES3.functional.shaders.swizzle_math_o",
        "perations.vector_add.mediump_vec3_z_z_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003511,
        "dEQP-GLES3.functional.shaders.swizzle_math_op",
        "erations.vector_add.mediump_vec3_z_z_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003512,
        "dEQP-GLES3.functional.shaders.swizzle_math_op",
        "erations.vector_add.mediump_vec3_xz_zx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003513,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_add.mediump_vec3_xz_zx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003514,
        "dEQP-GLES3.functional.shaders.swizzle_math_op",
        "erations.vector_add.mediump_vec3_zz_zz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003515,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_add.mediump_vec3_zz_zz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003516,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_add.mediump_vec3_xyz_yzx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003517,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_add.mediump_vec3_xyz_yzx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003518,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_add.mediump_vec3_zyx_yxz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003519,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_add.mediump_vec3_zyx_yxz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003520,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_add.mediump_vec3_xxx_xxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003521,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_add.mediump_vec3_xxx_xxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003522,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_add.mediump_vec3_zzz_zzz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003523,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_add.mediump_vec3_zzz_zzz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003524,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_add.mediump_vec3_zzy_zyz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003525,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_add.mediump_vec3_zzy_zyz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003526,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_add.mediump_vec3_yxy_xyy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003527,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_add.mediump_vec3_yxy_xyy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003528,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_add.mediump_vec3_xzx_zxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003529,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_add.mediump_vec3_xzx_zxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003530,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_add.mediump_vec3_xyyx_yyxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003531,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_add.mediump_vec3_xyyx_yyxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003532,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_add.mediump_vec3_zxyz_xyzz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003533,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_add.mediump_vec3_zxyz_xyzz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003534,
        "dEQP-GLES3.functional.shaders.swizzle_math_o",
        "perations.vector_add.mediump_vec4_x_x_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003535,
        "dEQP-GLES3.functional.shaders.swizzle_math_op",
        "erations.vector_add.mediump_vec4_x_x_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003536,
        "dEQP-GLES3.functional.shaders.swizzle_math_o",
        "perations.vector_add.mediump_vec4_w_w_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003537,
        "dEQP-GLES3.functional.shaders.swizzle_math_op",
        "erations.vector_add.mediump_vec4_w_w_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003538,
        "dEQP-GLES3.functional.shaders.swizzle_math_op",
        "erations.vector_add.mediump_vec4_wx_xw_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003539,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_add.mediump_vec4_wx_xw_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003540,
        "dEQP-GLES3.functional.shaders.swizzle_math_op",
        "erations.vector_add.mediump_vec4_wz_zw_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003541,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_add.mediump_vec4_wz_zw_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003542,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_add.mediump_vec4_www_www_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003543,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_add.mediump_vec4_www_www_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003544,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_add.mediump_vec4_yyw_ywy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003545,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_add.mediump_vec4_yyw_ywy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003546,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_add.mediump_vec4_wzy_zyw_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003547,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_add.mediump_vec4_wzy_zyw_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003548,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_add.mediump_vec4_xyzw_yzwx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003549,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_add.mediump_vec4_xyzw_yzwx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003550,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_add.mediump_vec4_wzyx_zyxw_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003551,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_add.mediump_vec4_wzyx_zyxw_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003552,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_add.mediump_vec4_xyxy_yxyx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003553,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_add.mediump_vec4_xyxy_yxyx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003554,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_add.mediump_vec4_yzzy_zzyy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003555,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_add.mediump_vec4_yzzy_zzyy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003556,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_add.mediump_vec4_wxww_xwww_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003557,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_add.mediump_vec4_wxww_xwww_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003558,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_add.mediump_vec4_xyxx_yxxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003559,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_add.mediump_vec4_xyxx_yxxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003560,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_add.mediump_vec4_zzzz_zzzz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003561,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_add.mediump_vec4_zzzz_zzzz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003562,
        "dEQP-GLES3.functional.shaders.swizzle_math_o",
        "perations.vector_add.mediump_ivec2_x_x_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003563,
        "dEQP-GLES3.functional.shaders.swizzle_math_op",
        "erations.vector_add.mediump_ivec2_x_x_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003564,
        "dEQP-GLES3.functional.shaders.swizzle_math_op",
        "erations.vector_add.mediump_ivec2_xx_xx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003565,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_add.mediump_ivec2_xx_xx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003566,
        "dEQP-GLES3.functional.shaders.swizzle_math_op",
        "erations.vector_add.mediump_ivec2_xy_yx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003567,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_add.mediump_ivec2_xy_yx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003568,
        "dEQP-GLES3.functional.shaders.swizzle_math_op",
        "erations.vector_add.mediump_ivec2_yx_xy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003569,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_add.mediump_ivec2_yx_xy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003570,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_add.mediump_ivec2_yxy_xyy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003571,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_add.mediump_ivec2_yxy_xyy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003572,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_add.mediump_ivec2_xyxx_yxxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003573,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_add.mediump_ivec2_xyxx_yxxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003574,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_add.mediump_ivec2_yxyx_xyxy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003575,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_add.mediump_ivec2_yxyx_xyxy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003576,
        "dEQP-GLES3.functional.shaders.swizzle_math_o",
        "perations.vector_add.mediump_ivec3_x_x_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003577,
        "dEQP-GLES3.functional.shaders.swizzle_math_op",
        "erations.vector_add.mediump_ivec3_x_x_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003578,
        "dEQP-GLES3.functional.shaders.swizzle_math_o",
        "perations.vector_add.mediump_ivec3_z_z_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003579,
        "dEQP-GLES3.functional.shaders.swizzle_math_op",
        "erations.vector_add.mediump_ivec3_z_z_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003580,
        "dEQP-GLES3.functional.shaders.swizzle_math_op",
        "erations.vector_add.mediump_ivec3_xz_zx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003581,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_add.mediump_ivec3_xz_zx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003582,
        "dEQP-GLES3.functional.shaders.swizzle_math_op",
        "erations.vector_add.mediump_ivec3_zz_zz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003583,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_add.mediump_ivec3_zz_zz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003584,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_add.mediump_ivec3_xyz_yzx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003585,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_add.mediump_ivec3_xyz_yzx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003586,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_add.mediump_ivec3_zyx_yxz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003587,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_add.mediump_ivec3_zyx_yxz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003588,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_add.mediump_ivec3_xxx_xxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003589,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_add.mediump_ivec3_xxx_xxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003590,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_add.mediump_ivec3_zzz_zzz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003591,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_add.mediump_ivec3_zzz_zzz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003592,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_add.mediump_ivec3_zzy_zyz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003593,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_add.mediump_ivec3_zzy_zyz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003594,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_add.mediump_ivec3_yxy_xyy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003595,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_add.mediump_ivec3_yxy_xyy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003596,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_add.mediump_ivec3_xzx_zxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003597,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_add.mediump_ivec3_xzx_zxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003598,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_add.mediump_ivec3_xyyx_yyxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003599,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_add.mediump_ivec3_xyyx_yyxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003600,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_add.mediump_ivec3_zxyz_xyzz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003601,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_add.mediump_ivec3_zxyz_xyzz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003602,
        "dEQP-GLES3.functional.shaders.swizzle_math_o",
        "perations.vector_add.mediump_ivec4_x_x_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003603,
        "dEQP-GLES3.functional.shaders.swizzle_math_op",
        "erations.vector_add.mediump_ivec4_x_x_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003604,
        "dEQP-GLES3.functional.shaders.swizzle_math_o",
        "perations.vector_add.mediump_ivec4_w_w_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003605,
        "dEQP-GLES3.functional.shaders.swizzle_math_op",
        "erations.vector_add.mediump_ivec4_w_w_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003606,
        "dEQP-GLES3.functional.shaders.swizzle_math_op",
        "erations.vector_add.mediump_ivec4_wx_xw_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003607,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_add.mediump_ivec4_wx_xw_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003608,
        "dEQP-GLES3.functional.shaders.swizzle_math_op",
        "erations.vector_add.mediump_ivec4_wz_zw_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003609,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_add.mediump_ivec4_wz_zw_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003610,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_add.mediump_ivec4_www_www_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003611,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_add.mediump_ivec4_www_www_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003612,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_add.mediump_ivec4_yyw_ywy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003613,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_add.mediump_ivec4_yyw_ywy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003614,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_add.mediump_ivec4_wzy_zyw_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003615,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_add.mediump_ivec4_wzy_zyw_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003616,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_add.mediump_ivec4_xyzw_yzwx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003617,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_add.mediump_ivec4_xyzw_yzwx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003618,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_add.mediump_ivec4_wzyx_zyxw_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003619,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_add.mediump_ivec4_wzyx_zyxw_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003620,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_add.mediump_ivec4_xyxy_yxyx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003621,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_add.mediump_ivec4_xyxy_yxyx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003622,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_add.mediump_ivec4_yzzy_zzyy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003623,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_add.mediump_ivec4_yzzy_zzyy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003624,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_add.mediump_ivec4_wxww_xwww_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003625,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_add.mediump_ivec4_wxww_xwww_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003626,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_add.mediump_ivec4_xyxx_yxxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003627,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_add.mediump_ivec4_xyxx_yxxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003628,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_add.mediump_ivec4_zzzz_zzzz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003629,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_add.mediump_ivec4_zzzz_zzzz_fragment");
