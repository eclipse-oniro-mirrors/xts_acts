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

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000388,
        "KHR-GLES3.shaders.loops.for_unifor",
        "m_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000389,
        "KHR-GLES3.shaders.loops.for_uniform",
        "_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000390,
        "KHR-GLES3.shaders.loops.for_uniform",
        "_iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000391,
        "KHR-GLES3.shaders.loops.for_uniform_",
        "iterations.basic_mediump_int_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000392,
        "KHR-GLES3.shaders.loops.for_uniform_",
        "iterations.basic_mediump_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000393,
        "KHR-GLES3.shaders.loops.for_uniform_i",
        "terations.basic_mediump_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000394,
        "KHR-GLES3.shaders.loops.for_unifor",
        "m_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000395,
        "KHR-GLES3.shaders.loops.for_uniform",
        "_iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000396,
        "KHR-GLES3.shaders.loops.for_uniform",
        "_iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000397,
        "KHR-GLES3.shaders.loops.for_uniform_",
        "iterations.basic_highp_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000398,
        "KHR-GLES3.shaders.loops.for_unif",
        "orm_iterations.empty_body_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000399,
        "KHR-GLES3.shaders.loops.for_unifo",
        "rm_iterations.empty_body_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000400,
        "KHR-GLES3.shaders.loops.for_uniform_iterations",
        ".infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000401,
        "KHR-GLES3.shaders.loops.for_uniform_iterations.",
        "infinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000402,
        "KHR-GLES3.shaders.loops.for_uniform_iterations",
        ".infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000403,
        "KHR-GLES3.shaders.loops.for_uniform_iterations.",
        "infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000404,
        "KHR-GLES3.shaders.loops.for_uniform_iterat",
        "ions.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000405,
        "KHR-GLES3.shaders.loops.for_uniform_iterati",
        "ons.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000406,
        "KHR-GLES3.shaders.loops.for_uniform",
        "_iterations.single_statement_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000407,
        "KHR-GLES3.shaders.loops.for_uniform_",
        "iterations.single_statement_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000408,
        "KHR-GLES3.shaders.loops.for_uniform_",
        "iterations.compound_statement_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000409,
        "KHR-GLES3.shaders.loops.for_uniform_i",
        "terations.compound_statement_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000410,
        "KHR-GLES3.shaders.loops.for_uniform_",
        "iterations.sequence_statement_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000411,
        "KHR-GLES3.shaders.loops.for_uniform_i",
        "terations.sequence_statement_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000412,
        "KHR-GLES3.shaders.loops.for_unifo",
        "rm_iterations.no_iterations_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000413,
        "KHR-GLES3.shaders.loops.for_unifor",
        "m_iterations.no_iterations_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000414,
        "KHR-GLES3.shaders.loops.for_uniform",
        "_iterations.single_iteration_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000415,
        "KHR-GLES3.shaders.loops.for_uniform_",
        "iterations.single_iteration_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000416,
        "KHR-GLES3.shaders.loops.for_uniform_it",
        "erations.select_iteration_count_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000417,
        "KHR-GLES3.shaders.loops.for_uniform_ite",
        "rations.select_iteration_count_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000418,
        "KHR-GLES3.shaders.loops.for_uniform_i",
        "terations.conditional_continue_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000419,
        "KHR-GLES3.shaders.loops.for_uniform_it",
        "erations.conditional_continue_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000420,
        "KHR-GLES3.shaders.loops.for_uniform_it",
        "erations.unconditional_continue_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000421,
        "KHR-GLES3.shaders.loops.for_uniform_ite",
        "rations.unconditional_continue_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000422,
        "KHR-GLES3.shaders.loops.for_unifo",
        "rm_iterations.only_continue_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000423,
        "KHR-GLES3.shaders.loops.for_unifor",
        "m_iterations.only_continue_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000424,
        "KHR-GLES3.shaders.loops.for_unifor",
        "m_iterations.double_continue_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000425,
        "KHR-GLES3.shaders.loops.for_uniform",
        "_iterations.double_continue_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000426,
        "KHR-GLES3.shaders.loops.for_uniform",
        "_iterations.conditional_break_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000427,
        "KHR-GLES3.shaders.loops.for_uniform_",
        "iterations.conditional_break_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000428,
        "KHR-GLES3.shaders.loops.for_uniform_",
        "iterations.unconditional_break_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000429,
        "KHR-GLES3.shaders.loops.for_uniform_i",
        "terations.unconditional_break_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000430,
        "KHR-GLES3.shaders.loops.for_unifo",
        "rm_iterations.pre_increment_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000431,
        "KHR-GLES3.shaders.loops.for_unifor",
        "m_iterations.pre_increment_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000432,
        "KHR-GLES3.shaders.loops.for_unifor",
        "m_iterations.post_increment_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000433,
        "KHR-GLES3.shaders.loops.for_uniform",
        "_iterations.post_increment_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000434,
        "KHR-GLES3.shaders.loops.for_uniform_i",
        "terations.mixed_break_continue_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000435,
        "KHR-GLES3.shaders.loops.for_uniform_it",
        "erations.mixed_break_continue_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000436,
        "KHR-GLES3.shaders.loops.for_unifor",
        "m_iterations.vector_counter_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000437,
        "KHR-GLES3.shaders.loops.for_uniform",
        "_iterations.vector_counter_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000438,
        "KHR-GLES3.shaders.loops.for_unifor",
        "m_iterations.101_iterations_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000439,
        "KHR-GLES3.shaders.loops.for_uniform",
        "_iterations.101_iterations_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000440,
        "KHR-GLES3.shaders.loops.for_uni",
        "form_iterations.sequence_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000441,
        "KHR-GLES3.shaders.loops.for_unif",
        "orm_iterations.sequence_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000442,
        "KHR-GLES3.shaders.loops.for_un",
        "iform_iterations.nested_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000443,
        "KHR-GLES3.shaders.loops.for_uni",
        "form_iterations.nested_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000444,
        "KHR-GLES3.shaders.loops.for_unifor",
        "m_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000445,
        "KHR-GLES3.shaders.loops.for_uniform",
        "_iterations.nested_sequence_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000446,
        "KHR-GLES3.shaders.loops.for_uniform_ite",
        "rations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000447,
        "KHR-GLES3.shaders.loops.for_uniform_iter",
        "ations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000448,
        "KHR-GLES3.shaders.loops.for_uniform_ite",
        "rations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000449,
        "KHR-GLES3.shaders.loops.for_uniform_iter",
        "ations.nested_tricky_dataflow_2_fragment");
