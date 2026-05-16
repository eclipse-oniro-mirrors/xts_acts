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

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007952,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_decrement_result.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007953,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_result.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007954,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_decrement_result.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007955,
        "dEQP-GLES3.functional.shaders.operator.unary_oper",
        "ator.post_decrement_result.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007956,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_result.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007957,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_decrement_result.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007958,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_decrement_result.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007959,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_result.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007960,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_result.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007961,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_decrement_result.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007962,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_decrement_result.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007963,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_result.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007964,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_decrement_result.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007965,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_result.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007966,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_result.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007967,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_decrement_result.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007968,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_decrement_result.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007969,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_result.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007970,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_decrement_result.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007971,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_result.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007972,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_result.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007973,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_decrement_result.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007974,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_decrement_result.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007975,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_result.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007976,
        "dEQP-GLES3.functional.shaders.operator.unary_",
        "operator.post_decrement_result.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007977,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_decrement_result.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007978,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_result.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007979,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_decrement_result.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007980,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_decrement_result.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007981,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_result.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007982,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_decrement_result.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007983,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_result.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007984,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_decrement_result.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007985,
        "dEQP-GLES3.functional.shaders.operator.unary_oper",
        "ator.post_decrement_result.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007986,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_result.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007987,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_decrement_result.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007988,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_decrement_result.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007989,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_result.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007990,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_decrement_result.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007991,
        "dEQP-GLES3.functional.shaders.operator.unary_oper",
        "ator.post_decrement_result.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007992,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_result.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007993,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_decrement_result.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007994,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_decrement_result.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007995,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_result.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007996,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_decrement_result.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007997,
        "dEQP-GLES3.functional.shaders.operator.unary_oper",
        "ator.post_decrement_result.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007998,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_result.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007999,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_decrement_result.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008000,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_decrement_result.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008001,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_result.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008002,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_result.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008003,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_decrement_result.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008004,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_decrement_result.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008005,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_result.highp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008006,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_decrement_result.lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008007,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_result.lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008008,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_decrement_result.mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008009,
        "dEQP-GLES3.functional.shaders.operator.unary_oper",
        "ator.post_decrement_result.mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008010,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_result.highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008011,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_decrement_result.highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008012,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_decrement_result.lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008013,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_result.lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008014,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_decrement_result.mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008015,
        "dEQP-GLES3.functional.shaders.operator.unary_oper",
        "ator.post_decrement_result.mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008016,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_result.highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008017,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_decrement_result.highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008018,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.post_decrement_result.lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008019,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_result.lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008020,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_decrement_result.mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008021,
        "dEQP-GLES3.functional.shaders.operator.unary_oper",
        "ator.post_decrement_result.mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008022,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.post_decrement_result.highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008023,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.post_decrement_result.highp_uvec4_fragment");
