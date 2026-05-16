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

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006899,
        "dEQP-GLES3.functional.shaders.loops.while",
        "_constant_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006900,
        "dEQP-GLES3.functional.shaders.loops.while_",
        "constant_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006901,
        "dEQP-GLES3.functional.shaders.loops.while_",
        "constant_iterations.basic_lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006902,
        "dEQP-GLES3.functional.shaders.loops.while_c",
        "onstant_iterations.basic_lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006903,
        "dEQP-GLES3.functional.shaders.loops.while_c",
        "onstant_iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006904,
        "dEQP-GLES3.functional.shaders.loops.while_co",
        "nstant_iterations.basic_mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006905,
        "dEQP-GLES3.functional.shaders.loops.while_co",
        "nstant_iterations.basic_mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006906,
        "dEQP-GLES3.functional.shaders.loops.while_con",
        "stant_iterations.basic_mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006907,
        "dEQP-GLES3.functional.shaders.loops.while_",
        "constant_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006908,
        "dEQP-GLES3.functional.shaders.loops.while_c",
        "onstant_iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006909,
        "dEQP-GLES3.functional.shaders.loops.while_c",
        "onstant_iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006910,
        "dEQP-GLES3.functional.shaders.loops.while_co",
        "nstant_iterations.basic_highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006911,
        "dEQP-GLES3.functional.shaders.loops.whi",
        "le_constant_iterations.empty_body_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006912,
        "dEQP-GLES3.functional.shaders.loops.whil",
        "e_constant_iterations.empty_body_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006913,
        "dEQP-GLES3.functional.shaders.loops.while_constant_ite",
        "rations.infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006914,
        "dEQP-GLES3.functional.shaders.loops.while_constant_iter",
        "ations.infinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006915,
        "dEQP-GLES3.functional.shaders.loops.while_constant_it",
        "erations.infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006916,
        "dEQP-GLES3.functional.shaders.loops.while_constant_ite",
        "rations.infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006917,
        "dEQP-GLES3.functional.shaders.loops.while_constant",
        "_iterations.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006918,
        "dEQP-GLES3.functional.shaders.loops.while_constant_",
        "iterations.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006919,
        "dEQP-GLES3.functional.shaders.loops.while_",
        "constant_iterations.single_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006920,
        "dEQP-GLES3.functional.shaders.loops.while_c",
        "onstant_iterations.single_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006921,
        "dEQP-GLES3.functional.shaders.loops.while_c",
        "onstant_iterations.compound_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006922,
        "dEQP-GLES3.functional.shaders.loops.while_co",
        "nstant_iterations.compound_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006923,
        "dEQP-GLES3.functional.shaders.loops.while_c",
        "onstant_iterations.sequence_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006924,
        "dEQP-GLES3.functional.shaders.loops.while_co",
        "nstant_iterations.sequence_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006925,
        "dEQP-GLES3.functional.shaders.loops.while",
        "_constant_iterations.no_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006926,
        "dEQP-GLES3.functional.shaders.loops.while_",
        "constant_iterations.no_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006927,
        "dEQP-GLES3.functional.shaders.loops.while_",
        "constant_iterations.single_iteration_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006928,
        "dEQP-GLES3.functional.shaders.loops.while_c",
        "onstant_iterations.single_iteration_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006929,
        "dEQP-GLES3.functional.shaders.loops.while_con",
        "stant_iterations.select_iteration_count_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006930,
        "dEQP-GLES3.functional.shaders.loops.while_cons",
        "tant_iterations.select_iteration_count_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006931,
        "dEQP-GLES3.functional.shaders.loops.while_co",
        "nstant_iterations.conditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006932,
        "dEQP-GLES3.functional.shaders.loops.while_con",
        "stant_iterations.conditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006933,
        "dEQP-GLES3.functional.shaders.loops.while_con",
        "stant_iterations.unconditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006934,
        "dEQP-GLES3.functional.shaders.loops.while_cons",
        "tant_iterations.unconditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006935,
        "dEQP-GLES3.functional.shaders.loops.while",
        "_constant_iterations.only_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006936,
        "dEQP-GLES3.functional.shaders.loops.while_",
        "constant_iterations.only_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006937,
        "dEQP-GLES3.functional.shaders.loops.while_",
        "constant_iterations.double_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006938,
        "dEQP-GLES3.functional.shaders.loops.while_c",
        "onstant_iterations.double_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006939,
        "dEQP-GLES3.functional.shaders.loops.while_c",
        "onstant_iterations.conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006940,
        "dEQP-GLES3.functional.shaders.loops.while_co",
        "nstant_iterations.conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006941,
        "dEQP-GLES3.functional.shaders.loops.while_co",
        "nstant_iterations.unconditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006942,
        "dEQP-GLES3.functional.shaders.loops.while_con",
        "stant_iterations.unconditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006943,
        "dEQP-GLES3.functional.shaders.loops.while",
        "_constant_iterations.pre_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006944,
        "dEQP-GLES3.functional.shaders.loops.while_",
        "constant_iterations.pre_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006945,
        "dEQP-GLES3.functional.shaders.loops.while",
        "_constant_iterations.post_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006946,
        "dEQP-GLES3.functional.shaders.loops.while_",
        "constant_iterations.post_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006947,
        "dEQP-GLES3.functional.shaders.loops.while_co",
        "nstant_iterations.mixed_break_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006948,
        "dEQP-GLES3.functional.shaders.loops.while_con",
        "stant_iterations.mixed_break_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006949,
        "dEQP-GLES3.functional.shaders.loops.while",
        "_constant_iterations.vector_counter_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006950,
        "dEQP-GLES3.functional.shaders.loops.while_",
        "constant_iterations.vector_counter_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006951,
        "dEQP-GLES3.functional.shaders.loops.while",
        "_constant_iterations.101_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006952,
        "dEQP-GLES3.functional.shaders.loops.while_",
        "constant_iterations.101_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006953,
        "dEQP-GLES3.functional.shaders.loops.wh",
        "ile_constant_iterations.sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006954,
        "dEQP-GLES3.functional.shaders.loops.whi",
        "le_constant_iterations.sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006955,
        "dEQP-GLES3.functional.shaders.loops.w",
        "hile_constant_iterations.nested_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006956,
        "dEQP-GLES3.functional.shaders.loops.wh",
        "ile_constant_iterations.nested_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006957,
        "dEQP-GLES3.functional.shaders.loops.while_",
        "constant_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006958,
        "dEQP-GLES3.functional.shaders.loops.while_c",
        "onstant_iterations.nested_sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006959,
        "dEQP-GLES3.functional.shaders.loops.while_cons",
        "tant_iterations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006960,
        "dEQP-GLES3.functional.shaders.loops.while_const",
        "ant_iterations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006961,
        "dEQP-GLES3.functional.shaders.loops.while_cons",
        "tant_iterations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006962,
        "dEQP-GLES3.functional.shaders.loops.while_const",
        "ant_iterations.nested_tricky_dataflow_2_fragment");
