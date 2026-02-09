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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20006TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005146,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.div_assign_effect.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005147,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.div_assign_effect.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005148,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.div_assign_effect.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005149,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.div_assign_effect.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005150,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.div_assign_effect.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005151,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.div_assign_effect.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005152,
        "dEQP-GLES2.functional.shaders.operator.binar",
        "y_operator.div_assign_effect.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005153,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.div_assign_effect.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005154,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.div_assign_effect.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005155,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.div_assign_effect.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005156,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.div_assign_effect.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005157,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.div_assign_effect.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005158,
        "dEQP-GLES2.functional.shaders.operator.binar",
        "y_operator.div_assign_effect.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005159,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.div_assign_effect.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005160,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.div_assign_effect.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005161,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.div_assign_effect.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005162,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.div_assign_effect.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005163,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.div_assign_effect.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005164,
        "dEQP-GLES2.functional.shaders.operator.binar",
        "y_operator.div_assign_effect.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005165,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.div_assign_effect.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005166,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.div_assign_effect.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005167,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.div_assign_effect.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005168,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.div_assign_effect.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005169,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.div_assign_effect.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005170,
        "dEQP-GLES2.functional.shaders.operator.binar",
        "y_operator.div_assign_effect.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005171,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.div_assign_effect.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005172,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.div_assign_effect.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005173,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.div_assign_effect.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005174,
        "dEQP-GLES2.functional.shaders.operator.binar",
        "y_operator.div_assign_effect.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005175,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.div_assign_effect.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005176,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.div_assign_effect.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005177,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.div_assign_effect.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005178,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.div_assign_effect.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005179,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.div_assign_effect.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005180,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.div_assign_effect.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005181,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.div_assign_effect.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005182,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.div_assign_effect.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005183,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.div_assign_effect.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005184,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.div_assign_effect.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005185,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.div_assign_effect.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005186,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.div_assign_effect.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005187,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.div_assign_effect.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005188,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.div_assign_effect.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005189,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.div_assign_effect.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005190,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.div_assign_effect.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005191,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.div_assign_effect.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005192,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.div_assign_effect.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005193,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.div_assign_effect.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005194,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.div_assign_effect.lowp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005195,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.div_assign_effect.lowp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005196,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.div_assign_effect.mediump_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005197,
        "dEQP-GLES2.functional.shaders.operator.binary_oper",
        "ator.div_assign_effect.mediump_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005198,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.div_assign_effect.highp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005199,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.div_assign_effect.highp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005200,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.div_assign_effect.lowp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005201,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.div_assign_effect.lowp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005202,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.div_assign_effect.mediump_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005203,
        "dEQP-GLES2.functional.shaders.operator.binary_oper",
        "ator.div_assign_effect.mediump_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005204,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.div_assign_effect.highp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005205,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.div_assign_effect.highp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005206,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.div_assign_effect.lowp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005207,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.div_assign_effect.lowp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005208,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.div_assign_effect.mediump_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005209,
        "dEQP-GLES2.functional.shaders.operator.binary_oper",
        "ator.div_assign_effect.mediump_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005210,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.div_assign_effect.highp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005211,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.div_assign_effect.highp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005212,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.div_assign_effect.lowp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005213,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.div_assign_effect.lowp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005214,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.div_assign_effect.mediump_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005215,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.div_assign_effect.mediump_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005216,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.div_assign_effect.highp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005217,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.div_assign_effect.highp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005218,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.div_assign_effect.lowp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005219,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.div_assign_effect.lowp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005220,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.div_assign_effect.mediump_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005221,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.div_assign_effect.mediump_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005222,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.div_assign_effect.highp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005223,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.div_assign_effect.highp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005224,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.div_assign_effect.lowp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005225,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.div_assign_effect.lowp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005226,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.div_assign_effect.mediump_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005227,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.div_assign_effect.mediump_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005228,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.div_assign_effect.highp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005229,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.div_assign_effect.highp_ivec4_int_fragment");
