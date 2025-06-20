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
#include "../Gl43masterBaseFunc.h"
#include "../ActsGl43master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002087,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002088,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002089,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002090,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.basic_mediump_int_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002091,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.basic_mediump_float_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002092,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.basic_mediump_float_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002093,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002094,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002095,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002096,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.basic_highp_float_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002097,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.empty_body_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002098,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.empty_body_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002099,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002100,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.infinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002101,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002102,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002103,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002104,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002105,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.single_statement_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002106,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.single_statement_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002107,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.compound_statement_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002108,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.compound_statement_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002109,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.sequence_statement_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002110,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.sequence_statement_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002111,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.single_iteration_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002112,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.single_iteration_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002113,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.select_iteration_count_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002114,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.select_iteration_count_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002115,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.conditional_continue_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002116,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.conditional_continue_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002117,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.unconditional_continue_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002118,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.unconditional_continue_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002119,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.only_continue_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002120,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.only_continue_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002121,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.double_continue_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002122,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.double_continue_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002123,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.conditional_break_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002124,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.conditional_break_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002125,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.unconditional_break_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002126,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.unconditional_break_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002127,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.pre_increment_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002128,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.pre_increment_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002129,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.post_increment_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002130,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.post_increment_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002131,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.mixed_break_continue_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002132,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.mixed_break_continue_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002133,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.vector_counter_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002134,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.vector_counter_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002135,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.101_iterations_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002136,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.101_iterations_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002137,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.sequence_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002138,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.sequence_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002139,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.nested_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002140,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.nested_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002141,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002142,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.nested_sequence_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002143,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002144,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002145,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002146,
    "KHR-GL43.shaders.loops.do_while_dynamic_iterations.nested_tricky_dataflow_2_fragment");
