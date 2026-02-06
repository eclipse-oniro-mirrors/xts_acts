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

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004270,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_decrement_result.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004271,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_decrement_result.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004272,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_decrement_result.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004273,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.pre_decrement_result.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004274,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_decrement_result.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004275,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_decrement_result.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004276,
        "dEQP-GLES2.functional.shaders.operator.unary_",
        "operator.pre_decrement_result.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004277,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_decrement_result.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004278,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_decrement_result.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004279,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.pre_decrement_result.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004280,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_decrement_result.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004281,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_decrement_result.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004282,
        "dEQP-GLES2.functional.shaders.operator.unary_",
        "operator.pre_decrement_result.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004283,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_decrement_result.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004284,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_decrement_result.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004285,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.pre_decrement_result.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004286,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_decrement_result.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004287,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_decrement_result.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004288,
        "dEQP-GLES2.functional.shaders.operator.unary_",
        "operator.pre_decrement_result.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004289,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_decrement_result.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004290,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_decrement_result.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004291,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.pre_decrement_result.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004292,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_decrement_result.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004293,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_decrement_result.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004294,
        "dEQP-GLES2.functional.shaders.operator.unary_",
        "operator.pre_decrement_result.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004295,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_decrement_result.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004296,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_decrement_result.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004297,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_decrement_result.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004298,
        "dEQP-GLES2.functional.shaders.operator.unary_",
        "operator.pre_decrement_result.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004299,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_decrement_result.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004300,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_decrement_result.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004301,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_decrement_result.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004302,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_decrement_result.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004303,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.pre_decrement_result.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004304,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_decrement_result.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004305,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_decrement_result.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004306,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_decrement_result.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004307,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_decrement_result.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004308,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_decrement_result.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004309,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.pre_decrement_result.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004310,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_decrement_result.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004311,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_decrement_result.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004312,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_decrement_result.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004313,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_decrement_result.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004314,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_decrement_result.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004315,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.pre_decrement_result.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004316,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_decrement_result.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004317,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_decrement_result.highp_ivec4_fragment");
