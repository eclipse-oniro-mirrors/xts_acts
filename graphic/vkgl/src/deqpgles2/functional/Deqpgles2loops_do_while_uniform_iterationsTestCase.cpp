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

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003795,
        "dEQP-GLES2.functional.shaders.loops.do_whi",
        "le_uniform_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003796,
        "dEQP-GLES2.functional.shaders.loops.do_whil",
        "e_uniform_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003797,
        "dEQP-GLES2.functional.shaders.loops.do_whil",
        "e_uniform_iterations.basic_lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003798,
        "dEQP-GLES2.functional.shaders.loops.do_while",
        "_uniform_iterations.basic_lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003799,
        "dEQP-GLES2.functional.shaders.loops.do_while",
        "_uniform_iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003800,
        "dEQP-GLES2.functional.shaders.loops.do_while_",
        "uniform_iterations.basic_mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003801,
        "dEQP-GLES2.functional.shaders.loops.do_while_",
        "uniform_iterations.basic_mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003802,
        "dEQP-GLES2.functional.shaders.loops.do_while_u",
        "niform_iterations.basic_mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003803,
        "dEQP-GLES2.functional.shaders.loops.do_whil",
        "e_uniform_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003804,
        "dEQP-GLES2.functional.shaders.loops.do_while",
        "_uniform_iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003805,
        "dEQP-GLES2.functional.shaders.loops.do_while",
        "_uniform_iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003806,
        "dEQP-GLES2.functional.shaders.loops.do_while_",
        "uniform_iterations.basic_highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003807,
        "dEQP-GLES2.functional.shaders.loops.do_w",
        "hile_uniform_iterations.empty_body_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003808,
        "dEQP-GLES2.functional.shaders.loops.do_wh",
        "ile_uniform_iterations.empty_body_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003809,
        "dEQP-GLES2.functional.shaders.loops.do_while_uniform_it",
        "erations.infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003810,
        "dEQP-GLES2.functional.shaders.loops.do_while_uniform_ite",
        "rations.infinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003811,
        "dEQP-GLES2.functional.shaders.loops.do_while_uniform_i",
        "terations.infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003812,
        "dEQP-GLES2.functional.shaders.loops.do_while_uniform_it",
        "erations.infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003813,
        "dEQP-GLES2.functional.shaders.loops.do_while_unifor",
        "m_iterations.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003814,
        "dEQP-GLES2.functional.shaders.loops.do_while_uniform",
        "_iterations.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003815,
        "dEQP-GLES2.functional.shaders.loops.do_whil",
        "e_uniform_iterations.single_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003816,
        "dEQP-GLES2.functional.shaders.loops.do_while",
        "_uniform_iterations.single_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003817,
        "dEQP-GLES2.functional.shaders.loops.do_while",
        "_uniform_iterations.compound_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003818,
        "dEQP-GLES2.functional.shaders.loops.do_while_",
        "uniform_iterations.compound_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003819,
        "dEQP-GLES2.functional.shaders.loops.do_while",
        "_uniform_iterations.sequence_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003820,
        "dEQP-GLES2.functional.shaders.loops.do_while_",
        "uniform_iterations.sequence_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003821,
        "dEQP-GLES2.functional.shaders.loops.do_whil",
        "e_uniform_iterations.single_iteration_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003822,
        "dEQP-GLES2.functional.shaders.loops.do_while",
        "_uniform_iterations.single_iteration_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003823,
        "dEQP-GLES2.functional.shaders.loops.do_while_u",
        "niform_iterations.select_iteration_count_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003824,
        "dEQP-GLES2.functional.shaders.loops.do_while_un",
        "iform_iterations.select_iteration_count_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003825,
        "dEQP-GLES2.functional.shaders.loops.do_while_",
        "uniform_iterations.conditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003826,
        "dEQP-GLES2.functional.shaders.loops.do_while_u",
        "niform_iterations.conditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003827,
        "dEQP-GLES2.functional.shaders.loops.do_while_u",
        "niform_iterations.unconditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003828,
        "dEQP-GLES2.functional.shaders.loops.do_while_un",
        "iform_iterations.unconditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003829,
        "dEQP-GLES2.functional.shaders.loops.do_whi",
        "le_uniform_iterations.only_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003830,
        "dEQP-GLES2.functional.shaders.loops.do_whil",
        "e_uniform_iterations.only_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003831,
        "dEQP-GLES2.functional.shaders.loops.do_whil",
        "e_uniform_iterations.double_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003832,
        "dEQP-GLES2.functional.shaders.loops.do_while",
        "_uniform_iterations.double_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003833,
        "dEQP-GLES2.functional.shaders.loops.do_while",
        "_uniform_iterations.conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003834,
        "dEQP-GLES2.functional.shaders.loops.do_while_",
        "uniform_iterations.conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003835,
        "dEQP-GLES2.functional.shaders.loops.do_while_",
        "uniform_iterations.unconditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003836,
        "dEQP-GLES2.functional.shaders.loops.do_while_u",
        "niform_iterations.unconditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003837,
        "dEQP-GLES2.functional.shaders.loops.do_whi",
        "le_uniform_iterations.pre_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003838,
        "dEQP-GLES2.functional.shaders.loops.do_whil",
        "e_uniform_iterations.pre_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003839,
        "dEQP-GLES2.functional.shaders.loops.do_whi",
        "le_uniform_iterations.post_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003840,
        "dEQP-GLES2.functional.shaders.loops.do_whil",
        "e_uniform_iterations.post_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003841,
        "dEQP-GLES2.functional.shaders.loops.do_while_",
        "uniform_iterations.mixed_break_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003842,
        "dEQP-GLES2.functional.shaders.loops.do_while_u",
        "niform_iterations.mixed_break_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003843,
        "dEQP-GLES2.functional.shaders.loops.do_whi",
        "le_uniform_iterations.vector_counter_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003844,
        "dEQP-GLES2.functional.shaders.loops.do_whil",
        "e_uniform_iterations.vector_counter_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003845,
        "dEQP-GLES2.functional.shaders.loops.do_whi",
        "le_uniform_iterations.101_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003846,
        "dEQP-GLES2.functional.shaders.loops.do_whil",
        "e_uniform_iterations.101_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003847,
        "dEQP-GLES2.functional.shaders.loops.do_",
        "while_uniform_iterations.sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003848,
        "dEQP-GLES2.functional.shaders.loops.do_w",
        "hile_uniform_iterations.sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003849,
        "dEQP-GLES2.functional.shaders.loops.do",
        "_while_uniform_iterations.nested_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003850,
        "dEQP-GLES2.functional.shaders.loops.do_",
        "while_uniform_iterations.nested_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003851,
        "dEQP-GLES2.functional.shaders.loops.do_whil",
        "e_uniform_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003852,
        "dEQP-GLES2.functional.shaders.loops.do_while",
        "_uniform_iterations.nested_sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003853,
        "dEQP-GLES2.functional.shaders.loops.do_while_un",
        "iform_iterations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003854,
        "dEQP-GLES2.functional.shaders.loops.do_while_uni",
        "form_iterations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003855,
        "dEQP-GLES2.functional.shaders.loops.do_while_un",
        "iform_iterations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003856,
        "dEQP-GLES2.functional.shaders.loops.do_while_uni",
        "form_iterations.nested_tricky_dataflow_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003857,
        "dEQP-GLES2.functional.shaders.loops.do_whil",
        "e_uniform_iterations.conditional_body_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003858,
        "dEQP-GLES2.functional.shaders.loops.do_while",
        "_uniform_iterations.conditional_body_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003859,
        "dEQP-GLES2.functional.shaders.loops.do_while_",
        "uniform_iterations.function_call_return_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003860,
        "dEQP-GLES2.functional.shaders.loops.do_while_u",
        "niform_iterations.function_call_return_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003861,
        "dEQP-GLES2.functional.shaders.loops.do_while_",
        "uniform_iterations.function_call_inout_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003862,
        "dEQP-GLES2.functional.shaders.loops.do_while_u",
        "niform_iterations.function_call_inout_fragment");
