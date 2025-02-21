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
#include "../ActsDeqpgles20001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000649,
        "dEQP-GLES2.functional.shaders",
        ".constants.float_input_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000650,
        "dEQP-GLES2.functional.shaders.",
        "constants.float_input_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000651,
        "dEQP-GLES2.functional.shaders.",
        "constants.float_uniform_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000652,
        "dEQP-GLES2.functional.shaders.c",
        "onstants.float_uniform_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000653,
        "dEQP-GLES2.functional.shade",
        "rs.constants.float_0_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000654,
        "dEQP-GLES2.functional.shader",
        "s.constants.float_0_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000655,
        "dEQP-GLES2.functional.shade",
        "rs.constants.float_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000656,
        "dEQP-GLES2.functional.shader",
        "s.constants.float_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000657,
        "dEQP-GLES2.functional.shade",
        "rs.constants.float_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000658,
        "dEQP-GLES2.functional.shader",
        "s.constants.float_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000659,
        "dEQP-GLES2.functional.shade",
        "rs.constants.float_3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000660,
        "dEQP-GLES2.functional.shader",
        "s.constants.float_3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000661,
        "dEQP-GLES2.functional.shade",
        "rs.constants.float_4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000662,
        "dEQP-GLES2.functional.shader",
        "s.constants.float_4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000663,
        "dEQP-GLES2.functional.shade",
        "rs.constants.float_5_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000664,
        "dEQP-GLES2.functional.shader",
        "s.constants.float_5_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000665,
        "dEQP-GLES2.functional.shade",
        "rs.constants.float_6_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000666,
        "dEQP-GLES2.functional.shader",
        "s.constants.float_6_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000667,
        "dEQP-GLES2.functional.shade",
        "rs.constants.float_7_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000668,
        "dEQP-GLES2.functional.shader",
        "s.constants.float_7_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000669,
        "dEQP-GLES2.functional.shade",
        "rs.constants.float_8_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000670,
        "dEQP-GLES2.functional.shader",
        "s.constants.float_8_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000671,
        "dEQP-GLES2.functional.shad",
        "ers.constants.int_0_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000672,
        "dEQP-GLES2.functional.shade",
        "rs.constants.int_0_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000673,
        "dEQP-GLES2.functional.shad",
        "ers.constants.int_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000674,
        "dEQP-GLES2.functional.shade",
        "rs.constants.int_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000675,
        "dEQP-GLES2.functional.shad",
        "ers.constants.int_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000676,
        "dEQP-GLES2.functional.shade",
        "rs.constants.int_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000677,
        "dEQP-GLES2.functional.shad",
        "ers.constants.int_3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000678,
        "dEQP-GLES2.functional.shade",
        "rs.constants.int_3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000679,
        "dEQP-GLES2.functional.shad",
        "ers.constants.int_4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000680,
        "dEQP-GLES2.functional.shade",
        "rs.constants.int_4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000681,
        "dEQP-GLES2.functional.shad",
        "ers.constants.bool_0_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000682,
        "dEQP-GLES2.functional.shade",
        "rs.constants.bool_0_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000683,
        "dEQP-GLES2.functional.shad",
        "ers.constants.bool_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000684,
        "dEQP-GLES2.functional.shade",
        "rs.constants.bool_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000685,
        "dEQP-GLES2.functional.shaders.co",
        "nstants.const_float_global_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000686,
        "dEQP-GLES2.functional.shaders.con",
        "stants.const_float_global_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000687,
        "dEQP-GLES2.functional.shaders.c",
        "onstants.const_float_main_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000688,
        "dEQP-GLES2.functional.shaders.co",
        "nstants.const_float_main_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000689,
        "dEQP-GLES2.functional.shaders.con",
        "stants.const_float_function_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000690,
        "dEQP-GLES2.functional.shaders.cons",
        "tants.const_float_function_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000691,
        "dEQP-GLES2.functional.shaders.co",
        "nstants.const_float_scope_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000692,
        "dEQP-GLES2.functional.shaders.con",
        "stants.const_float_scope_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000693,
        "dEQP-GLES2.functional.shaders.constant",
        "s.const_float_scope_shawdowing_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000694,
        "dEQP-GLES2.functional.shaders.constants",
        ".const_float_scope_shawdowing_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000695,
        "dEQP-GLES2.functional.shaders.constant",
        "s.const_float_scope_shawdowing_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000696,
        "dEQP-GLES2.functional.shaders.constants",
        ".const_float_scope_shawdowing_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000697,
        "dEQP-GLES2.functional.shaders.constant",
        "s.const_float_scope_shawdowing_3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000698,
        "dEQP-GLES2.functional.shaders.constants",
        ".const_float_scope_shawdowing_3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000699,
        "dEQP-GLES2.functional.shaders.constant",
        "s.const_float_scope_shawdowing_4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000700,
        "dEQP-GLES2.functional.shaders.constants",
        ".const_float_scope_shawdowing_4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000701,
        "dEQP-GLES2.functional.shaders.constants.",
        "const_float_operations_with_const_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000702,
        "dEQP-GLES2.functional.shaders.constants.c",
        "onst_float_operations_with_const_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000703,
        "dEQP-GLES2.functional.shaders.const",
        "ants.const_float_assignment_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000704,
        "dEQP-GLES2.functional.shaders.consta",
        "nts.const_float_assignment_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000705,
        "dEQP-GLES2.functional.shaders.const",
        "ants.const_float_assignment_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000706,
        "dEQP-GLES2.functional.shaders.consta",
        "nts.const_float_assignment_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000707,
        "dEQP-GLES2.functional.shaders.const",
        "ants.const_float_assignment_3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000708,
        "dEQP-GLES2.functional.shaders.consta",
        "nts.const_float_assignment_3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000709,
        "dEQP-GLES2.functional.shaders.const",
        "ants.const_float_assignment_4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000710,
        "dEQP-GLES2.functional.shaders.consta",
        "nts.const_float_assignment_4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000711,
        "dEQP-GLES2.functional.shaders.consta",
        "nts.const_float_assign_uniform_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000712,
        "dEQP-GLES2.functional.shaders.constan",
        "ts.const_float_assign_uniform_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000713,
        "dEQP-GLES2.functional.shaders.con",
        "stants.const_float_assign_varying");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000714,
        "dEQP-GLES2.functional.shaders.con",
        "stants.const_float_from_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000715,
        "dEQP-GLES2.functional.shaders.cons",
        "tants.const_float_from_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000716,
        "dEQP-GLES2.functional.shaders.cons",
        "tants.const_float_from_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000717,
        "dEQP-GLES2.functional.shaders.const",
        "ants.const_float_from_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000718,
        "dEQP-GLES2.functional.shaders.cons",
        "tants.const_float_from_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000719,
        "dEQP-GLES2.functional.shaders.const",
        "ants.const_float_from_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000720,
        "dEQP-GLES2.functional.shaders.cons",
        "tants.const_float_from_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000721,
        "dEQP-GLES2.functional.shaders.const",
        "ants.const_float_from_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000722,
        "dEQP-GLES2.functional.shaders.constant",
        "s.const_float_assign_variable_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000723,
        "dEQP-GLES2.functional.shaders.constants",
        ".const_float_assign_variable_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000724,
        "dEQP-GLES2.functional.shaders.constant",
        "s.const_float_assign_variable_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000725,
        "dEQP-GLES2.functional.shaders.constants",
        ".const_float_assign_variable_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000726,
        "dEQP-GLES2.functional.shaders.constan",
        "ts.const_float_assign_user_func_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000727,
        "dEQP-GLES2.functional.shaders.constant",
        "s.const_float_assign_user_func_fragment");
