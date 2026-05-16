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

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000698,
        "KHR-GLES3.shaders.loops.do_while_cons",
        "tant_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000699,
        "KHR-GLES3.shaders.loops.do_while_const",
        "ant_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000700,
        "KHR-GLES3.shaders.loops.do_while_const",
        "ant_iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000701,
        "KHR-GLES3.shaders.loops.do_while_consta",
        "nt_iterations.basic_mediump_int_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000702,
        "KHR-GLES3.shaders.loops.do_while_consta",
        "nt_iterations.basic_mediump_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000703,
        "KHR-GLES3.shaders.loops.do_while_constan",
        "t_iterations.basic_mediump_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000704,
        "KHR-GLES3.shaders.loops.do_while_cons",
        "tant_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000705,
        "KHR-GLES3.shaders.loops.do_while_const",
        "ant_iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000706,
        "KHR-GLES3.shaders.loops.do_while_const",
        "ant_iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000707,
        "KHR-GLES3.shaders.loops.do_while_consta",
        "nt_iterations.basic_highp_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000708,
        "KHR-GLES3.shaders.loops.do_while_co",
        "nstant_iterations.empty_body_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000709,
        "KHR-GLES3.shaders.loops.do_while_con",
        "stant_iterations.empty_body_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000710,
        "KHR-GLES3.shaders.loops.do_while_constant_iterati",
        "ons.infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000711,
        "KHR-GLES3.shaders.loops.do_while_constant_iteratio",
        "ns.infinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000712,
        "KHR-GLES3.shaders.loops.do_while_constant_iterati",
        "ons.infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000713,
        "KHR-GLES3.shaders.loops.do_while_constant_iteratio",
        "ns.infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000714,
        "KHR-GLES3.shaders.loops.do_while_constant_ite",
        "rations.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000715,
        "KHR-GLES3.shaders.loops.do_while_constant_iter",
        "ations.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000716,
        "KHR-GLES3.shaders.loops.do_while_const",
        "ant_iterations.single_statement_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000717,
        "KHR-GLES3.shaders.loops.do_while_consta",
        "nt_iterations.single_statement_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000718,
        "KHR-GLES3.shaders.loops.do_while_consta",
        "nt_iterations.compound_statement_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000719,
        "KHR-GLES3.shaders.loops.do_while_constan",
        "t_iterations.compound_statement_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000720,
        "KHR-GLES3.shaders.loops.do_while_consta",
        "nt_iterations.sequence_statement_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000721,
        "KHR-GLES3.shaders.loops.do_while_constan",
        "t_iterations.sequence_statement_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000722,
        "KHR-GLES3.shaders.loops.do_while_const",
        "ant_iterations.single_iteration_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000723,
        "KHR-GLES3.shaders.loops.do_while_consta",
        "nt_iterations.single_iteration_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000724,
        "KHR-GLES3.shaders.loops.do_while_constant",
        "_iterations.select_iteration_count_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000725,
        "KHR-GLES3.shaders.loops.do_while_constant_",
        "iterations.select_iteration_count_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000726,
        "KHR-GLES3.shaders.loops.do_while_constan",
        "t_iterations.conditional_continue_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000727,
        "KHR-GLES3.shaders.loops.do_while_constant",
        "_iterations.conditional_continue_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000728,
        "KHR-GLES3.shaders.loops.do_while_constant",
        "_iterations.unconditional_continue_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000729,
        "KHR-GLES3.shaders.loops.do_while_constant_",
        "iterations.unconditional_continue_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000730,
        "KHR-GLES3.shaders.loops.do_while_con",
        "stant_iterations.only_continue_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000731,
        "KHR-GLES3.shaders.loops.do_while_cons",
        "tant_iterations.only_continue_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000732,
        "KHR-GLES3.shaders.loops.do_while_cons",
        "tant_iterations.double_continue_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000733,
        "KHR-GLES3.shaders.loops.do_while_const",
        "ant_iterations.double_continue_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000734,
        "KHR-GLES3.shaders.loops.do_while_const",
        "ant_iterations.conditional_break_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000735,
        "KHR-GLES3.shaders.loops.do_while_consta",
        "nt_iterations.conditional_break_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000736,
        "KHR-GLES3.shaders.loops.do_while_consta",
        "nt_iterations.unconditional_break_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000737,
        "KHR-GLES3.shaders.loops.do_while_constan",
        "t_iterations.unconditional_break_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000738,
        "KHR-GLES3.shaders.loops.do_while_con",
        "stant_iterations.pre_increment_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000739,
        "KHR-GLES3.shaders.loops.do_while_cons",
        "tant_iterations.pre_increment_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000740,
        "KHR-GLES3.shaders.loops.do_while_cons",
        "tant_iterations.post_increment_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000741,
        "KHR-GLES3.shaders.loops.do_while_const",
        "ant_iterations.post_increment_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000742,
        "KHR-GLES3.shaders.loops.do_while_constan",
        "t_iterations.mixed_break_continue_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000743,
        "KHR-GLES3.shaders.loops.do_while_constant",
        "_iterations.mixed_break_continue_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000744,
        "KHR-GLES3.shaders.loops.do_while_cons",
        "tant_iterations.vector_counter_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000745,
        "KHR-GLES3.shaders.loops.do_while_const",
        "ant_iterations.vector_counter_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000746,
        "KHR-GLES3.shaders.loops.do_while_cons",
        "tant_iterations.101_iterations_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000747,
        "KHR-GLES3.shaders.loops.do_while_const",
        "ant_iterations.101_iterations_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000748,
        "KHR-GLES3.shaders.loops.do_while_c",
        "onstant_iterations.sequence_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000749,
        "KHR-GLES3.shaders.loops.do_while_co",
        "nstant_iterations.sequence_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000750,
        "KHR-GLES3.shaders.loops.do_while_",
        "constant_iterations.nested_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000751,
        "KHR-GLES3.shaders.loops.do_while_c",
        "onstant_iterations.nested_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000752,
        "KHR-GLES3.shaders.loops.do_while_cons",
        "tant_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000753,
        "KHR-GLES3.shaders.loops.do_while_const",
        "ant_iterations.nested_sequence_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000754,
        "KHR-GLES3.shaders.loops.do_while_constant_",
        "iterations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000755,
        "KHR-GLES3.shaders.loops.do_while_constant_i",
        "terations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000756,
        "KHR-GLES3.shaders.loops.do_while_constant_",
        "iterations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000757,
        "KHR-GLES3.shaders.loops.do_while_constant_i",
        "terations.nested_tricky_dataflow_2_fragment");
