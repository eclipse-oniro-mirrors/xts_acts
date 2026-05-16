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

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007736,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_increment_result.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007737,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_result.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007738,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_result.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007739,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.pre_increment_result.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007740,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_increment_result.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007741,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_result.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007742,
        "dEQP-GLES3.functional.shaders.operator.unary_",
        "operator.pre_increment_result.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007743,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_increment_result.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007744,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_result.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007745,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.pre_increment_result.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007746,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_increment_result.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007747,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_result.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007748,
        "dEQP-GLES3.functional.shaders.operator.unary_",
        "operator.pre_increment_result.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007749,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_increment_result.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007750,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_result.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007751,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.pre_increment_result.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007752,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_increment_result.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007753,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_result.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007754,
        "dEQP-GLES3.functional.shaders.operator.unary_",
        "operator.pre_increment_result.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007755,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_increment_result.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007756,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_result.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007757,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.pre_increment_result.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007758,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_increment_result.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007759,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_result.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007760,
        "dEQP-GLES3.functional.shaders.operator.unary_",
        "operator.pre_increment_result.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007761,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_increment_result.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007762,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_increment_result.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007763,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_result.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007764,
        "dEQP-GLES3.functional.shaders.operator.unary_",
        "operator.pre_increment_result.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007765,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_increment_result.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007766,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_increment_result.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007767,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_result.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007768,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_result.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007769,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.pre_increment_result.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007770,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_increment_result.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007771,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_result.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007772,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_increment_result.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007773,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_result.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007774,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_result.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007775,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.pre_increment_result.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007776,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_increment_result.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007777,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_result.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007778,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_increment_result.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007779,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_result.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007780,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_result.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007781,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.pre_increment_result.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007782,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_increment_result.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007783,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_result.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007784,
        "dEQP-GLES3.functional.shaders.operator.unary_",
        "operator.pre_increment_result.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007785,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_increment_result.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007786,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_result.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007787,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.pre_increment_result.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007788,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_increment_result.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007789,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_result.highp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007790,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_increment_result.lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007791,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_result.lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007792,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_result.mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007793,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.pre_increment_result.mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007794,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_increment_result.highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007795,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_result.highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007796,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_increment_result.lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007797,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_result.lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007798,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_result.mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007799,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.pre_increment_result.mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007800,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_increment_result.highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007801,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_result.highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007802,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_increment_result.lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007803,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_result.lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007804,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_result.mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007805,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.pre_increment_result.mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007806,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_increment_result.highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007807,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_result.highp_uvec4_fragment");
