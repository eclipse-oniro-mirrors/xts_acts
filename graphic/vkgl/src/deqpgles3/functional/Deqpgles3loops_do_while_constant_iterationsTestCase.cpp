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
#include "../ActsDeqpgles30008TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007091,
        "dEQP-GLES3.functional.shaders.loops.do_whil",
        "e_constant_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007092,
        "dEQP-GLES3.functional.shaders.loops.do_while",
        "_constant_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007093,
        "dEQP-GLES3.functional.shaders.loops.do_while",
        "_constant_iterations.basic_lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007094,
        "dEQP-GLES3.functional.shaders.loops.do_while_",
        "constant_iterations.basic_lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007095,
        "dEQP-GLES3.functional.shaders.loops.do_while",
        "_constant_iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007096,
        "dEQP-GLES3.functional.shaders.loops.do_while_",
        "constant_iterations.basic_mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007097,
        "dEQP-GLES3.functional.shaders.loops.do_while_",
        "constant_iterations.basic_mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007098,
        "dEQP-GLES3.functional.shaders.loops.do_while_c",
        "onstant_iterations.basic_mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007099,
        "dEQP-GLES3.functional.shaders.loops.do_whil",
        "e_constant_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007100,
        "dEQP-GLES3.functional.shaders.loops.do_while",
        "_constant_iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007101,
        "dEQP-GLES3.functional.shaders.loops.do_while",
        "_constant_iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007102,
        "dEQP-GLES3.functional.shaders.loops.do_while_",
        "constant_iterations.basic_highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007103,
        "dEQP-GLES3.functional.shaders.loops.do_wh",
        "ile_constant_iterations.empty_body_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007104,
        "dEQP-GLES3.functional.shaders.loops.do_whi",
        "le_constant_iterations.empty_body_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007105,
        "dEQP-GLES3.functional.shaders.loops.do_while_constant_i",
        "terations.infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007106,
        "dEQP-GLES3.functional.shaders.loops.do_while_constant_it",
        "erations.infinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007107,
        "dEQP-GLES3.functional.shaders.loops.do_while_constant_i",
        "terations.infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007108,
        "dEQP-GLES3.functional.shaders.loops.do_while_constant_it",
        "erations.infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007109,
        "dEQP-GLES3.functional.shaders.loops.do_while_consta",
        "nt_iterations.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007110,
        "dEQP-GLES3.functional.shaders.loops.do_while_constan",
        "t_iterations.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007111,
        "dEQP-GLES3.functional.shaders.loops.do_while",
        "_constant_iterations.single_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007112,
        "dEQP-GLES3.functional.shaders.loops.do_while_",
        "constant_iterations.single_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007113,
        "dEQP-GLES3.functional.shaders.loops.do_while_",
        "constant_iterations.compound_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007114,
        "dEQP-GLES3.functional.shaders.loops.do_while_c",
        "onstant_iterations.compound_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007115,
        "dEQP-GLES3.functional.shaders.loops.do_while_",
        "constant_iterations.sequence_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007116,
        "dEQP-GLES3.functional.shaders.loops.do_while_c",
        "onstant_iterations.sequence_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007117,
        "dEQP-GLES3.functional.shaders.loops.do_while",
        "_constant_iterations.single_iteration_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007118,
        "dEQP-GLES3.functional.shaders.loops.do_while_",
        "constant_iterations.single_iteration_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007119,
        "dEQP-GLES3.functional.shaders.loops.do_while_co",
        "nstant_iterations.select_iteration_count_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007120,
        "dEQP-GLES3.functional.shaders.loops.do_while_con",
        "stant_iterations.select_iteration_count_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007121,
        "dEQP-GLES3.functional.shaders.loops.do_while_c",
        "onstant_iterations.conditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007122,
        "dEQP-GLES3.functional.shaders.loops.do_while_co",
        "nstant_iterations.conditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007123,
        "dEQP-GLES3.functional.shaders.loops.do_while_co",
        "nstant_iterations.unconditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007124,
        "dEQP-GLES3.functional.shaders.loops.do_while_con",
        "stant_iterations.unconditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007125,
        "dEQP-GLES3.functional.shaders.loops.do_whi",
        "le_constant_iterations.only_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007126,
        "dEQP-GLES3.functional.shaders.loops.do_whil",
        "e_constant_iterations.only_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007127,
        "dEQP-GLES3.functional.shaders.loops.do_whil",
        "e_constant_iterations.double_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007128,
        "dEQP-GLES3.functional.shaders.loops.do_while",
        "_constant_iterations.double_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007129,
        "dEQP-GLES3.functional.shaders.loops.do_while",
        "_constant_iterations.conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007130,
        "dEQP-GLES3.functional.shaders.loops.do_while_",
        "constant_iterations.conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007131,
        "dEQP-GLES3.functional.shaders.loops.do_while_",
        "constant_iterations.unconditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007132,
        "dEQP-GLES3.functional.shaders.loops.do_while_c",
        "onstant_iterations.unconditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007133,
        "dEQP-GLES3.functional.shaders.loops.do_whi",
        "le_constant_iterations.pre_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007134,
        "dEQP-GLES3.functional.shaders.loops.do_whil",
        "e_constant_iterations.pre_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007135,
        "dEQP-GLES3.functional.shaders.loops.do_whil",
        "e_constant_iterations.post_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007136,
        "dEQP-GLES3.functional.shaders.loops.do_while",
        "_constant_iterations.post_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007137,
        "dEQP-GLES3.functional.shaders.loops.do_while_c",
        "onstant_iterations.mixed_break_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007138,
        "dEQP-GLES3.functional.shaders.loops.do_while_co",
        "nstant_iterations.mixed_break_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007139,
        "dEQP-GLES3.functional.shaders.loops.do_whil",
        "e_constant_iterations.vector_counter_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007140,
        "dEQP-GLES3.functional.shaders.loops.do_while",
        "_constant_iterations.vector_counter_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007141,
        "dEQP-GLES3.functional.shaders.loops.do_whil",
        "e_constant_iterations.101_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007142,
        "dEQP-GLES3.functional.shaders.loops.do_while",
        "_constant_iterations.101_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007143,
        "dEQP-GLES3.functional.shaders.loops.do_w",
        "hile_constant_iterations.sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007144,
        "dEQP-GLES3.functional.shaders.loops.do_wh",
        "ile_constant_iterations.sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007145,
        "dEQP-GLES3.functional.shaders.loops.do_",
        "while_constant_iterations.nested_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007146,
        "dEQP-GLES3.functional.shaders.loops.do_w",
        "hile_constant_iterations.nested_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007147,
        "dEQP-GLES3.functional.shaders.loops.do_whil",
        "e_constant_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007148,
        "dEQP-GLES3.functional.shaders.loops.do_while",
        "_constant_iterations.nested_sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007149,
        "dEQP-GLES3.functional.shaders.loops.do_while_con",
        "stant_iterations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007150,
        "dEQP-GLES3.functional.shaders.loops.do_while_cons",
        "tant_iterations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007151,
        "dEQP-GLES3.functional.shaders.loops.do_while_con",
        "stant_iterations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007152,
        "dEQP-GLES3.functional.shaders.loops.do_while_cons",
        "tant_iterations.nested_tricky_dataflow_2_fragment");
