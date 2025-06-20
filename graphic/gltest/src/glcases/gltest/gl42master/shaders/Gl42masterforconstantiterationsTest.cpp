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

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001595,
    "KHR-GL42.shaders.loops.for_constant_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001596,
    "KHR-GL42.shaders.loops.for_constant_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001597,
    "KHR-GL42.shaders.loops.for_constant_iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001598,
    "KHR-GL42.shaders.loops.for_constant_iterations.basic_mediump_int_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001599,
    "KHR-GL42.shaders.loops.for_constant_iterations.basic_mediump_float_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001600,
    "KHR-GL42.shaders.loops.for_constant_iterations.basic_mediump_float_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001601,
    "KHR-GL42.shaders.loops.for_constant_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001602,
    "KHR-GL42.shaders.loops.for_constant_iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001603,
    "KHR-GL42.shaders.loops.for_constant_iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001604,
    "KHR-GL42.shaders.loops.for_constant_iterations.basic_highp_float_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001605,
    "KHR-GL42.shaders.loops.for_constant_iterations.empty_body_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001606,
    "KHR-GL42.shaders.loops.for_constant_iterations.empty_body_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001607,
    "KHR-GL42.shaders.loops.for_constant_iterations.infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001608,
    "KHR-GL42.shaders.loops.for_constant_iterations.infinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001609,
    "KHR-GL42.shaders.loops.for_constant_iterations.infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001610,
    "KHR-GL42.shaders.loops.for_constant_iterations.infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001611,
    "KHR-GL42.shaders.loops.for_constant_iterations.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001612,
    "KHR-GL42.shaders.loops.for_constant_iterations.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001613,
    "KHR-GL42.shaders.loops.for_constant_iterations.single_statement_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001614,
    "KHR-GL42.shaders.loops.for_constant_iterations.single_statement_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001615,
    "KHR-GL42.shaders.loops.for_constant_iterations.compound_statement_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001616,
    "KHR-GL42.shaders.loops.for_constant_iterations.compound_statement_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001617,
    "KHR-GL42.shaders.loops.for_constant_iterations.sequence_statement_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001618,
    "KHR-GL42.shaders.loops.for_constant_iterations.sequence_statement_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001619,
    "KHR-GL42.shaders.loops.for_constant_iterations.no_iterations_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001620,
    "KHR-GL42.shaders.loops.for_constant_iterations.no_iterations_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001621,
    "KHR-GL42.shaders.loops.for_constant_iterations.single_iteration_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001622,
    "KHR-GL42.shaders.loops.for_constant_iterations.single_iteration_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001623,
    "KHR-GL42.shaders.loops.for_constant_iterations.select_iteration_count_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001624,
    "KHR-GL42.shaders.loops.for_constant_iterations.select_iteration_count_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001625,
    "KHR-GL42.shaders.loops.for_constant_iterations.conditional_continue_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001626,
    "KHR-GL42.shaders.loops.for_constant_iterations.conditional_continue_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001627,
    "KHR-GL42.shaders.loops.for_constant_iterations.unconditional_continue_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001628,
    "KHR-GL42.shaders.loops.for_constant_iterations.unconditional_continue_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001629,
    "KHR-GL42.shaders.loops.for_constant_iterations.only_continue_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001630,
    "KHR-GL42.shaders.loops.for_constant_iterations.only_continue_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001631,
    "KHR-GL42.shaders.loops.for_constant_iterations.double_continue_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001632,
    "KHR-GL42.shaders.loops.for_constant_iterations.double_continue_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001633,
    "KHR-GL42.shaders.loops.for_constant_iterations.conditional_break_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001634,
    "KHR-GL42.shaders.loops.for_constant_iterations.conditional_break_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001635,
    "KHR-GL42.shaders.loops.for_constant_iterations.unconditional_break_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001636,
    "KHR-GL42.shaders.loops.for_constant_iterations.unconditional_break_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001637,
    "KHR-GL42.shaders.loops.for_constant_iterations.pre_increment_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001638,
    "KHR-GL42.shaders.loops.for_constant_iterations.pre_increment_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001639,
    "KHR-GL42.shaders.loops.for_constant_iterations.post_increment_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001640,
    "KHR-GL42.shaders.loops.for_constant_iterations.post_increment_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001641,
    "KHR-GL42.shaders.loops.for_constant_iterations.mixed_break_continue_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001642,
    "KHR-GL42.shaders.loops.for_constant_iterations.mixed_break_continue_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001643,
    "KHR-GL42.shaders.loops.for_constant_iterations.vector_counter_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001644,
    "KHR-GL42.shaders.loops.for_constant_iterations.vector_counter_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001645,
    "KHR-GL42.shaders.loops.for_constant_iterations.101_iterations_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001646,
    "KHR-GL42.shaders.loops.for_constant_iterations.101_iterations_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001647,
    "KHR-GL42.shaders.loops.for_constant_iterations.sequence_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001648,
    "KHR-GL42.shaders.loops.for_constant_iterations.sequence_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001649,
    "KHR-GL42.shaders.loops.for_constant_iterations.nested_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001650,
    "KHR-GL42.shaders.loops.for_constant_iterations.nested_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001651,
    "KHR-GL42.shaders.loops.for_constant_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001652,
    "KHR-GL42.shaders.loops.for_constant_iterations.nested_sequence_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001653,
    "KHR-GL42.shaders.loops.for_constant_iterations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001654,
    "KHR-GL42.shaders.loops.for_constant_iterations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001655,
    "KHR-GL42.shaders.loops.for_constant_iterations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001656,
    "KHR-GL42.shaders.loops.for_constant_iterations.nested_tricky_dataflow_2_fragment");
