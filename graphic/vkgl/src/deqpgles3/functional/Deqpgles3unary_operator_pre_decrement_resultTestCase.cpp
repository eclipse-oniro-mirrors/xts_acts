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

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007808,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_decrement_result.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007809,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_result.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007810,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_result.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007811,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.pre_decrement_result.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007812,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_decrement_result.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007813,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_result.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007814,
        "dEQP-GLES3.functional.shaders.operator.unary_",
        "operator.pre_decrement_result.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007815,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_decrement_result.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007816,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_result.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007817,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.pre_decrement_result.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007818,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_decrement_result.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007819,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_result.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007820,
        "dEQP-GLES3.functional.shaders.operator.unary_",
        "operator.pre_decrement_result.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007821,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_decrement_result.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007822,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_result.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007823,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.pre_decrement_result.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007824,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_decrement_result.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007825,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_result.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007826,
        "dEQP-GLES3.functional.shaders.operator.unary_",
        "operator.pre_decrement_result.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007827,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_decrement_result.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007828,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_result.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007829,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.pre_decrement_result.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007830,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_decrement_result.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007831,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_result.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007832,
        "dEQP-GLES3.functional.shaders.operator.unary_",
        "operator.pre_decrement_result.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007833,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_decrement_result.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007834,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_decrement_result.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007835,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_result.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007836,
        "dEQP-GLES3.functional.shaders.operator.unary_",
        "operator.pre_decrement_result.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007837,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_decrement_result.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007838,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_decrement_result.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007839,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_result.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007840,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_result.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007841,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.pre_decrement_result.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007842,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_decrement_result.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007843,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_result.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007844,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_decrement_result.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007845,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_result.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007846,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_result.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007847,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.pre_decrement_result.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007848,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_decrement_result.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007849,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_result.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007850,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_decrement_result.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007851,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_result.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007852,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_result.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007853,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.pre_decrement_result.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007854,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_decrement_result.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007855,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_result.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007856,
        "dEQP-GLES3.functional.shaders.operator.unary_",
        "operator.pre_decrement_result.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007857,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_decrement_result.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007858,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_result.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007859,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.pre_decrement_result.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007860,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_decrement_result.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007861,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_result.highp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007862,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_decrement_result.lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007863,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_result.lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007864,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_result.mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007865,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.pre_decrement_result.mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007866,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_decrement_result.highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007867,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_result.highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007868,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_decrement_result.lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007869,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_result.lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007870,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_result.mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007871,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.pre_decrement_result.mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007872,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_decrement_result.highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007873,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_result.highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007874,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_decrement_result.lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007875,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_result.lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007876,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_result.mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007877,
        "dEQP-GLES3.functional.shaders.operator.unary_ope",
        "rator.pre_decrement_result.mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007878,
        "dEQP-GLES3.functional.shaders.operator.unary_o",
        "perator.pre_decrement_result.highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007879,
        "dEQP-GLES3.functional.shaders.operator.unary_op",
        "erator.pre_decrement_result.highp_uvec4_fragment");
