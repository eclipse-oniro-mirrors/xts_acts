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

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003863,
        "dEQP-GLES2.functional.shaders.loops.do_whi",
        "le_dynamic_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003864,
        "dEQP-GLES2.functional.shaders.loops.do_whil",
        "e_dynamic_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003865,
        "dEQP-GLES2.functional.shaders.loops.do_whil",
        "e_dynamic_iterations.basic_lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003866,
        "dEQP-GLES2.functional.shaders.loops.do_while",
        "_dynamic_iterations.basic_lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003867,
        "dEQP-GLES2.functional.shaders.loops.do_while",
        "_dynamic_iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003868,
        "dEQP-GLES2.functional.shaders.loops.do_while_",
        "dynamic_iterations.basic_mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003869,
        "dEQP-GLES2.functional.shaders.loops.do_while_",
        "dynamic_iterations.basic_mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003870,
        "dEQP-GLES2.functional.shaders.loops.do_while_d",
        "ynamic_iterations.basic_mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003871,
        "dEQP-GLES2.functional.shaders.loops.do_whil",
        "e_dynamic_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003872,
        "dEQP-GLES2.functional.shaders.loops.do_while",
        "_dynamic_iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003873,
        "dEQP-GLES2.functional.shaders.loops.do_while",
        "_dynamic_iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003874,
        "dEQP-GLES2.functional.shaders.loops.do_while_",
        "dynamic_iterations.basic_highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003875,
        "dEQP-GLES2.functional.shaders.loops.do_w",
        "hile_dynamic_iterations.empty_body_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003876,
        "dEQP-GLES2.functional.shaders.loops.do_wh",
        "ile_dynamic_iterations.empty_body_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003877,
        "dEQP-GLES2.functional.shaders.loops.do_while_dynamic_it",
        "erations.infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003878,
        "dEQP-GLES2.functional.shaders.loops.do_while_dynamic_ite",
        "rations.infinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003879,
        "dEQP-GLES2.functional.shaders.loops.do_while_dynamic_i",
        "terations.infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003880,
        "dEQP-GLES2.functional.shaders.loops.do_while_dynamic_it",
        "erations.infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003881,
        "dEQP-GLES2.functional.shaders.loops.do_while_dynami",
        "c_iterations.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003882,
        "dEQP-GLES2.functional.shaders.loops.do_while_dynamic",
        "_iterations.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003883,
        "dEQP-GLES2.functional.shaders.loops.do_whil",
        "e_dynamic_iterations.single_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003884,
        "dEQP-GLES2.functional.shaders.loops.do_while",
        "_dynamic_iterations.single_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003885,
        "dEQP-GLES2.functional.shaders.loops.do_while",
        "_dynamic_iterations.compound_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003886,
        "dEQP-GLES2.functional.shaders.loops.do_while_",
        "dynamic_iterations.compound_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003887,
        "dEQP-GLES2.functional.shaders.loops.do_while",
        "_dynamic_iterations.sequence_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003888,
        "dEQP-GLES2.functional.shaders.loops.do_while_",
        "dynamic_iterations.sequence_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003889,
        "dEQP-GLES2.functional.shaders.loops.do_whil",
        "e_dynamic_iterations.single_iteration_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003890,
        "dEQP-GLES2.functional.shaders.loops.do_while",
        "_dynamic_iterations.single_iteration_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003891,
        "dEQP-GLES2.functional.shaders.loops.do_while_d",
        "ynamic_iterations.select_iteration_count_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003892,
        "dEQP-GLES2.functional.shaders.loops.do_while_dy",
        "namic_iterations.select_iteration_count_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003893,
        "dEQP-GLES2.functional.shaders.loops.do_while_",
        "dynamic_iterations.conditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003894,
        "dEQP-GLES2.functional.shaders.loops.do_while_d",
        "ynamic_iterations.conditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003895,
        "dEQP-GLES2.functional.shaders.loops.do_while_d",
        "ynamic_iterations.unconditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003896,
        "dEQP-GLES2.functional.shaders.loops.do_while_dy",
        "namic_iterations.unconditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003897,
        "dEQP-GLES2.functional.shaders.loops.do_whi",
        "le_dynamic_iterations.only_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003898,
        "dEQP-GLES2.functional.shaders.loops.do_whil",
        "e_dynamic_iterations.only_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003899,
        "dEQP-GLES2.functional.shaders.loops.do_whil",
        "e_dynamic_iterations.double_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003900,
        "dEQP-GLES2.functional.shaders.loops.do_while",
        "_dynamic_iterations.double_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003901,
        "dEQP-GLES2.functional.shaders.loops.do_while",
        "_dynamic_iterations.conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003902,
        "dEQP-GLES2.functional.shaders.loops.do_while_",
        "dynamic_iterations.conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003903,
        "dEQP-GLES2.functional.shaders.loops.do_while_",
        "dynamic_iterations.unconditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003904,
        "dEQP-GLES2.functional.shaders.loops.do_while_d",
        "ynamic_iterations.unconditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003905,
        "dEQP-GLES2.functional.shaders.loops.do_whi",
        "le_dynamic_iterations.pre_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003906,
        "dEQP-GLES2.functional.shaders.loops.do_whil",
        "e_dynamic_iterations.pre_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003907,
        "dEQP-GLES2.functional.shaders.loops.do_whi",
        "le_dynamic_iterations.post_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003908,
        "dEQP-GLES2.functional.shaders.loops.do_whil",
        "e_dynamic_iterations.post_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003909,
        "dEQP-GLES2.functional.shaders.loops.do_while_",
        "dynamic_iterations.mixed_break_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003910,
        "dEQP-GLES2.functional.shaders.loops.do_while_d",
        "ynamic_iterations.mixed_break_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003911,
        "dEQP-GLES2.functional.shaders.loops.do_whi",
        "le_dynamic_iterations.vector_counter_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003912,
        "dEQP-GLES2.functional.shaders.loops.do_whil",
        "e_dynamic_iterations.vector_counter_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003913,
        "dEQP-GLES2.functional.shaders.loops.do_whi",
        "le_dynamic_iterations.101_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003914,
        "dEQP-GLES2.functional.shaders.loops.do_whil",
        "e_dynamic_iterations.101_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003915,
        "dEQP-GLES2.functional.shaders.loops.do_",
        "while_dynamic_iterations.sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003916,
        "dEQP-GLES2.functional.shaders.loops.do_w",
        "hile_dynamic_iterations.sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003917,
        "dEQP-GLES2.functional.shaders.loops.do",
        "_while_dynamic_iterations.nested_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003918,
        "dEQP-GLES2.functional.shaders.loops.do_",
        "while_dynamic_iterations.nested_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003919,
        "dEQP-GLES2.functional.shaders.loops.do_whil",
        "e_dynamic_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003920,
        "dEQP-GLES2.functional.shaders.loops.do_while",
        "_dynamic_iterations.nested_sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003921,
        "dEQP-GLES2.functional.shaders.loops.do_while_dy",
        "namic_iterations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003922,
        "dEQP-GLES2.functional.shaders.loops.do_while_dyn",
        "amic_iterations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003923,
        "dEQP-GLES2.functional.shaders.loops.do_while_dy",
        "namic_iterations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003924,
        "dEQP-GLES2.functional.shaders.loops.do_while_dyn",
        "amic_iterations.nested_tricky_dataflow_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003925,
        "dEQP-GLES2.functional.shaders.loops.do_whil",
        "e_dynamic_iterations.conditional_body_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003926,
        "dEQP-GLES2.functional.shaders.loops.do_while",
        "_dynamic_iterations.conditional_body_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003927,
        "dEQP-GLES2.functional.shaders.loops.do_while_",
        "dynamic_iterations.function_call_return_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003928,
        "dEQP-GLES2.functional.shaders.loops.do_while_d",
        "ynamic_iterations.function_call_return_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003929,
        "dEQP-GLES2.functional.shaders.loops.do_while_",
        "dynamic_iterations.function_call_inout_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003930,
        "dEQP-GLES2.functional.shaders.loops.do_while_d",
        "ynamic_iterations.function_call_inout_fragment");
