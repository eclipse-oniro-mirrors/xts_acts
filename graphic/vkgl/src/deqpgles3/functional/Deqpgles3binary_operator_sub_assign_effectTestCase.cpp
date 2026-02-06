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

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009686,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.sub_assign_effect.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009687,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_effect.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009688,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_effect.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009689,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.sub_assign_effect.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009690,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.sub_assign_effect.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009691,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_effect.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009692,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.sub_assign_effect.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009693,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.sub_assign_effect.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009694,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_effect.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009695,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.sub_assign_effect.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009696,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.sub_assign_effect.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009697,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_effect.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009698,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.sub_assign_effect.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009699,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.sub_assign_effect.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009700,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_effect.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009701,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.sub_assign_effect.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009702,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.sub_assign_effect.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009703,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_effect.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009704,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.sub_assign_effect.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009705,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.sub_assign_effect.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009706,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_effect.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009707,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.sub_assign_effect.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009708,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.sub_assign_effect.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009709,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_effect.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009710,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.sub_assign_effect.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009711,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.sub_assign_effect.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009712,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.sub_assign_effect.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009713,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_effect.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009714,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.sub_assign_effect.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009715,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_effect.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009716,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_effect.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009717,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.sub_assign_effect.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009718,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.sub_assign_effect.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009719,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_effect.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009720,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_effect.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009721,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.sub_assign_effect.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009722,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.sub_assign_effect.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009723,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_effect.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009724,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_effect.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009725,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.sub_assign_effect.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009726,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.sub_assign_effect.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009727,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.sub_assign_effect.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009728,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.sub_assign_effect.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009729,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_effect.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009730,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.sub_assign_effect.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009731,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_effect.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009732,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.sub_assign_effect.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009733,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_effect.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009734,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.sub_assign_effect.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009735,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.sub_assign_effect.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009736,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_effect.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009737,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.sub_assign_effect.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009738,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.sub_assign_effect.lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009739,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_effect.lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009740,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_effect.mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009741,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.sub_assign_effect.mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009742,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.sub_assign_effect.lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009743,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_effect.lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009744,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_effect.mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009745,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.sub_assign_effect.mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009746,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.sub_assign_effect.lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009747,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_effect.lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009748,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_effect.mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009749,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.sub_assign_effect.mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009750,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.sub_assign_effect.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009751,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_effect.highp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009752,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.sub_assign_effect.highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009753,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_effect.highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009754,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.sub_assign_effect.highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009755,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_effect.highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009756,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.sub_assign_effect.highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009757,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.sub_assign_effect.highp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009758,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.sub_assign_effect.lowp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009759,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.sub_assign_effect.lowp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009760,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.sub_assign_effect.mediump_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009761,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.sub_assign_effect.mediump_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009762,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.sub_assign_effect.highp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009763,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.sub_assign_effect.highp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009764,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.sub_assign_effect.lowp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009765,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.sub_assign_effect.lowp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009766,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.sub_assign_effect.mediump_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009767,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.sub_assign_effect.mediump_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009768,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.sub_assign_effect.highp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009769,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.sub_assign_effect.highp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009770,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.sub_assign_effect.lowp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009771,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.sub_assign_effect.lowp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009772,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.sub_assign_effect.mediump_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009773,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.sub_assign_effect.mediump_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009774,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.sub_assign_effect.highp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009775,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.sub_assign_effect.highp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009776,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.sub_assign_effect.lowp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009777,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.sub_assign_effect.lowp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009778,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.sub_assign_effect.mediump_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009779,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.sub_assign_effect.mediump_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009780,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.sub_assign_effect.lowp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009781,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.sub_assign_effect.lowp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009782,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.sub_assign_effect.mediump_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009783,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.sub_assign_effect.mediump_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009784,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.sub_assign_effect.lowp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009785,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.sub_assign_effect.lowp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009786,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.sub_assign_effect.mediump_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009787,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.sub_assign_effect.mediump_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009788,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.sub_assign_effect.highp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009789,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.sub_assign_effect.highp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009790,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.sub_assign_effect.highp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009791,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.sub_assign_effect.highp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009792,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.sub_assign_effect.highp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009793,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.sub_assign_effect.highp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009794,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.sub_assign_effect.lowp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009795,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.sub_assign_effect.lowp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009796,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.sub_assign_effect.mediump_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009797,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.sub_assign_effect.mediump_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009798,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.sub_assign_effect.lowp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009799,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.sub_assign_effect.lowp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009800,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.sub_assign_effect.mediump_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009801,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.sub_assign_effect.mediump_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009802,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.sub_assign_effect.lowp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009803,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.sub_assign_effect.lowp_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009804,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.sub_assign_effect.mediump_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009805,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.sub_assign_effect.mediump_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009806,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.sub_assign_effect.highp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009807,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.sub_assign_effect.highp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009808,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.sub_assign_effect.highp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009809,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.sub_assign_effect.highp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009810,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.sub_assign_effect.highp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009811,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.sub_assign_effect.highp_uvec4_uint_fragment");
