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

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000326,
        "KHR-GLES3.shaders.loops.for_consta",
        "nt_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000327,
        "KHR-GLES3.shaders.loops.for_constan",
        "t_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000328,
        "KHR-GLES3.shaders.loops.for_constant",
        "_iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000329,
        "KHR-GLES3.shaders.loops.for_constant_",
        "iterations.basic_mediump_int_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000330,
        "KHR-GLES3.shaders.loops.for_constant_",
        "iterations.basic_mediump_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000331,
        "KHR-GLES3.shaders.loops.for_constant_i",
        "terations.basic_mediump_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000332,
        "KHR-GLES3.shaders.loops.for_constan",
        "t_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000333,
        "KHR-GLES3.shaders.loops.for_constant",
        "_iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000334,
        "KHR-GLES3.shaders.loops.for_constant",
        "_iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000335,
        "KHR-GLES3.shaders.loops.for_constant_",
        "iterations.basic_highp_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000336,
        "KHR-GLES3.shaders.loops.for_cons",
        "tant_iterations.empty_body_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000337,
        "KHR-GLES3.shaders.loops.for_const",
        "ant_iterations.empty_body_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000338,
        "KHR-GLES3.shaders.loops.for_constant_iterations",
        ".infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000339,
        "KHR-GLES3.shaders.loops.for_constant_iterations.",
        "infinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000340,
        "KHR-GLES3.shaders.loops.for_constant_iteration",
        "s.infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000341,
        "KHR-GLES3.shaders.loops.for_constant_iterations",
        ".infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000342,
        "KHR-GLES3.shaders.loops.for_constant_iterat",
        "ions.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000343,
        "KHR-GLES3.shaders.loops.for_constant_iterati",
        "ons.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000344,
        "KHR-GLES3.shaders.loops.for_constan",
        "t_iterations.single_statement_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000345,
        "KHR-GLES3.shaders.loops.for_constant",
        "_iterations.single_statement_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000346,
        "KHR-GLES3.shaders.loops.for_constant",
        "_iterations.compound_statement_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000347,
        "KHR-GLES3.shaders.loops.for_constant_",
        "iterations.compound_statement_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000348,
        "KHR-GLES3.shaders.loops.for_constant",
        "_iterations.sequence_statement_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000349,
        "KHR-GLES3.shaders.loops.for_constant_",
        "iterations.sequence_statement_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000350,
        "KHR-GLES3.shaders.loops.for_consta",
        "nt_iterations.no_iterations_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000351,
        "KHR-GLES3.shaders.loops.for_constan",
        "t_iterations.no_iterations_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000352,
        "KHR-GLES3.shaders.loops.for_constan",
        "t_iterations.single_iteration_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000353,
        "KHR-GLES3.shaders.loops.for_constant",
        "_iterations.single_iteration_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000354,
        "KHR-GLES3.shaders.loops.for_constant_i",
        "terations.select_iteration_count_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000355,
        "KHR-GLES3.shaders.loops.for_constant_it",
        "erations.select_iteration_count_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000356,
        "KHR-GLES3.shaders.loops.for_constant_",
        "iterations.conditional_continue_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000357,
        "KHR-GLES3.shaders.loops.for_constant_i",
        "terations.conditional_continue_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000358,
        "KHR-GLES3.shaders.loops.for_constant_i",
        "terations.unconditional_continue_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000359,
        "KHR-GLES3.shaders.loops.for_constant_it",
        "erations.unconditional_continue_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000360,
        "KHR-GLES3.shaders.loops.for_consta",
        "nt_iterations.only_continue_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000361,
        "KHR-GLES3.shaders.loops.for_constan",
        "t_iterations.only_continue_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000362,
        "KHR-GLES3.shaders.loops.for_constan",
        "t_iterations.double_continue_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000363,
        "KHR-GLES3.shaders.loops.for_constant",
        "_iterations.double_continue_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000364,
        "KHR-GLES3.shaders.loops.for_constant",
        "_iterations.conditional_break_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000365,
        "KHR-GLES3.shaders.loops.for_constant_",
        "iterations.conditional_break_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000366,
        "KHR-GLES3.shaders.loops.for_constant_",
        "iterations.unconditional_break_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000367,
        "KHR-GLES3.shaders.loops.for_constant_i",
        "terations.unconditional_break_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000368,
        "KHR-GLES3.shaders.loops.for_consta",
        "nt_iterations.pre_increment_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000369,
        "KHR-GLES3.shaders.loops.for_constan",
        "t_iterations.pre_increment_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000370,
        "KHR-GLES3.shaders.loops.for_consta",
        "nt_iterations.post_increment_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000371,
        "KHR-GLES3.shaders.loops.for_constan",
        "t_iterations.post_increment_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000372,
        "KHR-GLES3.shaders.loops.for_constant_",
        "iterations.mixed_break_continue_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000373,
        "KHR-GLES3.shaders.loops.for_constant_i",
        "terations.mixed_break_continue_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000374,
        "KHR-GLES3.shaders.loops.for_consta",
        "nt_iterations.vector_counter_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000375,
        "KHR-GLES3.shaders.loops.for_constan",
        "t_iterations.vector_counter_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000376,
        "KHR-GLES3.shaders.loops.for_consta",
        "nt_iterations.101_iterations_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000377,
        "KHR-GLES3.shaders.loops.for_constan",
        "t_iterations.101_iterations_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000378,
        "KHR-GLES3.shaders.loops.for_con",
        "stant_iterations.sequence_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000379,
        "KHR-GLES3.shaders.loops.for_cons",
        "tant_iterations.sequence_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000380,
        "KHR-GLES3.shaders.loops.for_co",
        "nstant_iterations.nested_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000381,
        "KHR-GLES3.shaders.loops.for_con",
        "stant_iterations.nested_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000382,
        "KHR-GLES3.shaders.loops.for_constan",
        "t_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000383,
        "KHR-GLES3.shaders.loops.for_constant",
        "_iterations.nested_sequence_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000384,
        "KHR-GLES3.shaders.loops.for_constant_it",
        "erations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000385,
        "KHR-GLES3.shaders.loops.for_constant_ite",
        "rations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000386,
        "KHR-GLES3.shaders.loops.for_constant_it",
        "erations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000387,
        "KHR-GLES3.shaders.loops.for_constant_ite",
        "rations.nested_tricky_dataflow_2_fragment");
