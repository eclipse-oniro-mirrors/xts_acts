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

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005230,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.add_assign_result.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005231,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.add_assign_result.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005232,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.add_assign_result.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005233,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.add_assign_result.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005234,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.add_assign_result.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005235,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.add_assign_result.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005236,
        "dEQP-GLES2.functional.shaders.operator.binar",
        "y_operator.add_assign_result.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005237,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.add_assign_result.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005238,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.add_assign_result.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005239,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.add_assign_result.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005240,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.add_assign_result.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005241,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.add_assign_result.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005242,
        "dEQP-GLES2.functional.shaders.operator.binar",
        "y_operator.add_assign_result.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005243,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.add_assign_result.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005244,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.add_assign_result.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005245,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.add_assign_result.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005246,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.add_assign_result.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005247,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.add_assign_result.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005248,
        "dEQP-GLES2.functional.shaders.operator.binar",
        "y_operator.add_assign_result.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005249,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.add_assign_result.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005250,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.add_assign_result.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005251,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.add_assign_result.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005252,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.add_assign_result.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005253,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.add_assign_result.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005254,
        "dEQP-GLES2.functional.shaders.operator.binar",
        "y_operator.add_assign_result.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005255,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.add_assign_result.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005256,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.add_assign_result.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005257,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.add_assign_result.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005258,
        "dEQP-GLES2.functional.shaders.operator.binar",
        "y_operator.add_assign_result.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005259,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.add_assign_result.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005260,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.add_assign_result.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005261,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.add_assign_result.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005262,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.add_assign_result.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005263,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.add_assign_result.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005264,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.add_assign_result.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005265,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.add_assign_result.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005266,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.add_assign_result.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005267,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.add_assign_result.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005268,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.add_assign_result.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005269,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.add_assign_result.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005270,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.add_assign_result.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005271,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.add_assign_result.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005272,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.add_assign_result.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005273,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.add_assign_result.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005274,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.add_assign_result.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005275,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.add_assign_result.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005276,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.add_assign_result.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005277,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.add_assign_result.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005278,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.add_assign_result.lowp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005279,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.add_assign_result.lowp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005280,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.add_assign_result.mediump_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005281,
        "dEQP-GLES2.functional.shaders.operator.binary_oper",
        "ator.add_assign_result.mediump_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005282,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.add_assign_result.highp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005283,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.add_assign_result.highp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005284,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.add_assign_result.lowp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005285,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.add_assign_result.lowp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005286,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.add_assign_result.mediump_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005287,
        "dEQP-GLES2.functional.shaders.operator.binary_oper",
        "ator.add_assign_result.mediump_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005288,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.add_assign_result.highp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005289,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.add_assign_result.highp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005290,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.add_assign_result.lowp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005291,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.add_assign_result.lowp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005292,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.add_assign_result.mediump_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005293,
        "dEQP-GLES2.functional.shaders.operator.binary_oper",
        "ator.add_assign_result.mediump_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005294,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.add_assign_result.highp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005295,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.add_assign_result.highp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005296,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.add_assign_result.lowp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005297,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.add_assign_result.lowp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005298,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.add_assign_result.mediump_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005299,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.add_assign_result.mediump_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005300,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.add_assign_result.highp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005301,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.add_assign_result.highp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005302,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.add_assign_result.lowp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005303,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.add_assign_result.lowp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005304,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.add_assign_result.mediump_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005305,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.add_assign_result.mediump_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005306,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.add_assign_result.highp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005307,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.add_assign_result.highp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005308,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.add_assign_result.lowp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005309,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.add_assign_result.lowp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005310,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.add_assign_result.mediump_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005311,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.add_assign_result.mediump_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005312,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.add_assign_result.highp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005313,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.add_assign_result.highp_ivec4_int_fragment");
