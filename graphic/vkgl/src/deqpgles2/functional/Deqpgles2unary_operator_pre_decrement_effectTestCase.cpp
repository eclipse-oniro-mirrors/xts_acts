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

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004078,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_decrement_effect.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004079,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_decrement_effect.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004080,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_decrement_effect.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004081,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.pre_decrement_effect.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004082,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_decrement_effect.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004083,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_decrement_effect.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004084,
        "dEQP-GLES2.functional.shaders.operator.unary_",
        "operator.pre_decrement_effect.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004085,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_decrement_effect.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004086,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_decrement_effect.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004087,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.pre_decrement_effect.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004088,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_decrement_effect.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004089,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_decrement_effect.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004090,
        "dEQP-GLES2.functional.shaders.operator.unary_",
        "operator.pre_decrement_effect.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004091,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_decrement_effect.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004092,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_decrement_effect.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004093,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.pre_decrement_effect.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004094,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_decrement_effect.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004095,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_decrement_effect.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004096,
        "dEQP-GLES2.functional.shaders.operator.unary_",
        "operator.pre_decrement_effect.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004097,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_decrement_effect.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004098,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_decrement_effect.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004099,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.pre_decrement_effect.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004100,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_decrement_effect.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004101,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_decrement_effect.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004102,
        "dEQP-GLES2.functional.shaders.operator.unary_",
        "operator.pre_decrement_effect.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004103,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_decrement_effect.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004104,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_decrement_effect.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004105,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_decrement_effect.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004106,
        "dEQP-GLES2.functional.shaders.operator.unary_",
        "operator.pre_decrement_effect.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004107,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_decrement_effect.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004108,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_decrement_effect.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004109,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_decrement_effect.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004110,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_decrement_effect.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004111,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.pre_decrement_effect.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004112,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_decrement_effect.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004113,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_decrement_effect.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004114,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_decrement_effect.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004115,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_decrement_effect.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004116,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_decrement_effect.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004117,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.pre_decrement_effect.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004118,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_decrement_effect.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004119,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_decrement_effect.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004120,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_decrement_effect.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004121,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_decrement_effect.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004122,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_decrement_effect.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004123,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.pre_decrement_effect.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004124,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_decrement_effect.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004125,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_decrement_effect.highp_ivec4_fragment");
