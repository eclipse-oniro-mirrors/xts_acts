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

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004318,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.post_increment_result.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004319,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_increment_result.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004320,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.post_increment_result.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004321,
        "dEQP-GLES2.functional.shaders.operator.unary_oper",
        "ator.post_increment_result.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004322,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_increment_result.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004323,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.post_increment_result.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004324,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.post_increment_result.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004325,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_increment_result.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004326,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_increment_result.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004327,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.post_increment_result.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004328,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.post_increment_result.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004329,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_increment_result.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004330,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.post_increment_result.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004331,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_increment_result.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004332,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_increment_result.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004333,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.post_increment_result.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004334,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.post_increment_result.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004335,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_increment_result.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004336,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.post_increment_result.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004337,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_increment_result.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004338,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_increment_result.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004339,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.post_increment_result.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004340,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.post_increment_result.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004341,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_increment_result.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004342,
        "dEQP-GLES2.functional.shaders.operator.unary_",
        "operator.post_increment_result.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004343,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.post_increment_result.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004344,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_increment_result.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004345,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.post_increment_result.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004346,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.post_increment_result.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004347,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_increment_result.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004348,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.post_increment_result.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004349,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_increment_result.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004350,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.post_increment_result.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004351,
        "dEQP-GLES2.functional.shaders.operator.unary_oper",
        "ator.post_increment_result.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004352,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_increment_result.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004353,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.post_increment_result.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004354,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.post_increment_result.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004355,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_increment_result.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004356,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.post_increment_result.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004357,
        "dEQP-GLES2.functional.shaders.operator.unary_oper",
        "ator.post_increment_result.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004358,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_increment_result.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004359,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.post_increment_result.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004360,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.post_increment_result.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004361,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_increment_result.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004362,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.post_increment_result.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004363,
        "dEQP-GLES2.functional.shaders.operator.unary_oper",
        "ator.post_increment_result.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004364,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_increment_result.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004365,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.post_increment_result.highp_ivec4_fragment");
