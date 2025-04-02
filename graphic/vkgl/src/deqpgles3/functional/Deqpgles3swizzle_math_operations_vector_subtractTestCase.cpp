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

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003630,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_subtract.mediump_vec2_x_x_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003631,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_subtract.mediump_vec2_x_x_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003632,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_subtract.mediump_vec2_xx_xx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003633,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_subtract.mediump_vec2_xx_xx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003634,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_subtract.mediump_vec2_xy_yx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003635,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_subtract.mediump_vec2_xy_yx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003636,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_subtract.mediump_vec2_yx_xy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003637,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_subtract.mediump_vec2_yx_xy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003638,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_subtract.mediump_vec2_yxy_xyy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003639,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_subtract.mediump_vec2_yxy_xyy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003640,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_subtract.mediump_vec2_xyxx_yxxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003641,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_subtract.mediump_vec2_xyxx_yxxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003642,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_subtract.mediump_vec2_yxyx_xyxy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003643,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_subtract.mediump_vec2_yxyx_xyxy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003644,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_subtract.mediump_vec3_x_x_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003645,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_subtract.mediump_vec3_x_x_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003646,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_subtract.mediump_vec3_z_z_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003647,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_subtract.mediump_vec3_z_z_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003648,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_subtract.mediump_vec3_xz_zx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003649,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_subtract.mediump_vec3_xz_zx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003650,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_subtract.mediump_vec3_zz_zz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003651,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_subtract.mediump_vec3_zz_zz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003652,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_subtract.mediump_vec3_xyz_yzx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003653,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_subtract.mediump_vec3_xyz_yzx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003654,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_subtract.mediump_vec3_zyx_yxz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003655,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_subtract.mediump_vec3_zyx_yxz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003656,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_subtract.mediump_vec3_xxx_xxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003657,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_subtract.mediump_vec3_xxx_xxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003658,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_subtract.mediump_vec3_zzz_zzz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003659,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_subtract.mediump_vec3_zzz_zzz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003660,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_subtract.mediump_vec3_zzy_zyz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003661,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_subtract.mediump_vec3_zzy_zyz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003662,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_subtract.mediump_vec3_yxy_xyy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003663,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_subtract.mediump_vec3_yxy_xyy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003664,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_subtract.mediump_vec3_xzx_zxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003665,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_subtract.mediump_vec3_xzx_zxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003666,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_subtract.mediump_vec3_xyyx_yyxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003667,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_subtract.mediump_vec3_xyyx_yyxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003668,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_subtract.mediump_vec3_zxyz_xyzz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003669,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_subtract.mediump_vec3_zxyz_xyzz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003670,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_subtract.mediump_vec4_x_x_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003671,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_subtract.mediump_vec4_x_x_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003672,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_subtract.mediump_vec4_w_w_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003673,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_subtract.mediump_vec4_w_w_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003674,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_subtract.mediump_vec4_wx_xw_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003675,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_subtract.mediump_vec4_wx_xw_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003676,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_subtract.mediump_vec4_wz_zw_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003677,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_subtract.mediump_vec4_wz_zw_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003678,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_subtract.mediump_vec4_www_www_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003679,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_subtract.mediump_vec4_www_www_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003680,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_subtract.mediump_vec4_yyw_ywy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003681,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_subtract.mediump_vec4_yyw_ywy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003682,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_subtract.mediump_vec4_wzy_zyw_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003683,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_subtract.mediump_vec4_wzy_zyw_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003684,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_subtract.mediump_vec4_xyzw_yzwx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003685,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_subtract.mediump_vec4_xyzw_yzwx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003686,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_subtract.mediump_vec4_wzyx_zyxw_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003687,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_subtract.mediump_vec4_wzyx_zyxw_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003688,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_subtract.mediump_vec4_xyxy_yxyx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003689,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_subtract.mediump_vec4_xyxy_yxyx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003690,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_subtract.mediump_vec4_yzzy_zzyy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003691,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_subtract.mediump_vec4_yzzy_zzyy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003692,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_subtract.mediump_vec4_wxww_xwww_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003693,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_subtract.mediump_vec4_wxww_xwww_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003694,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_subtract.mediump_vec4_xyxx_yxxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003695,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_subtract.mediump_vec4_xyxx_yxxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003696,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_subtract.mediump_vec4_zzzz_zzzz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003697,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_subtract.mediump_vec4_zzzz_zzzz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003698,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_subtract.mediump_ivec2_x_x_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003699,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_subtract.mediump_ivec2_x_x_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003700,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_subtract.mediump_ivec2_xx_xx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003701,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_subtract.mediump_ivec2_xx_xx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003702,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_subtract.mediump_ivec2_xy_yx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003703,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_subtract.mediump_ivec2_xy_yx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003704,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_subtract.mediump_ivec2_yx_xy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003705,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_subtract.mediump_ivec2_yx_xy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003706,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_subtract.mediump_ivec2_yxy_xyy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003707,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_subtract.mediump_ivec2_yxy_xyy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003708,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_subtract.mediump_ivec2_xyxx_yxxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003709,
        "dEQP-GLES3.functional.shaders.swizzle_math_operatio",
        "ns.vector_subtract.mediump_ivec2_xyxx_yxxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003710,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_subtract.mediump_ivec2_yxyx_xyxy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003711,
        "dEQP-GLES3.functional.shaders.swizzle_math_operatio",
        "ns.vector_subtract.mediump_ivec2_yxyx_xyxy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003712,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_subtract.mediump_ivec3_x_x_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003713,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_subtract.mediump_ivec3_x_x_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003714,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_subtract.mediump_ivec3_z_z_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003715,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_subtract.mediump_ivec3_z_z_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003716,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_subtract.mediump_ivec3_xz_zx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003717,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_subtract.mediump_ivec3_xz_zx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003718,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_subtract.mediump_ivec3_zz_zz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003719,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_subtract.mediump_ivec3_zz_zz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003720,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_subtract.mediump_ivec3_xyz_yzx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003721,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_subtract.mediump_ivec3_xyz_yzx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003722,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_subtract.mediump_ivec3_zyx_yxz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003723,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_subtract.mediump_ivec3_zyx_yxz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003724,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_subtract.mediump_ivec3_xxx_xxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003725,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_subtract.mediump_ivec3_xxx_xxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003726,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_subtract.mediump_ivec3_zzz_zzz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003727,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_subtract.mediump_ivec3_zzz_zzz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003728,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_subtract.mediump_ivec3_zzy_zyz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003729,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_subtract.mediump_ivec3_zzy_zyz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003730,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_subtract.mediump_ivec3_yxy_xyy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003731,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_subtract.mediump_ivec3_yxy_xyy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003732,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_subtract.mediump_ivec3_xzx_zxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003733,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_subtract.mediump_ivec3_xzx_zxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003734,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_subtract.mediump_ivec3_xyyx_yyxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003735,
        "dEQP-GLES3.functional.shaders.swizzle_math_operatio",
        "ns.vector_subtract.mediump_ivec3_xyyx_yyxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003736,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_subtract.mediump_ivec3_zxyz_xyzz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003737,
        "dEQP-GLES3.functional.shaders.swizzle_math_operatio",
        "ns.vector_subtract.mediump_ivec3_zxyz_xyzz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003738,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_subtract.mediump_ivec4_x_x_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003739,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_subtract.mediump_ivec4_x_x_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003740,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_subtract.mediump_ivec4_w_w_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003741,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_subtract.mediump_ivec4_w_w_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003742,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_subtract.mediump_ivec4_wx_xw_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003743,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_subtract.mediump_ivec4_wx_xw_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003744,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_subtract.mediump_ivec4_wz_zw_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003745,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_subtract.mediump_ivec4_wz_zw_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003746,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_subtract.mediump_ivec4_www_www_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003747,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_subtract.mediump_ivec4_www_www_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003748,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_subtract.mediump_ivec4_yyw_ywy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003749,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_subtract.mediump_ivec4_yyw_ywy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003750,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_subtract.mediump_ivec4_wzy_zyw_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003751,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_subtract.mediump_ivec4_wzy_zyw_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003752,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_subtract.mediump_ivec4_xyzw_yzwx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003753,
        "dEQP-GLES3.functional.shaders.swizzle_math_operatio",
        "ns.vector_subtract.mediump_ivec4_xyzw_yzwx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003754,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_subtract.mediump_ivec4_wzyx_zyxw_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003755,
        "dEQP-GLES3.functional.shaders.swizzle_math_operatio",
        "ns.vector_subtract.mediump_ivec4_wzyx_zyxw_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003756,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_subtract.mediump_ivec4_xyxy_yxyx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003757,
        "dEQP-GLES3.functional.shaders.swizzle_math_operatio",
        "ns.vector_subtract.mediump_ivec4_xyxy_yxyx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003758,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_subtract.mediump_ivec4_yzzy_zzyy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003759,
        "dEQP-GLES3.functional.shaders.swizzle_math_operatio",
        "ns.vector_subtract.mediump_ivec4_yzzy_zzyy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003760,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_subtract.mediump_ivec4_wxww_xwww_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003761,
        "dEQP-GLES3.functional.shaders.swizzle_math_operatio",
        "ns.vector_subtract.mediump_ivec4_wxww_xwww_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003762,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_subtract.mediump_ivec4_xyxx_yxxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003763,
        "dEQP-GLES3.functional.shaders.swizzle_math_operatio",
        "ns.vector_subtract.mediump_ivec4_xyxx_yxxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003764,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_subtract.mediump_ivec4_zzzz_zzzz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003765,
        "dEQP-GLES3.functional.shaders.swizzle_math_operatio",
        "ns.vector_subtract.mediump_ivec4_zzzz_zzzz_fragment");
