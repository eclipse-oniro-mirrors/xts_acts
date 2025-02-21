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
#include "../ActsDeqpgles30002TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001332,
        "dEQP-GLES3.functional.shaders",
        ".constants.float_input_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001333,
        "dEQP-GLES3.functional.shaders.",
        "constants.float_input_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001334,
        "dEQP-GLES3.functional.shaders.",
        "constants.float_uniform_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001335,
        "dEQP-GLES3.functional.shaders.c",
        "onstants.float_uniform_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001336,
        "dEQP-GLES3.functional.shade",
        "rs.constants.float_0_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001337,
        "dEQP-GLES3.functional.shader",
        "s.constants.float_0_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001338,
        "dEQP-GLES3.functional.shade",
        "rs.constants.float_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001339,
        "dEQP-GLES3.functional.shader",
        "s.constants.float_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001340,
        "dEQP-GLES3.functional.shade",
        "rs.constants.float_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001341,
        "dEQP-GLES3.functional.shader",
        "s.constants.float_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001342,
        "dEQP-GLES3.functional.shade",
        "rs.constants.float_3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001343,
        "dEQP-GLES3.functional.shader",
        "s.constants.float_3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001344,
        "dEQP-GLES3.functional.shade",
        "rs.constants.float_4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001345,
        "dEQP-GLES3.functional.shader",
        "s.constants.float_4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001346,
        "dEQP-GLES3.functional.shade",
        "rs.constants.float_5_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001347,
        "dEQP-GLES3.functional.shader",
        "s.constants.float_5_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001348,
        "dEQP-GLES3.functional.shade",
        "rs.constants.float_6_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001349,
        "dEQP-GLES3.functional.shader",
        "s.constants.float_6_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001350,
        "dEQP-GLES3.functional.shade",
        "rs.constants.float_7_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001351,
        "dEQP-GLES3.functional.shader",
        "s.constants.float_7_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001352,
        "dEQP-GLES3.functional.shade",
        "rs.constants.float_8_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001353,
        "dEQP-GLES3.functional.shader",
        "s.constants.float_8_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001354,
        "dEQP-GLES3.functional.shaders.c",
        "onstants.float_f_suffix_0_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001355,
        "dEQP-GLES3.functional.shaders.co",
        "nstants.float_f_suffix_0_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001356,
        "dEQP-GLES3.functional.shaders.c",
        "onstants.float_f_suffix_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001357,
        "dEQP-GLES3.functional.shaders.co",
        "nstants.float_f_suffix_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001358,
        "dEQP-GLES3.functional.shad",
        "ers.constants.int_0_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001359,
        "dEQP-GLES3.functional.shade",
        "rs.constants.int_0_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001360,
        "dEQP-GLES3.functional.shad",
        "ers.constants.int_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001361,
        "dEQP-GLES3.functional.shade",
        "rs.constants.int_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001362,
        "dEQP-GLES3.functional.shad",
        "ers.constants.int_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001363,
        "dEQP-GLES3.functional.shade",
        "rs.constants.int_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001364,
        "dEQP-GLES3.functional.shad",
        "ers.constants.int_3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001365,
        "dEQP-GLES3.functional.shade",
        "rs.constants.int_3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001366,
        "dEQP-GLES3.functional.shad",
        "ers.constants.int_4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001367,
        "dEQP-GLES3.functional.shade",
        "rs.constants.int_4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001368,
        "dEQP-GLES3.functional.shad",
        "ers.constants.bool_0_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001369,
        "dEQP-GLES3.functional.shade",
        "rs.constants.bool_0_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001370,
        "dEQP-GLES3.functional.shad",
        "ers.constants.bool_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001371,
        "dEQP-GLES3.functional.shade",
        "rs.constants.bool_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001372,
        "dEQP-GLES3.functional.shaders.co",
        "nstants.const_float_global_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001373,
        "dEQP-GLES3.functional.shaders.con",
        "stants.const_float_global_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001374,
        "dEQP-GLES3.functional.shaders.c",
        "onstants.const_float_main_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001375,
        "dEQP-GLES3.functional.shaders.co",
        "nstants.const_float_main_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001376,
        "dEQP-GLES3.functional.shaders.con",
        "stants.const_float_function_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001377,
        "dEQP-GLES3.functional.shaders.cons",
        "tants.const_float_function_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001378,
        "dEQP-GLES3.functional.shaders.co",
        "nstants.const_float_scope_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001379,
        "dEQP-GLES3.functional.shaders.con",
        "stants.const_float_scope_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001380,
        "dEQP-GLES3.functional.shaders.constant",
        "s.const_float_scope_shawdowing_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001381,
        "dEQP-GLES3.functional.shaders.constants",
        ".const_float_scope_shawdowing_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001382,
        "dEQP-GLES3.functional.shaders.constant",
        "s.const_float_scope_shawdowing_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001383,
        "dEQP-GLES3.functional.shaders.constants",
        ".const_float_scope_shawdowing_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001384,
        "dEQP-GLES3.functional.shaders.constant",
        "s.const_float_scope_shawdowing_3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001385,
        "dEQP-GLES3.functional.shaders.constants",
        ".const_float_scope_shawdowing_3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001386,
        "dEQP-GLES3.functional.shaders.constant",
        "s.const_float_scope_shawdowing_4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001387,
        "dEQP-GLES3.functional.shaders.constants",
        ".const_float_scope_shawdowing_4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001388,
        "dEQP-GLES3.functional.shaders.constants.",
        "const_float_operations_with_const_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001389,
        "dEQP-GLES3.functional.shaders.constants.c",
        "onst_float_operations_with_const_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001390,
        "dEQP-GLES3.functional.shaders.const",
        "ants.const_float_assignment_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001391,
        "dEQP-GLES3.functional.shaders.consta",
        "nts.const_float_assignment_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001392,
        "dEQP-GLES3.functional.shaders.const",
        "ants.const_float_assignment_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001393,
        "dEQP-GLES3.functional.shaders.consta",
        "nts.const_float_assignment_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001394,
        "dEQP-GLES3.functional.shaders.const",
        "ants.const_float_assignment_3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001395,
        "dEQP-GLES3.functional.shaders.consta",
        "nts.const_float_assignment_3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001396,
        "dEQP-GLES3.functional.shaders.const",
        "ants.const_float_assignment_4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001397,
        "dEQP-GLES3.functional.shaders.consta",
        "nts.const_float_assignment_4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001398,
        "dEQP-GLES3.functional.shaders.consta",
        "nts.const_float_assign_uniform_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001399,
        "dEQP-GLES3.functional.shaders.constan",
        "ts.const_float_assign_uniform_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001400,
        "dEQP-GLES3.functional.shaders.con",
        "stants.const_float_assign_varying");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001401,
        "dEQP-GLES3.functional.shaders.constan",
        "ts.const_float_function_gotcha_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001402,
        "dEQP-GLES3.functional.shaders.constant",
        "s.const_float_function_gotcha_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001403,
        "dEQP-GLES3.functional.shaders.con",
        "stants.const_float_from_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001404,
        "dEQP-GLES3.functional.shaders.cons",
        "tants.const_float_from_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001405,
        "dEQP-GLES3.functional.shaders.cons",
        "tants.const_float_from_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001406,
        "dEQP-GLES3.functional.shaders.const",
        "ants.const_float_from_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001407,
        "dEQP-GLES3.functional.shaders.cons",
        "tants.const_float_from_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001408,
        "dEQP-GLES3.functional.shaders.const",
        "ants.const_float_from_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001409,
        "dEQP-GLES3.functional.shaders.cons",
        "tants.const_float_from_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001410,
        "dEQP-GLES3.functional.shaders.const",
        "ants.const_float_from_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001411,
        "dEQP-GLES3.functional.shaders.constant",
        "s.const_float_assign_variable_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001412,
        "dEQP-GLES3.functional.shaders.constants",
        ".const_float_assign_variable_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001413,
        "dEQP-GLES3.functional.shaders.constant",
        "s.const_float_assign_variable_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001414,
        "dEQP-GLES3.functional.shaders.constants",
        ".const_float_assign_variable_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001415,
        "dEQP-GLES3.functional.shaders.constan",
        "ts.const_float_assign_user_func_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001416,
        "dEQP-GLES3.functional.shaders.constant",
        "s.const_float_assign_user_func_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001417,
        "dEQP-GLES3.functional.shaders.co",
        "nstants.const_mat_multiply_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001418,
        "dEQP-GLES3.functional.shaders.con",
        "stants.const_mat_multiply_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001419,
        "dEQP-GLES3.functional.shaders",
        ".constants.int_decimal_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001420,
        "dEQP-GLES3.functional.shaders.",
        "constants.int_decimal_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001421,
        "dEQP-GLES3.functional.shader",
        "s.constants.int_octal_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001422,
        "dEQP-GLES3.functional.shaders",
        ".constants.int_octal_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001423,
        "dEQP-GLES3.functional.shaders.co",
        "nstants.int_hexadecimal_0_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001424,
        "dEQP-GLES3.functional.shaders.con",
        "stants.int_hexadecimal_0_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001425,
        "dEQP-GLES3.functional.shaders.co",
        "nstants.int_hexadecimal_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001426,
        "dEQP-GLES3.functional.shaders.con",
        "stants.int_hexadecimal_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001427,
        "dEQP-GLES3.functional.shaders.",
        "constants.uint_decimal_0_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001428,
        "dEQP-GLES3.functional.shaders.c",
        "onstants.uint_decimal_0_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001429,
        "dEQP-GLES3.functional.shaders.",
        "constants.uint_decimal_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001430,
        "dEQP-GLES3.functional.shaders.c",
        "onstants.uint_decimal_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001431,
        "dEQP-GLES3.functional.shaders.",
        "constants.uint_decimal_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001432,
        "dEQP-GLES3.functional.shaders.c",
        "onstants.uint_decimal_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001433,
        "dEQP-GLES3.functional.shaders.",
        "constants.uint_decimal_3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001434,
        "dEQP-GLES3.functional.shaders.c",
        "onstants.uint_decimal_3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001435,
        "dEQP-GLES3.functional.shaders",
        ".constants.uint_octal_0_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001436,
        "dEQP-GLES3.functional.shaders.",
        "constants.uint_octal_0_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001437,
        "dEQP-GLES3.functional.shaders",
        ".constants.uint_octal_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001438,
        "dEQP-GLES3.functional.shaders.",
        "constants.uint_octal_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001439,
        "dEQP-GLES3.functional.shaders.co",
        "nstants.uint_hexadecimal_0_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001440,
        "dEQP-GLES3.functional.shaders.con",
        "stants.uint_hexadecimal_0_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001441,
        "dEQP-GLES3.functional.shaders.co",
        "nstants.uint_hexadecimal_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001442,
        "dEQP-GLES3.functional.shaders.con",
        "stants.uint_hexadecimal_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001443,
        "dEQP-GLES3.functional.shaders.",
        "constants.int_from_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001444,
        "dEQP-GLES3.functional.shaders.c",
        "onstants.int_from_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001445,
        "dEQP-GLES3.functional.shaders.c",
        "onstants.int_from_uint_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001446,
        "dEQP-GLES3.functional.shaders.co",
        "nstants.int_from_uint_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001447,
        "dEQP-GLES3.functional.shaders.",
        "constants.uint_from_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001448,
        "dEQP-GLES3.functional.shaders.c",
        "onstants.uint_from_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001449,
        "dEQP-GLES3.functional.shaders.c",
        "onstants.uint_from_int_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001450,
        "dEQP-GLES3.functional.shaders.co",
        "nstants.uint_from_int_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001451,
        "dEQP-GLES3.functional.shaders.",
        "constants.int_from_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001452,
        "dEQP-GLES3.functional.shaders.c",
        "onstants.int_from_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001453,
        "dEQP-GLES3.functional.shaders.c",
        "onstants.uint_from_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001454,
        "dEQP-GLES3.functional.shaders.co",
        "nstants.uint_from_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001455,
        "dEQP-GLES3.functional.shaders.",
        "constants.bool_from_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001456,
        "dEQP-GLES3.functional.shaders.c",
        "onstants.bool_from_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001457,
        "dEQP-GLES3.functional.shaders.",
        "constants.bool_from_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001458,
        "dEQP-GLES3.functional.shaders.c",
        "onstants.bool_from_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001459,
        "dEQP-GLES3.functional.shaders.c",
        "onstants.bool_from_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001460,
        "dEQP-GLES3.functional.shaders.co",
        "nstants.bool_from_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001461,
        "dEQP-GLES3.functional.shaders.con",
        "stants.float_int_f_suffix_0_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001462,
        "dEQP-GLES3.functional.shaders.cons",
        "tants.float_int_f_suffix_0_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001463,
        "dEQP-GLES3.functional.shaders.con",
        "stants.float_int_f_suffix_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001464,
        "dEQP-GLES3.functional.shaders.cons",
        "tants.float_int_f_suffix_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001465,
        "dEQP-GLES3.functional.shaders",
        ".constants.int_l_suffix_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001466,
        "dEQP-GLES3.functional.shaders.",
        "constants.int_l_suffix_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001467,
        "dEQP-GLES3.functional.shaders.",
        "constants.uint_ul_suffix_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001468,
        "dEQP-GLES3.functional.shaders.c",
        "onstants.uint_ul_suffix_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001469,
        "dEQP-GLES3.functional.shaders.c",
        "onstants.invalid_octal_0_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001470,
        "dEQP-GLES3.functional.shaders.co",
        "nstants.invalid_octal_0_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001471,
        "dEQP-GLES3.functional.shaders.c",
        "onstants.invalid_octal_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001472,
        "dEQP-GLES3.functional.shaders.co",
        "nstants.invalid_octal_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001473,
        "dEQP-GLES3.functional.shaders.cons",
        "tants.invalid_hexadecimal_0_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001474,
        "dEQP-GLES3.functional.shaders.const",
        "ants.invalid_hexadecimal_0_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001475,
        "dEQP-GLES3.functional.shaders.cons",
        "tants.invalid_hexadecimal_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001476,
        "dEQP-GLES3.functional.shaders.const",
        "ants.invalid_hexadecimal_1_fragment");
