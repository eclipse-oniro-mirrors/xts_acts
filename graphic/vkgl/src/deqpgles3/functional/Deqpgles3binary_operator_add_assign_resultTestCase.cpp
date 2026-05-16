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
#include "../ActsDeqpgles30011TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010736,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.add_assign_result.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010737,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_result.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010738,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_result.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010739,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.add_assign_result.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010740,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.add_assign_result.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010741,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_result.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010742,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.add_assign_result.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010743,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.add_assign_result.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010744,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_result.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010745,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.add_assign_result.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010746,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.add_assign_result.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010747,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_result.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010748,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.add_assign_result.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010749,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.add_assign_result.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010750,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_result.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010751,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.add_assign_result.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010752,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.add_assign_result.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010753,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_result.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010754,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.add_assign_result.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010755,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.add_assign_result.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010756,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_result.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010757,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.add_assign_result.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010758,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.add_assign_result.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010759,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_result.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010760,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.add_assign_result.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010761,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.add_assign_result.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010762,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.add_assign_result.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010763,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_result.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010764,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.add_assign_result.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010765,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_result.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010766,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_result.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010767,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.add_assign_result.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010768,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.add_assign_result.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010769,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_result.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010770,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_result.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010771,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.add_assign_result.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010772,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.add_assign_result.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010773,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_result.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010774,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_result.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010775,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.add_assign_result.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010776,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.add_assign_result.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010777,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.add_assign_result.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010778,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.add_assign_result.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010779,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_result.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010780,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.add_assign_result.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010781,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_result.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010782,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.add_assign_result.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010783,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_result.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010784,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.add_assign_result.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010785,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.add_assign_result.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010786,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_result.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010787,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.add_assign_result.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010788,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.add_assign_result.lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010789,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_result.lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010790,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_result.mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010791,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.add_assign_result.mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010792,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.add_assign_result.lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010793,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_result.lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010794,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_result.mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010795,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.add_assign_result.mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010796,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.add_assign_result.lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010797,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_result.lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010798,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_result.mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010799,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.add_assign_result.mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010800,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.add_assign_result.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010801,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_result.highp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010802,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.add_assign_result.highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010803,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_result.highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010804,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.add_assign_result.highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010805,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_result.highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010806,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.add_assign_result.highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010807,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.add_assign_result.highp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010808,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.add_assign_result.lowp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010809,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.add_assign_result.lowp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010810,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.add_assign_result.mediump_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010811,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.add_assign_result.mediump_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010812,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.add_assign_result.highp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010813,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.add_assign_result.highp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010814,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.add_assign_result.lowp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010815,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.add_assign_result.lowp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010816,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.add_assign_result.mediump_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010817,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.add_assign_result.mediump_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010818,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.add_assign_result.highp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010819,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.add_assign_result.highp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010820,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.add_assign_result.lowp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010821,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.add_assign_result.lowp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010822,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.add_assign_result.mediump_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010823,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.add_assign_result.mediump_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010824,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.add_assign_result.highp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010825,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.add_assign_result.highp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010826,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.add_assign_result.lowp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010827,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.add_assign_result.lowp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010828,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.add_assign_result.mediump_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010829,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.add_assign_result.mediump_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010830,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.add_assign_result.lowp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010831,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.add_assign_result.lowp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010832,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.add_assign_result.mediump_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010833,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.add_assign_result.mediump_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010834,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.add_assign_result.lowp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010835,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.add_assign_result.lowp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010836,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.add_assign_result.mediump_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010837,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.add_assign_result.mediump_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010838,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.add_assign_result.highp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010839,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.add_assign_result.highp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010840,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.add_assign_result.highp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010841,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.add_assign_result.highp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010842,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.add_assign_result.highp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010843,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.add_assign_result.highp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010844,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.add_assign_result.lowp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010845,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.add_assign_result.lowp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010846,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.add_assign_result.mediump_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010847,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.add_assign_result.mediump_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010848,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.add_assign_result.lowp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010849,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.add_assign_result.lowp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010850,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.add_assign_result.mediump_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010851,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.add_assign_result.mediump_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010852,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.add_assign_result.lowp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010853,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.add_assign_result.lowp_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010854,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.add_assign_result.mediump_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010855,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.add_assign_result.mediump_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010856,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.add_assign_result.highp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010857,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.add_assign_result.highp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010858,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.add_assign_result.highp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010859,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.add_assign_result.highp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010860,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.add_assign_result.highp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010861,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.add_assign_result.highp_uvec4_uint_fragment");
