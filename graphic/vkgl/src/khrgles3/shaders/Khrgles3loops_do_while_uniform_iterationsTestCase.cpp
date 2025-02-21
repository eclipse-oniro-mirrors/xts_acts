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
#include "../Khrgles3BaseFunc.h"
#include "../ActsKhrgles30001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000758,
        "KHR-GLES3.shaders.loops.do_while_uni",
        "form_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000759,
        "KHR-GLES3.shaders.loops.do_while_unif",
        "orm_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000760,
        "KHR-GLES3.shaders.loops.do_while_unifo",
        "rm_iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000761,
        "KHR-GLES3.shaders.loops.do_while_unifor",
        "m_iterations.basic_mediump_int_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000762,
        "KHR-GLES3.shaders.loops.do_while_unifor",
        "m_iterations.basic_mediump_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000763,
        "KHR-GLES3.shaders.loops.do_while_uniform",
        "_iterations.basic_mediump_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000764,
        "KHR-GLES3.shaders.loops.do_while_unif",
        "orm_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000765,
        "KHR-GLES3.shaders.loops.do_while_unifo",
        "rm_iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000766,
        "KHR-GLES3.shaders.loops.do_while_unifo",
        "rm_iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000767,
        "KHR-GLES3.shaders.loops.do_while_unifor",
        "m_iterations.basic_highp_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000768,
        "KHR-GLES3.shaders.loops.do_while_u",
        "niform_iterations.empty_body_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000769,
        "KHR-GLES3.shaders.loops.do_while_un",
        "iform_iterations.empty_body_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000770,
        "KHR-GLES3.shaders.loops.do_while_uniform_iteratio",
        "ns.infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000771,
        "KHR-GLES3.shaders.loops.do_while_uniform_iteration",
        "s.infinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000772,
        "KHR-GLES3.shaders.loops.do_while_uniform_iterati",
        "ons.infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000773,
        "KHR-GLES3.shaders.loops.do_while_uniform_iteratio",
        "ns.infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000774,
        "KHR-GLES3.shaders.loops.do_while_uniform_iter",
        "ations.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000775,
        "KHR-GLES3.shaders.loops.do_while_uniform_itera",
        "tions.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000776,
        "KHR-GLES3.shaders.loops.do_while_unif",
        "orm_iterations.single_statement_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000777,
        "KHR-GLES3.shaders.loops.do_while_unifo",
        "rm_iterations.single_statement_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000778,
        "KHR-GLES3.shaders.loops.do_while_unifo",
        "rm_iterations.compound_statement_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000779,
        "KHR-GLES3.shaders.loops.do_while_unifor",
        "m_iterations.compound_statement_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000780,
        "KHR-GLES3.shaders.loops.do_while_unifo",
        "rm_iterations.sequence_statement_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000781,
        "KHR-GLES3.shaders.loops.do_while_unifor",
        "m_iterations.sequence_statement_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000782,
        "KHR-GLES3.shaders.loops.do_while_unif",
        "orm_iterations.single_iteration_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000783,
        "KHR-GLES3.shaders.loops.do_while_unifo",
        "rm_iterations.single_iteration_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000784,
        "KHR-GLES3.shaders.loops.do_while_uniform",
        "_iterations.select_iteration_count_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000785,
        "KHR-GLES3.shaders.loops.do_while_uniform_",
        "iterations.select_iteration_count_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000786,
        "KHR-GLES3.shaders.loops.do_while_unifor",
        "m_iterations.conditional_continue_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000787,
        "KHR-GLES3.shaders.loops.do_while_uniform",
        "_iterations.conditional_continue_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000788,
        "KHR-GLES3.shaders.loops.do_while_uniform",
        "_iterations.unconditional_continue_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000789,
        "KHR-GLES3.shaders.loops.do_while_uniform_",
        "iterations.unconditional_continue_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000790,
        "KHR-GLES3.shaders.loops.do_while_uni",
        "form_iterations.only_continue_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000791,
        "KHR-GLES3.shaders.loops.do_while_unif",
        "orm_iterations.only_continue_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000792,
        "KHR-GLES3.shaders.loops.do_while_unif",
        "orm_iterations.double_continue_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000793,
        "KHR-GLES3.shaders.loops.do_while_unifo",
        "rm_iterations.double_continue_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000794,
        "KHR-GLES3.shaders.loops.do_while_unifo",
        "rm_iterations.conditional_break_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000795,
        "KHR-GLES3.shaders.loops.do_while_unifor",
        "m_iterations.conditional_break_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000796,
        "KHR-GLES3.shaders.loops.do_while_unifor",
        "m_iterations.unconditional_break_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000797,
        "KHR-GLES3.shaders.loops.do_while_uniform",
        "_iterations.unconditional_break_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000798,
        "KHR-GLES3.shaders.loops.do_while_uni",
        "form_iterations.pre_increment_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000799,
        "KHR-GLES3.shaders.loops.do_while_unif",
        "orm_iterations.pre_increment_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000800,
        "KHR-GLES3.shaders.loops.do_while_uni",
        "form_iterations.post_increment_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000801,
        "KHR-GLES3.shaders.loops.do_while_unif",
        "orm_iterations.post_increment_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000802,
        "KHR-GLES3.shaders.loops.do_while_unifor",
        "m_iterations.mixed_break_continue_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000803,
        "KHR-GLES3.shaders.loops.do_while_uniform",
        "_iterations.mixed_break_continue_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000804,
        "KHR-GLES3.shaders.loops.do_while_uni",
        "form_iterations.vector_counter_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000805,
        "KHR-GLES3.shaders.loops.do_while_unif",
        "orm_iterations.vector_counter_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000806,
        "KHR-GLES3.shaders.loops.do_while_uni",
        "form_iterations.101_iterations_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000807,
        "KHR-GLES3.shaders.loops.do_while_unif",
        "orm_iterations.101_iterations_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000808,
        "KHR-GLES3.shaders.loops.do_while_",
        "uniform_iterations.sequence_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000809,
        "KHR-GLES3.shaders.loops.do_while_u",
        "niform_iterations.sequence_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000810,
        "KHR-GLES3.shaders.loops.do_while",
        "_uniform_iterations.nested_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000811,
        "KHR-GLES3.shaders.loops.do_while_",
        "uniform_iterations.nested_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000812,
        "KHR-GLES3.shaders.loops.do_while_unif",
        "orm_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000813,
        "KHR-GLES3.shaders.loops.do_while_unifo",
        "rm_iterations.nested_sequence_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000814,
        "KHR-GLES3.shaders.loops.do_while_uniform_",
        "iterations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000815,
        "KHR-GLES3.shaders.loops.do_while_uniform_i",
        "terations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000816,
        "KHR-GLES3.shaders.loops.do_while_uniform_",
        "iterations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000817,
        "KHR-GLES3.shaders.loops.do_while_uniform_i",
        "terations.nested_tricky_dataflow_2_fragment");
