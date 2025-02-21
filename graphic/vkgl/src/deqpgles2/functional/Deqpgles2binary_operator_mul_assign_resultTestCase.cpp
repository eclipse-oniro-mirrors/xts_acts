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

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005398,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.mul_assign_result.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005399,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.mul_assign_result.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005400,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.mul_assign_result.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005401,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.mul_assign_result.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005402,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.mul_assign_result.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005403,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.mul_assign_result.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005404,
        "dEQP-GLES2.functional.shaders.operator.binar",
        "y_operator.mul_assign_result.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005405,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.mul_assign_result.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005406,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.mul_assign_result.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005407,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.mul_assign_result.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005408,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.mul_assign_result.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005409,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.mul_assign_result.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005410,
        "dEQP-GLES2.functional.shaders.operator.binar",
        "y_operator.mul_assign_result.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005411,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.mul_assign_result.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005412,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.mul_assign_result.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005413,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.mul_assign_result.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005414,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.mul_assign_result.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005415,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.mul_assign_result.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005416,
        "dEQP-GLES2.functional.shaders.operator.binar",
        "y_operator.mul_assign_result.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005417,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.mul_assign_result.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005418,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.mul_assign_result.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005419,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.mul_assign_result.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005420,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.mul_assign_result.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005421,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.mul_assign_result.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005422,
        "dEQP-GLES2.functional.shaders.operator.binar",
        "y_operator.mul_assign_result.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005423,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.mul_assign_result.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005424,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.mul_assign_result.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005425,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.mul_assign_result.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005426,
        "dEQP-GLES2.functional.shaders.operator.binar",
        "y_operator.mul_assign_result.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005427,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.mul_assign_result.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005428,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.mul_assign_result.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005429,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.mul_assign_result.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005430,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.mul_assign_result.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005431,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.mul_assign_result.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005432,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.mul_assign_result.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005433,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.mul_assign_result.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005434,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.mul_assign_result.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005435,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.mul_assign_result.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005436,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.mul_assign_result.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005437,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.mul_assign_result.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005438,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.mul_assign_result.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005439,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.mul_assign_result.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005440,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.mul_assign_result.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005441,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.mul_assign_result.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005442,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.mul_assign_result.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005443,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.mul_assign_result.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005444,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.mul_assign_result.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005445,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.mul_assign_result.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005446,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.mul_assign_result.lowp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005447,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.mul_assign_result.lowp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005448,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.mul_assign_result.mediump_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005449,
        "dEQP-GLES2.functional.shaders.operator.binary_oper",
        "ator.mul_assign_result.mediump_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005450,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.mul_assign_result.highp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005451,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.mul_assign_result.highp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005452,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.mul_assign_result.lowp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005453,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.mul_assign_result.lowp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005454,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.mul_assign_result.mediump_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005455,
        "dEQP-GLES2.functional.shaders.operator.binary_oper",
        "ator.mul_assign_result.mediump_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005456,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.mul_assign_result.highp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005457,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.mul_assign_result.highp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005458,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.mul_assign_result.lowp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005459,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.mul_assign_result.lowp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005460,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.mul_assign_result.mediump_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005461,
        "dEQP-GLES2.functional.shaders.operator.binary_oper",
        "ator.mul_assign_result.mediump_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005462,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.mul_assign_result.highp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005463,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.mul_assign_result.highp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005464,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.mul_assign_result.lowp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005465,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.mul_assign_result.lowp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005466,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.mul_assign_result.mediump_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005467,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.mul_assign_result.mediump_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005468,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.mul_assign_result.highp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005469,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.mul_assign_result.highp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005470,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.mul_assign_result.lowp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005471,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.mul_assign_result.lowp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005472,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.mul_assign_result.mediump_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005473,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.mul_assign_result.mediump_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005474,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.mul_assign_result.highp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005475,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.mul_assign_result.highp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005476,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.mul_assign_result.lowp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005477,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.mul_assign_result.lowp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005478,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.mul_assign_result.mediump_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005479,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.mul_assign_result.mediump_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005480,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.mul_assign_result.highp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005481,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.mul_assign_result.highp_ivec4_int_fragment");
