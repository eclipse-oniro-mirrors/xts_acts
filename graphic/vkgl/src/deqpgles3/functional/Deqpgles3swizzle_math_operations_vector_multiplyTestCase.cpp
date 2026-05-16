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

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003766,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_multiply.mediump_vec2_x_x_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003767,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_multiply.mediump_vec2_x_x_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003768,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_multiply.mediump_vec2_xx_xx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003769,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_multiply.mediump_vec2_xx_xx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003770,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_multiply.mediump_vec2_xy_yx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003771,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_multiply.mediump_vec2_xy_yx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003772,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_multiply.mediump_vec2_yx_xy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003773,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_multiply.mediump_vec2_yx_xy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003774,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_multiply.mediump_vec2_yxy_xyy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003775,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_multiply.mediump_vec2_yxy_xyy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003776,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_multiply.mediump_vec2_xyxx_yxxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003777,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_multiply.mediump_vec2_xyxx_yxxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003778,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_multiply.mediump_vec2_yxyx_xyxy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003779,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_multiply.mediump_vec2_yxyx_xyxy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003780,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_multiply.mediump_vec3_x_x_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003781,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_multiply.mediump_vec3_x_x_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003782,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_multiply.mediump_vec3_z_z_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003783,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_multiply.mediump_vec3_z_z_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003784,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_multiply.mediump_vec3_xz_zx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003785,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_multiply.mediump_vec3_xz_zx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003786,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_multiply.mediump_vec3_zz_zz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003787,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_multiply.mediump_vec3_zz_zz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003788,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_multiply.mediump_vec3_xyz_yzx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003789,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_multiply.mediump_vec3_xyz_yzx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003790,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_multiply.mediump_vec3_zyx_yxz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003791,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_multiply.mediump_vec3_zyx_yxz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003792,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_multiply.mediump_vec3_xxx_xxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003793,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_multiply.mediump_vec3_xxx_xxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003794,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_multiply.mediump_vec3_zzz_zzz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003795,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_multiply.mediump_vec3_zzz_zzz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003796,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_multiply.mediump_vec3_zzy_zyz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003797,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_multiply.mediump_vec3_zzy_zyz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003798,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_multiply.mediump_vec3_yxy_xyy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003799,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_multiply.mediump_vec3_yxy_xyy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003800,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_multiply.mediump_vec3_xzx_zxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003801,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_multiply.mediump_vec3_xzx_zxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003802,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_multiply.mediump_vec3_xyyx_yyxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003803,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_multiply.mediump_vec3_xyyx_yyxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003804,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_multiply.mediump_vec3_zxyz_xyzz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003805,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_multiply.mediump_vec3_zxyz_xyzz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003806,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_multiply.mediump_vec4_x_x_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003807,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_multiply.mediump_vec4_x_x_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003808,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_multiply.mediump_vec4_w_w_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003809,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_multiply.mediump_vec4_w_w_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003810,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_multiply.mediump_vec4_wx_xw_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003811,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_multiply.mediump_vec4_wx_xw_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003812,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_multiply.mediump_vec4_wz_zw_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003813,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_multiply.mediump_vec4_wz_zw_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003814,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_multiply.mediump_vec4_www_www_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003815,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_multiply.mediump_vec4_www_www_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003816,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_multiply.mediump_vec4_yyw_ywy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003817,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_multiply.mediump_vec4_yyw_ywy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003818,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_multiply.mediump_vec4_wzy_zyw_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003819,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_multiply.mediump_vec4_wzy_zyw_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003820,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_multiply.mediump_vec4_xyzw_yzwx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003821,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_multiply.mediump_vec4_xyzw_yzwx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003822,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_multiply.mediump_vec4_wzyx_zyxw_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003823,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_multiply.mediump_vec4_wzyx_zyxw_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003824,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_multiply.mediump_vec4_xyxy_yxyx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003825,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_multiply.mediump_vec4_xyxy_yxyx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003826,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_multiply.mediump_vec4_yzzy_zzyy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003827,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_multiply.mediump_vec4_yzzy_zzyy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003828,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_multiply.mediump_vec4_wxww_xwww_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003829,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_multiply.mediump_vec4_wxww_xwww_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003830,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_multiply.mediump_vec4_xyxx_yxxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003831,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_multiply.mediump_vec4_xyxx_yxxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003832,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_multiply.mediump_vec4_zzzz_zzzz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003833,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_multiply.mediump_vec4_zzzz_zzzz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003834,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_multiply.mediump_ivec2_x_x_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003835,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_multiply.mediump_ivec2_x_x_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003836,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_multiply.mediump_ivec2_xx_xx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003837,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_multiply.mediump_ivec2_xx_xx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003838,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_multiply.mediump_ivec2_xy_yx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003839,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_multiply.mediump_ivec2_xy_yx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003840,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_multiply.mediump_ivec2_yx_xy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003841,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_multiply.mediump_ivec2_yx_xy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003842,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_multiply.mediump_ivec2_yxy_xyy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003843,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_multiply.mediump_ivec2_yxy_xyy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003844,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_multiply.mediump_ivec2_xyxx_yxxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003845,
        "dEQP-GLES3.functional.shaders.swizzle_math_operatio",
        "ns.vector_multiply.mediump_ivec2_xyxx_yxxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003846,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_multiply.mediump_ivec2_yxyx_xyxy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003847,
        "dEQP-GLES3.functional.shaders.swizzle_math_operatio",
        "ns.vector_multiply.mediump_ivec2_yxyx_xyxy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003848,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_multiply.mediump_ivec3_x_x_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003849,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_multiply.mediump_ivec3_x_x_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003850,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_multiply.mediump_ivec3_z_z_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003851,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_multiply.mediump_ivec3_z_z_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003852,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_multiply.mediump_ivec3_xz_zx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003853,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_multiply.mediump_ivec3_xz_zx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003854,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_multiply.mediump_ivec3_zz_zz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003855,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_multiply.mediump_ivec3_zz_zz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003856,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_multiply.mediump_ivec3_xyz_yzx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003857,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_multiply.mediump_ivec3_xyz_yzx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003858,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_multiply.mediump_ivec3_zyx_yxz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003859,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_multiply.mediump_ivec3_zyx_yxz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003860,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_multiply.mediump_ivec3_xxx_xxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003861,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_multiply.mediump_ivec3_xxx_xxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003862,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_multiply.mediump_ivec3_zzz_zzz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003863,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_multiply.mediump_ivec3_zzz_zzz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003864,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_multiply.mediump_ivec3_zzy_zyz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003865,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_multiply.mediump_ivec3_zzy_zyz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003866,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_multiply.mediump_ivec3_yxy_xyy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003867,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_multiply.mediump_ivec3_yxy_xyy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003868,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_multiply.mediump_ivec3_xzx_zxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003869,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_multiply.mediump_ivec3_xzx_zxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003870,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_multiply.mediump_ivec3_xyyx_yyxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003871,
        "dEQP-GLES3.functional.shaders.swizzle_math_operatio",
        "ns.vector_multiply.mediump_ivec3_xyyx_yyxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003872,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_multiply.mediump_ivec3_zxyz_xyzz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003873,
        "dEQP-GLES3.functional.shaders.swizzle_math_operatio",
        "ns.vector_multiply.mediump_ivec3_zxyz_xyzz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003874,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_multiply.mediump_ivec4_x_x_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003875,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_multiply.mediump_ivec4_x_x_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003876,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_multiply.mediump_ivec4_w_w_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003877,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_multiply.mediump_ivec4_w_w_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003878,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_multiply.mediump_ivec4_wx_xw_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003879,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_multiply.mediump_ivec4_wx_xw_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003880,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_multiply.mediump_ivec4_wz_zw_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003881,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_multiply.mediump_ivec4_wz_zw_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003882,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_multiply.mediump_ivec4_www_www_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003883,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_multiply.mediump_ivec4_www_www_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003884,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_multiply.mediump_ivec4_yyw_ywy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003885,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_multiply.mediump_ivec4_yyw_ywy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003886,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_multiply.mediump_ivec4_wzy_zyw_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003887,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_multiply.mediump_ivec4_wzy_zyw_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003888,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_multiply.mediump_ivec4_xyzw_yzwx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003889,
        "dEQP-GLES3.functional.shaders.swizzle_math_operatio",
        "ns.vector_multiply.mediump_ivec4_xyzw_yzwx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003890,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_multiply.mediump_ivec4_wzyx_zyxw_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003891,
        "dEQP-GLES3.functional.shaders.swizzle_math_operatio",
        "ns.vector_multiply.mediump_ivec4_wzyx_zyxw_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003892,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_multiply.mediump_ivec4_xyxy_yxyx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003893,
        "dEQP-GLES3.functional.shaders.swizzle_math_operatio",
        "ns.vector_multiply.mediump_ivec4_xyxy_yxyx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003894,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_multiply.mediump_ivec4_yzzy_zzyy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003895,
        "dEQP-GLES3.functional.shaders.swizzle_math_operatio",
        "ns.vector_multiply.mediump_ivec4_yzzy_zzyy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003896,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_multiply.mediump_ivec4_wxww_xwww_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003897,
        "dEQP-GLES3.functional.shaders.swizzle_math_operatio",
        "ns.vector_multiply.mediump_ivec4_wxww_xwww_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003898,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_multiply.mediump_ivec4_xyxx_yxxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003899,
        "dEQP-GLES3.functional.shaders.swizzle_math_operatio",
        "ns.vector_multiply.mediump_ivec4_xyxx_yxxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003900,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_multiply.mediump_ivec4_zzzz_zzzz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003901,
        "dEQP-GLES3.functional.shaders.swizzle_math_operatio",
        "ns.vector_multiply.mediump_ivec4_zzzz_zzzz_fragment");
