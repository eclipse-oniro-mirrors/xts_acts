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
#include "../ActsDeqpgles30010TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009812,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mul_assign_effect.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009813,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_effect.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009814,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_effect.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009815,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mul_assign_effect.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009816,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mul_assign_effect.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009817,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_effect.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009818,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.mul_assign_effect.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009819,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mul_assign_effect.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009820,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_effect.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009821,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mul_assign_effect.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009822,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mul_assign_effect.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009823,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_effect.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009824,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.mul_assign_effect.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009825,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mul_assign_effect.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009826,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_effect.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009827,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mul_assign_effect.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009828,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mul_assign_effect.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009829,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_effect.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009830,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.mul_assign_effect.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009831,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mul_assign_effect.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009832,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_effect.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009833,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mul_assign_effect.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009834,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mul_assign_effect.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009835,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_effect.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009836,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.mul_assign_effect.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009837,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mul_assign_effect.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009838,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mul_assign_effect.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009839,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_effect.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009840,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mul_assign_effect.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009841,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_effect.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009842,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_effect.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009843,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mul_assign_effect.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009844,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mul_assign_effect.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009845,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_effect.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009846,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_effect.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009847,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mul_assign_effect.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009848,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mul_assign_effect.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009849,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_effect.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009850,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_effect.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009851,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mul_assign_effect.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009852,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.mul_assign_effect.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009853,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mul_assign_effect.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009854,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mul_assign_effect.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009855,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_effect.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009856,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mul_assign_effect.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009857,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_effect.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009858,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mul_assign_effect.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009859,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_effect.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009860,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.mul_assign_effect.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009861,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mul_assign_effect.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009862,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_effect.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009863,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mul_assign_effect.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009864,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mul_assign_effect.lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009865,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_effect.lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009866,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_effect.mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009867,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mul_assign_effect.mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009868,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mul_assign_effect.lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009869,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_effect.lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009870,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_effect.mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009871,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mul_assign_effect.mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009872,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mul_assign_effect.lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009873,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_effect.lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009874,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_effect.mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009875,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mul_assign_effect.mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009876,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mul_assign_effect.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009877,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_effect.highp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009878,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mul_assign_effect.highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009879,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_effect.highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009880,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mul_assign_effect.highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009881,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_effect.highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009882,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.mul_assign_effect.highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009883,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.mul_assign_effect.highp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009884,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mul_assign_effect.lowp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009885,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mul_assign_effect.lowp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009886,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.mul_assign_effect.mediump_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009887,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.mul_assign_effect.mediump_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009888,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mul_assign_effect.highp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009889,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.mul_assign_effect.highp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009890,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mul_assign_effect.lowp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009891,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mul_assign_effect.lowp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009892,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.mul_assign_effect.mediump_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009893,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.mul_assign_effect.mediump_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009894,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mul_assign_effect.highp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009895,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.mul_assign_effect.highp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009896,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mul_assign_effect.lowp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009897,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mul_assign_effect.lowp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009898,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.mul_assign_effect.mediump_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009899,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.mul_assign_effect.mediump_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009900,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mul_assign_effect.highp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009901,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.mul_assign_effect.highp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009902,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mul_assign_effect.lowp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009903,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mul_assign_effect.lowp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009904,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mul_assign_effect.mediump_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009905,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.mul_assign_effect.mediump_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009906,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mul_assign_effect.lowp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009907,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mul_assign_effect.lowp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009908,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mul_assign_effect.mediump_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009909,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.mul_assign_effect.mediump_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009910,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mul_assign_effect.lowp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009911,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mul_assign_effect.lowp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009912,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mul_assign_effect.mediump_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009913,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.mul_assign_effect.mediump_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009914,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mul_assign_effect.highp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009915,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mul_assign_effect.highp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009916,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mul_assign_effect.highp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009917,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mul_assign_effect.highp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009918,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mul_assign_effect.highp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009919,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mul_assign_effect.highp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009920,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mul_assign_effect.lowp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009921,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mul_assign_effect.lowp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009922,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.mul_assign_effect.mediump_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009923,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.mul_assign_effect.mediump_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009924,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mul_assign_effect.lowp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009925,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mul_assign_effect.lowp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009926,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.mul_assign_effect.mediump_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009927,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.mul_assign_effect.mediump_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009928,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.mul_assign_effect.lowp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009929,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mul_assign_effect.lowp_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009930,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.mul_assign_effect.mediump_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009931,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.mul_assign_effect.mediump_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009932,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mul_assign_effect.highp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009933,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.mul_assign_effect.highp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009934,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mul_assign_effect.highp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009935,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.mul_assign_effect.highp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009936,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.mul_assign_effect.highp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009937,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.mul_assign_effect.highp_uvec4_uint_fragment");
