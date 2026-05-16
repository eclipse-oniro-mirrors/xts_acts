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

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006707,
        "dEQP-GLES3.functional.shaders.loops.for_",
        "constant_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006708,
        "dEQP-GLES3.functional.shaders.loops.for_c",
        "onstant_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006709,
        "dEQP-GLES3.functional.shaders.loops.for_c",
        "onstant_iterations.basic_lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006710,
        "dEQP-GLES3.functional.shaders.loops.for_co",
        "nstant_iterations.basic_lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006711,
        "dEQP-GLES3.functional.shaders.loops.for_co",
        "nstant_iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006712,
        "dEQP-GLES3.functional.shaders.loops.for_con",
        "stant_iterations.basic_mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006713,
        "dEQP-GLES3.functional.shaders.loops.for_con",
        "stant_iterations.basic_mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006714,
        "dEQP-GLES3.functional.shaders.loops.for_cons",
        "tant_iterations.basic_mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006715,
        "dEQP-GLES3.functional.shaders.loops.for_c",
        "onstant_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006716,
        "dEQP-GLES3.functional.shaders.loops.for_co",
        "nstant_iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006717,
        "dEQP-GLES3.functional.shaders.loops.for_co",
        "nstant_iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006718,
        "dEQP-GLES3.functional.shaders.loops.for_con",
        "stant_iterations.basic_highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006719,
        "dEQP-GLES3.functional.shaders.loops.fo",
        "r_constant_iterations.empty_body_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006720,
        "dEQP-GLES3.functional.shaders.loops.for",
        "_constant_iterations.empty_body_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006721,
        "dEQP-GLES3.functional.shaders.loops.for_constant_iter",
        "ations.infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006722,
        "dEQP-GLES3.functional.shaders.loops.for_constant_itera",
        "tions.infinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006723,
        "dEQP-GLES3.functional.shaders.loops.for_constant_ite",
        "rations.infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006724,
        "dEQP-GLES3.functional.shaders.loops.for_constant_iter",
        "ations.infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006725,
        "dEQP-GLES3.functional.shaders.loops.for_constant_",
        "iterations.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006726,
        "dEQP-GLES3.functional.shaders.loops.for_constant_i",
        "terations.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006727,
        "dEQP-GLES3.functional.shaders.loops.for_c",
        "onstant_iterations.single_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006728,
        "dEQP-GLES3.functional.shaders.loops.for_co",
        "nstant_iterations.single_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006729,
        "dEQP-GLES3.functional.shaders.loops.for_co",
        "nstant_iterations.compound_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006730,
        "dEQP-GLES3.functional.shaders.loops.for_con",
        "stant_iterations.compound_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006731,
        "dEQP-GLES3.functional.shaders.loops.for_co",
        "nstant_iterations.sequence_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006732,
        "dEQP-GLES3.functional.shaders.loops.for_con",
        "stant_iterations.sequence_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006733,
        "dEQP-GLES3.functional.shaders.loops.for_",
        "constant_iterations.no_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006734,
        "dEQP-GLES3.functional.shaders.loops.for_c",
        "onstant_iterations.no_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006735,
        "dEQP-GLES3.functional.shaders.loops.for_c",
        "onstant_iterations.single_iteration_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006736,
        "dEQP-GLES3.functional.shaders.loops.for_co",
        "nstant_iterations.single_iteration_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006737,
        "dEQP-GLES3.functional.shaders.loops.for_cons",
        "tant_iterations.select_iteration_count_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006738,
        "dEQP-GLES3.functional.shaders.loops.for_const",
        "ant_iterations.select_iteration_count_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006739,
        "dEQP-GLES3.functional.shaders.loops.for_con",
        "stant_iterations.conditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006740,
        "dEQP-GLES3.functional.shaders.loops.for_cons",
        "tant_iterations.conditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006741,
        "dEQP-GLES3.functional.shaders.loops.for_cons",
        "tant_iterations.unconditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006742,
        "dEQP-GLES3.functional.shaders.loops.for_const",
        "ant_iterations.unconditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006743,
        "dEQP-GLES3.functional.shaders.loops.for_",
        "constant_iterations.only_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006744,
        "dEQP-GLES3.functional.shaders.loops.for_c",
        "onstant_iterations.only_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006745,
        "dEQP-GLES3.functional.shaders.loops.for_c",
        "onstant_iterations.double_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006746,
        "dEQP-GLES3.functional.shaders.loops.for_co",
        "nstant_iterations.double_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006747,
        "dEQP-GLES3.functional.shaders.loops.for_co",
        "nstant_iterations.conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006748,
        "dEQP-GLES3.functional.shaders.loops.for_con",
        "stant_iterations.conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006749,
        "dEQP-GLES3.functional.shaders.loops.for_con",
        "stant_iterations.unconditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006750,
        "dEQP-GLES3.functional.shaders.loops.for_cons",
        "tant_iterations.unconditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006751,
        "dEQP-GLES3.functional.shaders.loops.for_",
        "constant_iterations.pre_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006752,
        "dEQP-GLES3.functional.shaders.loops.for_c",
        "onstant_iterations.pre_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006753,
        "dEQP-GLES3.functional.shaders.loops.for_",
        "constant_iterations.post_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006754,
        "dEQP-GLES3.functional.shaders.loops.for_c",
        "onstant_iterations.post_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006755,
        "dEQP-GLES3.functional.shaders.loops.for_con",
        "stant_iterations.mixed_break_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006756,
        "dEQP-GLES3.functional.shaders.loops.for_cons",
        "tant_iterations.mixed_break_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006757,
        "dEQP-GLES3.functional.shaders.loops.for_",
        "constant_iterations.vector_counter_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006758,
        "dEQP-GLES3.functional.shaders.loops.for_c",
        "onstant_iterations.vector_counter_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006759,
        "dEQP-GLES3.functional.shaders.loops.for_",
        "constant_iterations.101_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006760,
        "dEQP-GLES3.functional.shaders.loops.for_c",
        "onstant_iterations.101_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006761,
        "dEQP-GLES3.functional.shaders.loops.f",
        "or_constant_iterations.sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006762,
        "dEQP-GLES3.functional.shaders.loops.fo",
        "r_constant_iterations.sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006763,
        "dEQP-GLES3.functional.shaders.loops.",
        "for_constant_iterations.nested_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006764,
        "dEQP-GLES3.functional.shaders.loops.f",
        "or_constant_iterations.nested_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006765,
        "dEQP-GLES3.functional.shaders.loops.for_c",
        "onstant_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006766,
        "dEQP-GLES3.functional.shaders.loops.for_co",
        "nstant_iterations.nested_sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006767,
        "dEQP-GLES3.functional.shaders.loops.for_const",
        "ant_iterations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006768,
        "dEQP-GLES3.functional.shaders.loops.for_consta",
        "nt_iterations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006769,
        "dEQP-GLES3.functional.shaders.loops.for_const",
        "ant_iterations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006770,
        "dEQP-GLES3.functional.shaders.loops.for_consta",
        "nt_iterations.nested_tricky_dataflow_2_fragment");
