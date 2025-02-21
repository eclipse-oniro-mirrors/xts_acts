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
#include "../ActsDeqpgles30012TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011114,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.div_assign_result.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011115,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_result.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011116,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_result.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011117,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.div_assign_result.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011118,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.div_assign_result.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011119,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_result.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011120,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.div_assign_result.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011121,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.div_assign_result.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011122,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_result.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011123,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.div_assign_result.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011124,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.div_assign_result.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011125,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_result.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011126,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.div_assign_result.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011127,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.div_assign_result.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011128,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_result.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011129,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.div_assign_result.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011130,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.div_assign_result.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011131,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_result.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011132,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.div_assign_result.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011133,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.div_assign_result.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011134,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_result.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011135,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.div_assign_result.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011136,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.div_assign_result.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011137,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_result.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011138,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.div_assign_result.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011139,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.div_assign_result.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011140,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.div_assign_result.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011141,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_result.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011142,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.div_assign_result.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011143,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_result.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011144,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_result.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011145,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.div_assign_result.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011146,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.div_assign_result.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011147,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_result.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011148,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_result.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011149,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.div_assign_result.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011150,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.div_assign_result.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011151,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_result.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011152,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_result.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011153,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.div_assign_result.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011154,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.div_assign_result.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011155,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.div_assign_result.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011156,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.div_assign_result.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011157,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_result.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011158,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.div_assign_result.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011159,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_result.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011160,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.div_assign_result.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011161,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_result.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011162,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.div_assign_result.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011163,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.div_assign_result.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011164,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_result.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011165,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.div_assign_result.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011166,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.div_assign_result.lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011167,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_result.lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011168,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_result.mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011169,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.div_assign_result.mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011170,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.div_assign_result.lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011171,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_result.lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011172,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_result.mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011173,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.div_assign_result.mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011174,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.div_assign_result.lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011175,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_result.lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011176,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_result.mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011177,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.div_assign_result.mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011178,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.div_assign_result.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011179,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_result.highp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011180,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.div_assign_result.highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011181,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_result.highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011182,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.div_assign_result.highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011183,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_result.highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011184,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.div_assign_result.highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011185,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.div_assign_result.highp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011186,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.div_assign_result.lowp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011187,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.div_assign_result.lowp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011188,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.div_assign_result.mediump_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011189,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.div_assign_result.mediump_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011190,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.div_assign_result.highp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011191,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.div_assign_result.highp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011192,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.div_assign_result.lowp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011193,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.div_assign_result.lowp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011194,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.div_assign_result.mediump_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011195,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.div_assign_result.mediump_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011196,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.div_assign_result.highp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011197,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.div_assign_result.highp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011198,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.div_assign_result.lowp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011199,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.div_assign_result.lowp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011200,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.div_assign_result.mediump_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011201,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.div_assign_result.mediump_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011202,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.div_assign_result.highp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011203,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.div_assign_result.highp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011204,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.div_assign_result.lowp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011205,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.div_assign_result.lowp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011206,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.div_assign_result.mediump_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011207,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.div_assign_result.mediump_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011208,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.div_assign_result.lowp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011209,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.div_assign_result.lowp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011210,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.div_assign_result.mediump_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011211,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.div_assign_result.mediump_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011212,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.div_assign_result.lowp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011213,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.div_assign_result.lowp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011214,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.div_assign_result.mediump_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011215,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.div_assign_result.mediump_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011216,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.div_assign_result.highp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011217,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.div_assign_result.highp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011218,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.div_assign_result.highp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011219,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.div_assign_result.highp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011220,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.div_assign_result.highp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011221,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.div_assign_result.highp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011222,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.div_assign_result.lowp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011223,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.div_assign_result.lowp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011224,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.div_assign_result.mediump_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011225,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.div_assign_result.mediump_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011226,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.div_assign_result.lowp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011227,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.div_assign_result.lowp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011228,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.div_assign_result.mediump_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011229,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.div_assign_result.mediump_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011230,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.div_assign_result.lowp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011231,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.div_assign_result.lowp_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011232,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.div_assign_result.mediump_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011233,
        "dEQP-GLES3.functional.shaders.operator.binary_oper",
        "ator.div_assign_result.mediump_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011234,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.div_assign_result.highp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011235,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.div_assign_result.highp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011236,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.div_assign_result.highp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011237,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.div_assign_result.highp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011238,
        "dEQP-GLES3.functional.shaders.operator.binary_op",
        "erator.div_assign_result.highp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011239,
        "dEQP-GLES3.functional.shaders.operator.binary_ope",
        "rator.div_assign_result.highp_uvec4_uint_fragment");
