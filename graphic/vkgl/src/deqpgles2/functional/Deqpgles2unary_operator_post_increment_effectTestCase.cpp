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

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004126,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.post_increment_effect.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004127,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_increment_effect.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004128,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.post_increment_effect.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004129,
        "dEQP-GLES2.functional.shaders.operator.unary_oper",
        "ator.post_increment_effect.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004130,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_increment_effect.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004131,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.post_increment_effect.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004132,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.post_increment_effect.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004133,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_increment_effect.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004134,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_increment_effect.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004135,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.post_increment_effect.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004136,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.post_increment_effect.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004137,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_increment_effect.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004138,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.post_increment_effect.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004139,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_increment_effect.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004140,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_increment_effect.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004141,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.post_increment_effect.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004142,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.post_increment_effect.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004143,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_increment_effect.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004144,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.post_increment_effect.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004145,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_increment_effect.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004146,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_increment_effect.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004147,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.post_increment_effect.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004148,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.post_increment_effect.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004149,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_increment_effect.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004150,
        "dEQP-GLES2.functional.shaders.operator.unary_",
        "operator.post_increment_effect.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004151,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.post_increment_effect.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004152,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_increment_effect.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004153,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.post_increment_effect.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004154,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.post_increment_effect.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004155,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_increment_effect.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004156,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.post_increment_effect.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004157,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_increment_effect.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004158,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.post_increment_effect.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004159,
        "dEQP-GLES2.functional.shaders.operator.unary_oper",
        "ator.post_increment_effect.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004160,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_increment_effect.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004161,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.post_increment_effect.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004162,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.post_increment_effect.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004163,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_increment_effect.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004164,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.post_increment_effect.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004165,
        "dEQP-GLES2.functional.shaders.operator.unary_oper",
        "ator.post_increment_effect.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004166,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_increment_effect.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004167,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.post_increment_effect.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004168,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.post_increment_effect.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004169,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_increment_effect.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004170,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.post_increment_effect.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004171,
        "dEQP-GLES2.functional.shaders.operator.unary_oper",
        "ator.post_increment_effect.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004172,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.post_increment_effect.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004173,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.post_increment_effect.highp_ivec4_fragment");
