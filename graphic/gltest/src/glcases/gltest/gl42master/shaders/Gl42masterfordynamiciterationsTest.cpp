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

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001719,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001720,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001721,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001722,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.basic_mediump_int_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001723,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.basic_mediump_float_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001724,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.basic_mediump_float_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001725,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001726,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001727,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001728,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.basic_highp_float_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001729,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.empty_body_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001730,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.empty_body_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001731,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001732,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.infinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001733,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001734,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001735,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001736,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001737,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.single_statement_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001738,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.single_statement_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001739,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.compound_statement_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001740,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.compound_statement_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001741,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.sequence_statement_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001742,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.sequence_statement_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001743,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.no_iterations_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001744,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.no_iterations_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001745,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.single_iteration_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001746,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.single_iteration_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001747,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.select_iteration_count_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001748,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.select_iteration_count_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001749,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.conditional_continue_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001750,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.conditional_continue_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001751,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.unconditional_continue_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001752,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.unconditional_continue_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001753,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.only_continue_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001754,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.only_continue_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001755,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.double_continue_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001756,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.double_continue_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001757,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.conditional_break_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001758,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.conditional_break_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001759,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.unconditional_break_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001760,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.unconditional_break_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001761,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.pre_increment_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001762,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.pre_increment_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001763,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.post_increment_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001764,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.post_increment_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001765,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.mixed_break_continue_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001766,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.mixed_break_continue_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001767,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.vector_counter_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001768,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.vector_counter_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001769,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.101_iterations_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001770,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.101_iterations_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001771,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.sequence_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001772,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.sequence_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001773,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.nested_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001774,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.nested_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001775,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001776,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.nested_sequence_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001777,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001778,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001779,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001780,
    "KHR-GL42.shaders.loops.for_dynamic_iterations.nested_tricky_dataflow_2_fragment");
