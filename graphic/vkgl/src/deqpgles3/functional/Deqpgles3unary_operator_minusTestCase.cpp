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

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007358,
        "dEQP-GLES3.functional.shaders.operator",
        ".unary_operator.minus.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007359,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.minus.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007360,
        "dEQP-GLES3.functional.shaders.operator.u",
        "nary_operator.minus.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007361,
        "dEQP-GLES3.functional.shaders.operator.un",
        "ary_operator.minus.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007362,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.minus.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007363,
        "dEQP-GLES3.functional.shaders.operator.u",
        "nary_operator.minus.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007364,
        "dEQP-GLES3.functional.shaders.operator",
        ".unary_operator.minus.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007365,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.minus.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007366,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.minus.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007367,
        "dEQP-GLES3.functional.shaders.operator.u",
        "nary_operator.minus.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007368,
        "dEQP-GLES3.functional.shaders.operator",
        ".unary_operator.minus.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007369,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.minus.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007370,
        "dEQP-GLES3.functional.shaders.operator",
        ".unary_operator.minus.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007371,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.minus.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007372,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.minus.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007373,
        "dEQP-GLES3.functional.shaders.operator.u",
        "nary_operator.minus.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007374,
        "dEQP-GLES3.functional.shaders.operator",
        ".unary_operator.minus.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007375,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.minus.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007376,
        "dEQP-GLES3.functional.shaders.operator",
        ".unary_operator.minus.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007377,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.minus.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007378,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.minus.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007379,
        "dEQP-GLES3.functional.shaders.operator.u",
        "nary_operator.minus.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007380,
        "dEQP-GLES3.functional.shaders.operator",
        ".unary_operator.minus.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007381,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.minus.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007382,
        "dEQP-GLES3.functional.shaders.operato",
        "r.unary_operator.minus.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007383,
        "dEQP-GLES3.functional.shaders.operator",
        ".unary_operator.minus.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007384,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.minus.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007385,
        "dEQP-GLES3.functional.shaders.operator.u",
        "nary_operator.minus.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007386,
        "dEQP-GLES3.functional.shaders.operator",
        ".unary_operator.minus.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007387,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.minus.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007388,
        "dEQP-GLES3.functional.shaders.operator",
        ".unary_operator.minus.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007389,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.minus.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007390,
        "dEQP-GLES3.functional.shaders.operator.u",
        "nary_operator.minus.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007391,
        "dEQP-GLES3.functional.shaders.operator.un",
        "ary_operator.minus.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007392,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.minus.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007393,
        "dEQP-GLES3.functional.shaders.operator.u",
        "nary_operator.minus.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007394,
        "dEQP-GLES3.functional.shaders.operator",
        ".unary_operator.minus.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007395,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.minus.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007396,
        "dEQP-GLES3.functional.shaders.operator.u",
        "nary_operator.minus.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007397,
        "dEQP-GLES3.functional.shaders.operator.un",
        "ary_operator.minus.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007398,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.minus.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007399,
        "dEQP-GLES3.functional.shaders.operator.u",
        "nary_operator.minus.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007400,
        "dEQP-GLES3.functional.shaders.operator",
        ".unary_operator.minus.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007401,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.minus.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007402,
        "dEQP-GLES3.functional.shaders.operator.u",
        "nary_operator.minus.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007403,
        "dEQP-GLES3.functional.shaders.operator.un",
        "ary_operator.minus.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007404,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.minus.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007405,
        "dEQP-GLES3.functional.shaders.operator.u",
        "nary_operator.minus.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007406,
        "dEQP-GLES3.functional.shaders.operator",
        ".unary_operator.minus.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007407,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.minus.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007408,
        "dEQP-GLES3.functional.shaders.operator",
        ".unary_operator.minus.lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007409,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.minus.lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007410,
        "dEQP-GLES3.functional.shaders.operator",
        ".unary_operator.minus.lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007411,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.minus.lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007412,
        "dEQP-GLES3.functional.shaders.operator",
        ".unary_operator.minus.lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007413,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.minus.lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007414,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.minus.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007415,
        "dEQP-GLES3.functional.shaders.operator.u",
        "nary_operator.minus.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007416,
        "dEQP-GLES3.functional.shaders.operator.u",
        "nary_operator.minus.mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007417,
        "dEQP-GLES3.functional.shaders.operator.un",
        "ary_operator.minus.mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007418,
        "dEQP-GLES3.functional.shaders.operator.u",
        "nary_operator.minus.mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007419,
        "dEQP-GLES3.functional.shaders.operator.un",
        "ary_operator.minus.mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007420,
        "dEQP-GLES3.functional.shaders.operator.u",
        "nary_operator.minus.mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007421,
        "dEQP-GLES3.functional.shaders.operator.un",
        "ary_operator.minus.mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007422,
        "dEQP-GLES3.functional.shaders.operator",
        ".unary_operator.minus.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007423,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.minus.highp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007424,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.minus.highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007425,
        "dEQP-GLES3.functional.shaders.operator.u",
        "nary_operator.minus.highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007426,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.minus.highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007427,
        "dEQP-GLES3.functional.shaders.operator.u",
        "nary_operator.minus.highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007428,
        "dEQP-GLES3.functional.shaders.operator.",
        "unary_operator.minus.highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007429,
        "dEQP-GLES3.functional.shaders.operator.u",
        "nary_operator.minus.highp_uvec4_fragment");
