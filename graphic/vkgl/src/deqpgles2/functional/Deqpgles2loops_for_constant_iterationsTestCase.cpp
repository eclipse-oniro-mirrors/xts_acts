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

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003307,
        "dEQP-GLES2.functional.shaders.loops.for_",
        "constant_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003308,
        "dEQP-GLES2.functional.shaders.loops.for_c",
        "onstant_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003309,
        "dEQP-GLES2.functional.shaders.loops.for_c",
        "onstant_iterations.basic_lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003310,
        "dEQP-GLES2.functional.shaders.loops.for_co",
        "nstant_iterations.basic_lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003311,
        "dEQP-GLES2.functional.shaders.loops.for_co",
        "nstant_iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003312,
        "dEQP-GLES2.functional.shaders.loops.for_con",
        "stant_iterations.basic_mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003313,
        "dEQP-GLES2.functional.shaders.loops.for_con",
        "stant_iterations.basic_mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003314,
        "dEQP-GLES2.functional.shaders.loops.for_cons",
        "tant_iterations.basic_mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003315,
        "dEQP-GLES2.functional.shaders.loops.for_c",
        "onstant_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003316,
        "dEQP-GLES2.functional.shaders.loops.for_co",
        "nstant_iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003317,
        "dEQP-GLES2.functional.shaders.loops.for_co",
        "nstant_iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003318,
        "dEQP-GLES2.functional.shaders.loops.for_con",
        "stant_iterations.basic_highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003319,
        "dEQP-GLES2.functional.shaders.loops.fo",
        "r_constant_iterations.empty_body_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003320,
        "dEQP-GLES2.functional.shaders.loops.for",
        "_constant_iterations.empty_body_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003321,
        "dEQP-GLES2.functional.shaders.loops.for_constant_iter",
        "ations.infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003322,
        "dEQP-GLES2.functional.shaders.loops.for_constant_itera",
        "tions.infinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003323,
        "dEQP-GLES2.functional.shaders.loops.for_constant_ite",
        "rations.infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003324,
        "dEQP-GLES2.functional.shaders.loops.for_constant_iter",
        "ations.infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003325,
        "dEQP-GLES2.functional.shaders.loops.for_constant_",
        "iterations.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003326,
        "dEQP-GLES2.functional.shaders.loops.for_constant_i",
        "terations.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003327,
        "dEQP-GLES2.functional.shaders.loops.for_c",
        "onstant_iterations.single_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003328,
        "dEQP-GLES2.functional.shaders.loops.for_co",
        "nstant_iterations.single_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003329,
        "dEQP-GLES2.functional.shaders.loops.for_co",
        "nstant_iterations.compound_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003330,
        "dEQP-GLES2.functional.shaders.loops.for_con",
        "stant_iterations.compound_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003331,
        "dEQP-GLES2.functional.shaders.loops.for_co",
        "nstant_iterations.sequence_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003332,
        "dEQP-GLES2.functional.shaders.loops.for_con",
        "stant_iterations.sequence_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003333,
        "dEQP-GLES2.functional.shaders.loops.for_",
        "constant_iterations.no_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003334,
        "dEQP-GLES2.functional.shaders.loops.for_c",
        "onstant_iterations.no_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003335,
        "dEQP-GLES2.functional.shaders.loops.for_c",
        "onstant_iterations.single_iteration_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003336,
        "dEQP-GLES2.functional.shaders.loops.for_co",
        "nstant_iterations.single_iteration_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003337,
        "dEQP-GLES2.functional.shaders.loops.for_cons",
        "tant_iterations.select_iteration_count_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003338,
        "dEQP-GLES2.functional.shaders.loops.for_const",
        "ant_iterations.select_iteration_count_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003339,
        "dEQP-GLES2.functional.shaders.loops.for_con",
        "stant_iterations.conditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003340,
        "dEQP-GLES2.functional.shaders.loops.for_cons",
        "tant_iterations.conditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003341,
        "dEQP-GLES2.functional.shaders.loops.for_cons",
        "tant_iterations.unconditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003342,
        "dEQP-GLES2.functional.shaders.loops.for_const",
        "ant_iterations.unconditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003343,
        "dEQP-GLES2.functional.shaders.loops.for_",
        "constant_iterations.only_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003344,
        "dEQP-GLES2.functional.shaders.loops.for_c",
        "onstant_iterations.only_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003345,
        "dEQP-GLES2.functional.shaders.loops.for_c",
        "onstant_iterations.double_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003346,
        "dEQP-GLES2.functional.shaders.loops.for_co",
        "nstant_iterations.double_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003347,
        "dEQP-GLES2.functional.shaders.loops.for_co",
        "nstant_iterations.conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003348,
        "dEQP-GLES2.functional.shaders.loops.for_con",
        "stant_iterations.conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003349,
        "dEQP-GLES2.functional.shaders.loops.for_con",
        "stant_iterations.unconditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003350,
        "dEQP-GLES2.functional.shaders.loops.for_cons",
        "tant_iterations.unconditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003351,
        "dEQP-GLES2.functional.shaders.loops.for_",
        "constant_iterations.pre_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003352,
        "dEQP-GLES2.functional.shaders.loops.for_c",
        "onstant_iterations.pre_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003353,
        "dEQP-GLES2.functional.shaders.loops.for_",
        "constant_iterations.post_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003354,
        "dEQP-GLES2.functional.shaders.loops.for_c",
        "onstant_iterations.post_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003355,
        "dEQP-GLES2.functional.shaders.loops.for_con",
        "stant_iterations.mixed_break_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003356,
        "dEQP-GLES2.functional.shaders.loops.for_cons",
        "tant_iterations.mixed_break_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003357,
        "dEQP-GLES2.functional.shaders.loops.for_",
        "constant_iterations.vector_counter_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003358,
        "dEQP-GLES2.functional.shaders.loops.for_c",
        "onstant_iterations.vector_counter_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003359,
        "dEQP-GLES2.functional.shaders.loops.for_",
        "constant_iterations.101_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003360,
        "dEQP-GLES2.functional.shaders.loops.for_c",
        "onstant_iterations.101_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003361,
        "dEQP-GLES2.functional.shaders.loops.f",
        "or_constant_iterations.sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003362,
        "dEQP-GLES2.functional.shaders.loops.fo",
        "r_constant_iterations.sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003363,
        "dEQP-GLES2.functional.shaders.loops.",
        "for_constant_iterations.nested_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003364,
        "dEQP-GLES2.functional.shaders.loops.f",
        "or_constant_iterations.nested_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003365,
        "dEQP-GLES2.functional.shaders.loops.for_c",
        "onstant_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003366,
        "dEQP-GLES2.functional.shaders.loops.for_co",
        "nstant_iterations.nested_sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003367,
        "dEQP-GLES2.functional.shaders.loops.for_const",
        "ant_iterations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003368,
        "dEQP-GLES2.functional.shaders.loops.for_consta",
        "nt_iterations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003369,
        "dEQP-GLES2.functional.shaders.loops.for_const",
        "ant_iterations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003370,
        "dEQP-GLES2.functional.shaders.loops.for_consta",
        "nt_iterations.nested_tricky_dataflow_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003371,
        "dEQP-GLES2.functional.shaders.loops.for_c",
        "onstant_iterations.conditional_body_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003372,
        "dEQP-GLES2.functional.shaders.loops.for_co",
        "nstant_iterations.conditional_body_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003373,
        "dEQP-GLES2.functional.shaders.loops.for_con",
        "stant_iterations.function_call_return_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003374,
        "dEQP-GLES2.functional.shaders.loops.for_cons",
        "tant_iterations.function_call_return_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003375,
        "dEQP-GLES2.functional.shaders.loops.for_con",
        "stant_iterations.function_call_inout_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003376,
        "dEQP-GLES2.functional.shaders.loops.for_cons",
        "tant_iterations.function_call_inout_fragment");
