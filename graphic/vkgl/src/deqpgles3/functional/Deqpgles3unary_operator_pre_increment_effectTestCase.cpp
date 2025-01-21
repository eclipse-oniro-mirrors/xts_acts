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

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007448,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_increment_effect.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007449,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_effect.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007450,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_effect.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007451,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.pre_increment_effect.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007452,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_increment_effect.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007453,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_effect.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007454,
        "dEQP-GLES3.functional.shaders.operator.unary_",
        "operator.pre_increment_effect.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007455,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_increment_effect.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007456,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_effect.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007457,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.pre_increment_effect.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007458,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_increment_effect.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007459,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_effect.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007460,
        "dEQP-GLES3.functional.shaders.operator.unary_",
        "operator.pre_increment_effect.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007461,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_increment_effect.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007462,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_effect.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007463,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.pre_increment_effect.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007464,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_increment_effect.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007465,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_effect.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007466,
        "dEQP-GLES3.functional.shaders.operator.unary_",
        "operator.pre_increment_effect.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007467,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_increment_effect.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007468,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_effect.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007469,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.pre_increment_effect.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007470,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_increment_effect.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007471,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_effect.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007472,
        "dEQP-GLES3.functional.shaders.operator.unary_",
        "operator.pre_increment_effect.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007473,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_increment_effect.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007474,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_increment_effect.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007475,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_effect.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007476,
        "dEQP-GLES3.functional.shaders.operator.unary_",
        "operator.pre_increment_effect.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007477,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_increment_effect.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007478,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_increment_effect.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007479,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_effect.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007480,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_effect.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007481,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.pre_increment_effect.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007482,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_increment_effect.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007483,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_effect.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007484,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_increment_effect.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007485,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_effect.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007486,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_effect.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007487,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.pre_increment_effect.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007488,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_increment_effect.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007489,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_effect.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007490,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_increment_effect.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007491,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_effect.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007492,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_effect.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007493,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.pre_increment_effect.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007494,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_increment_effect.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007495,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_effect.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007496,
        "dEQP-GLES3.functional.shaders.operator.unary_",
        "operator.pre_increment_effect.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007497,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_increment_effect.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007498,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_effect.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007499,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.pre_increment_effect.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007500,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_increment_effect.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007501,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_effect.highp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007502,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_increment_effect.lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007503,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_effect.lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007504,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_effect.mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007505,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.pre_increment_effect.mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007506,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_increment_effect.highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007507,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_effect.highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007508,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_increment_effect.lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007509,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_effect.lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007510,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_effect.mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007511,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.pre_increment_effect.mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007512,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_increment_effect.highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007513,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_effect.highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007514,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_increment_effect.lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007515,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_effect.lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007516,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_effect.mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007517,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.pre_increment_effect.mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007518,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_increment_effect.highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007519,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_increment_effect.highp_uvec4_fragment");
