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

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007880,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_increment_result.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007881,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_result.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007882,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_increment_result.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007883,
        "dEQP-GLES3.functional.shaders.operator.unary_oper",
        "ator.post_increment_result.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007884,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_result.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007885,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_increment_result.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007886,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_increment_result.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007887,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_result.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007888,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_result.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007889,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_increment_result.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007890,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_increment_result.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007891,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_result.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007892,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_increment_result.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007893,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_result.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007894,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_result.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007895,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_increment_result.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007896,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_increment_result.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007897,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_result.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007898,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_increment_result.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007899,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_result.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007900,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_result.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007901,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_increment_result.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007902,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_increment_result.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007903,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_result.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007904,
        "dEQP-GLES3.functional.shaders.operator.unary_",
        "operator.post_increment_result.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007905,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_increment_result.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007906,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_result.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007907,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_increment_result.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007908,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_increment_result.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007909,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_result.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007910,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_increment_result.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007911,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_result.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007912,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_increment_result.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007913,
        "dEQP-GLES3.functional.shaders.operator.unary_oper",
        "ator.post_increment_result.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007914,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_result.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007915,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_increment_result.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007916,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_increment_result.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007917,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_result.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007918,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_increment_result.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007919,
        "dEQP-GLES3.functional.shaders.operator.unary_oper",
        "ator.post_increment_result.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007920,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_result.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007921,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_increment_result.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007922,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_increment_result.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007923,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_result.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007924,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_increment_result.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007925,
        "dEQP-GLES3.functional.shaders.operator.unary_oper",
        "ator.post_increment_result.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007926,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_result.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007927,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_increment_result.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007928,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_increment_result.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007929,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_result.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007930,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_result.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007931,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_increment_result.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007932,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_increment_result.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007933,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_result.highp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007934,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_increment_result.lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007935,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_result.lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007936,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_increment_result.mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007937,
        "dEQP-GLES3.functional.shaders.operator.unary_oper",
        "ator.post_increment_result.mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007938,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_result.highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007939,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_increment_result.highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007940,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_increment_result.lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007941,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_result.lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007942,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_increment_result.mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007943,
        "dEQP-GLES3.functional.shaders.operator.unary_oper",
        "ator.post_increment_result.mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007944,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_result.highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007945,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_increment_result.highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007946,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_increment_result.lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007947,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_result.lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007948,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_increment_result.mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007949,
        "dEQP-GLES3.functional.shaders.operator.unary_oper",
        "ator.post_increment_result.mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007950,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_increment_result.highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007951,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_increment_result.highp_uvec4_fragment");
