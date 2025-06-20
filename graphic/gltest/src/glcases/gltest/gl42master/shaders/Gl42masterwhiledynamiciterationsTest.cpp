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

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001905,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001906,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001907,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001908,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.basic_mediump_int_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001909,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.basic_mediump_float_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001910,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.basic_mediump_float_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001911,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001912,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001913,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001914,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.basic_highp_float_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001915,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.empty_body_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001916,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.empty_body_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001917,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001918,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.infinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001919,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001920,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001921,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001922,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001923,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.single_statement_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001924,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.single_statement_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001925,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.compound_statement_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001926,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.compound_statement_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001927,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.sequence_statement_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001928,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.sequence_statement_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001929,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.no_iterations_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001930,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.no_iterations_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001931,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.single_iteration_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001932,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.single_iteration_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001933,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.select_iteration_count_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001934,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.select_iteration_count_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001935,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.conditional_continue_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001936,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.conditional_continue_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001937,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.unconditional_continue_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001938,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.unconditional_continue_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001939,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.only_continue_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001940,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.only_continue_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001941,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.double_continue_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001942,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.double_continue_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001943,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.conditional_break_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001944,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.conditional_break_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001945,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.unconditional_break_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001946,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.unconditional_break_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001947,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.pre_increment_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001948,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.pre_increment_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001949,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.post_increment_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001950,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.post_increment_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001951,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.mixed_break_continue_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001952,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.mixed_break_continue_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001953,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.vector_counter_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001954,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.vector_counter_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001955,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.101_iterations_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001956,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.101_iterations_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001957,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.sequence_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001958,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.sequence_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001959,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.nested_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001960,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.nested_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001961,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001962,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.nested_sequence_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001963,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001964,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001965,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001966,
    "KHR-GL42.shaders.loops.while_dynamic_iterations.nested_tricky_dataflow_2_fragment");
