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
#include "../ActsDeqpgles20005TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004978,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.sub_assign_effect.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004979,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.sub_assign_effect.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004980,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.sub_assign_effect.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004981,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.sub_assign_effect.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004982,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.sub_assign_effect.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004983,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.sub_assign_effect.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004984,
        "dEQP-GLES2.functional.shaders.operator.binar",
        "y_operator.sub_assign_effect.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004985,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.sub_assign_effect.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004986,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.sub_assign_effect.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004987,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.sub_assign_effect.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004988,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.sub_assign_effect.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004989,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.sub_assign_effect.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004990,
        "dEQP-GLES2.functional.shaders.operator.binar",
        "y_operator.sub_assign_effect.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004991,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.sub_assign_effect.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004992,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.sub_assign_effect.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004993,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.sub_assign_effect.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004994,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.sub_assign_effect.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004995,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.sub_assign_effect.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004996,
        "dEQP-GLES2.functional.shaders.operator.binar",
        "y_operator.sub_assign_effect.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004997,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.sub_assign_effect.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004998,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.sub_assign_effect.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004999,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.sub_assign_effect.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005000,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.sub_assign_effect.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005001,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.sub_assign_effect.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005002,
        "dEQP-GLES2.functional.shaders.operator.binar",
        "y_operator.sub_assign_effect.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005003,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.sub_assign_effect.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005004,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.sub_assign_effect.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005005,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.sub_assign_effect.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005006,
        "dEQP-GLES2.functional.shaders.operator.binar",
        "y_operator.sub_assign_effect.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005007,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.sub_assign_effect.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005008,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.sub_assign_effect.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005009,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.sub_assign_effect.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005010,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.sub_assign_effect.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005011,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.sub_assign_effect.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005012,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.sub_assign_effect.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005013,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.sub_assign_effect.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005014,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.sub_assign_effect.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005015,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.sub_assign_effect.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005016,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.sub_assign_effect.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005017,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.sub_assign_effect.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005018,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.sub_assign_effect.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005019,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.sub_assign_effect.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005020,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.sub_assign_effect.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005021,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.sub_assign_effect.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005022,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.sub_assign_effect.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005023,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.sub_assign_effect.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005024,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.sub_assign_effect.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005025,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.sub_assign_effect.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005026,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.sub_assign_effect.lowp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005027,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.sub_assign_effect.lowp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005028,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.sub_assign_effect.mediump_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005029,
        "dEQP-GLES2.functional.shaders.operator.binary_oper",
        "ator.sub_assign_effect.mediump_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005030,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.sub_assign_effect.highp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005031,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.sub_assign_effect.highp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005032,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.sub_assign_effect.lowp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005033,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.sub_assign_effect.lowp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005034,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.sub_assign_effect.mediump_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005035,
        "dEQP-GLES2.functional.shaders.operator.binary_oper",
        "ator.sub_assign_effect.mediump_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005036,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.sub_assign_effect.highp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005037,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.sub_assign_effect.highp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005038,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.sub_assign_effect.lowp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005039,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.sub_assign_effect.lowp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005040,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.sub_assign_effect.mediump_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005041,
        "dEQP-GLES2.functional.shaders.operator.binary_oper",
        "ator.sub_assign_effect.mediump_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005042,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.sub_assign_effect.highp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005043,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.sub_assign_effect.highp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005044,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.sub_assign_effect.lowp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005045,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.sub_assign_effect.lowp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005046,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.sub_assign_effect.mediump_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005047,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.sub_assign_effect.mediump_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005048,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.sub_assign_effect.highp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005049,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.sub_assign_effect.highp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005050,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.sub_assign_effect.lowp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005051,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.sub_assign_effect.lowp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005052,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.sub_assign_effect.mediump_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005053,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.sub_assign_effect.mediump_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005054,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.sub_assign_effect.highp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005055,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.sub_assign_effect.highp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005056,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.sub_assign_effect.lowp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005057,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.sub_assign_effect.lowp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005058,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.sub_assign_effect.mediump_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005059,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.sub_assign_effect.mediump_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005060,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.sub_assign_effect.highp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_005061,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.sub_assign_effect.highp_ivec4_int_fragment");
