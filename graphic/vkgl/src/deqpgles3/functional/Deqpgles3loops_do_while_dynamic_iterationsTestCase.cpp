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

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007215,
        "dEQP-GLES3.functional.shaders.loops.do_whi",
        "le_dynamic_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007216,
        "dEQP-GLES3.functional.shaders.loops.do_whil",
        "e_dynamic_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007217,
        "dEQP-GLES3.functional.shaders.loops.do_whil",
        "e_dynamic_iterations.basic_lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007218,
        "dEQP-GLES3.functional.shaders.loops.do_while",
        "_dynamic_iterations.basic_lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007219,
        "dEQP-GLES3.functional.shaders.loops.do_while",
        "_dynamic_iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007220,
        "dEQP-GLES3.functional.shaders.loops.do_while_",
        "dynamic_iterations.basic_mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007221,
        "dEQP-GLES3.functional.shaders.loops.do_while_",
        "dynamic_iterations.basic_mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007222,
        "dEQP-GLES3.functional.shaders.loops.do_while_d",
        "ynamic_iterations.basic_mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007223,
        "dEQP-GLES3.functional.shaders.loops.do_whil",
        "e_dynamic_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007224,
        "dEQP-GLES3.functional.shaders.loops.do_while",
        "_dynamic_iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007225,
        "dEQP-GLES3.functional.shaders.loops.do_while",
        "_dynamic_iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007226,
        "dEQP-GLES3.functional.shaders.loops.do_while_",
        "dynamic_iterations.basic_highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007227,
        "dEQP-GLES3.functional.shaders.loops.do_w",
        "hile_dynamic_iterations.empty_body_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007228,
        "dEQP-GLES3.functional.shaders.loops.do_wh",
        "ile_dynamic_iterations.empty_body_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007229,
        "dEQP-GLES3.functional.shaders.loops.do_while_dynamic_it",
        "erations.infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007230,
        "dEQP-GLES3.functional.shaders.loops.do_while_dynamic_ite",
        "rations.infinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007231,
        "dEQP-GLES3.functional.shaders.loops.do_while_dynamic_i",
        "terations.infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007232,
        "dEQP-GLES3.functional.shaders.loops.do_while_dynamic_it",
        "erations.infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007233,
        "dEQP-GLES3.functional.shaders.loops.do_while_dynami",
        "c_iterations.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007234,
        "dEQP-GLES3.functional.shaders.loops.do_while_dynamic",
        "_iterations.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007235,
        "dEQP-GLES3.functional.shaders.loops.do_whil",
        "e_dynamic_iterations.single_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007236,
        "dEQP-GLES3.functional.shaders.loops.do_while",
        "_dynamic_iterations.single_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007237,
        "dEQP-GLES3.functional.shaders.loops.do_while",
        "_dynamic_iterations.compound_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007238,
        "dEQP-GLES3.functional.shaders.loops.do_while_",
        "dynamic_iterations.compound_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007239,
        "dEQP-GLES3.functional.shaders.loops.do_while",
        "_dynamic_iterations.sequence_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007240,
        "dEQP-GLES3.functional.shaders.loops.do_while_",
        "dynamic_iterations.sequence_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007241,
        "dEQP-GLES3.functional.shaders.loops.do_whil",
        "e_dynamic_iterations.single_iteration_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007242,
        "dEQP-GLES3.functional.shaders.loops.do_while",
        "_dynamic_iterations.single_iteration_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007243,
        "dEQP-GLES3.functional.shaders.loops.do_while_d",
        "ynamic_iterations.select_iteration_count_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007244,
        "dEQP-GLES3.functional.shaders.loops.do_while_dy",
        "namic_iterations.select_iteration_count_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007245,
        "dEQP-GLES3.functional.shaders.loops.do_while_",
        "dynamic_iterations.conditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007246,
        "dEQP-GLES3.functional.shaders.loops.do_while_d",
        "ynamic_iterations.conditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007247,
        "dEQP-GLES3.functional.shaders.loops.do_while_d",
        "ynamic_iterations.unconditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007248,
        "dEQP-GLES3.functional.shaders.loops.do_while_dy",
        "namic_iterations.unconditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007249,
        "dEQP-GLES3.functional.shaders.loops.do_whi",
        "le_dynamic_iterations.only_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007250,
        "dEQP-GLES3.functional.shaders.loops.do_whil",
        "e_dynamic_iterations.only_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007251,
        "dEQP-GLES3.functional.shaders.loops.do_whil",
        "e_dynamic_iterations.double_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007252,
        "dEQP-GLES3.functional.shaders.loops.do_while",
        "_dynamic_iterations.double_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007253,
        "dEQP-GLES3.functional.shaders.loops.do_while",
        "_dynamic_iterations.conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007254,
        "dEQP-GLES3.functional.shaders.loops.do_while_",
        "dynamic_iterations.conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007255,
        "dEQP-GLES3.functional.shaders.loops.do_while_",
        "dynamic_iterations.unconditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007256,
        "dEQP-GLES3.functional.shaders.loops.do_while_d",
        "ynamic_iterations.unconditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007257,
        "dEQP-GLES3.functional.shaders.loops.do_whi",
        "le_dynamic_iterations.pre_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007258,
        "dEQP-GLES3.functional.shaders.loops.do_whil",
        "e_dynamic_iterations.pre_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007259,
        "dEQP-GLES3.functional.shaders.loops.do_whi",
        "le_dynamic_iterations.post_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007260,
        "dEQP-GLES3.functional.shaders.loops.do_whil",
        "e_dynamic_iterations.post_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007261,
        "dEQP-GLES3.functional.shaders.loops.do_while_",
        "dynamic_iterations.mixed_break_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007262,
        "dEQP-GLES3.functional.shaders.loops.do_while_d",
        "ynamic_iterations.mixed_break_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007263,
        "dEQP-GLES3.functional.shaders.loops.do_whi",
        "le_dynamic_iterations.vector_counter_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007264,
        "dEQP-GLES3.functional.shaders.loops.do_whil",
        "e_dynamic_iterations.vector_counter_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007265,
        "dEQP-GLES3.functional.shaders.loops.do_whi",
        "le_dynamic_iterations.101_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007266,
        "dEQP-GLES3.functional.shaders.loops.do_whil",
        "e_dynamic_iterations.101_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007267,
        "dEQP-GLES3.functional.shaders.loops.do_",
        "while_dynamic_iterations.sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007268,
        "dEQP-GLES3.functional.shaders.loops.do_w",
        "hile_dynamic_iterations.sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007269,
        "dEQP-GLES3.functional.shaders.loops.do",
        "_while_dynamic_iterations.nested_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007270,
        "dEQP-GLES3.functional.shaders.loops.do_",
        "while_dynamic_iterations.nested_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007271,
        "dEQP-GLES3.functional.shaders.loops.do_whil",
        "e_dynamic_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007272,
        "dEQP-GLES3.functional.shaders.loops.do_while",
        "_dynamic_iterations.nested_sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007273,
        "dEQP-GLES3.functional.shaders.loops.do_while_dy",
        "namic_iterations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007274,
        "dEQP-GLES3.functional.shaders.loops.do_while_dyn",
        "amic_iterations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007275,
        "dEQP-GLES3.functional.shaders.loops.do_while_dy",
        "namic_iterations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007276,
        "dEQP-GLES3.functional.shaders.loops.do_while_dyn",
        "amic_iterations.nested_tricky_dataflow_2_fragment");
