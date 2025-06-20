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

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001781,
    "KHR-GL42.shaders.loops.while_constant_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001782,
    "KHR-GL42.shaders.loops.while_constant_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001783,
    "KHR-GL42.shaders.loops.while_constant_iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001784,
    "KHR-GL42.shaders.loops.while_constant_iterations.basic_mediump_int_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001785,
    "KHR-GL42.shaders.loops.while_constant_iterations.basic_mediump_float_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001786,
    "KHR-GL42.shaders.loops.while_constant_iterations.basic_mediump_float_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001787,
    "KHR-GL42.shaders.loops.while_constant_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001788,
    "KHR-GL42.shaders.loops.while_constant_iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001789,
    "KHR-GL42.shaders.loops.while_constant_iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001790,
    "KHR-GL42.shaders.loops.while_constant_iterations.basic_highp_float_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001791,
    "KHR-GL42.shaders.loops.while_constant_iterations.empty_body_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001792,
    "KHR-GL42.shaders.loops.while_constant_iterations.empty_body_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001793,
    "KHR-GL42.shaders.loops.while_constant_iterations.infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001794,
    "KHR-GL42.shaders.loops.while_constant_iterations.infinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001795,
    "KHR-GL42.shaders.loops.while_constant_iterations.infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001796,
    "KHR-GL42.shaders.loops.while_constant_iterations.infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001797,
    "KHR-GL42.shaders.loops.while_constant_iterations.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001798,
    "KHR-GL42.shaders.loops.while_constant_iterations.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001799,
    "KHR-GL42.shaders.loops.while_constant_iterations.single_statement_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001800,
    "KHR-GL42.shaders.loops.while_constant_iterations.single_statement_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001801,
    "KHR-GL42.shaders.loops.while_constant_iterations.compound_statement_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001802,
    "KHR-GL42.shaders.loops.while_constant_iterations.compound_statement_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001803,
    "KHR-GL42.shaders.loops.while_constant_iterations.sequence_statement_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001804,
    "KHR-GL42.shaders.loops.while_constant_iterations.sequence_statement_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001805,
    "KHR-GL42.shaders.loops.while_constant_iterations.no_iterations_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001806,
    "KHR-GL42.shaders.loops.while_constant_iterations.no_iterations_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001807,
    "KHR-GL42.shaders.loops.while_constant_iterations.single_iteration_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001808,
    "KHR-GL42.shaders.loops.while_constant_iterations.single_iteration_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001809,
    "KHR-GL42.shaders.loops.while_constant_iterations.select_iteration_count_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001810,
    "KHR-GL42.shaders.loops.while_constant_iterations.select_iteration_count_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001811,
    "KHR-GL42.shaders.loops.while_constant_iterations.conditional_continue_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001812,
    "KHR-GL42.shaders.loops.while_constant_iterations.conditional_continue_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001813,
    "KHR-GL42.shaders.loops.while_constant_iterations.unconditional_continue_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001814,
    "KHR-GL42.shaders.loops.while_constant_iterations.unconditional_continue_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001815,
    "KHR-GL42.shaders.loops.while_constant_iterations.only_continue_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001816,
    "KHR-GL42.shaders.loops.while_constant_iterations.only_continue_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001817,
    "KHR-GL42.shaders.loops.while_constant_iterations.double_continue_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001818,
    "KHR-GL42.shaders.loops.while_constant_iterations.double_continue_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001819,
    "KHR-GL42.shaders.loops.while_constant_iterations.conditional_break_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001820,
    "KHR-GL42.shaders.loops.while_constant_iterations.conditional_break_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001821,
    "KHR-GL42.shaders.loops.while_constant_iterations.unconditional_break_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001822,
    "KHR-GL42.shaders.loops.while_constant_iterations.unconditional_break_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001823,
    "KHR-GL42.shaders.loops.while_constant_iterations.pre_increment_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001824,
    "KHR-GL42.shaders.loops.while_constant_iterations.pre_increment_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001825,
    "KHR-GL42.shaders.loops.while_constant_iterations.post_increment_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001826,
    "KHR-GL42.shaders.loops.while_constant_iterations.post_increment_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001827,
    "KHR-GL42.shaders.loops.while_constant_iterations.mixed_break_continue_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001828,
    "KHR-GL42.shaders.loops.while_constant_iterations.mixed_break_continue_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001829,
    "KHR-GL42.shaders.loops.while_constant_iterations.vector_counter_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001830,
    "KHR-GL42.shaders.loops.while_constant_iterations.vector_counter_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001831,
    "KHR-GL42.shaders.loops.while_constant_iterations.101_iterations_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001832,
    "KHR-GL42.shaders.loops.while_constant_iterations.101_iterations_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001833,
    "KHR-GL42.shaders.loops.while_constant_iterations.sequence_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001834,
    "KHR-GL42.shaders.loops.while_constant_iterations.sequence_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001835,
    "KHR-GL42.shaders.loops.while_constant_iterations.nested_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001836,
    "KHR-GL42.shaders.loops.while_constant_iterations.nested_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001837,
    "KHR-GL42.shaders.loops.while_constant_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001838,
    "KHR-GL42.shaders.loops.while_constant_iterations.nested_sequence_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001839,
    "KHR-GL42.shaders.loops.while_constant_iterations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001840,
    "KHR-GL42.shaders.loops.while_constant_iterations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001841,
    "KHR-GL42.shaders.loops.while_constant_iterations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001842,
    "KHR-GL42.shaders.loops.while_constant_iterations.nested_tricky_dataflow_2_fragment");
