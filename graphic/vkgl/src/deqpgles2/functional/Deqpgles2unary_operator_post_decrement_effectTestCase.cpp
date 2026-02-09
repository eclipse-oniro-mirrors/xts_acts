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

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004174,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.post_decrement_effect.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004175,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_decrement_effect.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004176,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.post_decrement_effect.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004177,
        "dEQP-GLES2.functional.shaders.operator.unary_oper",
        "ator.post_decrement_effect.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004178,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_decrement_effect.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004179,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.post_decrement_effect.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004180,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.post_decrement_effect.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004181,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_decrement_effect.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004182,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_decrement_effect.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004183,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.post_decrement_effect.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004184,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.post_decrement_effect.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004185,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_decrement_effect.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004186,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.post_decrement_effect.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004187,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_decrement_effect.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004188,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_decrement_effect.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004189,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.post_decrement_effect.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004190,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.post_decrement_effect.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004191,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_decrement_effect.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004192,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.post_decrement_effect.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004193,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_decrement_effect.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004194,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_decrement_effect.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004195,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.post_decrement_effect.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004196,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.post_decrement_effect.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004197,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_decrement_effect.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004198,
        "dEQP-GLES2.functional.shaders.operator.unary_",
        "operator.post_decrement_effect.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004199,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.post_decrement_effect.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004200,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_decrement_effect.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004201,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.post_decrement_effect.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004202,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.post_decrement_effect.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004203,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_decrement_effect.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004204,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.post_decrement_effect.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004205,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_decrement_effect.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004206,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.post_decrement_effect.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004207,
        "dEQP-GLES2.functional.shaders.operator.unary_oper",
        "ator.post_decrement_effect.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004208,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_decrement_effect.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004209,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.post_decrement_effect.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004210,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.post_decrement_effect.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004211,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_decrement_effect.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004212,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.post_decrement_effect.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004213,
        "dEQP-GLES2.functional.shaders.operator.unary_oper",
        "ator.post_decrement_effect.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004214,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_decrement_effect.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004215,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.post_decrement_effect.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004216,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.post_decrement_effect.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004217,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_decrement_effect.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004218,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.post_decrement_effect.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004219,
        "dEQP-GLES2.functional.shaders.operator.unary_oper",
        "ator.post_decrement_effect.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004220,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_decrement_effect.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004221,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.post_decrement_effect.highp_ivec4_fragment");
