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

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003727,
        "dEQP-GLES2.functional.shaders.loops.do_whil",
        "e_constant_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003728,
        "dEQP-GLES2.functional.shaders.loops.do_while",
        "_constant_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003729,
        "dEQP-GLES2.functional.shaders.loops.do_while",
        "_constant_iterations.basic_lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003730,
        "dEQP-GLES2.functional.shaders.loops.do_while_",
        "constant_iterations.basic_lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003731,
        "dEQP-GLES2.functional.shaders.loops.do_while",
        "_constant_iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003732,
        "dEQP-GLES2.functional.shaders.loops.do_while_",
        "constant_iterations.basic_mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003733,
        "dEQP-GLES2.functional.shaders.loops.do_while_",
        "constant_iterations.basic_mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003734,
        "dEQP-GLES2.functional.shaders.loops.do_while_c",
        "onstant_iterations.basic_mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003735,
        "dEQP-GLES2.functional.shaders.loops.do_whil",
        "e_constant_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003736,
        "dEQP-GLES2.functional.shaders.loops.do_while",
        "_constant_iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003737,
        "dEQP-GLES2.functional.shaders.loops.do_while",
        "_constant_iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003738,
        "dEQP-GLES2.functional.shaders.loops.do_while_",
        "constant_iterations.basic_highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003739,
        "dEQP-GLES2.functional.shaders.loops.do_wh",
        "ile_constant_iterations.empty_body_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003740,
        "dEQP-GLES2.functional.shaders.loops.do_whi",
        "le_constant_iterations.empty_body_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003741,
        "dEQP-GLES2.functional.shaders.loops.do_while_constant_i",
        "terations.infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003742,
        "dEQP-GLES2.functional.shaders.loops.do_while_constant_it",
        "erations.infinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003743,
        "dEQP-GLES2.functional.shaders.loops.do_while_constant_i",
        "terations.infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003744,
        "dEQP-GLES2.functional.shaders.loops.do_while_constant_it",
        "erations.infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003745,
        "dEQP-GLES2.functional.shaders.loops.do_while_consta",
        "nt_iterations.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003746,
        "dEQP-GLES2.functional.shaders.loops.do_while_constan",
        "t_iterations.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003747,
        "dEQP-GLES2.functional.shaders.loops.do_while",
        "_constant_iterations.single_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003748,
        "dEQP-GLES2.functional.shaders.loops.do_while_",
        "constant_iterations.single_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003749,
        "dEQP-GLES2.functional.shaders.loops.do_while_",
        "constant_iterations.compound_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003750,
        "dEQP-GLES2.functional.shaders.loops.do_while_c",
        "onstant_iterations.compound_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003751,
        "dEQP-GLES2.functional.shaders.loops.do_while_",
        "constant_iterations.sequence_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003752,
        "dEQP-GLES2.functional.shaders.loops.do_while_c",
        "onstant_iterations.sequence_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003753,
        "dEQP-GLES2.functional.shaders.loops.do_while",
        "_constant_iterations.single_iteration_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003754,
        "dEQP-GLES2.functional.shaders.loops.do_while_",
        "constant_iterations.single_iteration_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003755,
        "dEQP-GLES2.functional.shaders.loops.do_while_co",
        "nstant_iterations.select_iteration_count_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003756,
        "dEQP-GLES2.functional.shaders.loops.do_while_con",
        "stant_iterations.select_iteration_count_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003757,
        "dEQP-GLES2.functional.shaders.loops.do_while_c",
        "onstant_iterations.conditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003758,
        "dEQP-GLES2.functional.shaders.loops.do_while_co",
        "nstant_iterations.conditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003759,
        "dEQP-GLES2.functional.shaders.loops.do_while_co",
        "nstant_iterations.unconditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003760,
        "dEQP-GLES2.functional.shaders.loops.do_while_con",
        "stant_iterations.unconditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003761,
        "dEQP-GLES2.functional.shaders.loops.do_whi",
        "le_constant_iterations.only_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003762,
        "dEQP-GLES2.functional.shaders.loops.do_whil",
        "e_constant_iterations.only_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003763,
        "dEQP-GLES2.functional.shaders.loops.do_whil",
        "e_constant_iterations.double_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003764,
        "dEQP-GLES2.functional.shaders.loops.do_while",
        "_constant_iterations.double_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003765,
        "dEQP-GLES2.functional.shaders.loops.do_while",
        "_constant_iterations.conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003766,
        "dEQP-GLES2.functional.shaders.loops.do_while_",
        "constant_iterations.conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003767,
        "dEQP-GLES2.functional.shaders.loops.do_while_",
        "constant_iterations.unconditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003768,
        "dEQP-GLES2.functional.shaders.loops.do_while_c",
        "onstant_iterations.unconditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003769,
        "dEQP-GLES2.functional.shaders.loops.do_whi",
        "le_constant_iterations.pre_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003770,
        "dEQP-GLES2.functional.shaders.loops.do_whil",
        "e_constant_iterations.pre_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003771,
        "dEQP-GLES2.functional.shaders.loops.do_whil",
        "e_constant_iterations.post_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003772,
        "dEQP-GLES2.functional.shaders.loops.do_while",
        "_constant_iterations.post_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003773,
        "dEQP-GLES2.functional.shaders.loops.do_while_c",
        "onstant_iterations.mixed_break_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003774,
        "dEQP-GLES2.functional.shaders.loops.do_while_co",
        "nstant_iterations.mixed_break_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003775,
        "dEQP-GLES2.functional.shaders.loops.do_whil",
        "e_constant_iterations.vector_counter_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003776,
        "dEQP-GLES2.functional.shaders.loops.do_while",
        "_constant_iterations.vector_counter_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003777,
        "dEQP-GLES2.functional.shaders.loops.do_whil",
        "e_constant_iterations.101_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003778,
        "dEQP-GLES2.functional.shaders.loops.do_while",
        "_constant_iterations.101_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003779,
        "dEQP-GLES2.functional.shaders.loops.do_w",
        "hile_constant_iterations.sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003780,
        "dEQP-GLES2.functional.shaders.loops.do_wh",
        "ile_constant_iterations.sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003781,
        "dEQP-GLES2.functional.shaders.loops.do_",
        "while_constant_iterations.nested_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003782,
        "dEQP-GLES2.functional.shaders.loops.do_w",
        "hile_constant_iterations.nested_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003783,
        "dEQP-GLES2.functional.shaders.loops.do_whil",
        "e_constant_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003784,
        "dEQP-GLES2.functional.shaders.loops.do_while",
        "_constant_iterations.nested_sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003785,
        "dEQP-GLES2.functional.shaders.loops.do_while_con",
        "stant_iterations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003786,
        "dEQP-GLES2.functional.shaders.loops.do_while_cons",
        "tant_iterations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003787,
        "dEQP-GLES2.functional.shaders.loops.do_while_con",
        "stant_iterations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003788,
        "dEQP-GLES2.functional.shaders.loops.do_while_cons",
        "tant_iterations.nested_tricky_dataflow_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003789,
        "dEQP-GLES2.functional.shaders.loops.do_while",
        "_constant_iterations.conditional_body_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003790,
        "dEQP-GLES2.functional.shaders.loops.do_while_",
        "constant_iterations.conditional_body_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003791,
        "dEQP-GLES2.functional.shaders.loops.do_while_c",
        "onstant_iterations.function_call_return_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003792,
        "dEQP-GLES2.functional.shaders.loops.do_while_co",
        "nstant_iterations.function_call_return_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003793,
        "dEQP-GLES2.functional.shaders.loops.do_while_",
        "constant_iterations.function_call_inout_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003794,
        "dEQP-GLES2.functional.shaders.loops.do_while_c",
        "onstant_iterations.function_call_inout_fragment");
