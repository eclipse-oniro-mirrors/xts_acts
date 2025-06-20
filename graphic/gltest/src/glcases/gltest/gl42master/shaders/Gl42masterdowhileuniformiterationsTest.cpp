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
#include "../Gl42masterBaseFunc.h"
#include "../ActsGl42master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002027,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002028,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002029,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002030,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.basic_mediump_int_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002031,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.basic_mediump_float_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002032,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.basic_mediump_float_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002033,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002034,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002035,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002036,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.basic_highp_float_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002037,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.empty_body_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002038,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.empty_body_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002039,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002040,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.infinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002041,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002042,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002043,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002044,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002045,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.single_statement_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002046,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.single_statement_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002047,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.compound_statement_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002048,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.compound_statement_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002049,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.sequence_statement_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002050,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.sequence_statement_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002051,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.single_iteration_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002052,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.single_iteration_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002053,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.select_iteration_count_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002054,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.select_iteration_count_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002055,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.conditional_continue_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002056,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.conditional_continue_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002057,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.unconditional_continue_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002058,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.unconditional_continue_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002059,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.only_continue_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002060,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.only_continue_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002061,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.double_continue_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002062,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.double_continue_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002063,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.conditional_break_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002064,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.conditional_break_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002065,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.unconditional_break_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002066,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.unconditional_break_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002067,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.pre_increment_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002068,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.pre_increment_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002069,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.post_increment_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002070,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.post_increment_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002071,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.mixed_break_continue_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002072,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.mixed_break_continue_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002073,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.vector_counter_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002074,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.vector_counter_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002075,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.101_iterations_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002076,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.101_iterations_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002077,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.sequence_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002078,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.sequence_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002079,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.nested_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002080,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.nested_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002081,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002082,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.nested_sequence_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002083,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002084,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002085,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002086,
    "KHR-GL42.shaders.loops.do_while_uniform_iterations.nested_tricky_dataflow_2_fragment");
