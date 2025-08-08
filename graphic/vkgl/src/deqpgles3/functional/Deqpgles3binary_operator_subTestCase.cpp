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
#include "../ActsDeqpgles30009TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008204,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.sub.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008205,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.sub.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008206,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.sub.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008207,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.sub.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008208,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.sub.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008209,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.sub.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008210,
        "dEQP-GLES3.functional.shaders.operato",
        "r.binary_operator.sub.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008211,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.sub.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008212,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.sub.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008213,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.sub.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008214,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.sub.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008215,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.sub.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008216,
        "dEQP-GLES3.functional.shaders.operato",
        "r.binary_operator.sub.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008217,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.sub.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008218,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.sub.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008219,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.sub.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008220,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.sub.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008221,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.sub.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008222,
        "dEQP-GLES3.functional.shaders.operato",
        "r.binary_operator.sub.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008223,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.sub.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008224,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.sub.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008225,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.sub.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008226,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.sub.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008227,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.sub.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008228,
        "dEQP-GLES3.functional.shaders.operato",
        "r.binary_operator.sub.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008229,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.sub.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008230,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.sub.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008231,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.sub.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008232,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.sub.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008233,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.sub.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008234,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.sub.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008235,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.sub.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008236,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.sub.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008237,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.sub.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008238,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.sub.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008239,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.sub.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008240,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.sub.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008241,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.sub.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008242,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.sub.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008243,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.sub.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008244,
        "dEQP-GLES3.functional.shaders.operato",
        "r.binary_operator.sub.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008245,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.sub.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008246,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.sub.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008247,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.sub.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008248,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.sub.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008249,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.sub.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008250,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.sub.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008251,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.sub.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008252,
        "dEQP-GLES3.functional.shaders.operato",
        "r.binary_operator.sub.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008253,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.sub.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008254,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.sub.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008255,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.sub.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008256,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.sub.lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008257,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.sub.lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008258,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.sub.mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008259,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.sub.mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008260,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.sub.lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008261,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.sub.lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008262,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.sub.mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008263,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.sub.mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008264,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.sub.lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008265,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.sub.lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008266,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.sub.mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008267,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.sub.mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008268,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.sub.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008269,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.sub.highp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008270,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.sub.highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008271,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.sub.highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008272,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.sub.highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008273,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.sub.highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008274,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.sub.highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008275,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.sub.highp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008276,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.sub.lowp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008277,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.sub.lowp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008278,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.sub.mediump_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008279,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.sub.mediump_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008280,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.sub.highp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008281,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.sub.highp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008282,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.sub.lowp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008283,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.sub.lowp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008284,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.sub.mediump_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008285,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.sub.mediump_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008286,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.sub.highp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008287,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.sub.highp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008288,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.sub.lowp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008289,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.sub.lowp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008290,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.sub.mediump_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008291,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.sub.mediump_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008292,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.sub.highp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008293,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.sub.highp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008294,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.sub.lowp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008295,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.sub.lowp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008296,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.sub.mediump_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008297,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.sub.mediump_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008298,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.sub.lowp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008299,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.sub.lowp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008300,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.sub.mediump_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008301,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.sub.mediump_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008302,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.sub.lowp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008303,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.sub.lowp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008304,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.sub.mediump_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008305,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.sub.mediump_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008306,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.sub.highp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008307,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.sub.highp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008308,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.sub.highp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008309,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.sub.highp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008310,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.sub.highp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008311,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.sub.highp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008312,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.sub.lowp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008313,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.sub.lowp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008314,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.sub.mediump_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008315,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.sub.mediump_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008316,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.sub.lowp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008317,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.sub.lowp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008318,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.sub.mediump_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008319,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.sub.mediump_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008320,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.sub.lowp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008321,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.sub.lowp_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008322,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.sub.mediump_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008323,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.sub.mediump_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008324,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.sub.highp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008325,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.sub.highp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008326,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.sub.highp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008327,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.sub.highp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008328,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.sub.highp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008329,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.sub.highp_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008330,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.sub.lowp_float_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008331,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.sub.lowp_float_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008332,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.sub.mediump_float_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008333,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.sub.mediump_float_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008334,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.sub.highp_float_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008335,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.sub.highp_float_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008336,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.sub.lowp_float_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008337,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.sub.lowp_float_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008338,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.sub.mediump_float_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008339,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.sub.mediump_float_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008340,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.sub.highp_float_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008341,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.sub.highp_float_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008342,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.sub.lowp_float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008343,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.sub.lowp_float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008344,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.sub.mediump_float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008345,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.sub.mediump_float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008346,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.sub.highp_float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008347,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.sub.highp_float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008348,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.sub.lowp_int_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008349,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.sub.lowp_int_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008350,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.sub.mediump_int_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008351,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.sub.mediump_int_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008352,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.sub.lowp_int_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008353,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.sub.lowp_int_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008354,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.sub.mediump_int_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008355,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.sub.mediump_int_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008356,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.sub.lowp_int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008357,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.sub.lowp_int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008358,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.sub.mediump_int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008359,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.sub.mediump_int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008360,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.sub.highp_int_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008361,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.sub.highp_int_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008362,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.sub.highp_int_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008363,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.sub.highp_int_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008364,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.sub.highp_int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008365,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.sub.highp_int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008366,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.sub.lowp_uint_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008367,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.sub.lowp_uint_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008368,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.sub.mediump_uint_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008369,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.sub.mediump_uint_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008370,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.sub.lowp_uint_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008371,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.sub.lowp_uint_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008372,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.sub.mediump_uint_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008373,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.sub.mediump_uint_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008374,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.sub.lowp_uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008375,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.sub.lowp_uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008376,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.sub.mediump_uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008377,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.sub.mediump_uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008378,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.sub.highp_uint_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008379,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.sub.highp_uint_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008380,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.sub.highp_uint_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008381,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.sub.highp_uint_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008382,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.sub.highp_uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008383,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.sub.highp_uint_uvec4_fragment");
