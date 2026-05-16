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

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007592,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_increment_effect.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007593,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_effect.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007594,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_increment_effect.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007595,
        "dEQP-GLES3.functional.shaders.operator.unary_oper",
        "ator.post_increment_effect.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007596,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_effect.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007597,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_increment_effect.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007598,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_increment_effect.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007599,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_effect.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007600,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_effect.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007601,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_increment_effect.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007602,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_increment_effect.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007603,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_effect.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007604,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_increment_effect.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007605,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_effect.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007606,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_effect.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007607,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_increment_effect.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007608,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_increment_effect.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007609,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_effect.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007610,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_increment_effect.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007611,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_effect.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007612,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_effect.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007613,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_increment_effect.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007614,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_increment_effect.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007615,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_effect.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007616,
        "dEQP-GLES3.functional.shaders.operator.unary_",
        "operator.post_increment_effect.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007617,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_increment_effect.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007618,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_effect.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007619,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_increment_effect.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007620,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_increment_effect.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007621,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_effect.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007622,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_increment_effect.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007623,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_effect.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007624,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_increment_effect.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007625,
        "dEQP-GLES3.functional.shaders.operator.unary_oper",
        "ator.post_increment_effect.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007626,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_effect.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007627,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_increment_effect.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007628,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_increment_effect.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007629,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_effect.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007630,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_increment_effect.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007631,
        "dEQP-GLES3.functional.shaders.operator.unary_oper",
        "ator.post_increment_effect.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007632,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_effect.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007633,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_increment_effect.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007634,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_increment_effect.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007635,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_effect.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007636,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_increment_effect.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007637,
        "dEQP-GLES3.functional.shaders.operator.unary_oper",
        "ator.post_increment_effect.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007638,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_effect.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007639,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_increment_effect.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007640,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_increment_effect.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007641,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_effect.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007642,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_effect.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007643,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_increment_effect.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007644,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_increment_effect.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007645,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_effect.highp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007646,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_increment_effect.lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007647,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_effect.lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007648,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_increment_effect.mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007649,
        "dEQP-GLES3.functional.shaders.operator.unary_oper",
        "ator.post_increment_effect.mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007650,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_effect.highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007651,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_increment_effect.highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007652,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_increment_effect.lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007653,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_effect.lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007654,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_increment_effect.mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007655,
        "dEQP-GLES3.functional.shaders.operator.unary_oper",
        "ator.post_increment_effect.mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007656,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_effect.highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007657,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_increment_effect.highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007658,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_increment_effect.lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007659,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_effect.lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007660,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_increment_effect.mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007661,
        "dEQP-GLES3.functional.shaders.operator.unary_oper",
        "ator.post_increment_effect.mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007662,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_effect.highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007663,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_increment_effect.highp_uvec4_fragment");
