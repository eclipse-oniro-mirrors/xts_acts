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
#include "../ActsDeqpgles20005TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004222,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_increment_result.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004223,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_increment_result.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004224,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_increment_result.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004225,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.pre_increment_result.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004226,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_increment_result.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004227,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_increment_result.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004228,
        "dEQP-GLES2.functional.shaders.operator.unary_",
        "operator.pre_increment_result.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004229,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_increment_result.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004230,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_increment_result.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004231,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.pre_increment_result.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004232,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_increment_result.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004233,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_increment_result.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004234,
        "dEQP-GLES2.functional.shaders.operator.unary_",
        "operator.pre_increment_result.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004235,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_increment_result.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004236,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_increment_result.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004237,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.pre_increment_result.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004238,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_increment_result.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004239,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_increment_result.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004240,
        "dEQP-GLES2.functional.shaders.operator.unary_",
        "operator.pre_increment_result.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004241,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_increment_result.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004242,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_increment_result.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004243,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.pre_increment_result.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004244,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_increment_result.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004245,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_increment_result.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004246,
        "dEQP-GLES2.functional.shaders.operator.unary_",
        "operator.pre_increment_result.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004247,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_increment_result.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004248,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_increment_result.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004249,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_increment_result.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004250,
        "dEQP-GLES2.functional.shaders.operator.unary_",
        "operator.pre_increment_result.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004251,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_increment_result.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004252,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_increment_result.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004253,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_increment_result.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004254,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_increment_result.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004255,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.pre_increment_result.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004256,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_increment_result.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004257,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_increment_result.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004258,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_increment_result.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004259,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_increment_result.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004260,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_increment_result.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004261,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.pre_increment_result.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004262,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_increment_result.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004263,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_increment_result.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004264,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_increment_result.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004265,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_increment_result.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004266,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_increment_result.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004267,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.pre_increment_result.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004268,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_increment_result.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004269,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_increment_result.highp_ivec4_fragment");
