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

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004894,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.add_assign_effect.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004895,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.add_assign_effect.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004896,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.add_assign_effect.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004897,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.add_assign_effect.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004898,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.add_assign_effect.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004899,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.add_assign_effect.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004900,
        "dEQP-GLES2.functional.shaders.operator.binar",
        "y_operator.add_assign_effect.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004901,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.add_assign_effect.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004902,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.add_assign_effect.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004903,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.add_assign_effect.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004904,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.add_assign_effect.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004905,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.add_assign_effect.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004906,
        "dEQP-GLES2.functional.shaders.operator.binar",
        "y_operator.add_assign_effect.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004907,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.add_assign_effect.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004908,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.add_assign_effect.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004909,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.add_assign_effect.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004910,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.add_assign_effect.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004911,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.add_assign_effect.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004912,
        "dEQP-GLES2.functional.shaders.operator.binar",
        "y_operator.add_assign_effect.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004913,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.add_assign_effect.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004914,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.add_assign_effect.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004915,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.add_assign_effect.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004916,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.add_assign_effect.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004917,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.add_assign_effect.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004918,
        "dEQP-GLES2.functional.shaders.operator.binar",
        "y_operator.add_assign_effect.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004919,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.add_assign_effect.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004920,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.add_assign_effect.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004921,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.add_assign_effect.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004922,
        "dEQP-GLES2.functional.shaders.operator.binar",
        "y_operator.add_assign_effect.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004923,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.add_assign_effect.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004924,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.add_assign_effect.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004925,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.add_assign_effect.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004926,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.add_assign_effect.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004927,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.add_assign_effect.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004928,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.add_assign_effect.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004929,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.add_assign_effect.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004930,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.add_assign_effect.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004931,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.add_assign_effect.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004932,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.add_assign_effect.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004933,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.add_assign_effect.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004934,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.add_assign_effect.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004935,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.add_assign_effect.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004936,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.add_assign_effect.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004937,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.add_assign_effect.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004938,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.add_assign_effect.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004939,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.add_assign_effect.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004940,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.add_assign_effect.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004941,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.add_assign_effect.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004942,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.add_assign_effect.lowp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004943,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.add_assign_effect.lowp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004944,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.add_assign_effect.mediump_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004945,
        "dEQP-GLES2.functional.shaders.operator.binary_oper",
        "ator.add_assign_effect.mediump_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004946,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.add_assign_effect.highp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004947,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.add_assign_effect.highp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004948,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.add_assign_effect.lowp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004949,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.add_assign_effect.lowp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004950,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.add_assign_effect.mediump_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004951,
        "dEQP-GLES2.functional.shaders.operator.binary_oper",
        "ator.add_assign_effect.mediump_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004952,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.add_assign_effect.highp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004953,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.add_assign_effect.highp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004954,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.add_assign_effect.lowp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004955,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.add_assign_effect.lowp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004956,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.add_assign_effect.mediump_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004957,
        "dEQP-GLES2.functional.shaders.operator.binary_oper",
        "ator.add_assign_effect.mediump_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004958,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.add_assign_effect.highp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004959,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.add_assign_effect.highp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004960,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.add_assign_effect.lowp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004961,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.add_assign_effect.lowp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004962,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.add_assign_effect.mediump_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004963,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.add_assign_effect.mediump_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004964,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.add_assign_effect.highp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004965,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.add_assign_effect.highp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004966,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.add_assign_effect.lowp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004967,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.add_assign_effect.lowp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004968,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.add_assign_effect.mediump_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004969,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.add_assign_effect.mediump_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004970,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.add_assign_effect.highp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004971,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.add_assign_effect.highp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004972,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.add_assign_effect.lowp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004973,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.add_assign_effect.lowp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004974,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.add_assign_effect.mediump_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004975,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.add_assign_effect.mediump_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004976,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.add_assign_effect.highp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004977,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.add_assign_effect.highp_ivec4_int_fragment");
