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

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004366,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.post_decrement_result.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004367,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_decrement_result.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004368,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.post_decrement_result.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004369,
        "dEQP-GLES2.functional.shaders.operator.unary_oper",
        "ator.post_decrement_result.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004370,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_decrement_result.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004371,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.post_decrement_result.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004372,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.post_decrement_result.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004373,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_decrement_result.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004374,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_decrement_result.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004375,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.post_decrement_result.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004376,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.post_decrement_result.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004377,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_decrement_result.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004378,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.post_decrement_result.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004379,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_decrement_result.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004380,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_decrement_result.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004381,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.post_decrement_result.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004382,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.post_decrement_result.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004383,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_decrement_result.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004384,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.post_decrement_result.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004385,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_decrement_result.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004386,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_decrement_result.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004387,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.post_decrement_result.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004388,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.post_decrement_result.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004389,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_decrement_result.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004390,
        "dEQP-GLES2.functional.shaders.operator.unary_",
        "operator.post_decrement_result.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004391,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.post_decrement_result.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004392,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_decrement_result.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004393,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.post_decrement_result.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004394,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.post_decrement_result.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004395,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_decrement_result.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004396,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.post_decrement_result.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004397,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_decrement_result.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004398,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.post_decrement_result.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004399,
        "dEQP-GLES2.functional.shaders.operator.unary_oper",
        "ator.post_decrement_result.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004400,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_decrement_result.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004401,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.post_decrement_result.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004402,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.post_decrement_result.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004403,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_decrement_result.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004404,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.post_decrement_result.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004405,
        "dEQP-GLES2.functional.shaders.operator.unary_oper",
        "ator.post_decrement_result.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004406,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_decrement_result.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004407,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.post_decrement_result.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004408,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.post_decrement_result.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004409,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_decrement_result.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004410,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.post_decrement_result.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004411,
        "dEQP-GLES2.functional.shaders.operator.unary_oper",
        "ator.post_decrement_result.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004412,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_decrement_result.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004413,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.post_decrement_result.highp_ivec4_fragment");
