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

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000818,
        "KHR-GLES3.shaders.loops.do_while_dyn",
        "amic_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000819,
        "KHR-GLES3.shaders.loops.do_while_dyna",
        "mic_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000820,
        "KHR-GLES3.shaders.loops.do_while_dynam",
        "ic_iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000821,
        "KHR-GLES3.shaders.loops.do_while_dynami",
        "c_iterations.basic_mediump_int_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000822,
        "KHR-GLES3.shaders.loops.do_while_dynami",
        "c_iterations.basic_mediump_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000823,
        "KHR-GLES3.shaders.loops.do_while_dynamic",
        "_iterations.basic_mediump_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000824,
        "KHR-GLES3.shaders.loops.do_while_dyna",
        "mic_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000825,
        "KHR-GLES3.shaders.loops.do_while_dynam",
        "ic_iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000826,
        "KHR-GLES3.shaders.loops.do_while_dynam",
        "ic_iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000827,
        "KHR-GLES3.shaders.loops.do_while_dynami",
        "c_iterations.basic_highp_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000828,
        "KHR-GLES3.shaders.loops.do_while_d",
        "ynamic_iterations.empty_body_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000829,
        "KHR-GLES3.shaders.loops.do_while_dy",
        "namic_iterations.empty_body_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000830,
        "KHR-GLES3.shaders.loops.do_while_dynamic_iteratio",
        "ns.infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000831,
        "KHR-GLES3.shaders.loops.do_while_dynamic_iteration",
        "s.infinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000832,
        "KHR-GLES3.shaders.loops.do_while_dynamic_iterati",
        "ons.infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000833,
        "KHR-GLES3.shaders.loops.do_while_dynamic_iteratio",
        "ns.infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000834,
        "KHR-GLES3.shaders.loops.do_while_dynamic_iter",
        "ations.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000835,
        "KHR-GLES3.shaders.loops.do_while_dynamic_itera",
        "tions.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000836,
        "KHR-GLES3.shaders.loops.do_while_dyna",
        "mic_iterations.single_statement_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000837,
        "KHR-GLES3.shaders.loops.do_while_dynam",
        "ic_iterations.single_statement_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000838,
        "KHR-GLES3.shaders.loops.do_while_dynam",
        "ic_iterations.compound_statement_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000839,
        "KHR-GLES3.shaders.loops.do_while_dynami",
        "c_iterations.compound_statement_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000840,
        "KHR-GLES3.shaders.loops.do_while_dynam",
        "ic_iterations.sequence_statement_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000841,
        "KHR-GLES3.shaders.loops.do_while_dynami",
        "c_iterations.sequence_statement_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000842,
        "KHR-GLES3.shaders.loops.do_while_dyna",
        "mic_iterations.single_iteration_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000843,
        "KHR-GLES3.shaders.loops.do_while_dynam",
        "ic_iterations.single_iteration_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000844,
        "KHR-GLES3.shaders.loops.do_while_dynamic",
        "_iterations.select_iteration_count_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000845,
        "KHR-GLES3.shaders.loops.do_while_dynamic_",
        "iterations.select_iteration_count_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000846,
        "KHR-GLES3.shaders.loops.do_while_dynami",
        "c_iterations.conditional_continue_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000847,
        "KHR-GLES3.shaders.loops.do_while_dynamic",
        "_iterations.conditional_continue_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000848,
        "KHR-GLES3.shaders.loops.do_while_dynamic",
        "_iterations.unconditional_continue_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000849,
        "KHR-GLES3.shaders.loops.do_while_dynamic_",
        "iterations.unconditional_continue_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000850,
        "KHR-GLES3.shaders.loops.do_while_dyn",
        "amic_iterations.only_continue_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000851,
        "KHR-GLES3.shaders.loops.do_while_dyna",
        "mic_iterations.only_continue_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000852,
        "KHR-GLES3.shaders.loops.do_while_dyna",
        "mic_iterations.double_continue_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000853,
        "KHR-GLES3.shaders.loops.do_while_dynam",
        "ic_iterations.double_continue_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000854,
        "KHR-GLES3.shaders.loops.do_while_dynam",
        "ic_iterations.conditional_break_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000855,
        "KHR-GLES3.shaders.loops.do_while_dynami",
        "c_iterations.conditional_break_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000856,
        "KHR-GLES3.shaders.loops.do_while_dynami",
        "c_iterations.unconditional_break_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000857,
        "KHR-GLES3.shaders.loops.do_while_dynamic",
        "_iterations.unconditional_break_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000858,
        "KHR-GLES3.shaders.loops.do_while_dyn",
        "amic_iterations.pre_increment_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000859,
        "KHR-GLES3.shaders.loops.do_while_dyna",
        "mic_iterations.pre_increment_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000860,
        "KHR-GLES3.shaders.loops.do_while_dyn",
        "amic_iterations.post_increment_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000861,
        "KHR-GLES3.shaders.loops.do_while_dyna",
        "mic_iterations.post_increment_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000862,
        "KHR-GLES3.shaders.loops.do_while_dynami",
        "c_iterations.mixed_break_continue_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000863,
        "KHR-GLES3.shaders.loops.do_while_dynamic",
        "_iterations.mixed_break_continue_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000864,
        "KHR-GLES3.shaders.loops.do_while_dyn",
        "amic_iterations.vector_counter_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000865,
        "KHR-GLES3.shaders.loops.do_while_dyna",
        "mic_iterations.vector_counter_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000866,
        "KHR-GLES3.shaders.loops.do_while_dyn",
        "amic_iterations.101_iterations_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000867,
        "KHR-GLES3.shaders.loops.do_while_dyna",
        "mic_iterations.101_iterations_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000868,
        "KHR-GLES3.shaders.loops.do_while_",
        "dynamic_iterations.sequence_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000869,
        "KHR-GLES3.shaders.loops.do_while_d",
        "ynamic_iterations.sequence_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000870,
        "KHR-GLES3.shaders.loops.do_while",
        "_dynamic_iterations.nested_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000871,
        "KHR-GLES3.shaders.loops.do_while_",
        "dynamic_iterations.nested_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000872,
        "KHR-GLES3.shaders.loops.do_while_dyna",
        "mic_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000873,
        "KHR-GLES3.shaders.loops.do_while_dynam",
        "ic_iterations.nested_sequence_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000874,
        "KHR-GLES3.shaders.loops.do_while_dynamic_",
        "iterations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000875,
        "KHR-GLES3.shaders.loops.do_while_dynamic_i",
        "terations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000876,
        "KHR-GLES3.shaders.loops.do_while_dynamic_",
        "iterations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000877,
        "KHR-GLES3.shaders.loops.do_while_dynamic_i",
        "terations.nested_tricky_dataflow_2_fragment");
