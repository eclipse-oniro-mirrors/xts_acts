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
#include "../Khrgles3BaseFunc.h"
#include "../ActsKhrgles30004TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003139,
        "KHR-GLES3.core.constant_express",
        "ions.basic_radians_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003140,
        "KHR-GLES3.core.constant_expressi",
        "ons.basic_radians_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003141,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_radians_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003142,
        "KHR-GLES3.core.constant_express",
        "ions.basic_radians_vec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003143,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_radians_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003144,
        "KHR-GLES3.core.constant_express",
        "ions.basic_radians_vec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003145,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_radians_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003146,
        "KHR-GLES3.core.constant_express",
        "ions.basic_radians_vec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003147,
        "KHR-GLES3.core.constant_express",
        "ions.basic_degrees_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003148,
        "KHR-GLES3.core.constant_expressi",
        "ons.basic_degrees_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003149,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_degrees_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003150,
        "KHR-GLES3.core.constant_express",
        "ions.basic_degrees_vec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003151,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_degrees_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003152,
        "KHR-GLES3.core.constant_express",
        "ions.basic_degrees_vec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003153,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_degrees_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003154,
        "KHR-GLES3.core.constant_express",
        "ions.basic_degrees_vec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003155,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_sin_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003156,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_sin_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003157,
        "KHR-GLES3.core.constant_expr",
        "essions.basic_sin_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003158,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_sin_vec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003159,
        "KHR-GLES3.core.constant_expr",
        "essions.basic_sin_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003160,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_sin_vec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003161,
        "KHR-GLES3.core.constant_expr",
        "essions.basic_sin_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003162,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_sin_vec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003163,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_cos_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003164,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_cos_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003165,
        "KHR-GLES3.core.constant_expr",
        "essions.basic_cos_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003166,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_cos_vec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003167,
        "KHR-GLES3.core.constant_expr",
        "essions.basic_cos_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003168,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_cos_vec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003169,
        "KHR-GLES3.core.constant_expr",
        "essions.basic_cos_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003170,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_cos_vec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003171,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_asin_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003172,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_asin_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003173,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_asin_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003174,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_asin_vec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003175,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_asin_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003176,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_asin_vec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003177,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_asin_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003178,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_asin_vec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003179,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_acos_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003180,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_acos_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003181,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_acos_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003182,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_acos_vec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003183,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_acos_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003184,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_acos_vec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003185,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_acos_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003186,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_acos_vec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003187,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_pow_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003188,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_pow_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003189,
        "KHR-GLES3.core.constant_expr",
        "essions.basic_pow_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003190,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_pow_vec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003191,
        "KHR-GLES3.core.constant_expr",
        "essions.basic_pow_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003192,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_pow_vec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003193,
        "KHR-GLES3.core.constant_expr",
        "essions.basic_pow_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003194,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_pow_vec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003195,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_exp_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003196,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_exp_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003197,
        "KHR-GLES3.core.constant_expr",
        "essions.basic_exp_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003198,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_exp_vec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003199,
        "KHR-GLES3.core.constant_expr",
        "essions.basic_exp_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003200,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_exp_vec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003201,
        "KHR-GLES3.core.constant_expr",
        "essions.basic_exp_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003202,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_exp_vec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003203,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_log_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003204,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_log_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003205,
        "KHR-GLES3.core.constant_expr",
        "essions.basic_log_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003206,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_log_vec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003207,
        "KHR-GLES3.core.constant_expr",
        "essions.basic_log_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003208,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_log_vec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003209,
        "KHR-GLES3.core.constant_expr",
        "essions.basic_log_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003210,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_log_vec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003211,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_exp2_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003212,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_exp2_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003213,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_exp2_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003214,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_exp2_vec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003215,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_exp2_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003216,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_exp2_vec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003217,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_exp2_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003218,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_exp2_vec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003219,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_log2_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003220,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_log2_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003221,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_log2_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003222,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_log2_vec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003223,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_log2_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003224,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_log2_vec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003225,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_log2_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003226,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_log2_vec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003227,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_sqrt_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003228,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_sqrt_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003229,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_sqrt_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003230,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_sqrt_vec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003231,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_sqrt_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003232,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_sqrt_vec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003233,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_sqrt_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003234,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_sqrt_vec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003235,
        "KHR-GLES3.core.constant_expressio",
        "ns.basic_inversesqrt_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003236,
        "KHR-GLES3.core.constant_expression",
        "s.basic_inversesqrt_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003237,
        "KHR-GLES3.core.constant_expressi",
        "ons.basic_inversesqrt_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003238,
        "KHR-GLES3.core.constant_expressio",
        "ns.basic_inversesqrt_vec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003239,
        "KHR-GLES3.core.constant_expressi",
        "ons.basic_inversesqrt_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003240,
        "KHR-GLES3.core.constant_expressio",
        "ns.basic_inversesqrt_vec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003241,
        "KHR-GLES3.core.constant_expressi",
        "ons.basic_inversesqrt_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003242,
        "KHR-GLES3.core.constant_expressio",
        "ns.basic_inversesqrt_vec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003243,
        "KHR-GLES3.core.constant_expr",
        "essions.basic_abs_int_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003244,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_abs_int_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003245,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_abs_ivec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003246,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_abs_ivec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003247,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_abs_ivec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003248,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_abs_ivec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003249,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_abs_ivec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003250,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_abs_ivec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003251,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_sign_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003252,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_sign_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003253,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_sign_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003254,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_sign_vec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003255,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_sign_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003256,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_sign_vec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003257,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_sign_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003258,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_sign_vec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003259,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_floor_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003260,
        "KHR-GLES3.core.constant_express",
        "ions.basic_floor_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003261,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_floor_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003262,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_floor_vec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003263,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_floor_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003264,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_floor_vec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003265,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_floor_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003266,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_floor_vec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003267,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_trunc_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003268,
        "KHR-GLES3.core.constant_express",
        "ions.basic_trunc_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003269,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_trunc_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003270,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_trunc_vec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003271,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_trunc_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003272,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_trunc_vec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003273,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_trunc_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003274,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_trunc_vec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003275,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_round_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003276,
        "KHR-GLES3.core.constant_express",
        "ions.basic_round_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003277,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_round_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003278,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_round_vec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003279,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_round_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003280,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_round_vec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003281,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_round_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003282,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_round_vec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003283,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_ceil_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003284,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_ceil_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003285,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_ceil_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003286,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_ceil_vec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003287,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_ceil_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003288,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_ceil_vec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003289,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_ceil_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003290,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_ceil_vec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003291,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_mod_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003292,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_mod_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003293,
        "KHR-GLES3.core.constant_expr",
        "essions.basic_mod_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003294,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_mod_vec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003295,
        "KHR-GLES3.core.constant_express",
        "ions.basic_mod_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003296,
        "KHR-GLES3.core.constant_expressi",
        "ons.basic_mod_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003297,
        "KHR-GLES3.core.constant_expr",
        "essions.basic_mod_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003298,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_mod_vec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003299,
        "KHR-GLES3.core.constant_express",
        "ions.basic_mod_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003300,
        "KHR-GLES3.core.constant_expressi",
        "ons.basic_mod_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003301,
        "KHR-GLES3.core.constant_expr",
        "essions.basic_mod_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003302,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_mod_vec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003303,
        "KHR-GLES3.core.constant_express",
        "ions.basic_mod_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003304,
        "KHR-GLES3.core.constant_expressi",
        "ons.basic_mod_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003305,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_min_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003306,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_min_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003307,
        "KHR-GLES3.core.constant_expr",
        "essions.basic_min_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003308,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_min_vec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003309,
        "KHR-GLES3.core.constant_express",
        "ions.basic_min_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003310,
        "KHR-GLES3.core.constant_expressi",
        "ons.basic_min_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003311,
        "KHR-GLES3.core.constant_expr",
        "essions.basic_min_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003312,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_min_vec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003313,
        "KHR-GLES3.core.constant_express",
        "ions.basic_min_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003314,
        "KHR-GLES3.core.constant_expressi",
        "ons.basic_min_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003315,
        "KHR-GLES3.core.constant_expr",
        "essions.basic_min_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003316,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_min_vec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003317,
        "KHR-GLES3.core.constant_express",
        "ions.basic_min_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003318,
        "KHR-GLES3.core.constant_expressi",
        "ons.basic_min_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003319,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_max_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003320,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_max_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003321,
        "KHR-GLES3.core.constant_expr",
        "essions.basic_max_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003322,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_max_vec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003323,
        "KHR-GLES3.core.constant_express",
        "ions.basic_max_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003324,
        "KHR-GLES3.core.constant_expressi",
        "ons.basic_max_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003325,
        "KHR-GLES3.core.constant_expr",
        "essions.basic_max_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003326,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_max_vec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003327,
        "KHR-GLES3.core.constant_express",
        "ions.basic_max_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003328,
        "KHR-GLES3.core.constant_expressi",
        "ons.basic_max_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003329,
        "KHR-GLES3.core.constant_expr",
        "essions.basic_max_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003330,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_max_vec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003331,
        "KHR-GLES3.core.constant_express",
        "ions.basic_max_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003332,
        "KHR-GLES3.core.constant_expressi",
        "ons.basic_max_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003333,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_clamp_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003334,
        "KHR-GLES3.core.constant_express",
        "ions.basic_clamp_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003335,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_clamp_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003336,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_clamp_vec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003337,
        "KHR-GLES3.core.constant_expressi",
        "ons.basic_clamp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003338,
        "KHR-GLES3.core.constant_expressio",
        "ns.basic_clamp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003339,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_clamp_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003340,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_clamp_vec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003341,
        "KHR-GLES3.core.constant_expressi",
        "ons.basic_clamp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003342,
        "KHR-GLES3.core.constant_expressio",
        "ns.basic_clamp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003343,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_clamp_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003344,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_clamp_vec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003345,
        "KHR-GLES3.core.constant_expressi",
        "ons.basic_clamp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003346,
        "KHR-GLES3.core.constant_expressio",
        "ns.basic_clamp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003347,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_length_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003348,
        "KHR-GLES3.core.constant_express",
        "ions.basic_length_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003349,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_length_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003350,
        "KHR-GLES3.core.constant_express",
        "ions.basic_length_vec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003351,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_length_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003352,
        "KHR-GLES3.core.constant_express",
        "ions.basic_length_vec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003353,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_length_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003354,
        "KHR-GLES3.core.constant_express",
        "ions.basic_length_vec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003355,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_dot_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003356,
        "KHR-GLES3.core.constant_expres",
        "sions.basic_dot_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003357,
        "KHR-GLES3.core.constant_expr",
        "essions.basic_dot_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003358,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_dot_vec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003359,
        "KHR-GLES3.core.constant_expr",
        "essions.basic_dot_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003360,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_dot_vec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003361,
        "KHR-GLES3.core.constant_expr",
        "essions.basic_dot_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003362,
        "KHR-GLES3.core.constant_expre",
        "ssions.basic_dot_vec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003363,
        "KHR-GLES3.core.constant_expressi",
        "ons.basic_normalize_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003364,
        "KHR-GLES3.core.constant_expressio",
        "ns.basic_normalize_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003365,
        "KHR-GLES3.core.constant_express",
        "ions.basic_normalize_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003366,
        "KHR-GLES3.core.constant_expressi",
        "ons.basic_normalize_vec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003367,
        "KHR-GLES3.core.constant_express",
        "ions.basic_normalize_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003368,
        "KHR-GLES3.core.constant_expressi",
        "ons.basic_normalize_vec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003369,
        "KHR-GLES3.core.constant_express",
        "ions.basic_normalize_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003370,
        "KHR-GLES3.core.constant_expressi",
        "ons.basic_normalize_vec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003371,
        "KHR-GLES3.core.constant_express",
        "ions.array_radians_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003372,
        "KHR-GLES3.core.constant_expressi",
        "ons.array_radians_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003373,
        "KHR-GLES3.core.constant_expres",
        "sions.array_radians_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003374,
        "KHR-GLES3.core.constant_express",
        "ions.array_radians_vec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003375,
        "KHR-GLES3.core.constant_expres",
        "sions.array_radians_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003376,
        "KHR-GLES3.core.constant_express",
        "ions.array_radians_vec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003377,
        "KHR-GLES3.core.constant_expres",
        "sions.array_radians_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003378,
        "KHR-GLES3.core.constant_express",
        "ions.array_radians_vec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003379,
        "KHR-GLES3.core.constant_express",
        "ions.array_degrees_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003380,
        "KHR-GLES3.core.constant_expressi",
        "ons.array_degrees_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003381,
        "KHR-GLES3.core.constant_expres",
        "sions.array_degrees_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003382,
        "KHR-GLES3.core.constant_express",
        "ions.array_degrees_vec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003383,
        "KHR-GLES3.core.constant_expres",
        "sions.array_degrees_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003384,
        "KHR-GLES3.core.constant_express",
        "ions.array_degrees_vec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003385,
        "KHR-GLES3.core.constant_expres",
        "sions.array_degrees_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003386,
        "KHR-GLES3.core.constant_express",
        "ions.array_degrees_vec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003387,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_sin_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003388,
        "KHR-GLES3.core.constant_expres",
        "sions.array_sin_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003389,
        "KHR-GLES3.core.constant_expr",
        "essions.array_sin_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003390,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_sin_vec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003391,
        "KHR-GLES3.core.constant_expr",
        "essions.array_sin_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003392,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_sin_vec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003393,
        "KHR-GLES3.core.constant_expr",
        "essions.array_sin_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003394,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_sin_vec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003395,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_cos_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003396,
        "KHR-GLES3.core.constant_expres",
        "sions.array_cos_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003397,
        "KHR-GLES3.core.constant_expr",
        "essions.array_cos_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003398,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_cos_vec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003399,
        "KHR-GLES3.core.constant_expr",
        "essions.array_cos_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003400,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_cos_vec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003401,
        "KHR-GLES3.core.constant_expr",
        "essions.array_cos_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003402,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_cos_vec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003403,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_asin_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003404,
        "KHR-GLES3.core.constant_expres",
        "sions.array_asin_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003405,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_asin_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003406,
        "KHR-GLES3.core.constant_expres",
        "sions.array_asin_vec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003407,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_asin_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003408,
        "KHR-GLES3.core.constant_expres",
        "sions.array_asin_vec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003409,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_asin_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003410,
        "KHR-GLES3.core.constant_expres",
        "sions.array_asin_vec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003411,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_acos_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003412,
        "KHR-GLES3.core.constant_expres",
        "sions.array_acos_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003413,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_acos_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003414,
        "KHR-GLES3.core.constant_expres",
        "sions.array_acos_vec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003415,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_acos_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003416,
        "KHR-GLES3.core.constant_expres",
        "sions.array_acos_vec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003417,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_acos_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003418,
        "KHR-GLES3.core.constant_expres",
        "sions.array_acos_vec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003419,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_pow_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003420,
        "KHR-GLES3.core.constant_expres",
        "sions.array_pow_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003421,
        "KHR-GLES3.core.constant_expr",
        "essions.array_pow_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003422,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_pow_vec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003423,
        "KHR-GLES3.core.constant_expr",
        "essions.array_pow_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003424,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_pow_vec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003425,
        "KHR-GLES3.core.constant_expr",
        "essions.array_pow_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003426,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_pow_vec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003427,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_exp_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003428,
        "KHR-GLES3.core.constant_expres",
        "sions.array_exp_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003429,
        "KHR-GLES3.core.constant_expr",
        "essions.array_exp_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003430,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_exp_vec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003431,
        "KHR-GLES3.core.constant_expr",
        "essions.array_exp_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003432,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_exp_vec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003433,
        "KHR-GLES3.core.constant_expr",
        "essions.array_exp_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003434,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_exp_vec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003435,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_log_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003436,
        "KHR-GLES3.core.constant_expres",
        "sions.array_log_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003437,
        "KHR-GLES3.core.constant_expr",
        "essions.array_log_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003438,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_log_vec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003439,
        "KHR-GLES3.core.constant_expr",
        "essions.array_log_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003440,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_log_vec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003441,
        "KHR-GLES3.core.constant_expr",
        "essions.array_log_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003442,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_log_vec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003443,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_exp2_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003444,
        "KHR-GLES3.core.constant_expres",
        "sions.array_exp2_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003445,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_exp2_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003446,
        "KHR-GLES3.core.constant_expres",
        "sions.array_exp2_vec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003447,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_exp2_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003448,
        "KHR-GLES3.core.constant_expres",
        "sions.array_exp2_vec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003449,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_exp2_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003450,
        "KHR-GLES3.core.constant_expres",
        "sions.array_exp2_vec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003451,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_log2_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003452,
        "KHR-GLES3.core.constant_expres",
        "sions.array_log2_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003453,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_log2_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003454,
        "KHR-GLES3.core.constant_expres",
        "sions.array_log2_vec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003455,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_log2_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003456,
        "KHR-GLES3.core.constant_expres",
        "sions.array_log2_vec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003457,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_log2_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003458,
        "KHR-GLES3.core.constant_expres",
        "sions.array_log2_vec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003459,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_sqrt_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003460,
        "KHR-GLES3.core.constant_expres",
        "sions.array_sqrt_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003461,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_sqrt_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003462,
        "KHR-GLES3.core.constant_expres",
        "sions.array_sqrt_vec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003463,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_sqrt_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003464,
        "KHR-GLES3.core.constant_expres",
        "sions.array_sqrt_vec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003465,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_sqrt_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003466,
        "KHR-GLES3.core.constant_expres",
        "sions.array_sqrt_vec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003467,
        "KHR-GLES3.core.constant_expressio",
        "ns.array_inversesqrt_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003468,
        "KHR-GLES3.core.constant_expression",
        "s.array_inversesqrt_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003469,
        "KHR-GLES3.core.constant_expressi",
        "ons.array_inversesqrt_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003470,
        "KHR-GLES3.core.constant_expressio",
        "ns.array_inversesqrt_vec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003471,
        "KHR-GLES3.core.constant_expressi",
        "ons.array_inversesqrt_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003472,
        "KHR-GLES3.core.constant_expressio",
        "ns.array_inversesqrt_vec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003473,
        "KHR-GLES3.core.constant_expressi",
        "ons.array_inversesqrt_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003474,
        "KHR-GLES3.core.constant_expressio",
        "ns.array_inversesqrt_vec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003475,
        "KHR-GLES3.core.constant_expr",
        "essions.array_abs_int_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003476,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_abs_int_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003477,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_abs_ivec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003478,
        "KHR-GLES3.core.constant_expres",
        "sions.array_abs_ivec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003479,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_abs_ivec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003480,
        "KHR-GLES3.core.constant_expres",
        "sions.array_abs_ivec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003481,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_abs_ivec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003482,
        "KHR-GLES3.core.constant_expres",
        "sions.array_abs_ivec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003483,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_sign_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003484,
        "KHR-GLES3.core.constant_expres",
        "sions.array_sign_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003485,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_sign_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003486,
        "KHR-GLES3.core.constant_expres",
        "sions.array_sign_vec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003487,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_sign_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003488,
        "KHR-GLES3.core.constant_expres",
        "sions.array_sign_vec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003489,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_sign_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003490,
        "KHR-GLES3.core.constant_expres",
        "sions.array_sign_vec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003491,
        "KHR-GLES3.core.constant_expres",
        "sions.array_floor_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003492,
        "KHR-GLES3.core.constant_express",
        "ions.array_floor_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003493,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_floor_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003494,
        "KHR-GLES3.core.constant_expres",
        "sions.array_floor_vec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003495,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_floor_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003496,
        "KHR-GLES3.core.constant_expres",
        "sions.array_floor_vec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003497,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_floor_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003498,
        "KHR-GLES3.core.constant_expres",
        "sions.array_floor_vec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003499,
        "KHR-GLES3.core.constant_expres",
        "sions.array_trunc_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003500,
        "KHR-GLES3.core.constant_express",
        "ions.array_trunc_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003501,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_trunc_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003502,
        "KHR-GLES3.core.constant_expres",
        "sions.array_trunc_vec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003503,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_trunc_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003504,
        "KHR-GLES3.core.constant_expres",
        "sions.array_trunc_vec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003505,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_trunc_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003506,
        "KHR-GLES3.core.constant_expres",
        "sions.array_trunc_vec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003507,
        "KHR-GLES3.core.constant_expres",
        "sions.array_round_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003508,
        "KHR-GLES3.core.constant_express",
        "ions.array_round_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003509,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_round_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003510,
        "KHR-GLES3.core.constant_expres",
        "sions.array_round_vec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003511,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_round_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003512,
        "KHR-GLES3.core.constant_expres",
        "sions.array_round_vec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003513,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_round_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003514,
        "KHR-GLES3.core.constant_expres",
        "sions.array_round_vec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003515,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_ceil_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003516,
        "KHR-GLES3.core.constant_expres",
        "sions.array_ceil_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003517,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_ceil_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003518,
        "KHR-GLES3.core.constant_expres",
        "sions.array_ceil_vec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003519,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_ceil_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003520,
        "KHR-GLES3.core.constant_expres",
        "sions.array_ceil_vec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003521,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_ceil_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003522,
        "KHR-GLES3.core.constant_expres",
        "sions.array_ceil_vec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003523,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_mod_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003524,
        "KHR-GLES3.core.constant_expres",
        "sions.array_mod_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003525,
        "KHR-GLES3.core.constant_expr",
        "essions.array_mod_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003526,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_mod_vec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003527,
        "KHR-GLES3.core.constant_express",
        "ions.array_mod_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003528,
        "KHR-GLES3.core.constant_expressi",
        "ons.array_mod_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003529,
        "KHR-GLES3.core.constant_expr",
        "essions.array_mod_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003530,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_mod_vec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003531,
        "KHR-GLES3.core.constant_express",
        "ions.array_mod_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003532,
        "KHR-GLES3.core.constant_expressi",
        "ons.array_mod_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003533,
        "KHR-GLES3.core.constant_expr",
        "essions.array_mod_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003534,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_mod_vec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003535,
        "KHR-GLES3.core.constant_express",
        "ions.array_mod_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003536,
        "KHR-GLES3.core.constant_expressi",
        "ons.array_mod_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003537,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_min_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003538,
        "KHR-GLES3.core.constant_expres",
        "sions.array_min_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003539,
        "KHR-GLES3.core.constant_expr",
        "essions.array_min_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003540,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_min_vec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003541,
        "KHR-GLES3.core.constant_express",
        "ions.array_min_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003542,
        "KHR-GLES3.core.constant_expressi",
        "ons.array_min_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003543,
        "KHR-GLES3.core.constant_expr",
        "essions.array_min_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003544,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_min_vec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003545,
        "KHR-GLES3.core.constant_express",
        "ions.array_min_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003546,
        "KHR-GLES3.core.constant_expressi",
        "ons.array_min_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003547,
        "KHR-GLES3.core.constant_expr",
        "essions.array_min_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003548,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_min_vec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003549,
        "KHR-GLES3.core.constant_express",
        "ions.array_min_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003550,
        "KHR-GLES3.core.constant_expressi",
        "ons.array_min_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003551,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_max_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003552,
        "KHR-GLES3.core.constant_expres",
        "sions.array_max_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003553,
        "KHR-GLES3.core.constant_expr",
        "essions.array_max_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003554,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_max_vec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003555,
        "KHR-GLES3.core.constant_express",
        "ions.array_max_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003556,
        "KHR-GLES3.core.constant_expressi",
        "ons.array_max_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003557,
        "KHR-GLES3.core.constant_expr",
        "essions.array_max_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003558,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_max_vec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003559,
        "KHR-GLES3.core.constant_express",
        "ions.array_max_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003560,
        "KHR-GLES3.core.constant_expressi",
        "ons.array_max_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003561,
        "KHR-GLES3.core.constant_expr",
        "essions.array_max_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003562,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_max_vec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003563,
        "KHR-GLES3.core.constant_express",
        "ions.array_max_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003564,
        "KHR-GLES3.core.constant_expressi",
        "ons.array_max_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003565,
        "KHR-GLES3.core.constant_expres",
        "sions.array_clamp_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003566,
        "KHR-GLES3.core.constant_express",
        "ions.array_clamp_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003567,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_clamp_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003568,
        "KHR-GLES3.core.constant_expres",
        "sions.array_clamp_vec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003569,
        "KHR-GLES3.core.constant_expressi",
        "ons.array_clamp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003570,
        "KHR-GLES3.core.constant_expressio",
        "ns.array_clamp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003571,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_clamp_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003572,
        "KHR-GLES3.core.constant_expres",
        "sions.array_clamp_vec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003573,
        "KHR-GLES3.core.constant_expressi",
        "ons.array_clamp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003574,
        "KHR-GLES3.core.constant_expressio",
        "ns.array_clamp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003575,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_clamp_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003576,
        "KHR-GLES3.core.constant_expres",
        "sions.array_clamp_vec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003577,
        "KHR-GLES3.core.constant_expressi",
        "ons.array_clamp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003578,
        "KHR-GLES3.core.constant_expressio",
        "ns.array_clamp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003579,
        "KHR-GLES3.core.constant_expres",
        "sions.array_length_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003580,
        "KHR-GLES3.core.constant_express",
        "ions.array_length_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003581,
        "KHR-GLES3.core.constant_expres",
        "sions.array_length_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003582,
        "KHR-GLES3.core.constant_express",
        "ions.array_length_vec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003583,
        "KHR-GLES3.core.constant_expres",
        "sions.array_length_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003584,
        "KHR-GLES3.core.constant_express",
        "ions.array_length_vec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003585,
        "KHR-GLES3.core.constant_expres",
        "sions.array_length_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003586,
        "KHR-GLES3.core.constant_express",
        "ions.array_length_vec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003587,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_dot_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003588,
        "KHR-GLES3.core.constant_expres",
        "sions.array_dot_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003589,
        "KHR-GLES3.core.constant_expr",
        "essions.array_dot_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003590,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_dot_vec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003591,
        "KHR-GLES3.core.constant_expr",
        "essions.array_dot_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003592,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_dot_vec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003593,
        "KHR-GLES3.core.constant_expr",
        "essions.array_dot_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003594,
        "KHR-GLES3.core.constant_expre",
        "ssions.array_dot_vec4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003595,
        "KHR-GLES3.core.constant_expressi",
        "ons.array_normalize_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003596,
        "KHR-GLES3.core.constant_expressio",
        "ns.array_normalize_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003597,
        "KHR-GLES3.core.constant_express",
        "ions.array_normalize_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003598,
        "KHR-GLES3.core.constant_expressi",
        "ons.array_normalize_vec2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003599,
        "KHR-GLES3.core.constant_express",
        "ions.array_normalize_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003600,
        "KHR-GLES3.core.constant_expressi",
        "ons.array_normalize_vec3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003601,
        "KHR-GLES3.core.constant_express",
        "ions.array_normalize_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003602,
        "KHR-GLES3.core.constant_expressi",
        "ons.array_normalize_vec4_fragment");
