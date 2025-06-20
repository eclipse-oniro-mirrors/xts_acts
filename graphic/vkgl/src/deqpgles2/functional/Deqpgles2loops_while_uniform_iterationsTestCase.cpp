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

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003587,
        "dEQP-GLES2.functional.shaders.loops.while",
        "_uniform_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003588,
        "dEQP-GLES2.functional.shaders.loops.while_",
        "uniform_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003589,
        "dEQP-GLES2.functional.shaders.loops.while_",
        "uniform_iterations.basic_lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003590,
        "dEQP-GLES2.functional.shaders.loops.while_u",
        "niform_iterations.basic_lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003591,
        "dEQP-GLES2.functional.shaders.loops.while_",
        "uniform_iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003592,
        "dEQP-GLES2.functional.shaders.loops.while_u",
        "niform_iterations.basic_mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003593,
        "dEQP-GLES2.functional.shaders.loops.while_u",
        "niform_iterations.basic_mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003594,
        "dEQP-GLES2.functional.shaders.loops.while_un",
        "iform_iterations.basic_mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003595,
        "dEQP-GLES2.functional.shaders.loops.while",
        "_uniform_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003596,
        "dEQP-GLES2.functional.shaders.loops.while_",
        "uniform_iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003597,
        "dEQP-GLES2.functional.shaders.loops.while_",
        "uniform_iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003598,
        "dEQP-GLES2.functional.shaders.loops.while_u",
        "niform_iterations.basic_highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003599,
        "dEQP-GLES2.functional.shaders.loops.whi",
        "le_uniform_iterations.empty_body_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003600,
        "dEQP-GLES2.functional.shaders.loops.whil",
        "e_uniform_iterations.empty_body_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003601,
        "dEQP-GLES2.functional.shaders.loops.while_uniform_ite",
        "rations.infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003602,
        "dEQP-GLES2.functional.shaders.loops.while_uniform_iter",
        "ations.infinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003603,
        "dEQP-GLES2.functional.shaders.loops.while_uniform_ite",
        "rations.infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003604,
        "dEQP-GLES2.functional.shaders.loops.while_uniform_iter",
        "ations.infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003605,
        "dEQP-GLES2.functional.shaders.loops.while_uniform",
        "_iterations.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003606,
        "dEQP-GLES2.functional.shaders.loops.while_uniform_",
        "iterations.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003607,
        "dEQP-GLES2.functional.shaders.loops.while_",
        "uniform_iterations.single_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003608,
        "dEQP-GLES2.functional.shaders.loops.while_u",
        "niform_iterations.single_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003609,
        "dEQP-GLES2.functional.shaders.loops.while_u",
        "niform_iterations.compound_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003610,
        "dEQP-GLES2.functional.shaders.loops.while_un",
        "iform_iterations.compound_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003611,
        "dEQP-GLES2.functional.shaders.loops.while_u",
        "niform_iterations.sequence_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003612,
        "dEQP-GLES2.functional.shaders.loops.while_un",
        "iform_iterations.sequence_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003613,
        "dEQP-GLES2.functional.shaders.loops.whil",
        "e_uniform_iterations.no_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003614,
        "dEQP-GLES2.functional.shaders.loops.while",
        "_uniform_iterations.no_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003615,
        "dEQP-GLES2.functional.shaders.loops.while_",
        "uniform_iterations.single_iteration_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003616,
        "dEQP-GLES2.functional.shaders.loops.while_u",
        "niform_iterations.single_iteration_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003617,
        "dEQP-GLES2.functional.shaders.loops.while_uni",
        "form_iterations.select_iteration_count_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003618,
        "dEQP-GLES2.functional.shaders.loops.while_unif",
        "orm_iterations.select_iteration_count_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003619,
        "dEQP-GLES2.functional.shaders.loops.while_un",
        "iform_iterations.conditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003620,
        "dEQP-GLES2.functional.shaders.loops.while_uni",
        "form_iterations.conditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003621,
        "dEQP-GLES2.functional.shaders.loops.while_uni",
        "form_iterations.unconditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003622,
        "dEQP-GLES2.functional.shaders.loops.while_unif",
        "orm_iterations.unconditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003623,
        "dEQP-GLES2.functional.shaders.loops.whil",
        "e_uniform_iterations.only_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003624,
        "dEQP-GLES2.functional.shaders.loops.while",
        "_uniform_iterations.only_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003625,
        "dEQP-GLES2.functional.shaders.loops.while",
        "_uniform_iterations.double_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003626,
        "dEQP-GLES2.functional.shaders.loops.while_",
        "uniform_iterations.double_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003627,
        "dEQP-GLES2.functional.shaders.loops.while_",
        "uniform_iterations.conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003628,
        "dEQP-GLES2.functional.shaders.loops.while_u",
        "niform_iterations.conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003629,
        "dEQP-GLES2.functional.shaders.loops.while_u",
        "niform_iterations.unconditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003630,
        "dEQP-GLES2.functional.shaders.loops.while_un",
        "iform_iterations.unconditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003631,
        "dEQP-GLES2.functional.shaders.loops.whil",
        "e_uniform_iterations.pre_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003632,
        "dEQP-GLES2.functional.shaders.loops.while",
        "_uniform_iterations.pre_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003633,
        "dEQP-GLES2.functional.shaders.loops.while",
        "_uniform_iterations.post_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003634,
        "dEQP-GLES2.functional.shaders.loops.while_",
        "uniform_iterations.post_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003635,
        "dEQP-GLES2.functional.shaders.loops.while_un",
        "iform_iterations.mixed_break_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003636,
        "dEQP-GLES2.functional.shaders.loops.while_uni",
        "form_iterations.mixed_break_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003637,
        "dEQP-GLES2.functional.shaders.loops.while",
        "_uniform_iterations.vector_counter_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003638,
        "dEQP-GLES2.functional.shaders.loops.while_",
        "uniform_iterations.vector_counter_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003639,
        "dEQP-GLES2.functional.shaders.loops.while",
        "_uniform_iterations.101_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003640,
        "dEQP-GLES2.functional.shaders.loops.while_",
        "uniform_iterations.101_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003641,
        "dEQP-GLES2.functional.shaders.loops.wh",
        "ile_uniform_iterations.sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003642,
        "dEQP-GLES2.functional.shaders.loops.whi",
        "le_uniform_iterations.sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003643,
        "dEQP-GLES2.functional.shaders.loops.w",
        "hile_uniform_iterations.nested_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003644,
        "dEQP-GLES2.functional.shaders.loops.wh",
        "ile_uniform_iterations.nested_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003645,
        "dEQP-GLES2.functional.shaders.loops.while",
        "_uniform_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003646,
        "dEQP-GLES2.functional.shaders.loops.while_",
        "uniform_iterations.nested_sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003647,
        "dEQP-GLES2.functional.shaders.loops.while_unif",
        "orm_iterations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003648,
        "dEQP-GLES2.functional.shaders.loops.while_unifo",
        "rm_iterations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003649,
        "dEQP-GLES2.functional.shaders.loops.while_unif",
        "orm_iterations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003650,
        "dEQP-GLES2.functional.shaders.loops.while_unifo",
        "rm_iterations.nested_tricky_dataflow_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003651,
        "dEQP-GLES2.functional.shaders.loops.while_",
        "uniform_iterations.conditional_body_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003652,
        "dEQP-GLES2.functional.shaders.loops.while_u",
        "niform_iterations.conditional_body_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003653,
        "dEQP-GLES2.functional.shaders.loops.while_un",
        "iform_iterations.function_call_return_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003654,
        "dEQP-GLES2.functional.shaders.loops.while_uni",
        "form_iterations.function_call_return_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003655,
        "dEQP-GLES2.functional.shaders.loops.while_u",
        "niform_iterations.function_call_inout_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003656,
        "dEQP-GLES2.functional.shaders.loops.while_un",
        "iform_iterations.function_call_inout_fragment");
