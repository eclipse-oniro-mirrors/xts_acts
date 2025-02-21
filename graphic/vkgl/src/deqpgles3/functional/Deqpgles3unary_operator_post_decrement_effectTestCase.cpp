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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30008TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007664,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_decrement_effect.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007665,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_effect.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007666,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_decrement_effect.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007667,
        "dEQP-GLES3.functional.shaders.operator.unary_oper",
        "ator.post_decrement_effect.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007668,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_effect.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007669,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_decrement_effect.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007670,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_decrement_effect.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007671,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_effect.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007672,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_effect.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007673,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_decrement_effect.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007674,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_decrement_effect.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007675,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_effect.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007676,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_decrement_effect.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007677,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_effect.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007678,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_effect.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007679,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_decrement_effect.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007680,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_decrement_effect.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007681,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_effect.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007682,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_decrement_effect.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007683,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_effect.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007684,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_effect.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007685,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_decrement_effect.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007686,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_decrement_effect.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007687,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_effect.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007688,
        "dEQP-GLES3.functional.shaders.operator.unary_",
        "operator.post_decrement_effect.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007689,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_decrement_effect.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007690,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_effect.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007691,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_decrement_effect.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007692,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_decrement_effect.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007693,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_effect.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007694,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_decrement_effect.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007695,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_effect.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007696,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_decrement_effect.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007697,
        "dEQP-GLES3.functional.shaders.operator.unary_oper",
        "ator.post_decrement_effect.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007698,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_effect.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007699,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_decrement_effect.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007700,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_decrement_effect.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007701,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_effect.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007702,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_decrement_effect.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007703,
        "dEQP-GLES3.functional.shaders.operator.unary_oper",
        "ator.post_decrement_effect.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007704,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_effect.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007705,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_decrement_effect.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007706,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_decrement_effect.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007707,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_effect.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007708,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_decrement_effect.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007709,
        "dEQP-GLES3.functional.shaders.operator.unary_oper",
        "ator.post_decrement_effect.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007710,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_effect.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007711,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_decrement_effect.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007712,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_decrement_effect.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007713,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_effect.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007714,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_effect.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007715,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_decrement_effect.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007716,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_decrement_effect.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007717,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_effect.highp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007718,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_decrement_effect.lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007719,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_effect.lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007720,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_decrement_effect.mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007721,
        "dEQP-GLES3.functional.shaders.operator.unary_oper",
        "ator.post_decrement_effect.mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007722,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_effect.highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007723,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_decrement_effect.highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007724,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_decrement_effect.lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007725,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_effect.lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007726,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_decrement_effect.mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007727,
        "dEQP-GLES3.functional.shaders.operator.unary_oper",
        "ator.post_decrement_effect.mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007728,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_effect.highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007729,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_decrement_effect.highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007730,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_decrement_effect.lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007731,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_effect.lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007732,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_decrement_effect.mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007733,
        "dEQP-GLES3.functional.shaders.operator.unary_oper",
        "ator.post_decrement_effect.mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007734,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_effect.highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007735,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_decrement_effect.highp_uvec4_fragment");
