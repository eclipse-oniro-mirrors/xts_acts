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

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000512,
        "KHR-GLES3.shaders.loops.while_const",
        "ant_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000513,
        "KHR-GLES3.shaders.loops.while_consta",
        "nt_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000514,
        "KHR-GLES3.shaders.loops.while_constan",
        "t_iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000515,
        "KHR-GLES3.shaders.loops.while_constant",
        "_iterations.basic_mediump_int_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000516,
        "KHR-GLES3.shaders.loops.while_constant",
        "_iterations.basic_mediump_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000517,
        "KHR-GLES3.shaders.loops.while_constant_",
        "iterations.basic_mediump_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000518,
        "KHR-GLES3.shaders.loops.while_consta",
        "nt_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000519,
        "KHR-GLES3.shaders.loops.while_constan",
        "t_iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000520,
        "KHR-GLES3.shaders.loops.while_constan",
        "t_iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000521,
        "KHR-GLES3.shaders.loops.while_constant",
        "_iterations.basic_highp_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000522,
        "KHR-GLES3.shaders.loops.while_con",
        "stant_iterations.empty_body_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000523,
        "KHR-GLES3.shaders.loops.while_cons",
        "tant_iterations.empty_body_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000524,
        "KHR-GLES3.shaders.loops.while_constant_iteration",
        "s.infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000525,
        "KHR-GLES3.shaders.loops.while_constant_iterations",
        ".infinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000526,
        "KHR-GLES3.shaders.loops.while_constant_iteratio",
        "ns.infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000527,
        "KHR-GLES3.shaders.loops.while_constant_iteration",
        "s.infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000528,
        "KHR-GLES3.shaders.loops.while_constant_itera",
        "tions.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000529,
        "KHR-GLES3.shaders.loops.while_constant_iterat",
        "ions.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000530,
        "KHR-GLES3.shaders.loops.while_consta",
        "nt_iterations.single_statement_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000531,
        "KHR-GLES3.shaders.loops.while_constan",
        "t_iterations.single_statement_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000532,
        "KHR-GLES3.shaders.loops.while_constan",
        "t_iterations.compound_statement_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000533,
        "KHR-GLES3.shaders.loops.while_constant",
        "_iterations.compound_statement_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000534,
        "KHR-GLES3.shaders.loops.while_constan",
        "t_iterations.sequence_statement_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000535,
        "KHR-GLES3.shaders.loops.while_constant",
        "_iterations.sequence_statement_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000536,
        "KHR-GLES3.shaders.loops.while_const",
        "ant_iterations.no_iterations_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000537,
        "KHR-GLES3.shaders.loops.while_consta",
        "nt_iterations.no_iterations_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000538,
        "KHR-GLES3.shaders.loops.while_consta",
        "nt_iterations.single_iteration_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000539,
        "KHR-GLES3.shaders.loops.while_constan",
        "t_iterations.single_iteration_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000540,
        "KHR-GLES3.shaders.loops.while_constant_",
        "iterations.select_iteration_count_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000541,
        "KHR-GLES3.shaders.loops.while_constant_i",
        "terations.select_iteration_count_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000542,
        "KHR-GLES3.shaders.loops.while_constant",
        "_iterations.conditional_continue_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000543,
        "KHR-GLES3.shaders.loops.while_constant_",
        "iterations.conditional_continue_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000544,
        "KHR-GLES3.shaders.loops.while_constant_",
        "iterations.unconditional_continue_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000545,
        "KHR-GLES3.shaders.loops.while_constant_i",
        "terations.unconditional_continue_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000546,
        "KHR-GLES3.shaders.loops.while_const",
        "ant_iterations.only_continue_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000547,
        "KHR-GLES3.shaders.loops.while_consta",
        "nt_iterations.only_continue_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000548,
        "KHR-GLES3.shaders.loops.while_consta",
        "nt_iterations.double_continue_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000549,
        "KHR-GLES3.shaders.loops.while_constan",
        "t_iterations.double_continue_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000550,
        "KHR-GLES3.shaders.loops.while_constan",
        "t_iterations.conditional_break_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000551,
        "KHR-GLES3.shaders.loops.while_constant",
        "_iterations.conditional_break_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000552,
        "KHR-GLES3.shaders.loops.while_constant",
        "_iterations.unconditional_break_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000553,
        "KHR-GLES3.shaders.loops.while_constant_",
        "iterations.unconditional_break_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000554,
        "KHR-GLES3.shaders.loops.while_const",
        "ant_iterations.pre_increment_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000555,
        "KHR-GLES3.shaders.loops.while_consta",
        "nt_iterations.pre_increment_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000556,
        "KHR-GLES3.shaders.loops.while_const",
        "ant_iterations.post_increment_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000557,
        "KHR-GLES3.shaders.loops.while_consta",
        "nt_iterations.post_increment_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000558,
        "KHR-GLES3.shaders.loops.while_constant",
        "_iterations.mixed_break_continue_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000559,
        "KHR-GLES3.shaders.loops.while_constant_",
        "iterations.mixed_break_continue_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000560,
        "KHR-GLES3.shaders.loops.while_const",
        "ant_iterations.vector_counter_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000561,
        "KHR-GLES3.shaders.loops.while_consta",
        "nt_iterations.vector_counter_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000562,
        "KHR-GLES3.shaders.loops.while_const",
        "ant_iterations.101_iterations_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000563,
        "KHR-GLES3.shaders.loops.while_consta",
        "nt_iterations.101_iterations_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000564,
        "KHR-GLES3.shaders.loops.while_co",
        "nstant_iterations.sequence_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000565,
        "KHR-GLES3.shaders.loops.while_con",
        "stant_iterations.sequence_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000566,
        "KHR-GLES3.shaders.loops.while_c",
        "onstant_iterations.nested_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000567,
        "KHR-GLES3.shaders.loops.while_co",
        "nstant_iterations.nested_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000568,
        "KHR-GLES3.shaders.loops.while_consta",
        "nt_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000569,
        "KHR-GLES3.shaders.loops.while_constan",
        "t_iterations.nested_sequence_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000570,
        "KHR-GLES3.shaders.loops.while_constant_i",
        "terations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000571,
        "KHR-GLES3.shaders.loops.while_constant_it",
        "erations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000572,
        "KHR-GLES3.shaders.loops.while_constant_i",
        "terations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000573,
        "KHR-GLES3.shaders.loops.while_constant_it",
        "erations.nested_tricky_dataflow_2_fragment");
