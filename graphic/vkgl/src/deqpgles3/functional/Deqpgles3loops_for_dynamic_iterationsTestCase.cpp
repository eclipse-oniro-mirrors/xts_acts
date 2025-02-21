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
#include "../ActsDeqpgles30007TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006835,
        "dEQP-GLES3.functional.shaders.loops.for_",
        "dynamic_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006836,
        "dEQP-GLES3.functional.shaders.loops.for_d",
        "ynamic_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006837,
        "dEQP-GLES3.functional.shaders.loops.for_d",
        "ynamic_iterations.basic_lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006838,
        "dEQP-GLES3.functional.shaders.loops.for_dy",
        "namic_iterations.basic_lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006839,
        "dEQP-GLES3.functional.shaders.loops.for_d",
        "ynamic_iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006840,
        "dEQP-GLES3.functional.shaders.loops.for_dy",
        "namic_iterations.basic_mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006841,
        "dEQP-GLES3.functional.shaders.loops.for_dy",
        "namic_iterations.basic_mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006842,
        "dEQP-GLES3.functional.shaders.loops.for_dyn",
        "amic_iterations.basic_mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006843,
        "dEQP-GLES3.functional.shaders.loops.for_",
        "dynamic_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006844,
        "dEQP-GLES3.functional.shaders.loops.for_d",
        "ynamic_iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006845,
        "dEQP-GLES3.functional.shaders.loops.for_d",
        "ynamic_iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006846,
        "dEQP-GLES3.functional.shaders.loops.for_dy",
        "namic_iterations.basic_highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006847,
        "dEQP-GLES3.functional.shaders.loops.fo",
        "r_dynamic_iterations.empty_body_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006848,
        "dEQP-GLES3.functional.shaders.loops.for",
        "_dynamic_iterations.empty_body_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006849,
        "dEQP-GLES3.functional.shaders.loops.for_dynamic_iter",
        "ations.infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006850,
        "dEQP-GLES3.functional.shaders.loops.for_dynamic_itera",
        "tions.infinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006851,
        "dEQP-GLES3.functional.shaders.loops.for_dynamic_iter",
        "ations.infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006852,
        "dEQP-GLES3.functional.shaders.loops.for_dynamic_itera",
        "tions.infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006853,
        "dEQP-GLES3.functional.shaders.loops.for_dynamic_",
        "iterations.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006854,
        "dEQP-GLES3.functional.shaders.loops.for_dynamic_i",
        "terations.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006855,
        "dEQP-GLES3.functional.shaders.loops.for_d",
        "ynamic_iterations.single_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006856,
        "dEQP-GLES3.functional.shaders.loops.for_dy",
        "namic_iterations.single_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006857,
        "dEQP-GLES3.functional.shaders.loops.for_dy",
        "namic_iterations.compound_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006858,
        "dEQP-GLES3.functional.shaders.loops.for_dyn",
        "amic_iterations.compound_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006859,
        "dEQP-GLES3.functional.shaders.loops.for_dy",
        "namic_iterations.sequence_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006860,
        "dEQP-GLES3.functional.shaders.loops.for_dyn",
        "amic_iterations.sequence_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006861,
        "dEQP-GLES3.functional.shaders.loops.for",
        "_dynamic_iterations.no_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006862,
        "dEQP-GLES3.functional.shaders.loops.for_",
        "dynamic_iterations.no_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006863,
        "dEQP-GLES3.functional.shaders.loops.for_d",
        "ynamic_iterations.single_iteration_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006864,
        "dEQP-GLES3.functional.shaders.loops.for_dy",
        "namic_iterations.single_iteration_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006865,
        "dEQP-GLES3.functional.shaders.loops.for_dyna",
        "mic_iterations.select_iteration_count_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006866,
        "dEQP-GLES3.functional.shaders.loops.for_dynam",
        "ic_iterations.select_iteration_count_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006867,
        "dEQP-GLES3.functional.shaders.loops.for_dyn",
        "amic_iterations.conditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006868,
        "dEQP-GLES3.functional.shaders.loops.for_dyna",
        "mic_iterations.conditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006869,
        "dEQP-GLES3.functional.shaders.loops.for_dyna",
        "mic_iterations.unconditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006870,
        "dEQP-GLES3.functional.shaders.loops.for_dynam",
        "ic_iterations.unconditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006871,
        "dEQP-GLES3.functional.shaders.loops.for",
        "_dynamic_iterations.only_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006872,
        "dEQP-GLES3.functional.shaders.loops.for_",
        "dynamic_iterations.only_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006873,
        "dEQP-GLES3.functional.shaders.loops.for_",
        "dynamic_iterations.double_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006874,
        "dEQP-GLES3.functional.shaders.loops.for_d",
        "ynamic_iterations.double_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006875,
        "dEQP-GLES3.functional.shaders.loops.for_d",
        "ynamic_iterations.conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006876,
        "dEQP-GLES3.functional.shaders.loops.for_dy",
        "namic_iterations.conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006877,
        "dEQP-GLES3.functional.shaders.loops.for_dy",
        "namic_iterations.unconditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006878,
        "dEQP-GLES3.functional.shaders.loops.for_dyn",
        "amic_iterations.unconditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006879,
        "dEQP-GLES3.functional.shaders.loops.for",
        "_dynamic_iterations.pre_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006880,
        "dEQP-GLES3.functional.shaders.loops.for_",
        "dynamic_iterations.pre_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006881,
        "dEQP-GLES3.functional.shaders.loops.for_",
        "dynamic_iterations.post_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006882,
        "dEQP-GLES3.functional.shaders.loops.for_d",
        "ynamic_iterations.post_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006883,
        "dEQP-GLES3.functional.shaders.loops.for_dyn",
        "amic_iterations.mixed_break_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006884,
        "dEQP-GLES3.functional.shaders.loops.for_dyna",
        "mic_iterations.mixed_break_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006885,
        "dEQP-GLES3.functional.shaders.loops.for_",
        "dynamic_iterations.vector_counter_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006886,
        "dEQP-GLES3.functional.shaders.loops.for_d",
        "ynamic_iterations.vector_counter_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006887,
        "dEQP-GLES3.functional.shaders.loops.for_",
        "dynamic_iterations.101_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006888,
        "dEQP-GLES3.functional.shaders.loops.for_d",
        "ynamic_iterations.101_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006889,
        "dEQP-GLES3.functional.shaders.loops.f",
        "or_dynamic_iterations.sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006890,
        "dEQP-GLES3.functional.shaders.loops.fo",
        "r_dynamic_iterations.sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006891,
        "dEQP-GLES3.functional.shaders.loops.",
        "for_dynamic_iterations.nested_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006892,
        "dEQP-GLES3.functional.shaders.loops.f",
        "or_dynamic_iterations.nested_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006893,
        "dEQP-GLES3.functional.shaders.loops.for_",
        "dynamic_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006894,
        "dEQP-GLES3.functional.shaders.loops.for_d",
        "ynamic_iterations.nested_sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006895,
        "dEQP-GLES3.functional.shaders.loops.for_dynam",
        "ic_iterations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006896,
        "dEQP-GLES3.functional.shaders.loops.for_dynami",
        "c_iterations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006897,
        "dEQP-GLES3.functional.shaders.loops.for_dynam",
        "ic_iterations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006898,
        "dEQP-GLES3.functional.shaders.loops.for_dynami",
        "c_iterations.nested_tricky_dataflow_2_fragment");
