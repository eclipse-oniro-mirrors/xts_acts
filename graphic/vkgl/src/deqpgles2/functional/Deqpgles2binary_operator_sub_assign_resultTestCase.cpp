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

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005314,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.sub_assign_result.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005315,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.sub_assign_result.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005316,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.sub_assign_result.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005317,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.sub_assign_result.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005318,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.sub_assign_result.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005319,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.sub_assign_result.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005320,
        "dEQP-GLES2.functional.shaders.operator.binar",
        "y_operator.sub_assign_result.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005321,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.sub_assign_result.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005322,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.sub_assign_result.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005323,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.sub_assign_result.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005324,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.sub_assign_result.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005325,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.sub_assign_result.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005326,
        "dEQP-GLES2.functional.shaders.operator.binar",
        "y_operator.sub_assign_result.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005327,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.sub_assign_result.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005328,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.sub_assign_result.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005329,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.sub_assign_result.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005330,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.sub_assign_result.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005331,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.sub_assign_result.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005332,
        "dEQP-GLES2.functional.shaders.operator.binar",
        "y_operator.sub_assign_result.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005333,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.sub_assign_result.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005334,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.sub_assign_result.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005335,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.sub_assign_result.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005336,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.sub_assign_result.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005337,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.sub_assign_result.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005338,
        "dEQP-GLES2.functional.shaders.operator.binar",
        "y_operator.sub_assign_result.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005339,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.sub_assign_result.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005340,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.sub_assign_result.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005341,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.sub_assign_result.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005342,
        "dEQP-GLES2.functional.shaders.operator.binar",
        "y_operator.sub_assign_result.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005343,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.sub_assign_result.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005344,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.sub_assign_result.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005345,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.sub_assign_result.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005346,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.sub_assign_result.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005347,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.sub_assign_result.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005348,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.sub_assign_result.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005349,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.sub_assign_result.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005350,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.sub_assign_result.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005351,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.sub_assign_result.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005352,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.sub_assign_result.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005353,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.sub_assign_result.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005354,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.sub_assign_result.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005355,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.sub_assign_result.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005356,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.sub_assign_result.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005357,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.sub_assign_result.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005358,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.sub_assign_result.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005359,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.sub_assign_result.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005360,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.sub_assign_result.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005361,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.sub_assign_result.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005362,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.sub_assign_result.lowp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005363,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.sub_assign_result.lowp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005364,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.sub_assign_result.mediump_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005365,
        "dEQP-GLES2.functional.shaders.operator.binary_oper",
        "ator.sub_assign_result.mediump_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005366,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.sub_assign_result.highp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005367,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.sub_assign_result.highp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005368,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.sub_assign_result.lowp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005369,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.sub_assign_result.lowp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005370,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.sub_assign_result.mediump_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005371,
        "dEQP-GLES2.functional.shaders.operator.binary_oper",
        "ator.sub_assign_result.mediump_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005372,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.sub_assign_result.highp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005373,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.sub_assign_result.highp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005374,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.sub_assign_result.lowp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005375,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.sub_assign_result.lowp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005376,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.sub_assign_result.mediump_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005377,
        "dEQP-GLES2.functional.shaders.operator.binary_oper",
        "ator.sub_assign_result.mediump_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005378,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.sub_assign_result.highp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005379,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.sub_assign_result.highp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005380,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.sub_assign_result.lowp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005381,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.sub_assign_result.lowp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005382,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.sub_assign_result.mediump_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005383,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.sub_assign_result.mediump_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005384,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.sub_assign_result.highp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005385,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.sub_assign_result.highp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005386,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.sub_assign_result.lowp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005387,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.sub_assign_result.lowp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005388,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.sub_assign_result.mediump_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005389,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.sub_assign_result.mediump_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005390,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.sub_assign_result.highp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005391,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.sub_assign_result.highp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005392,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.sub_assign_result.lowp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005393,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.sub_assign_result.lowp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005394,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.sub_assign_result.mediump_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005395,
        "dEQP-GLES2.functional.shaders.operator.binary_ope",
        "rator.sub_assign_result.mediump_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005396,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.sub_assign_result.highp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005397,
        "dEQP-GLES2.functional.shaders.operator.binary_op",
        "erator.sub_assign_result.highp_ivec4_int_fragment");
