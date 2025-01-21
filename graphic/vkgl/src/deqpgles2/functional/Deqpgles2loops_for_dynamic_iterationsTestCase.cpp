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

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003447,
        "dEQP-GLES2.functional.shaders.loops.for_",
        "dynamic_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003448,
        "dEQP-GLES2.functional.shaders.loops.for_d",
        "ynamic_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003449,
        "dEQP-GLES2.functional.shaders.loops.for_d",
        "ynamic_iterations.basic_lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003450,
        "dEQP-GLES2.functional.shaders.loops.for_dy",
        "namic_iterations.basic_lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003451,
        "dEQP-GLES2.functional.shaders.loops.for_d",
        "ynamic_iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003452,
        "dEQP-GLES2.functional.shaders.loops.for_dy",
        "namic_iterations.basic_mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003453,
        "dEQP-GLES2.functional.shaders.loops.for_dy",
        "namic_iterations.basic_mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003454,
        "dEQP-GLES2.functional.shaders.loops.for_dyn",
        "amic_iterations.basic_mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003455,
        "dEQP-GLES2.functional.shaders.loops.for_",
        "dynamic_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003456,
        "dEQP-GLES2.functional.shaders.loops.for_d",
        "ynamic_iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003457,
        "dEQP-GLES2.functional.shaders.loops.for_d",
        "ynamic_iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003458,
        "dEQP-GLES2.functional.shaders.loops.for_dy",
        "namic_iterations.basic_highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003459,
        "dEQP-GLES2.functional.shaders.loops.fo",
        "r_dynamic_iterations.empty_body_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003460,
        "dEQP-GLES2.functional.shaders.loops.for",
        "_dynamic_iterations.empty_body_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003461,
        "dEQP-GLES2.functional.shaders.loops.for_dynamic_iter",
        "ations.infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003462,
        "dEQP-GLES2.functional.shaders.loops.for_dynamic_itera",
        "tions.infinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003463,
        "dEQP-GLES2.functional.shaders.loops.for_dynamic_iter",
        "ations.infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003464,
        "dEQP-GLES2.functional.shaders.loops.for_dynamic_itera",
        "tions.infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003465,
        "dEQP-GLES2.functional.shaders.loops.for_dynamic_",
        "iterations.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003466,
        "dEQP-GLES2.functional.shaders.loops.for_dynamic_i",
        "terations.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003467,
        "dEQP-GLES2.functional.shaders.loops.for_d",
        "ynamic_iterations.single_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003468,
        "dEQP-GLES2.functional.shaders.loops.for_dy",
        "namic_iterations.single_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003469,
        "dEQP-GLES2.functional.shaders.loops.for_dy",
        "namic_iterations.compound_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003470,
        "dEQP-GLES2.functional.shaders.loops.for_dyn",
        "amic_iterations.compound_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003471,
        "dEQP-GLES2.functional.shaders.loops.for_dy",
        "namic_iterations.sequence_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003472,
        "dEQP-GLES2.functional.shaders.loops.for_dyn",
        "amic_iterations.sequence_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003473,
        "dEQP-GLES2.functional.shaders.loops.for",
        "_dynamic_iterations.no_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003474,
        "dEQP-GLES2.functional.shaders.loops.for_",
        "dynamic_iterations.no_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003475,
        "dEQP-GLES2.functional.shaders.loops.for_d",
        "ynamic_iterations.single_iteration_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003476,
        "dEQP-GLES2.functional.shaders.loops.for_dy",
        "namic_iterations.single_iteration_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003477,
        "dEQP-GLES2.functional.shaders.loops.for_dyna",
        "mic_iterations.select_iteration_count_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003478,
        "dEQP-GLES2.functional.shaders.loops.for_dynam",
        "ic_iterations.select_iteration_count_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003479,
        "dEQP-GLES2.functional.shaders.loops.for_dyn",
        "amic_iterations.conditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003480,
        "dEQP-GLES2.functional.shaders.loops.for_dyna",
        "mic_iterations.conditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003481,
        "dEQP-GLES2.functional.shaders.loops.for_dyna",
        "mic_iterations.unconditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003482,
        "dEQP-GLES2.functional.shaders.loops.for_dynam",
        "ic_iterations.unconditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003483,
        "dEQP-GLES2.functional.shaders.loops.for",
        "_dynamic_iterations.only_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003484,
        "dEQP-GLES2.functional.shaders.loops.for_",
        "dynamic_iterations.only_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003485,
        "dEQP-GLES2.functional.shaders.loops.for_",
        "dynamic_iterations.double_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003486,
        "dEQP-GLES2.functional.shaders.loops.for_d",
        "ynamic_iterations.double_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003487,
        "dEQP-GLES2.functional.shaders.loops.for_d",
        "ynamic_iterations.conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003488,
        "dEQP-GLES2.functional.shaders.loops.for_dy",
        "namic_iterations.conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003489,
        "dEQP-GLES2.functional.shaders.loops.for_dy",
        "namic_iterations.unconditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003490,
        "dEQP-GLES2.functional.shaders.loops.for_dyn",
        "amic_iterations.unconditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003491,
        "dEQP-GLES2.functional.shaders.loops.for",
        "_dynamic_iterations.pre_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003492,
        "dEQP-GLES2.functional.shaders.loops.for_",
        "dynamic_iterations.pre_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003493,
        "dEQP-GLES2.functional.shaders.loops.for_",
        "dynamic_iterations.post_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003494,
        "dEQP-GLES2.functional.shaders.loops.for_d",
        "ynamic_iterations.post_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003495,
        "dEQP-GLES2.functional.shaders.loops.for_dyn",
        "amic_iterations.mixed_break_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003496,
        "dEQP-GLES2.functional.shaders.loops.for_dyna",
        "mic_iterations.mixed_break_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003497,
        "dEQP-GLES2.functional.shaders.loops.for_",
        "dynamic_iterations.vector_counter_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003498,
        "dEQP-GLES2.functional.shaders.loops.for_d",
        "ynamic_iterations.vector_counter_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003499,
        "dEQP-GLES2.functional.shaders.loops.for_",
        "dynamic_iterations.101_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003500,
        "dEQP-GLES2.functional.shaders.loops.for_d",
        "ynamic_iterations.101_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003501,
        "dEQP-GLES2.functional.shaders.loops.f",
        "or_dynamic_iterations.sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003502,
        "dEQP-GLES2.functional.shaders.loops.fo",
        "r_dynamic_iterations.sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003503,
        "dEQP-GLES2.functional.shaders.loops.",
        "for_dynamic_iterations.nested_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003504,
        "dEQP-GLES2.functional.shaders.loops.f",
        "or_dynamic_iterations.nested_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003505,
        "dEQP-GLES2.functional.shaders.loops.for_",
        "dynamic_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003506,
        "dEQP-GLES2.functional.shaders.loops.for_d",
        "ynamic_iterations.nested_sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003507,
        "dEQP-GLES2.functional.shaders.loops.for_dynam",
        "ic_iterations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003508,
        "dEQP-GLES2.functional.shaders.loops.for_dynami",
        "c_iterations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003509,
        "dEQP-GLES2.functional.shaders.loops.for_dynam",
        "ic_iterations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003510,
        "dEQP-GLES2.functional.shaders.loops.for_dynami",
        "c_iterations.nested_tricky_dataflow_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003511,
        "dEQP-GLES2.functional.shaders.loops.for_d",
        "ynamic_iterations.conditional_body_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003512,
        "dEQP-GLES2.functional.shaders.loops.for_dy",
        "namic_iterations.conditional_body_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003513,
        "dEQP-GLES2.functional.shaders.loops.for_dyn",
        "amic_iterations.function_call_return_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003514,
        "dEQP-GLES2.functional.shaders.loops.for_dyna",
        "mic_iterations.function_call_return_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003515,
        "dEQP-GLES2.functional.shaders.loops.for_dy",
        "namic_iterations.function_call_inout_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003516,
        "dEQP-GLES2.functional.shaders.loops.for_dyn",
        "amic_iterations.function_call_inout_fragment");
