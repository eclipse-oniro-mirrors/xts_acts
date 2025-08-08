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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20004TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003377,
        "dEQP-GLES2.functional.shaders.loops.for_",
        "uniform_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003378,
        "dEQP-GLES2.functional.shaders.loops.for_u",
        "niform_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003379,
        "dEQP-GLES2.functional.shaders.loops.for_u",
        "niform_iterations.basic_lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003380,
        "dEQP-GLES2.functional.shaders.loops.for_un",
        "iform_iterations.basic_lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003381,
        "dEQP-GLES2.functional.shaders.loops.for_u",
        "niform_iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003382,
        "dEQP-GLES2.functional.shaders.loops.for_un",
        "iform_iterations.basic_mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003383,
        "dEQP-GLES2.functional.shaders.loops.for_un",
        "iform_iterations.basic_mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003384,
        "dEQP-GLES2.functional.shaders.loops.for_uni",
        "form_iterations.basic_mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003385,
        "dEQP-GLES2.functional.shaders.loops.for_",
        "uniform_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003386,
        "dEQP-GLES2.functional.shaders.loops.for_u",
        "niform_iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003387,
        "dEQP-GLES2.functional.shaders.loops.for_u",
        "niform_iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003388,
        "dEQP-GLES2.functional.shaders.loops.for_un",
        "iform_iterations.basic_highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003389,
        "dEQP-GLES2.functional.shaders.loops.fo",
        "r_uniform_iterations.empty_body_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003390,
        "dEQP-GLES2.functional.shaders.loops.for",
        "_uniform_iterations.empty_body_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003391,
        "dEQP-GLES2.functional.shaders.loops.for_uniform_iter",
        "ations.infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003392,
        "dEQP-GLES2.functional.shaders.loops.for_uniform_itera",
        "tions.infinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003393,
        "dEQP-GLES2.functional.shaders.loops.for_uniform_iter",
        "ations.infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003394,
        "dEQP-GLES2.functional.shaders.loops.for_uniform_itera",
        "tions.infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003395,
        "dEQP-GLES2.functional.shaders.loops.for_uniform_",
        "iterations.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003396,
        "dEQP-GLES2.functional.shaders.loops.for_uniform_i",
        "terations.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003397,
        "dEQP-GLES2.functional.shaders.loops.for_u",
        "niform_iterations.single_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003398,
        "dEQP-GLES2.functional.shaders.loops.for_un",
        "iform_iterations.single_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003399,
        "dEQP-GLES2.functional.shaders.loops.for_un",
        "iform_iterations.compound_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003400,
        "dEQP-GLES2.functional.shaders.loops.for_uni",
        "form_iterations.compound_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003401,
        "dEQP-GLES2.functional.shaders.loops.for_un",
        "iform_iterations.sequence_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003402,
        "dEQP-GLES2.functional.shaders.loops.for_uni",
        "form_iterations.sequence_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003403,
        "dEQP-GLES2.functional.shaders.loops.for",
        "_uniform_iterations.no_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003404,
        "dEQP-GLES2.functional.shaders.loops.for_",
        "uniform_iterations.no_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003405,
        "dEQP-GLES2.functional.shaders.loops.for_u",
        "niform_iterations.single_iteration_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003406,
        "dEQP-GLES2.functional.shaders.loops.for_un",
        "iform_iterations.single_iteration_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003407,
        "dEQP-GLES2.functional.shaders.loops.for_unif",
        "orm_iterations.select_iteration_count_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003408,
        "dEQP-GLES2.functional.shaders.loops.for_unifo",
        "rm_iterations.select_iteration_count_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003409,
        "dEQP-GLES2.functional.shaders.loops.for_uni",
        "form_iterations.conditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003410,
        "dEQP-GLES2.functional.shaders.loops.for_unif",
        "orm_iterations.conditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003411,
        "dEQP-GLES2.functional.shaders.loops.for_unif",
        "orm_iterations.unconditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003412,
        "dEQP-GLES2.functional.shaders.loops.for_unifo",
        "rm_iterations.unconditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003413,
        "dEQP-GLES2.functional.shaders.loops.for",
        "_uniform_iterations.only_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003414,
        "dEQP-GLES2.functional.shaders.loops.for_",
        "uniform_iterations.only_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003415,
        "dEQP-GLES2.functional.shaders.loops.for_",
        "uniform_iterations.double_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003416,
        "dEQP-GLES2.functional.shaders.loops.for_u",
        "niform_iterations.double_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003417,
        "dEQP-GLES2.functional.shaders.loops.for_u",
        "niform_iterations.conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003418,
        "dEQP-GLES2.functional.shaders.loops.for_un",
        "iform_iterations.conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003419,
        "dEQP-GLES2.functional.shaders.loops.for_un",
        "iform_iterations.unconditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003420,
        "dEQP-GLES2.functional.shaders.loops.for_uni",
        "form_iterations.unconditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003421,
        "dEQP-GLES2.functional.shaders.loops.for",
        "_uniform_iterations.pre_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003422,
        "dEQP-GLES2.functional.shaders.loops.for_",
        "uniform_iterations.pre_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003423,
        "dEQP-GLES2.functional.shaders.loops.for_",
        "uniform_iterations.post_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003424,
        "dEQP-GLES2.functional.shaders.loops.for_u",
        "niform_iterations.post_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003425,
        "dEQP-GLES2.functional.shaders.loops.for_uni",
        "form_iterations.mixed_break_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003426,
        "dEQP-GLES2.functional.shaders.loops.for_unif",
        "orm_iterations.mixed_break_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003427,
        "dEQP-GLES2.functional.shaders.loops.for_",
        "uniform_iterations.vector_counter_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003428,
        "dEQP-GLES2.functional.shaders.loops.for_u",
        "niform_iterations.vector_counter_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003429,
        "dEQP-GLES2.functional.shaders.loops.for_",
        "uniform_iterations.101_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003430,
        "dEQP-GLES2.functional.shaders.loops.for_u",
        "niform_iterations.101_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003431,
        "dEQP-GLES2.functional.shaders.loops.f",
        "or_uniform_iterations.sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003432,
        "dEQP-GLES2.functional.shaders.loops.fo",
        "r_uniform_iterations.sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003433,
        "dEQP-GLES2.functional.shaders.loops.",
        "for_uniform_iterations.nested_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003434,
        "dEQP-GLES2.functional.shaders.loops.f",
        "or_uniform_iterations.nested_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003435,
        "dEQP-GLES2.functional.shaders.loops.for_",
        "uniform_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003436,
        "dEQP-GLES2.functional.shaders.loops.for_u",
        "niform_iterations.nested_sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003437,
        "dEQP-GLES2.functional.shaders.loops.for_unifo",
        "rm_iterations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003438,
        "dEQP-GLES2.functional.shaders.loops.for_unifor",
        "m_iterations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003439,
        "dEQP-GLES2.functional.shaders.loops.for_unifo",
        "rm_iterations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003440,
        "dEQP-GLES2.functional.shaders.loops.for_unifor",
        "m_iterations.nested_tricky_dataflow_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003441,
        "dEQP-GLES2.functional.shaders.loops.for_u",
        "niform_iterations.conditional_body_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003442,
        "dEQP-GLES2.functional.shaders.loops.for_un",
        "iform_iterations.conditional_body_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003443,
        "dEQP-GLES2.functional.shaders.loops.for_uni",
        "form_iterations.function_call_return_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003444,
        "dEQP-GLES2.functional.shaders.loops.for_unif",
        "orm_iterations.function_call_return_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003445,
        "dEQP-GLES2.functional.shaders.loops.for_un",
        "iform_iterations.function_call_inout_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003446,
        "dEQP-GLES2.functional.shaders.loops.for_uni",
        "form_iterations.function_call_inout_fragment");
