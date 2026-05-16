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
#include "../ActsDeqpgles20004TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003517,
        "dEQP-GLES2.functional.shaders.loops.while",
        "_constant_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003518,
        "dEQP-GLES2.functional.shaders.loops.while_",
        "constant_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003519,
        "dEQP-GLES2.functional.shaders.loops.while_",
        "constant_iterations.basic_lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003520,
        "dEQP-GLES2.functional.shaders.loops.while_c",
        "onstant_iterations.basic_lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003521,
        "dEQP-GLES2.functional.shaders.loops.while_c",
        "onstant_iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003522,
        "dEQP-GLES2.functional.shaders.loops.while_co",
        "nstant_iterations.basic_mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003523,
        "dEQP-GLES2.functional.shaders.loops.while_co",
        "nstant_iterations.basic_mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003524,
        "dEQP-GLES2.functional.shaders.loops.while_con",
        "stant_iterations.basic_mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003525,
        "dEQP-GLES2.functional.shaders.loops.while_",
        "constant_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003526,
        "dEQP-GLES2.functional.shaders.loops.while_c",
        "onstant_iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003527,
        "dEQP-GLES2.functional.shaders.loops.while_c",
        "onstant_iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003528,
        "dEQP-GLES2.functional.shaders.loops.while_co",
        "nstant_iterations.basic_highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003529,
        "dEQP-GLES2.functional.shaders.loops.whi",
        "le_constant_iterations.empty_body_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003530,
        "dEQP-GLES2.functional.shaders.loops.whil",
        "e_constant_iterations.empty_body_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003531,
        "dEQP-GLES2.functional.shaders.loops.while_constant_ite",
        "rations.infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003532,
        "dEQP-GLES2.functional.shaders.loops.while_constant_iter",
        "ations.infinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003533,
        "dEQP-GLES2.functional.shaders.loops.while_constant_it",
        "erations.infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003534,
        "dEQP-GLES2.functional.shaders.loops.while_constant_ite",
        "rations.infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003535,
        "dEQP-GLES2.functional.shaders.loops.while_constant",
        "_iterations.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003536,
        "dEQP-GLES2.functional.shaders.loops.while_constant_",
        "iterations.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003537,
        "dEQP-GLES2.functional.shaders.loops.while_",
        "constant_iterations.single_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003538,
        "dEQP-GLES2.functional.shaders.loops.while_c",
        "onstant_iterations.single_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003539,
        "dEQP-GLES2.functional.shaders.loops.while_c",
        "onstant_iterations.compound_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003540,
        "dEQP-GLES2.functional.shaders.loops.while_co",
        "nstant_iterations.compound_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003541,
        "dEQP-GLES2.functional.shaders.loops.while_c",
        "onstant_iterations.sequence_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003542,
        "dEQP-GLES2.functional.shaders.loops.while_co",
        "nstant_iterations.sequence_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003543,
        "dEQP-GLES2.functional.shaders.loops.while",
        "_constant_iterations.no_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003544,
        "dEQP-GLES2.functional.shaders.loops.while_",
        "constant_iterations.no_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003545,
        "dEQP-GLES2.functional.shaders.loops.while_",
        "constant_iterations.single_iteration_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003546,
        "dEQP-GLES2.functional.shaders.loops.while_c",
        "onstant_iterations.single_iteration_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003547,
        "dEQP-GLES2.functional.shaders.loops.while_con",
        "stant_iterations.select_iteration_count_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003548,
        "dEQP-GLES2.functional.shaders.loops.while_cons",
        "tant_iterations.select_iteration_count_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003549,
        "dEQP-GLES2.functional.shaders.loops.while_co",
        "nstant_iterations.conditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003550,
        "dEQP-GLES2.functional.shaders.loops.while_con",
        "stant_iterations.conditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003551,
        "dEQP-GLES2.functional.shaders.loops.while_con",
        "stant_iterations.unconditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003552,
        "dEQP-GLES2.functional.shaders.loops.while_cons",
        "tant_iterations.unconditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003553,
        "dEQP-GLES2.functional.shaders.loops.while",
        "_constant_iterations.only_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003554,
        "dEQP-GLES2.functional.shaders.loops.while_",
        "constant_iterations.only_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003555,
        "dEQP-GLES2.functional.shaders.loops.while_",
        "constant_iterations.double_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003556,
        "dEQP-GLES2.functional.shaders.loops.while_c",
        "onstant_iterations.double_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003557,
        "dEQP-GLES2.functional.shaders.loops.while_c",
        "onstant_iterations.conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003558,
        "dEQP-GLES2.functional.shaders.loops.while_co",
        "nstant_iterations.conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003559,
        "dEQP-GLES2.functional.shaders.loops.while_co",
        "nstant_iterations.unconditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003560,
        "dEQP-GLES2.functional.shaders.loops.while_con",
        "stant_iterations.unconditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003561,
        "dEQP-GLES2.functional.shaders.loops.while",
        "_constant_iterations.pre_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003562,
        "dEQP-GLES2.functional.shaders.loops.while_",
        "constant_iterations.pre_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003563,
        "dEQP-GLES2.functional.shaders.loops.while",
        "_constant_iterations.post_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003564,
        "dEQP-GLES2.functional.shaders.loops.while_",
        "constant_iterations.post_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003565,
        "dEQP-GLES2.functional.shaders.loops.while_co",
        "nstant_iterations.mixed_break_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003566,
        "dEQP-GLES2.functional.shaders.loops.while_con",
        "stant_iterations.mixed_break_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003567,
        "dEQP-GLES2.functional.shaders.loops.while",
        "_constant_iterations.vector_counter_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003568,
        "dEQP-GLES2.functional.shaders.loops.while_",
        "constant_iterations.vector_counter_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003569,
        "dEQP-GLES2.functional.shaders.loops.while",
        "_constant_iterations.101_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003570,
        "dEQP-GLES2.functional.shaders.loops.while_",
        "constant_iterations.101_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003571,
        "dEQP-GLES2.functional.shaders.loops.wh",
        "ile_constant_iterations.sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003572,
        "dEQP-GLES2.functional.shaders.loops.whi",
        "le_constant_iterations.sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003573,
        "dEQP-GLES2.functional.shaders.loops.w",
        "hile_constant_iterations.nested_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003574,
        "dEQP-GLES2.functional.shaders.loops.wh",
        "ile_constant_iterations.nested_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003575,
        "dEQP-GLES2.functional.shaders.loops.while_",
        "constant_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003576,
        "dEQP-GLES2.functional.shaders.loops.while_c",
        "onstant_iterations.nested_sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003577,
        "dEQP-GLES2.functional.shaders.loops.while_cons",
        "tant_iterations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003578,
        "dEQP-GLES2.functional.shaders.loops.while_const",
        "ant_iterations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003579,
        "dEQP-GLES2.functional.shaders.loops.while_cons",
        "tant_iterations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003580,
        "dEQP-GLES2.functional.shaders.loops.while_const",
        "ant_iterations.nested_tricky_dataflow_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003581,
        "dEQP-GLES2.functional.shaders.loops.while_",
        "constant_iterations.conditional_body_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003582,
        "dEQP-GLES2.functional.shaders.loops.while_c",
        "onstant_iterations.conditional_body_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003583,
        "dEQP-GLES2.functional.shaders.loops.while_co",
        "nstant_iterations.function_call_return_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003584,
        "dEQP-GLES2.functional.shaders.loops.while_con",
        "stant_iterations.function_call_return_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003585,
        "dEQP-GLES2.functional.shaders.loops.while_co",
        "nstant_iterations.function_call_inout_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003586,
        "dEQP-GLES2.functional.shaders.loops.while_con",
        "stant_iterations.function_call_inout_fragment");
