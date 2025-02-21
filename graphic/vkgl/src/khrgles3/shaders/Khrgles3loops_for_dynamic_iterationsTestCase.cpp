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

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000450,
        "KHR-GLES3.shaders.loops.for_dynami",
        "c_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000451,
        "KHR-GLES3.shaders.loops.for_dynamic",
        "_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000452,
        "KHR-GLES3.shaders.loops.for_dynamic",
        "_iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000453,
        "KHR-GLES3.shaders.loops.for_dynamic_",
        "iterations.basic_mediump_int_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000454,
        "KHR-GLES3.shaders.loops.for_dynamic_",
        "iterations.basic_mediump_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000455,
        "KHR-GLES3.shaders.loops.for_dynamic_i",
        "terations.basic_mediump_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000456,
        "KHR-GLES3.shaders.loops.for_dynami",
        "c_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000457,
        "KHR-GLES3.shaders.loops.for_dynamic",
        "_iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000458,
        "KHR-GLES3.shaders.loops.for_dynamic",
        "_iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000459,
        "KHR-GLES3.shaders.loops.for_dynamic_",
        "iterations.basic_highp_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000460,
        "KHR-GLES3.shaders.loops.for_dyna",
        "mic_iterations.empty_body_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000461,
        "KHR-GLES3.shaders.loops.for_dynam",
        "ic_iterations.empty_body_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000462,
        "KHR-GLES3.shaders.loops.for_dynamic_iterations",
        ".infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000463,
        "KHR-GLES3.shaders.loops.for_dynamic_iterations.",
        "infinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000464,
        "KHR-GLES3.shaders.loops.for_dynamic_iterations",
        ".infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000465,
        "KHR-GLES3.shaders.loops.for_dynamic_iterations.",
        "infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000466,
        "KHR-GLES3.shaders.loops.for_dynamic_iterat",
        "ions.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000467,
        "KHR-GLES3.shaders.loops.for_dynamic_iterati",
        "ons.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000468,
        "KHR-GLES3.shaders.loops.for_dynamic",
        "_iterations.single_statement_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000469,
        "KHR-GLES3.shaders.loops.for_dynamic_",
        "iterations.single_statement_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000470,
        "KHR-GLES3.shaders.loops.for_dynamic_",
        "iterations.compound_statement_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000471,
        "KHR-GLES3.shaders.loops.for_dynamic_i",
        "terations.compound_statement_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000472,
        "KHR-GLES3.shaders.loops.for_dynamic_",
        "iterations.sequence_statement_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000473,
        "KHR-GLES3.shaders.loops.for_dynamic_i",
        "terations.sequence_statement_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000474,
        "KHR-GLES3.shaders.loops.for_dynam",
        "ic_iterations.no_iterations_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000475,
        "KHR-GLES3.shaders.loops.for_dynami",
        "c_iterations.no_iterations_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000476,
        "KHR-GLES3.shaders.loops.for_dynamic",
        "_iterations.single_iteration_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000477,
        "KHR-GLES3.shaders.loops.for_dynamic_",
        "iterations.single_iteration_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000478,
        "KHR-GLES3.shaders.loops.for_dynamic_it",
        "erations.select_iteration_count_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000479,
        "KHR-GLES3.shaders.loops.for_dynamic_ite",
        "rations.select_iteration_count_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000480,
        "KHR-GLES3.shaders.loops.for_dynamic_i",
        "terations.conditional_continue_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000481,
        "KHR-GLES3.shaders.loops.for_dynamic_it",
        "erations.conditional_continue_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000482,
        "KHR-GLES3.shaders.loops.for_dynamic_it",
        "erations.unconditional_continue_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000483,
        "KHR-GLES3.shaders.loops.for_dynamic_ite",
        "rations.unconditional_continue_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000484,
        "KHR-GLES3.shaders.loops.for_dynam",
        "ic_iterations.only_continue_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000485,
        "KHR-GLES3.shaders.loops.for_dynami",
        "c_iterations.only_continue_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000486,
        "KHR-GLES3.shaders.loops.for_dynami",
        "c_iterations.double_continue_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000487,
        "KHR-GLES3.shaders.loops.for_dynamic",
        "_iterations.double_continue_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000488,
        "KHR-GLES3.shaders.loops.for_dynamic",
        "_iterations.conditional_break_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000489,
        "KHR-GLES3.shaders.loops.for_dynamic_",
        "iterations.conditional_break_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000490,
        "KHR-GLES3.shaders.loops.for_dynamic_",
        "iterations.unconditional_break_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000491,
        "KHR-GLES3.shaders.loops.for_dynamic_i",
        "terations.unconditional_break_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000492,
        "KHR-GLES3.shaders.loops.for_dynam",
        "ic_iterations.pre_increment_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000493,
        "KHR-GLES3.shaders.loops.for_dynami",
        "c_iterations.pre_increment_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000494,
        "KHR-GLES3.shaders.loops.for_dynami",
        "c_iterations.post_increment_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000495,
        "KHR-GLES3.shaders.loops.for_dynamic",
        "_iterations.post_increment_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000496,
        "KHR-GLES3.shaders.loops.for_dynamic_i",
        "terations.mixed_break_continue_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000497,
        "KHR-GLES3.shaders.loops.for_dynamic_it",
        "erations.mixed_break_continue_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000498,
        "KHR-GLES3.shaders.loops.for_dynami",
        "c_iterations.vector_counter_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000499,
        "KHR-GLES3.shaders.loops.for_dynamic",
        "_iterations.vector_counter_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000500,
        "KHR-GLES3.shaders.loops.for_dynami",
        "c_iterations.101_iterations_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000501,
        "KHR-GLES3.shaders.loops.for_dynamic",
        "_iterations.101_iterations_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000502,
        "KHR-GLES3.shaders.loops.for_dyn",
        "amic_iterations.sequence_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000503,
        "KHR-GLES3.shaders.loops.for_dyna",
        "mic_iterations.sequence_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000504,
        "KHR-GLES3.shaders.loops.for_dy",
        "namic_iterations.nested_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000505,
        "KHR-GLES3.shaders.loops.for_dyn",
        "amic_iterations.nested_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000506,
        "KHR-GLES3.shaders.loops.for_dynami",
        "c_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000507,
        "KHR-GLES3.shaders.loops.for_dynamic",
        "_iterations.nested_sequence_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000508,
        "KHR-GLES3.shaders.loops.for_dynamic_ite",
        "rations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000509,
        "KHR-GLES3.shaders.loops.for_dynamic_iter",
        "ations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000510,
        "KHR-GLES3.shaders.loops.for_dynamic_ite",
        "rations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000511,
        "KHR-GLES3.shaders.loops.for_dynamic_iter",
        "ations.nested_tricky_dataflow_2_fragment");
