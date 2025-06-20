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

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005482,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.div_assign_result.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005483,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.div_assign_result.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005484,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.div_assign_result.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005485,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.div_assign_result.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005486,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.div_assign_result.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005487,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.div_assign_result.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005488,
        "dEQP-GLES2.functional.shaders.operator.binar",
        "y_operator.div_assign_result.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005489,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.div_assign_result.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005490,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.div_assign_result.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005491,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.div_assign_result.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005492,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.div_assign_result.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005493,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.div_assign_result.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005494,
        "dEQP-GLES2.functional.shaders.operator.binar",
        "y_operator.div_assign_result.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005495,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.div_assign_result.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005496,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.div_assign_result.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005497,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.div_assign_result.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005498,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.div_assign_result.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005499,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.div_assign_result.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005500,
        "dEQP-GLES2.functional.shaders.operator.binar",
        "y_operator.div_assign_result.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005501,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.div_assign_result.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005502,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.div_assign_result.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005503,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.div_assign_result.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005504,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.div_assign_result.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005505,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.div_assign_result.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005506,
        "dEQP-GLES2.functional.shaders.operator.binar",
        "y_operator.div_assign_result.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005507,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.div_assign_result.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005508,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.div_assign_result.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005509,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.div_assign_result.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005510,
        "dEQP-GLES2.functional.shaders.operator.binar",
        "y_operator.div_assign_result.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005511,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.div_assign_result.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005512,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.div_assign_result.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005513,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.div_assign_result.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005514,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.div_assign_result.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005515,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.div_assign_result.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005516,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.div_assign_result.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005517,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.div_assign_result.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005518,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.div_assign_result.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005519,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.div_assign_result.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005520,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.div_assign_result.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005521,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.div_assign_result.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005522,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.div_assign_result.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005523,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.div_assign_result.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005524,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.div_assign_result.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005525,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.div_assign_result.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005526,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.div_assign_result.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005527,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.div_assign_result.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005528,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.div_assign_result.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005529,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.div_assign_result.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005530,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.div_assign_result.lowp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005531,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.div_assign_result.lowp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005532,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.div_assign_result.mediump_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005533,
        "dEQP-GLES2.functional.shaders.operator.binary_oper",
        "ator.div_assign_result.mediump_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005534,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.div_assign_result.highp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005535,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.div_assign_result.highp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005536,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.div_assign_result.lowp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005537,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.div_assign_result.lowp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005538,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.div_assign_result.mediump_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005539,
        "dEQP-GLES2.functional.shaders.operator.binary_oper",
        "ator.div_assign_result.mediump_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005540,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.div_assign_result.highp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005541,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.div_assign_result.highp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005542,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.div_assign_result.lowp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005543,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.div_assign_result.lowp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005544,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.div_assign_result.mediump_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005545,
        "dEQP-GLES2.functional.shaders.operator.binary_oper",
        "ator.div_assign_result.mediump_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005546,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.div_assign_result.highp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005547,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.div_assign_result.highp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005548,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.div_assign_result.lowp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005549,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.div_assign_result.lowp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005550,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.div_assign_result.mediump_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005551,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.div_assign_result.mediump_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005552,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.div_assign_result.highp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005553,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.div_assign_result.highp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005554,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.div_assign_result.lowp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005555,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.div_assign_result.lowp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005556,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.div_assign_result.mediump_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005557,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.div_assign_result.mediump_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005558,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.div_assign_result.highp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005559,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.div_assign_result.highp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005560,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.div_assign_result.lowp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005561,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.div_assign_result.lowp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005562,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.div_assign_result.mediump_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005563,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.div_assign_result.mediump_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005564,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.div_assign_result.highp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005565,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.div_assign_result.highp_ivec4_int_fragment");
