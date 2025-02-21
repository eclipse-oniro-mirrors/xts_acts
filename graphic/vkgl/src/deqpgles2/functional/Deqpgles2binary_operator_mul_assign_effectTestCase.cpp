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

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005062,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.mul_assign_effect.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005063,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.mul_assign_effect.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005064,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.mul_assign_effect.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005065,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.mul_assign_effect.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005066,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.mul_assign_effect.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005067,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.mul_assign_effect.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005068,
        "dEQP-GLES2.functional.shaders.operator.binar",
        "y_operator.mul_assign_effect.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005069,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.mul_assign_effect.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005070,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.mul_assign_effect.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005071,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.mul_assign_effect.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005072,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.mul_assign_effect.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005073,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.mul_assign_effect.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005074,
        "dEQP-GLES2.functional.shaders.operator.binar",
        "y_operator.mul_assign_effect.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005075,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.mul_assign_effect.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005076,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.mul_assign_effect.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005077,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.mul_assign_effect.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005078,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.mul_assign_effect.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005079,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.mul_assign_effect.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005080,
        "dEQP-GLES2.functional.shaders.operator.binar",
        "y_operator.mul_assign_effect.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005081,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.mul_assign_effect.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005082,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.mul_assign_effect.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005083,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.mul_assign_effect.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005084,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.mul_assign_effect.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005085,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.mul_assign_effect.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005086,
        "dEQP-GLES2.functional.shaders.operator.binar",
        "y_operator.mul_assign_effect.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005087,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.mul_assign_effect.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005088,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.mul_assign_effect.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005089,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.mul_assign_effect.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005090,
        "dEQP-GLES2.functional.shaders.operator.binar",
        "y_operator.mul_assign_effect.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005091,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.mul_assign_effect.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005092,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.mul_assign_effect.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005093,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.mul_assign_effect.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005094,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.mul_assign_effect.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005095,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.mul_assign_effect.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005096,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.mul_assign_effect.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005097,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.mul_assign_effect.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005098,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.mul_assign_effect.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005099,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.mul_assign_effect.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005100,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.mul_assign_effect.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005101,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.mul_assign_effect.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005102,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.mul_assign_effect.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005103,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.mul_assign_effect.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005104,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.mul_assign_effect.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005105,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.mul_assign_effect.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005106,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.mul_assign_effect.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005107,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.mul_assign_effect.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005108,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.mul_assign_effect.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005109,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.mul_assign_effect.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005110,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.mul_assign_effect.lowp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005111,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.mul_assign_effect.lowp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005112,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.mul_assign_effect.mediump_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005113,
        "dEQP-GLES2.functional.shaders.operator.binary_oper",
        "ator.mul_assign_effect.mediump_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005114,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.mul_assign_effect.highp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005115,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.mul_assign_effect.highp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005116,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.mul_assign_effect.lowp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005117,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.mul_assign_effect.lowp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005118,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.mul_assign_effect.mediump_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005119,
        "dEQP-GLES2.functional.shaders.operator.binary_oper",
        "ator.mul_assign_effect.mediump_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005120,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.mul_assign_effect.highp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005121,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.mul_assign_effect.highp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005122,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.mul_assign_effect.lowp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005123,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.mul_assign_effect.lowp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005124,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.mul_assign_effect.mediump_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005125,
        "dEQP-GLES2.functional.shaders.operator.binary_oper",
        "ator.mul_assign_effect.mediump_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005126,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.mul_assign_effect.highp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005127,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.mul_assign_effect.highp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005128,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.mul_assign_effect.lowp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005129,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.mul_assign_effect.lowp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005130,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.mul_assign_effect.mediump_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005131,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.mul_assign_effect.mediump_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005132,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.mul_assign_effect.highp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005133,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.mul_assign_effect.highp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005134,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.mul_assign_effect.lowp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005135,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.mul_assign_effect.lowp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005136,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.mul_assign_effect.mediump_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005137,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.mul_assign_effect.mediump_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005138,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.mul_assign_effect.highp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005139,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.mul_assign_effect.highp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005140,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.mul_assign_effect.lowp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005141,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.mul_assign_effect.lowp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005142,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.mul_assign_effect.mediump_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005143,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.mul_assign_effect.mediump_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005144,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.mul_assign_effect.highp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005145,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.mul_assign_effect.highp_ivec4_int_fragment");
