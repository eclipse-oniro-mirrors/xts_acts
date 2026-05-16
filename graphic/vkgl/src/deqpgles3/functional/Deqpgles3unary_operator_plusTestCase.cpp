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
#include "../ActsDeqpgles30008TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007286,
        "dEQP-GLES3.functional.shaders.operator",
        ".unary_operator.plus.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007287,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.plus.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007288,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.plus.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007289,
        "dEQP-GLES3.functional.shaders.operator.u",
        "nary_operator.plus.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007290,
        "dEQP-GLES3.functional.shaders.operator",
        ".unary_operator.plus.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007291,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.plus.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007292,
        "dEQP-GLES3.functional.shaders.operato",
        "r.unary_operator.plus.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007293,
        "dEQP-GLES3.functional.shaders.operator",
        ".unary_operator.plus.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007294,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.plus.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007295,
        "dEQP-GLES3.functional.shaders.operator.u",
        "nary_operator.plus.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007296,
        "dEQP-GLES3.functional.shaders.operator",
        ".unary_operator.plus.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007297,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.plus.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007298,
        "dEQP-GLES3.functional.shaders.operato",
        "r.unary_operator.plus.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007299,
        "dEQP-GLES3.functional.shaders.operator",
        ".unary_operator.plus.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007300,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.plus.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007301,
        "dEQP-GLES3.functional.shaders.operator.u",
        "nary_operator.plus.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007302,
        "dEQP-GLES3.functional.shaders.operator",
        ".unary_operator.plus.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007303,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.plus.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007304,
        "dEQP-GLES3.functional.shaders.operato",
        "r.unary_operator.plus.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007305,
        "dEQP-GLES3.functional.shaders.operator",
        ".unary_operator.plus.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007306,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.plus.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007307,
        "dEQP-GLES3.functional.shaders.operator.u",
        "nary_operator.plus.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007308,
        "dEQP-GLES3.functional.shaders.operator",
        ".unary_operator.plus.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007309,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.plus.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007310,
        "dEQP-GLES3.functional.shaders.operato",
        "r.unary_operator.plus.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007311,
        "dEQP-GLES3.functional.shaders.operator",
        ".unary_operator.plus.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007312,
        "dEQP-GLES3.functional.shaders.operator",
        ".unary_operator.plus.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007313,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.plus.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007314,
        "dEQP-GLES3.functional.shaders.operato",
        "r.unary_operator.plus.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007315,
        "dEQP-GLES3.functional.shaders.operator",
        ".unary_operator.plus.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007316,
        "dEQP-GLES3.functional.shaders.operator",
        ".unary_operator.plus.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007317,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.plus.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007318,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.plus.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007319,
        "dEQP-GLES3.functional.shaders.operator.u",
        "nary_operator.plus.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007320,
        "dEQP-GLES3.functional.shaders.operator",
        ".unary_operator.plus.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007321,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.plus.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007322,
        "dEQP-GLES3.functional.shaders.operator",
        ".unary_operator.plus.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007323,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.plus.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007324,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.plus.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007325,
        "dEQP-GLES3.functional.shaders.operator.u",
        "nary_operator.plus.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007326,
        "dEQP-GLES3.functional.shaders.operator",
        ".unary_operator.plus.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007327,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.plus.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007328,
        "dEQP-GLES3.functional.shaders.operator",
        ".unary_operator.plus.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007329,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.plus.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007330,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.plus.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007331,
        "dEQP-GLES3.functional.shaders.operator.u",
        "nary_operator.plus.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007332,
        "dEQP-GLES3.functional.shaders.operator",
        ".unary_operator.plus.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007333,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.plus.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007334,
        "dEQP-GLES3.functional.shaders.operato",
        "r.unary_operator.plus.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007335,
        "dEQP-GLES3.functional.shaders.operator",
        ".unary_operator.plus.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007336,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.plus.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007337,
        "dEQP-GLES3.functional.shaders.operator.u",
        "nary_operator.plus.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007338,
        "dEQP-GLES3.functional.shaders.operator",
        ".unary_operator.plus.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007339,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.plus.highp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007340,
        "dEQP-GLES3.functional.shaders.operator",
        ".unary_operator.plus.lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007341,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.plus.lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007342,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.plus.mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007343,
        "dEQP-GLES3.functional.shaders.operator.u",
        "nary_operator.plus.mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007344,
        "dEQP-GLES3.functional.shaders.operator",
        ".unary_operator.plus.highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007345,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.plus.highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007346,
        "dEQP-GLES3.functional.shaders.operator",
        ".unary_operator.plus.lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007347,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.plus.lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007348,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.plus.mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007349,
        "dEQP-GLES3.functional.shaders.operator.u",
        "nary_operator.plus.mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007350,
        "dEQP-GLES3.functional.shaders.operator",
        ".unary_operator.plus.highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007351,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.plus.highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007352,
        "dEQP-GLES3.functional.shaders.operator",
        ".unary_operator.plus.lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007353,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.plus.lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007354,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.plus.mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007355,
        "dEQP-GLES3.functional.shaders.operator.u",
        "nary_operator.plus.mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007356,
        "dEQP-GLES3.functional.shaders.operator",
        ".unary_operator.plus.highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007357,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.plus.highp_uvec4_fragment");
