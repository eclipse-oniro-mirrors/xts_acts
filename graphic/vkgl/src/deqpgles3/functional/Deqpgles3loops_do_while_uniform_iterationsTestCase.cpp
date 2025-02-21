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

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007153,
        "dEQP-GLES3.functional.shaders.loops.do_whi",
        "le_uniform_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007154,
        "dEQP-GLES3.functional.shaders.loops.do_whil",
        "e_uniform_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007155,
        "dEQP-GLES3.functional.shaders.loops.do_whil",
        "e_uniform_iterations.basic_lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007156,
        "dEQP-GLES3.functional.shaders.loops.do_while",
        "_uniform_iterations.basic_lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007157,
        "dEQP-GLES3.functional.shaders.loops.do_while",
        "_uniform_iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007158,
        "dEQP-GLES3.functional.shaders.loops.do_while_",
        "uniform_iterations.basic_mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007159,
        "dEQP-GLES3.functional.shaders.loops.do_while_",
        "uniform_iterations.basic_mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007160,
        "dEQP-GLES3.functional.shaders.loops.do_while_u",
        "niform_iterations.basic_mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007161,
        "dEQP-GLES3.functional.shaders.loops.do_whil",
        "e_uniform_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007162,
        "dEQP-GLES3.functional.shaders.loops.do_while",
        "_uniform_iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007163,
        "dEQP-GLES3.functional.shaders.loops.do_while",
        "_uniform_iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007164,
        "dEQP-GLES3.functional.shaders.loops.do_while_",
        "uniform_iterations.basic_highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007165,
        "dEQP-GLES3.functional.shaders.loops.do_w",
        "hile_uniform_iterations.empty_body_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007166,
        "dEQP-GLES3.functional.shaders.loops.do_wh",
        "ile_uniform_iterations.empty_body_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007167,
        "dEQP-GLES3.functional.shaders.loops.do_while_uniform_it",
        "erations.infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007168,
        "dEQP-GLES3.functional.shaders.loops.do_while_uniform_ite",
        "rations.infinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007169,
        "dEQP-GLES3.functional.shaders.loops.do_while_uniform_i",
        "terations.infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007170,
        "dEQP-GLES3.functional.shaders.loops.do_while_uniform_it",
        "erations.infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007171,
        "dEQP-GLES3.functional.shaders.loops.do_while_unifor",
        "m_iterations.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007172,
        "dEQP-GLES3.functional.shaders.loops.do_while_uniform",
        "_iterations.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007173,
        "dEQP-GLES3.functional.shaders.loops.do_whil",
        "e_uniform_iterations.single_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007174,
        "dEQP-GLES3.functional.shaders.loops.do_while",
        "_uniform_iterations.single_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007175,
        "dEQP-GLES3.functional.shaders.loops.do_while",
        "_uniform_iterations.compound_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007176,
        "dEQP-GLES3.functional.shaders.loops.do_while_",
        "uniform_iterations.compound_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007177,
        "dEQP-GLES3.functional.shaders.loops.do_while",
        "_uniform_iterations.sequence_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007178,
        "dEQP-GLES3.functional.shaders.loops.do_while_",
        "uniform_iterations.sequence_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007179,
        "dEQP-GLES3.functional.shaders.loops.do_whil",
        "e_uniform_iterations.single_iteration_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007180,
        "dEQP-GLES3.functional.shaders.loops.do_while",
        "_uniform_iterations.single_iteration_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007181,
        "dEQP-GLES3.functional.shaders.loops.do_while_u",
        "niform_iterations.select_iteration_count_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007182,
        "dEQP-GLES3.functional.shaders.loops.do_while_un",
        "iform_iterations.select_iteration_count_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007183,
        "dEQP-GLES3.functional.shaders.loops.do_while_",
        "uniform_iterations.conditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007184,
        "dEQP-GLES3.functional.shaders.loops.do_while_u",
        "niform_iterations.conditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007185,
        "dEQP-GLES3.functional.shaders.loops.do_while_u",
        "niform_iterations.unconditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007186,
        "dEQP-GLES3.functional.shaders.loops.do_while_un",
        "iform_iterations.unconditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007187,
        "dEQP-GLES3.functional.shaders.loops.do_whi",
        "le_uniform_iterations.only_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007188,
        "dEQP-GLES3.functional.shaders.loops.do_whil",
        "e_uniform_iterations.only_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007189,
        "dEQP-GLES3.functional.shaders.loops.do_whil",
        "e_uniform_iterations.double_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007190,
        "dEQP-GLES3.functional.shaders.loops.do_while",
        "_uniform_iterations.double_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007191,
        "dEQP-GLES3.functional.shaders.loops.do_while",
        "_uniform_iterations.conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007192,
        "dEQP-GLES3.functional.shaders.loops.do_while_",
        "uniform_iterations.conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007193,
        "dEQP-GLES3.functional.shaders.loops.do_while_",
        "uniform_iterations.unconditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007194,
        "dEQP-GLES3.functional.shaders.loops.do_while_u",
        "niform_iterations.unconditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007195,
        "dEQP-GLES3.functional.shaders.loops.do_whi",
        "le_uniform_iterations.pre_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007196,
        "dEQP-GLES3.functional.shaders.loops.do_whil",
        "e_uniform_iterations.pre_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007197,
        "dEQP-GLES3.functional.shaders.loops.do_whi",
        "le_uniform_iterations.post_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007198,
        "dEQP-GLES3.functional.shaders.loops.do_whil",
        "e_uniform_iterations.post_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007199,
        "dEQP-GLES3.functional.shaders.loops.do_while_",
        "uniform_iterations.mixed_break_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007200,
        "dEQP-GLES3.functional.shaders.loops.do_while_u",
        "niform_iterations.mixed_break_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007201,
        "dEQP-GLES3.functional.shaders.loops.do_whi",
        "le_uniform_iterations.vector_counter_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007202,
        "dEQP-GLES3.functional.shaders.loops.do_whil",
        "e_uniform_iterations.vector_counter_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007203,
        "dEQP-GLES3.functional.shaders.loops.do_whi",
        "le_uniform_iterations.101_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007204,
        "dEQP-GLES3.functional.shaders.loops.do_whil",
        "e_uniform_iterations.101_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007205,
        "dEQP-GLES3.functional.shaders.loops.do_",
        "while_uniform_iterations.sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007206,
        "dEQP-GLES3.functional.shaders.loops.do_w",
        "hile_uniform_iterations.sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007207,
        "dEQP-GLES3.functional.shaders.loops.do",
        "_while_uniform_iterations.nested_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007208,
        "dEQP-GLES3.functional.shaders.loops.do_",
        "while_uniform_iterations.nested_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007209,
        "dEQP-GLES3.functional.shaders.loops.do_whil",
        "e_uniform_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007210,
        "dEQP-GLES3.functional.shaders.loops.do_while",
        "_uniform_iterations.nested_sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007211,
        "dEQP-GLES3.functional.shaders.loops.do_while_un",
        "iform_iterations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007212,
        "dEQP-GLES3.functional.shaders.loops.do_while_uni",
        "form_iterations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007213,
        "dEQP-GLES3.functional.shaders.loops.do_while_un",
        "iform_iterations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007214,
        "dEQP-GLES3.functional.shaders.loops.do_while_uni",
        "form_iterations.nested_tricky_dataflow_2_fragment");
