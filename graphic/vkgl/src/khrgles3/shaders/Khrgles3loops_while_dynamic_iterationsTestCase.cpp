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

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000636,
        "KHR-GLES3.shaders.loops.while_dynam",
        "ic_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000637,
        "KHR-GLES3.shaders.loops.while_dynami",
        "c_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000638,
        "KHR-GLES3.shaders.loops.while_dynami",
        "c_iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000639,
        "KHR-GLES3.shaders.loops.while_dynamic",
        "_iterations.basic_mediump_int_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000640,
        "KHR-GLES3.shaders.loops.while_dynamic",
        "_iterations.basic_mediump_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000641,
        "KHR-GLES3.shaders.loops.while_dynamic_",
        "iterations.basic_mediump_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000642,
        "KHR-GLES3.shaders.loops.while_dynam",
        "ic_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000643,
        "KHR-GLES3.shaders.loops.while_dynami",
        "c_iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000644,
        "KHR-GLES3.shaders.loops.while_dynami",
        "c_iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000645,
        "KHR-GLES3.shaders.loops.while_dynamic",
        "_iterations.basic_highp_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000646,
        "KHR-GLES3.shaders.loops.while_dyn",
        "amic_iterations.empty_body_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000647,
        "KHR-GLES3.shaders.loops.while_dyna",
        "mic_iterations.empty_body_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000648,
        "KHR-GLES3.shaders.loops.while_dynamic_iteration",
        "s.infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000649,
        "KHR-GLES3.shaders.loops.while_dynamic_iterations",
        ".infinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000650,
        "KHR-GLES3.shaders.loops.while_dynamic_iteration",
        "s.infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000651,
        "KHR-GLES3.shaders.loops.while_dynamic_iterations",
        ".infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000652,
        "KHR-GLES3.shaders.loops.while_dynamic_itera",
        "tions.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000653,
        "KHR-GLES3.shaders.loops.while_dynamic_iterat",
        "ions.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000654,
        "KHR-GLES3.shaders.loops.while_dynami",
        "c_iterations.single_statement_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000655,
        "KHR-GLES3.shaders.loops.while_dynamic",
        "_iterations.single_statement_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000656,
        "KHR-GLES3.shaders.loops.while_dynamic",
        "_iterations.compound_statement_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000657,
        "KHR-GLES3.shaders.loops.while_dynamic_",
        "iterations.compound_statement_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000658,
        "KHR-GLES3.shaders.loops.while_dynamic",
        "_iterations.sequence_statement_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000659,
        "KHR-GLES3.shaders.loops.while_dynamic_",
        "iterations.sequence_statement_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000660,
        "KHR-GLES3.shaders.loops.while_dyna",
        "mic_iterations.no_iterations_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000661,
        "KHR-GLES3.shaders.loops.while_dynam",
        "ic_iterations.no_iterations_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000662,
        "KHR-GLES3.shaders.loops.while_dynami",
        "c_iterations.single_iteration_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000663,
        "KHR-GLES3.shaders.loops.while_dynamic",
        "_iterations.single_iteration_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000664,
        "KHR-GLES3.shaders.loops.while_dynamic_i",
        "terations.select_iteration_count_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000665,
        "KHR-GLES3.shaders.loops.while_dynamic_it",
        "erations.select_iteration_count_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000666,
        "KHR-GLES3.shaders.loops.while_dynamic_",
        "iterations.conditional_continue_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000667,
        "KHR-GLES3.shaders.loops.while_dynamic_i",
        "terations.conditional_continue_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000668,
        "KHR-GLES3.shaders.loops.while_dynamic_i",
        "terations.unconditional_continue_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000669,
        "KHR-GLES3.shaders.loops.while_dynamic_it",
        "erations.unconditional_continue_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000670,
        "KHR-GLES3.shaders.loops.while_dyna",
        "mic_iterations.only_continue_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000671,
        "KHR-GLES3.shaders.loops.while_dynam",
        "ic_iterations.only_continue_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000672,
        "KHR-GLES3.shaders.loops.while_dynam",
        "ic_iterations.double_continue_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000673,
        "KHR-GLES3.shaders.loops.while_dynami",
        "c_iterations.double_continue_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000674,
        "KHR-GLES3.shaders.loops.while_dynami",
        "c_iterations.conditional_break_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000675,
        "KHR-GLES3.shaders.loops.while_dynamic",
        "_iterations.conditional_break_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000676,
        "KHR-GLES3.shaders.loops.while_dynamic",
        "_iterations.unconditional_break_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000677,
        "KHR-GLES3.shaders.loops.while_dynamic_",
        "iterations.unconditional_break_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000678,
        "KHR-GLES3.shaders.loops.while_dyna",
        "mic_iterations.pre_increment_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000679,
        "KHR-GLES3.shaders.loops.while_dynam",
        "ic_iterations.pre_increment_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000680,
        "KHR-GLES3.shaders.loops.while_dynam",
        "ic_iterations.post_increment_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000681,
        "KHR-GLES3.shaders.loops.while_dynami",
        "c_iterations.post_increment_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000682,
        "KHR-GLES3.shaders.loops.while_dynamic_",
        "iterations.mixed_break_continue_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000683,
        "KHR-GLES3.shaders.loops.while_dynamic_i",
        "terations.mixed_break_continue_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000684,
        "KHR-GLES3.shaders.loops.while_dynam",
        "ic_iterations.vector_counter_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000685,
        "KHR-GLES3.shaders.loops.while_dynami",
        "c_iterations.vector_counter_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000686,
        "KHR-GLES3.shaders.loops.while_dynam",
        "ic_iterations.101_iterations_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000687,
        "KHR-GLES3.shaders.loops.while_dynami",
        "c_iterations.101_iterations_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000688,
        "KHR-GLES3.shaders.loops.while_dy",
        "namic_iterations.sequence_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000689,
        "KHR-GLES3.shaders.loops.while_dyn",
        "amic_iterations.sequence_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000690,
        "KHR-GLES3.shaders.loops.while_d",
        "ynamic_iterations.nested_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000691,
        "KHR-GLES3.shaders.loops.while_dy",
        "namic_iterations.nested_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000692,
        "KHR-GLES3.shaders.loops.while_dynam",
        "ic_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000693,
        "KHR-GLES3.shaders.loops.while_dynami",
        "c_iterations.nested_sequence_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000694,
        "KHR-GLES3.shaders.loops.while_dynamic_it",
        "erations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000695,
        "KHR-GLES3.shaders.loops.while_dynamic_ite",
        "rations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000696,
        "KHR-GLES3.shaders.loops.while_dynamic_it",
        "erations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000697,
        "KHR-GLES3.shaders.loops.while_dynamic_ite",
        "rations.nested_tricky_dataflow_2_fragment");
