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
#include "../ActsDeqpgles30007TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006771,
        "dEQP-GLES3.functional.shaders.loops.for_",
        "uniform_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006772,
        "dEQP-GLES3.functional.shaders.loops.for_u",
        "niform_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006773,
        "dEQP-GLES3.functional.shaders.loops.for_u",
        "niform_iterations.basic_lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006774,
        "dEQP-GLES3.functional.shaders.loops.for_un",
        "iform_iterations.basic_lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006775,
        "dEQP-GLES3.functional.shaders.loops.for_u",
        "niform_iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006776,
        "dEQP-GLES3.functional.shaders.loops.for_un",
        "iform_iterations.basic_mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006777,
        "dEQP-GLES3.functional.shaders.loops.for_un",
        "iform_iterations.basic_mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006778,
        "dEQP-GLES3.functional.shaders.loops.for_uni",
        "form_iterations.basic_mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006779,
        "dEQP-GLES3.functional.shaders.loops.for_",
        "uniform_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006780,
        "dEQP-GLES3.functional.shaders.loops.for_u",
        "niform_iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006781,
        "dEQP-GLES3.functional.shaders.loops.for_u",
        "niform_iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006782,
        "dEQP-GLES3.functional.shaders.loops.for_un",
        "iform_iterations.basic_highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006783,
        "dEQP-GLES3.functional.shaders.loops.fo",
        "r_uniform_iterations.empty_body_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006784,
        "dEQP-GLES3.functional.shaders.loops.for",
        "_uniform_iterations.empty_body_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006785,
        "dEQP-GLES3.functional.shaders.loops.for_uniform_iter",
        "ations.infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006786,
        "dEQP-GLES3.functional.shaders.loops.for_uniform_itera",
        "tions.infinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006787,
        "dEQP-GLES3.functional.shaders.loops.for_uniform_iter",
        "ations.infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006788,
        "dEQP-GLES3.functional.shaders.loops.for_uniform_itera",
        "tions.infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006789,
        "dEQP-GLES3.functional.shaders.loops.for_uniform_",
        "iterations.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006790,
        "dEQP-GLES3.functional.shaders.loops.for_uniform_i",
        "terations.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006791,
        "dEQP-GLES3.functional.shaders.loops.for_u",
        "niform_iterations.single_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006792,
        "dEQP-GLES3.functional.shaders.loops.for_un",
        "iform_iterations.single_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006793,
        "dEQP-GLES3.functional.shaders.loops.for_un",
        "iform_iterations.compound_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006794,
        "dEQP-GLES3.functional.shaders.loops.for_uni",
        "form_iterations.compound_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006795,
        "dEQP-GLES3.functional.shaders.loops.for_un",
        "iform_iterations.sequence_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006796,
        "dEQP-GLES3.functional.shaders.loops.for_uni",
        "form_iterations.sequence_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006797,
        "dEQP-GLES3.functional.shaders.loops.for",
        "_uniform_iterations.no_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006798,
        "dEQP-GLES3.functional.shaders.loops.for_",
        "uniform_iterations.no_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006799,
        "dEQP-GLES3.functional.shaders.loops.for_u",
        "niform_iterations.single_iteration_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006800,
        "dEQP-GLES3.functional.shaders.loops.for_un",
        "iform_iterations.single_iteration_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006801,
        "dEQP-GLES3.functional.shaders.loops.for_unif",
        "orm_iterations.select_iteration_count_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006802,
        "dEQP-GLES3.functional.shaders.loops.for_unifo",
        "rm_iterations.select_iteration_count_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006803,
        "dEQP-GLES3.functional.shaders.loops.for_uni",
        "form_iterations.conditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006804,
        "dEQP-GLES3.functional.shaders.loops.for_unif",
        "orm_iterations.conditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006805,
        "dEQP-GLES3.functional.shaders.loops.for_unif",
        "orm_iterations.unconditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006806,
        "dEQP-GLES3.functional.shaders.loops.for_unifo",
        "rm_iterations.unconditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006807,
        "dEQP-GLES3.functional.shaders.loops.for",
        "_uniform_iterations.only_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006808,
        "dEQP-GLES3.functional.shaders.loops.for_",
        "uniform_iterations.only_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006809,
        "dEQP-GLES3.functional.shaders.loops.for_",
        "uniform_iterations.double_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006810,
        "dEQP-GLES3.functional.shaders.loops.for_u",
        "niform_iterations.double_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006811,
        "dEQP-GLES3.functional.shaders.loops.for_u",
        "niform_iterations.conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006812,
        "dEQP-GLES3.functional.shaders.loops.for_un",
        "iform_iterations.conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006813,
        "dEQP-GLES3.functional.shaders.loops.for_un",
        "iform_iterations.unconditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006814,
        "dEQP-GLES3.functional.shaders.loops.for_uni",
        "form_iterations.unconditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006815,
        "dEQP-GLES3.functional.shaders.loops.for",
        "_uniform_iterations.pre_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006816,
        "dEQP-GLES3.functional.shaders.loops.for_",
        "uniform_iterations.pre_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006817,
        "dEQP-GLES3.functional.shaders.loops.for_",
        "uniform_iterations.post_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006818,
        "dEQP-GLES3.functional.shaders.loops.for_u",
        "niform_iterations.post_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006819,
        "dEQP-GLES3.functional.shaders.loops.for_uni",
        "form_iterations.mixed_break_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006820,
        "dEQP-GLES3.functional.shaders.loops.for_unif",
        "orm_iterations.mixed_break_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006821,
        "dEQP-GLES3.functional.shaders.loops.for_",
        "uniform_iterations.vector_counter_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006822,
        "dEQP-GLES3.functional.shaders.loops.for_u",
        "niform_iterations.vector_counter_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006823,
        "dEQP-GLES3.functional.shaders.loops.for_",
        "uniform_iterations.101_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006824,
        "dEQP-GLES3.functional.shaders.loops.for_u",
        "niform_iterations.101_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006825,
        "dEQP-GLES3.functional.shaders.loops.f",
        "or_uniform_iterations.sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006826,
        "dEQP-GLES3.functional.shaders.loops.fo",
        "r_uniform_iterations.sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006827,
        "dEQP-GLES3.functional.shaders.loops.",
        "for_uniform_iterations.nested_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006828,
        "dEQP-GLES3.functional.shaders.loops.f",
        "or_uniform_iterations.nested_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006829,
        "dEQP-GLES3.functional.shaders.loops.for_",
        "uniform_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006830,
        "dEQP-GLES3.functional.shaders.loops.for_u",
        "niform_iterations.nested_sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006831,
        "dEQP-GLES3.functional.shaders.loops.for_unifo",
        "rm_iterations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006832,
        "dEQP-GLES3.functional.shaders.loops.for_unifor",
        "m_iterations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006833,
        "dEQP-GLES3.functional.shaders.loops.for_unifo",
        "rm_iterations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006834,
        "dEQP-GLES3.functional.shaders.loops.for_unifor",
        "m_iterations.nested_tricky_dataflow_2_fragment");
