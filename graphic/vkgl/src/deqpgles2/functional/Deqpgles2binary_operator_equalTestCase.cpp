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
#include "../ActsDeqpgles20006TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005614,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.equal.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005615,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.equal.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005616,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.equal.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005617,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.equal.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005618,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.equal.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005619,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.equal.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005620,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.equal.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005621,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.equal.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005622,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.equal.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005623,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.equal.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005624,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.equal.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005625,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.equal.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005626,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.equal.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005627,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.equal.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005628,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.equal.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005629,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.equal.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005630,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.equal.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005631,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.equal.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005632,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.equal.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005633,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.equal.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005634,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.equal.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005635,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.equal.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005636,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.equal.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005637,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.equal.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005638,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.equal.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005639,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.equal.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005640,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.equal.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005641,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.equal.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005642,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.equal.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005643,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.equal.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005644,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.equal.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005645,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.equal.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005646,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.equal.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005647,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.equal.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005648,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.equal.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005649,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.equal.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005650,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.equal.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005651,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.equal.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005652,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.equal.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005653,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.equal.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005654,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.equal.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005655,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.equal.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005656,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.equal.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005657,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.equal.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005658,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.equal.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005659,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.equal.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005660,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.equal.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005661,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.equal.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005662,
        "dEQP-GLES2.functional.shaders.operat",
        "or.binary_operator.equal.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005663,
        "dEQP-GLES2.functional.shaders.operato",
        "r.binary_operator.equal.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005664,
        "dEQP-GLES2.functional.shaders.operat",
        "or.binary_operator.equal.bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005665,
        "dEQP-GLES2.functional.shaders.operato",
        "r.binary_operator.equal.bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005666,
        "dEQP-GLES2.functional.shaders.operat",
        "or.binary_operator.equal.bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005667,
        "dEQP-GLES2.functional.shaders.operato",
        "r.binary_operator.equal.bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005668,
        "dEQP-GLES2.functional.shaders.operat",
        "or.binary_operator.equal.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005669,
        "dEQP-GLES2.functional.shaders.operato",
        "r.binary_operator.equal.bvec4_fragment");
