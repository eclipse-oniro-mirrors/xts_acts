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

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007520,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_decrement_effect.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007521,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_effect.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007522,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_effect.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007523,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.pre_decrement_effect.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007524,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_decrement_effect.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007525,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_effect.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007526,
        "dEQP-GLES3.functional.shaders.operator.unary_",
        "operator.pre_decrement_effect.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007527,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_decrement_effect.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007528,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_effect.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007529,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.pre_decrement_effect.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007530,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_decrement_effect.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007531,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_effect.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007532,
        "dEQP-GLES3.functional.shaders.operator.unary_",
        "operator.pre_decrement_effect.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007533,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_decrement_effect.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007534,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_effect.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007535,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.pre_decrement_effect.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007536,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_decrement_effect.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007537,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_effect.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007538,
        "dEQP-GLES3.functional.shaders.operator.unary_",
        "operator.pre_decrement_effect.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007539,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_decrement_effect.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007540,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_effect.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007541,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.pre_decrement_effect.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007542,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_decrement_effect.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007543,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_effect.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007544,
        "dEQP-GLES3.functional.shaders.operator.unary_",
        "operator.pre_decrement_effect.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007545,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_decrement_effect.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007546,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_decrement_effect.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007547,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_effect.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007548,
        "dEQP-GLES3.functional.shaders.operator.unary_",
        "operator.pre_decrement_effect.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007549,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_decrement_effect.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007550,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_decrement_effect.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007551,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_effect.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007552,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_effect.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007553,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.pre_decrement_effect.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007554,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_decrement_effect.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007555,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_effect.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007556,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_decrement_effect.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007557,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_effect.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007558,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_effect.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007559,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.pre_decrement_effect.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007560,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_decrement_effect.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007561,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_effect.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007562,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_decrement_effect.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007563,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_effect.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007564,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_effect.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007565,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.pre_decrement_effect.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007566,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_decrement_effect.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007567,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_effect.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007568,
        "dEQP-GLES3.functional.shaders.operator.unary_",
        "operator.pre_decrement_effect.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007569,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_decrement_effect.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007570,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_effect.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007571,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.pre_decrement_effect.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007572,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_decrement_effect.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007573,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_effect.highp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007574,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_decrement_effect.lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007575,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_effect.lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007576,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_effect.mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007577,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.pre_decrement_effect.mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007578,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_decrement_effect.highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007579,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_effect.highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007580,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_decrement_effect.lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007581,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_effect.lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007582,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_effect.mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007583,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.pre_decrement_effect.mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007584,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_decrement_effect.highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007585,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_effect.highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007586,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_decrement_effect.lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007587,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_effect.lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007588,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_effect.mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007589,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.pre_decrement_effect.mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007590,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_decrement_effect.highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007591,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_effect.highp_uvec4_fragment");
