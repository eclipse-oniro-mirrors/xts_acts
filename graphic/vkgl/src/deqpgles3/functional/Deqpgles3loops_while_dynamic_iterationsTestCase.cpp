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

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007027,
        "dEQP-GLES3.functional.shaders.loops.while",
        "_dynamic_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007028,
        "dEQP-GLES3.functional.shaders.loops.while_",
        "dynamic_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007029,
        "dEQP-GLES3.functional.shaders.loops.while_",
        "dynamic_iterations.basic_lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007030,
        "dEQP-GLES3.functional.shaders.loops.while_d",
        "ynamic_iterations.basic_lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007031,
        "dEQP-GLES3.functional.shaders.loops.while_",
        "dynamic_iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007032,
        "dEQP-GLES3.functional.shaders.loops.while_d",
        "ynamic_iterations.basic_mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007033,
        "dEQP-GLES3.functional.shaders.loops.while_d",
        "ynamic_iterations.basic_mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007034,
        "dEQP-GLES3.functional.shaders.loops.while_dy",
        "namic_iterations.basic_mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007035,
        "dEQP-GLES3.functional.shaders.loops.while",
        "_dynamic_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007036,
        "dEQP-GLES3.functional.shaders.loops.while_",
        "dynamic_iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007037,
        "dEQP-GLES3.functional.shaders.loops.while_",
        "dynamic_iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007038,
        "dEQP-GLES3.functional.shaders.loops.while_d",
        "ynamic_iterations.basic_highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007039,
        "dEQP-GLES3.functional.shaders.loops.whi",
        "le_dynamic_iterations.empty_body_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007040,
        "dEQP-GLES3.functional.shaders.loops.whil",
        "e_dynamic_iterations.empty_body_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007041,
        "dEQP-GLES3.functional.shaders.loops.while_dynamic_ite",
        "rations.infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007042,
        "dEQP-GLES3.functional.shaders.loops.while_dynamic_iter",
        "ations.infinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007043,
        "dEQP-GLES3.functional.shaders.loops.while_dynamic_ite",
        "rations.infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007044,
        "dEQP-GLES3.functional.shaders.loops.while_dynamic_iter",
        "ations.infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007045,
        "dEQP-GLES3.functional.shaders.loops.while_dynamic",
        "_iterations.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007046,
        "dEQP-GLES3.functional.shaders.loops.while_dynamic_",
        "iterations.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007047,
        "dEQP-GLES3.functional.shaders.loops.while_",
        "dynamic_iterations.single_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007048,
        "dEQP-GLES3.functional.shaders.loops.while_d",
        "ynamic_iterations.single_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007049,
        "dEQP-GLES3.functional.shaders.loops.while_d",
        "ynamic_iterations.compound_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007050,
        "dEQP-GLES3.functional.shaders.loops.while_dy",
        "namic_iterations.compound_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007051,
        "dEQP-GLES3.functional.shaders.loops.while_d",
        "ynamic_iterations.sequence_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007052,
        "dEQP-GLES3.functional.shaders.loops.while_dy",
        "namic_iterations.sequence_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007053,
        "dEQP-GLES3.functional.shaders.loops.whil",
        "e_dynamic_iterations.no_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007054,
        "dEQP-GLES3.functional.shaders.loops.while",
        "_dynamic_iterations.no_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007055,
        "dEQP-GLES3.functional.shaders.loops.while_",
        "dynamic_iterations.single_iteration_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007056,
        "dEQP-GLES3.functional.shaders.loops.while_d",
        "ynamic_iterations.single_iteration_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007057,
        "dEQP-GLES3.functional.shaders.loops.while_dyn",
        "amic_iterations.select_iteration_count_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007058,
        "dEQP-GLES3.functional.shaders.loops.while_dyna",
        "mic_iterations.select_iteration_count_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007059,
        "dEQP-GLES3.functional.shaders.loops.while_dy",
        "namic_iterations.conditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007060,
        "dEQP-GLES3.functional.shaders.loops.while_dyn",
        "amic_iterations.conditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007061,
        "dEQP-GLES3.functional.shaders.loops.while_dyn",
        "amic_iterations.unconditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007062,
        "dEQP-GLES3.functional.shaders.loops.while_dyna",
        "mic_iterations.unconditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007063,
        "dEQP-GLES3.functional.shaders.loops.whil",
        "e_dynamic_iterations.only_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007064,
        "dEQP-GLES3.functional.shaders.loops.while",
        "_dynamic_iterations.only_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007065,
        "dEQP-GLES3.functional.shaders.loops.while",
        "_dynamic_iterations.double_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007066,
        "dEQP-GLES3.functional.shaders.loops.while_",
        "dynamic_iterations.double_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007067,
        "dEQP-GLES3.functional.shaders.loops.while_",
        "dynamic_iterations.conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007068,
        "dEQP-GLES3.functional.shaders.loops.while_d",
        "ynamic_iterations.conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007069,
        "dEQP-GLES3.functional.shaders.loops.while_d",
        "ynamic_iterations.unconditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007070,
        "dEQP-GLES3.functional.shaders.loops.while_dy",
        "namic_iterations.unconditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007071,
        "dEQP-GLES3.functional.shaders.loops.whil",
        "e_dynamic_iterations.pre_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007072,
        "dEQP-GLES3.functional.shaders.loops.while",
        "_dynamic_iterations.pre_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007073,
        "dEQP-GLES3.functional.shaders.loops.while",
        "_dynamic_iterations.post_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007074,
        "dEQP-GLES3.functional.shaders.loops.while_",
        "dynamic_iterations.post_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007075,
        "dEQP-GLES3.functional.shaders.loops.while_dy",
        "namic_iterations.mixed_break_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007076,
        "dEQP-GLES3.functional.shaders.loops.while_dyn",
        "amic_iterations.mixed_break_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007077,
        "dEQP-GLES3.functional.shaders.loops.while",
        "_dynamic_iterations.vector_counter_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007078,
        "dEQP-GLES3.functional.shaders.loops.while_",
        "dynamic_iterations.vector_counter_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007079,
        "dEQP-GLES3.functional.shaders.loops.while",
        "_dynamic_iterations.101_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007080,
        "dEQP-GLES3.functional.shaders.loops.while_",
        "dynamic_iterations.101_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007081,
        "dEQP-GLES3.functional.shaders.loops.wh",
        "ile_dynamic_iterations.sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007082,
        "dEQP-GLES3.functional.shaders.loops.whi",
        "le_dynamic_iterations.sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007083,
        "dEQP-GLES3.functional.shaders.loops.w",
        "hile_dynamic_iterations.nested_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007084,
        "dEQP-GLES3.functional.shaders.loops.wh",
        "ile_dynamic_iterations.nested_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007085,
        "dEQP-GLES3.functional.shaders.loops.while",
        "_dynamic_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007086,
        "dEQP-GLES3.functional.shaders.loops.while_",
        "dynamic_iterations.nested_sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007087,
        "dEQP-GLES3.functional.shaders.loops.while_dyna",
        "mic_iterations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007088,
        "dEQP-GLES3.functional.shaders.loops.while_dynam",
        "ic_iterations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007089,
        "dEQP-GLES3.functional.shaders.loops.while_dyna",
        "mic_iterations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007090,
        "dEQP-GLES3.functional.shaders.loops.while_dynam",
        "ic_iterations.nested_tricky_dataflow_2_fragment");
