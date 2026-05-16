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

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003902,
        "dEQP-GLES3.functional.shaders.swizzle_math_op",
        "erations.vector_divide.mediump_vec2_x_x_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003903,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_divide.mediump_vec2_x_x_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003904,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_divide.mediump_vec2_xx_xx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003905,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_divide.mediump_vec2_xx_xx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003906,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_divide.mediump_vec2_xy_yx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003907,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_divide.mediump_vec2_xy_yx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003908,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_divide.mediump_vec2_yx_xy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003909,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_divide.mediump_vec2_yx_xy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003910,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_divide.mediump_vec2_yxy_xyy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003911,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_divide.mediump_vec2_yxy_xyy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003912,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_divide.mediump_vec2_xyxx_yxxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003913,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_divide.mediump_vec2_xyxx_yxxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003914,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_divide.mediump_vec2_yxyx_xyxy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003915,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_divide.mediump_vec2_yxyx_xyxy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003916,
        "dEQP-GLES3.functional.shaders.swizzle_math_op",
        "erations.vector_divide.mediump_vec3_x_x_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003917,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_divide.mediump_vec3_x_x_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003918,
        "dEQP-GLES3.functional.shaders.swizzle_math_op",
        "erations.vector_divide.mediump_vec3_z_z_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003919,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_divide.mediump_vec3_z_z_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003920,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_divide.mediump_vec3_xz_zx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003921,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_divide.mediump_vec3_xz_zx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003922,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_divide.mediump_vec3_zz_zz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003923,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_divide.mediump_vec3_zz_zz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003924,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_divide.mediump_vec3_xyz_yzx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003925,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_divide.mediump_vec3_xyz_yzx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003926,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_divide.mediump_vec3_zyx_yxz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003927,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_divide.mediump_vec3_zyx_yxz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003928,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_divide.mediump_vec3_xxx_xxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003929,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_divide.mediump_vec3_xxx_xxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003930,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_divide.mediump_vec3_zzz_zzz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003931,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_divide.mediump_vec3_zzz_zzz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003932,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_divide.mediump_vec3_zzy_zyz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003933,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_divide.mediump_vec3_zzy_zyz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003934,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_divide.mediump_vec3_yxy_xyy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003935,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_divide.mediump_vec3_yxy_xyy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003936,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_divide.mediump_vec3_xzx_zxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003937,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_divide.mediump_vec3_xzx_zxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003938,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_divide.mediump_vec3_xyyx_yyxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003939,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_divide.mediump_vec3_xyyx_yyxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003940,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_divide.mediump_vec3_zxyz_xyzz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003941,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_divide.mediump_vec3_zxyz_xyzz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003942,
        "dEQP-GLES3.functional.shaders.swizzle_math_op",
        "erations.vector_divide.mediump_vec4_x_x_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003943,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_divide.mediump_vec4_x_x_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003944,
        "dEQP-GLES3.functional.shaders.swizzle_math_op",
        "erations.vector_divide.mediump_vec4_w_w_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003945,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_divide.mediump_vec4_w_w_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003946,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_divide.mediump_vec4_wx_xw_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003947,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_divide.mediump_vec4_wx_xw_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003948,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_divide.mediump_vec4_wz_zw_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003949,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_divide.mediump_vec4_wz_zw_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003950,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_divide.mediump_vec4_www_www_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003951,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_divide.mediump_vec4_www_www_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003952,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_divide.mediump_vec4_yyw_ywy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003953,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_divide.mediump_vec4_yyw_ywy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003954,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_divide.mediump_vec4_wzy_zyw_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003955,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_divide.mediump_vec4_wzy_zyw_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003956,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_divide.mediump_vec4_xyzw_yzwx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003957,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_divide.mediump_vec4_xyzw_yzwx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003958,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_divide.mediump_vec4_wzyx_zyxw_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003959,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_divide.mediump_vec4_wzyx_zyxw_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003960,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_divide.mediump_vec4_xyxy_yxyx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003961,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_divide.mediump_vec4_xyxy_yxyx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003962,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_divide.mediump_vec4_yzzy_zzyy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003963,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_divide.mediump_vec4_yzzy_zzyy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003964,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_divide.mediump_vec4_wxww_xwww_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003965,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_divide.mediump_vec4_wxww_xwww_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003966,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_divide.mediump_vec4_xyxx_yxxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003967,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_divide.mediump_vec4_xyxx_yxxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003968,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_divide.mediump_vec4_zzzz_zzzz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003969,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_divide.mediump_vec4_zzzz_zzzz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003970,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_divide.mediump_ivec2_x_x_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003971,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_divide.mediump_ivec2_x_x_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003972,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_divide.mediump_ivec2_xx_xx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003973,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_divide.mediump_ivec2_xx_xx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003974,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_divide.mediump_ivec2_xy_yx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003975,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_divide.mediump_ivec2_xy_yx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003976,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_divide.mediump_ivec2_yx_xy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003977,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_divide.mediump_ivec2_yx_xy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003978,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_divide.mediump_ivec2_yxy_xyy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003979,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_divide.mediump_ivec2_yxy_xyy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003980,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_divide.mediump_ivec2_xyxx_yxxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003981,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_divide.mediump_ivec2_xyxx_yxxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003982,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_divide.mediump_ivec2_yxyx_xyxy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003983,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_divide.mediump_ivec2_yxyx_xyxy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003984,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_divide.mediump_ivec3_x_x_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003985,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_divide.mediump_ivec3_x_x_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003986,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_divide.mediump_ivec3_z_z_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003987,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_divide.mediump_ivec3_z_z_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003988,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_divide.mediump_ivec3_xz_zx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003989,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_divide.mediump_ivec3_xz_zx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003990,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_divide.mediump_ivec3_zz_zz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003991,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_divide.mediump_ivec3_zz_zz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003992,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_divide.mediump_ivec3_xyz_yzx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003993,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_divide.mediump_ivec3_xyz_yzx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003994,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_divide.mediump_ivec3_zyx_yxz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003995,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_divide.mediump_ivec3_zyx_yxz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003996,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_divide.mediump_ivec3_xxx_xxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003997,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_divide.mediump_ivec3_xxx_xxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003998,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_divide.mediump_ivec3_zzz_zzz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003999,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_divide.mediump_ivec3_zzz_zzz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_004000,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_divide.mediump_ivec3_zzy_zyz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_004001,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_divide.mediump_ivec3_zzy_zyz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_004002,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_divide.mediump_ivec3_yxy_xyy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_004003,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_divide.mediump_ivec3_yxy_xyy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_004004,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_divide.mediump_ivec3_xzx_zxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_004005,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_divide.mediump_ivec3_xzx_zxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_004006,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_divide.mediump_ivec3_xyyx_yyxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_004007,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_divide.mediump_ivec3_xyyx_yyxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_004008,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_divide.mediump_ivec3_zxyz_xyzz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_004009,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_divide.mediump_ivec3_zxyz_xyzz_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_004010,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_divide.mediump_ivec4_x_x_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_004011,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_divide.mediump_ivec4_x_x_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_004012,
        "dEQP-GLES3.functional.shaders.swizzle_math_ope",
        "rations.vector_divide.mediump_ivec4_w_w_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_004013,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_divide.mediump_ivec4_w_w_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_004014,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_divide.mediump_ivec4_wx_xw_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_004015,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_divide.mediump_ivec4_wx_xw_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_004016,
        "dEQP-GLES3.functional.shaders.swizzle_math_oper",
        "ations.vector_divide.mediump_ivec4_wz_zw_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_004017,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_divide.mediump_ivec4_wz_zw_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_004018,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_divide.mediump_ivec4_www_www_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_004019,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_divide.mediump_ivec4_www_www_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_004020,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_divide.mediump_ivec4_yyw_ywy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_004021,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_divide.mediump_ivec4_yyw_ywy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_004022,
        "dEQP-GLES3.functional.shaders.swizzle_math_opera",
        "tions.vector_divide.mediump_ivec4_wzy_zyw_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_004023,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_divide.mediump_ivec4_wzy_zyw_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_004024,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_divide.mediump_ivec4_xyzw_yzwx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_004025,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_divide.mediump_ivec4_xyzw_yzwx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_004026,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_divide.mediump_ivec4_wzyx_zyxw_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_004027,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_divide.mediump_ivec4_wzyx_zyxw_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_004028,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_divide.mediump_ivec4_xyxy_yxyx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_004029,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_divide.mediump_ivec4_xyxy_yxyx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_004030,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_divide.mediump_ivec4_yzzy_zzyy_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_004031,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_divide.mediump_ivec4_yzzy_zzyy_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_004032,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_divide.mediump_ivec4_wxww_xwww_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_004033,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_divide.mediump_ivec4_wxww_xwww_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_004034,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_divide.mediump_ivec4_xyxx_yxxx_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_004035,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_divide.mediump_ivec4_xyxx_yxxx_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_004036,
        "dEQP-GLES3.functional.shaders.swizzle_math_operat",
        "ions.vector_divide.mediump_ivec4_zzzz_zzzz_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_004037,
        "dEQP-GLES3.functional.shaders.swizzle_math_operati",
        "ons.vector_divide.mediump_ivec4_zzzz_zzzz_fragment");
