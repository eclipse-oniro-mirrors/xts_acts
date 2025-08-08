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

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000574,
        "KHR-GLES3.shaders.loops.while_unifo",
        "rm_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000575,
        "KHR-GLES3.shaders.loops.while_unifor",
        "m_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000576,
        "KHR-GLES3.shaders.loops.while_unifor",
        "m_iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000577,
        "KHR-GLES3.shaders.loops.while_uniform",
        "_iterations.basic_mediump_int_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000578,
        "KHR-GLES3.shaders.loops.while_uniform",
        "_iterations.basic_mediump_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000579,
        "KHR-GLES3.shaders.loops.while_uniform_",
        "iterations.basic_mediump_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000580,
        "KHR-GLES3.shaders.loops.while_unifo",
        "rm_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000581,
        "KHR-GLES3.shaders.loops.while_unifor",
        "m_iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000582,
        "KHR-GLES3.shaders.loops.while_unifor",
        "m_iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000583,
        "KHR-GLES3.shaders.loops.while_uniform",
        "_iterations.basic_highp_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000584,
        "KHR-GLES3.shaders.loops.while_uni",
        "form_iterations.empty_body_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000585,
        "KHR-GLES3.shaders.loops.while_unif",
        "orm_iterations.empty_body_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000586,
        "KHR-GLES3.shaders.loops.while_uniform_iteration",
        "s.infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000587,
        "KHR-GLES3.shaders.loops.while_uniform_iterations",
        ".infinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000588,
        "KHR-GLES3.shaders.loops.while_uniform_iteration",
        "s.infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000589,
        "KHR-GLES3.shaders.loops.while_uniform_iterations",
        ".infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000590,
        "KHR-GLES3.shaders.loops.while_uniform_itera",
        "tions.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000591,
        "KHR-GLES3.shaders.loops.while_uniform_iterat",
        "ions.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000592,
        "KHR-GLES3.shaders.loops.while_unifor",
        "m_iterations.single_statement_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000593,
        "KHR-GLES3.shaders.loops.while_uniform",
        "_iterations.single_statement_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000594,
        "KHR-GLES3.shaders.loops.while_uniform",
        "_iterations.compound_statement_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000595,
        "KHR-GLES3.shaders.loops.while_uniform_",
        "iterations.compound_statement_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000596,
        "KHR-GLES3.shaders.loops.while_uniform",
        "_iterations.sequence_statement_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000597,
        "KHR-GLES3.shaders.loops.while_uniform_",
        "iterations.sequence_statement_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000598,
        "KHR-GLES3.shaders.loops.while_unif",
        "orm_iterations.no_iterations_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000599,
        "KHR-GLES3.shaders.loops.while_unifo",
        "rm_iterations.no_iterations_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000600,
        "KHR-GLES3.shaders.loops.while_unifor",
        "m_iterations.single_iteration_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000601,
        "KHR-GLES3.shaders.loops.while_uniform",
        "_iterations.single_iteration_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000602,
        "KHR-GLES3.shaders.loops.while_uniform_i",
        "terations.select_iteration_count_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000603,
        "KHR-GLES3.shaders.loops.while_uniform_it",
        "erations.select_iteration_count_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000604,
        "KHR-GLES3.shaders.loops.while_uniform_",
        "iterations.conditional_continue_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000605,
        "KHR-GLES3.shaders.loops.while_uniform_i",
        "terations.conditional_continue_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000606,
        "KHR-GLES3.shaders.loops.while_uniform_i",
        "terations.unconditional_continue_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000607,
        "KHR-GLES3.shaders.loops.while_uniform_it",
        "erations.unconditional_continue_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000608,
        "KHR-GLES3.shaders.loops.while_unif",
        "orm_iterations.only_continue_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000609,
        "KHR-GLES3.shaders.loops.while_unifo",
        "rm_iterations.only_continue_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000610,
        "KHR-GLES3.shaders.loops.while_unifo",
        "rm_iterations.double_continue_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000611,
        "KHR-GLES3.shaders.loops.while_unifor",
        "m_iterations.double_continue_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000612,
        "KHR-GLES3.shaders.loops.while_unifor",
        "m_iterations.conditional_break_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000613,
        "KHR-GLES3.shaders.loops.while_uniform",
        "_iterations.conditional_break_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000614,
        "KHR-GLES3.shaders.loops.while_uniform",
        "_iterations.unconditional_break_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000615,
        "KHR-GLES3.shaders.loops.while_uniform_",
        "iterations.unconditional_break_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000616,
        "KHR-GLES3.shaders.loops.while_unif",
        "orm_iterations.pre_increment_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000617,
        "KHR-GLES3.shaders.loops.while_unifo",
        "rm_iterations.pre_increment_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000618,
        "KHR-GLES3.shaders.loops.while_unifo",
        "rm_iterations.post_increment_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000619,
        "KHR-GLES3.shaders.loops.while_unifor",
        "m_iterations.post_increment_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000620,
        "KHR-GLES3.shaders.loops.while_uniform_",
        "iterations.mixed_break_continue_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000621,
        "KHR-GLES3.shaders.loops.while_uniform_i",
        "terations.mixed_break_continue_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000622,
        "KHR-GLES3.shaders.loops.while_unifo",
        "rm_iterations.vector_counter_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000623,
        "KHR-GLES3.shaders.loops.while_unifor",
        "m_iterations.vector_counter_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000624,
        "KHR-GLES3.shaders.loops.while_unifo",
        "rm_iterations.101_iterations_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000625,
        "KHR-GLES3.shaders.loops.while_unifor",
        "m_iterations.101_iterations_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000626,
        "KHR-GLES3.shaders.loops.while_un",
        "iform_iterations.sequence_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000627,
        "KHR-GLES3.shaders.loops.while_uni",
        "form_iterations.sequence_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000628,
        "KHR-GLES3.shaders.loops.while_u",
        "niform_iterations.nested_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000629,
        "KHR-GLES3.shaders.loops.while_un",
        "iform_iterations.nested_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000630,
        "KHR-GLES3.shaders.loops.while_unifo",
        "rm_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000631,
        "KHR-GLES3.shaders.loops.while_unifor",
        "m_iterations.nested_sequence_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000632,
        "KHR-GLES3.shaders.loops.while_uniform_it",
        "erations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000633,
        "KHR-GLES3.shaders.loops.while_uniform_ite",
        "rations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000634,
        "KHR-GLES3.shaders.loops.while_uniform_it",
        "erations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000635,
        "KHR-GLES3.shaders.loops.while_uniform_ite",
        "rations.nested_tricky_dataflow_2_fragment");
