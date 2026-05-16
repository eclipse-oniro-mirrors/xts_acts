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

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005670,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.not_equal.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005671,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.not_equal.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005672,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.not_equal.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005673,
        "dEQP-GLES2.functional.shaders.operator.bina",
        "ry_operator.not_equal.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005674,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.not_equal.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005675,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.not_equal.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005676,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.not_equal.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005677,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.not_equal.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005678,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.not_equal.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005679,
        "dEQP-GLES2.functional.shaders.operator.bina",
        "ry_operator.not_equal.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005680,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.not_equal.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005681,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.not_equal.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005682,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.not_equal.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005683,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.not_equal.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005684,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.not_equal.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005685,
        "dEQP-GLES2.functional.shaders.operator.bina",
        "ry_operator.not_equal.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005686,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.not_equal.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005687,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.not_equal.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005688,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.not_equal.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005689,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.not_equal.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005690,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.not_equal.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005691,
        "dEQP-GLES2.functional.shaders.operator.bina",
        "ry_operator.not_equal.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005692,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.not_equal.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005693,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.not_equal.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005694,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.not_equal.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005695,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.not_equal.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005696,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.not_equal.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005697,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.not_equal.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005698,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.not_equal.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005699,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.not_equal.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005700,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.not_equal.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005701,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.not_equal.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005702,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.not_equal.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005703,
        "dEQP-GLES2.functional.shaders.operator.bina",
        "ry_operator.not_equal.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005704,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.not_equal.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005705,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.not_equal.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005706,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.not_equal.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005707,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.not_equal.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005708,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.not_equal.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005709,
        "dEQP-GLES2.functional.shaders.operator.bina",
        "ry_operator.not_equal.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005710,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.not_equal.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005711,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.not_equal.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005712,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.not_equal.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005713,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.not_equal.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005714,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.not_equal.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005715,
        "dEQP-GLES2.functional.shaders.operator.bina",
        "ry_operator.not_equal.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005716,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.not_equal.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005717,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.not_equal.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005718,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.not_equal.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005719,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.not_equal.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005720,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.not_equal.bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005721,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.not_equal.bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005722,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.not_equal.bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005723,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.not_equal.bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005724,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.not_equal.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005725,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.not_equal.bvec4_fragment");
