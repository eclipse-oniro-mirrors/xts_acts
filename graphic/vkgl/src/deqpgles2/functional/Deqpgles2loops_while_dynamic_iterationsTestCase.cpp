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

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003657,
        "dEQP-GLES2.functional.shaders.loops.while",
        "_dynamic_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003658,
        "dEQP-GLES2.functional.shaders.loops.while_",
        "dynamic_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003659,
        "dEQP-GLES2.functional.shaders.loops.while_",
        "dynamic_iterations.basic_lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003660,
        "dEQP-GLES2.functional.shaders.loops.while_d",
        "ynamic_iterations.basic_lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003661,
        "dEQP-GLES2.functional.shaders.loops.while_",
        "dynamic_iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003662,
        "dEQP-GLES2.functional.shaders.loops.while_d",
        "ynamic_iterations.basic_mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003663,
        "dEQP-GLES2.functional.shaders.loops.while_d",
        "ynamic_iterations.basic_mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003664,
        "dEQP-GLES2.functional.shaders.loops.while_dy",
        "namic_iterations.basic_mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003665,
        "dEQP-GLES2.functional.shaders.loops.while",
        "_dynamic_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003666,
        "dEQP-GLES2.functional.shaders.loops.while_",
        "dynamic_iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003667,
        "dEQP-GLES2.functional.shaders.loops.while_",
        "dynamic_iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003668,
        "dEQP-GLES2.functional.shaders.loops.while_d",
        "ynamic_iterations.basic_highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003669,
        "dEQP-GLES2.functional.shaders.loops.whi",
        "le_dynamic_iterations.empty_body_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003670,
        "dEQP-GLES2.functional.shaders.loops.whil",
        "e_dynamic_iterations.empty_body_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003671,
        "dEQP-GLES2.functional.shaders.loops.while_dynamic_ite",
        "rations.infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003672,
        "dEQP-GLES2.functional.shaders.loops.while_dynamic_iter",
        "ations.infinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003673,
        "dEQP-GLES2.functional.shaders.loops.while_dynamic_ite",
        "rations.infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003674,
        "dEQP-GLES2.functional.shaders.loops.while_dynamic_iter",
        "ations.infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003675,
        "dEQP-GLES2.functional.shaders.loops.while_dynamic",
        "_iterations.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003676,
        "dEQP-GLES2.functional.shaders.loops.while_dynamic_",
        "iterations.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003677,
        "dEQP-GLES2.functional.shaders.loops.while_",
        "dynamic_iterations.single_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003678,
        "dEQP-GLES2.functional.shaders.loops.while_d",
        "ynamic_iterations.single_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003679,
        "dEQP-GLES2.functional.shaders.loops.while_d",
        "ynamic_iterations.compound_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003680,
        "dEQP-GLES2.functional.shaders.loops.while_dy",
        "namic_iterations.compound_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003681,
        "dEQP-GLES2.functional.shaders.loops.while_d",
        "ynamic_iterations.sequence_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003682,
        "dEQP-GLES2.functional.shaders.loops.while_dy",
        "namic_iterations.sequence_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003683,
        "dEQP-GLES2.functional.shaders.loops.whil",
        "e_dynamic_iterations.no_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003684,
        "dEQP-GLES2.functional.shaders.loops.while",
        "_dynamic_iterations.no_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003685,
        "dEQP-GLES2.functional.shaders.loops.while_",
        "dynamic_iterations.single_iteration_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003686,
        "dEQP-GLES2.functional.shaders.loops.while_d",
        "ynamic_iterations.single_iteration_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003687,
        "dEQP-GLES2.functional.shaders.loops.while_dyn",
        "amic_iterations.select_iteration_count_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003688,
        "dEQP-GLES2.functional.shaders.loops.while_dyna",
        "mic_iterations.select_iteration_count_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003689,
        "dEQP-GLES2.functional.shaders.loops.while_dy",
        "namic_iterations.conditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003690,
        "dEQP-GLES2.functional.shaders.loops.while_dyn",
        "amic_iterations.conditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003691,
        "dEQP-GLES2.functional.shaders.loops.while_dyn",
        "amic_iterations.unconditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003692,
        "dEQP-GLES2.functional.shaders.loops.while_dyna",
        "mic_iterations.unconditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003693,
        "dEQP-GLES2.functional.shaders.loops.whil",
        "e_dynamic_iterations.only_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003694,
        "dEQP-GLES2.functional.shaders.loops.while",
        "_dynamic_iterations.only_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003695,
        "dEQP-GLES2.functional.shaders.loops.while",
        "_dynamic_iterations.double_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003696,
        "dEQP-GLES2.functional.shaders.loops.while_",
        "dynamic_iterations.double_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003697,
        "dEQP-GLES2.functional.shaders.loops.while_",
        "dynamic_iterations.conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003698,
        "dEQP-GLES2.functional.shaders.loops.while_d",
        "ynamic_iterations.conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003699,
        "dEQP-GLES2.functional.shaders.loops.while_d",
        "ynamic_iterations.unconditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003700,
        "dEQP-GLES2.functional.shaders.loops.while_dy",
        "namic_iterations.unconditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003701,
        "dEQP-GLES2.functional.shaders.loops.whil",
        "e_dynamic_iterations.pre_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003702,
        "dEQP-GLES2.functional.shaders.loops.while",
        "_dynamic_iterations.pre_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003703,
        "dEQP-GLES2.functional.shaders.loops.while",
        "_dynamic_iterations.post_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003704,
        "dEQP-GLES2.functional.shaders.loops.while_",
        "dynamic_iterations.post_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003705,
        "dEQP-GLES2.functional.shaders.loops.while_dy",
        "namic_iterations.mixed_break_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003706,
        "dEQP-GLES2.functional.shaders.loops.while_dyn",
        "amic_iterations.mixed_break_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003707,
        "dEQP-GLES2.functional.shaders.loops.while",
        "_dynamic_iterations.vector_counter_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003708,
        "dEQP-GLES2.functional.shaders.loops.while_",
        "dynamic_iterations.vector_counter_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003709,
        "dEQP-GLES2.functional.shaders.loops.while",
        "_dynamic_iterations.101_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003710,
        "dEQP-GLES2.functional.shaders.loops.while_",
        "dynamic_iterations.101_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003711,
        "dEQP-GLES2.functional.shaders.loops.wh",
        "ile_dynamic_iterations.sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003712,
        "dEQP-GLES2.functional.shaders.loops.whi",
        "le_dynamic_iterations.sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003713,
        "dEQP-GLES2.functional.shaders.loops.w",
        "hile_dynamic_iterations.nested_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003714,
        "dEQP-GLES2.functional.shaders.loops.wh",
        "ile_dynamic_iterations.nested_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003715,
        "dEQP-GLES2.functional.shaders.loops.while",
        "_dynamic_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003716,
        "dEQP-GLES2.functional.shaders.loops.while_",
        "dynamic_iterations.nested_sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003717,
        "dEQP-GLES2.functional.shaders.loops.while_dyna",
        "mic_iterations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003718,
        "dEQP-GLES2.functional.shaders.loops.while_dynam",
        "ic_iterations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003719,
        "dEQP-GLES2.functional.shaders.loops.while_dyna",
        "mic_iterations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003720,
        "dEQP-GLES2.functional.shaders.loops.while_dynam",
        "ic_iterations.nested_tricky_dataflow_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003721,
        "dEQP-GLES2.functional.shaders.loops.while_",
        "dynamic_iterations.conditional_body_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003722,
        "dEQP-GLES2.functional.shaders.loops.while_d",
        "ynamic_iterations.conditional_body_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003723,
        "dEQP-GLES2.functional.shaders.loops.while_dy",
        "namic_iterations.function_call_return_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003724,
        "dEQP-GLES2.functional.shaders.loops.while_dyn",
        "amic_iterations.function_call_return_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003725,
        "dEQP-GLES2.functional.shaders.loops.while_d",
        "ynamic_iterations.function_call_inout_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003726,
        "dEQP-GLES2.functional.shaders.loops.while_dy",
        "namic_iterations.function_call_inout_fragment");
