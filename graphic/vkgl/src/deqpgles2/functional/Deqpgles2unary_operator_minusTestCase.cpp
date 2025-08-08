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
#include "../ActsDeqpgles20004TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003980,
        "dEQP-GLES2.functional.shaders.operator",
        ".unary_operator.minus.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003981,
        "dEQP-GLES2.functional.shaders.operator.",
        "unary_operator.minus.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003982,
        "dEQP-GLES2.functional.shaders.operator.u",
        "nary_operator.minus.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003983,
        "dEQP-GLES2.functional.shaders.operator.un",
        "ary_operator.minus.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003984,
        "dEQP-GLES2.functional.shaders.operator.",
        "unary_operator.minus.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003985,
        "dEQP-GLES2.functional.shaders.operator.u",
        "nary_operator.minus.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003986,
        "dEQP-GLES2.functional.shaders.operator",
        ".unary_operator.minus.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003987,
        "dEQP-GLES2.functional.shaders.operator.",
        "unary_operator.minus.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003988,
        "dEQP-GLES2.functional.shaders.operator.",
        "unary_operator.minus.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003989,
        "dEQP-GLES2.functional.shaders.operator.u",
        "nary_operator.minus.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003990,
        "dEQP-GLES2.functional.shaders.operator",
        ".unary_operator.minus.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003991,
        "dEQP-GLES2.functional.shaders.operator.",
        "unary_operator.minus.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003992,
        "dEQP-GLES2.functional.shaders.operator",
        ".unary_operator.minus.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003993,
        "dEQP-GLES2.functional.shaders.operator.",
        "unary_operator.minus.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003994,
        "dEQP-GLES2.functional.shaders.operator.",
        "unary_operator.minus.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003995,
        "dEQP-GLES2.functional.shaders.operator.u",
        "nary_operator.minus.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003996,
        "dEQP-GLES2.functional.shaders.operator",
        ".unary_operator.minus.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003997,
        "dEQP-GLES2.functional.shaders.operator.",
        "unary_operator.minus.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003998,
        "dEQP-GLES2.functional.shaders.operator",
        ".unary_operator.minus.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003999,
        "dEQP-GLES2.functional.shaders.operator.",
        "unary_operator.minus.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_004000,
        "dEQP-GLES2.functional.shaders.operator.",
        "unary_operator.minus.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_004001,
        "dEQP-GLES2.functional.shaders.operator.u",
        "nary_operator.minus.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_004002,
        "dEQP-GLES2.functional.shaders.operator",
        ".unary_operator.minus.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_004003,
        "dEQP-GLES2.functional.shaders.operator.",
        "unary_operator.minus.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_004004,
        "dEQP-GLES2.functional.shaders.operato",
        "r.unary_operator.minus.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_004005,
        "dEQP-GLES2.functional.shaders.operator",
        ".unary_operator.minus.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_004006,
        "dEQP-GLES2.functional.shaders.operator.",
        "unary_operator.minus.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_004007,
        "dEQP-GLES2.functional.shaders.operator.u",
        "nary_operator.minus.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_004008,
        "dEQP-GLES2.functional.shaders.operator",
        ".unary_operator.minus.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_004009,
        "dEQP-GLES2.functional.shaders.operator.",
        "unary_operator.minus.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_004010,
        "dEQP-GLES2.functional.shaders.operator",
        ".unary_operator.minus.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_004011,
        "dEQP-GLES2.functional.shaders.operator.",
        "unary_operator.minus.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_004012,
        "dEQP-GLES2.functional.shaders.operator.u",
        "nary_operator.minus.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_004013,
        "dEQP-GLES2.functional.shaders.operator.un",
        "ary_operator.minus.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_004014,
        "dEQP-GLES2.functional.shaders.operator.",
        "unary_operator.minus.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_004015,
        "dEQP-GLES2.functional.shaders.operator.u",
        "nary_operator.minus.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_004016,
        "dEQP-GLES2.functional.shaders.operator",
        ".unary_operator.minus.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_004017,
        "dEQP-GLES2.functional.shaders.operator.",
        "unary_operator.minus.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_004018,
        "dEQP-GLES2.functional.shaders.operator.u",
        "nary_operator.minus.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_004019,
        "dEQP-GLES2.functional.shaders.operator.un",
        "ary_operator.minus.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_004020,
        "dEQP-GLES2.functional.shaders.operator.",
        "unary_operator.minus.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_004021,
        "dEQP-GLES2.functional.shaders.operator.u",
        "nary_operator.minus.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_004022,
        "dEQP-GLES2.functional.shaders.operator",
        ".unary_operator.minus.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_004023,
        "dEQP-GLES2.functional.shaders.operator.",
        "unary_operator.minus.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_004024,
        "dEQP-GLES2.functional.shaders.operator.u",
        "nary_operator.minus.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_004025,
        "dEQP-GLES2.functional.shaders.operator.un",
        "ary_operator.minus.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_004026,
        "dEQP-GLES2.functional.shaders.operator.",
        "unary_operator.minus.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_004027,
        "dEQP-GLES2.functional.shaders.operator.u",
        "nary_operator.minus.highp_ivec4_fragment");
