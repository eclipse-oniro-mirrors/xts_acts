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

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001657,
    "KHR-GL43.shaders.loops.for_uniform_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001658,
    "KHR-GL43.shaders.loops.for_uniform_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001659,
    "KHR-GL43.shaders.loops.for_uniform_iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001660,
    "KHR-GL43.shaders.loops.for_uniform_iterations.basic_mediump_int_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001661,
    "KHR-GL43.shaders.loops.for_uniform_iterations.basic_mediump_float_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001662,
    "KHR-GL43.shaders.loops.for_uniform_iterations.basic_mediump_float_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001663,
    "KHR-GL43.shaders.loops.for_uniform_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001664,
    "KHR-GL43.shaders.loops.for_uniform_iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001665,
    "KHR-GL43.shaders.loops.for_uniform_iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001666,
    "KHR-GL43.shaders.loops.for_uniform_iterations.basic_highp_float_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001667,
    "KHR-GL43.shaders.loops.for_uniform_iterations.empty_body_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001668,
    "KHR-GL43.shaders.loops.for_uniform_iterations.empty_body_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001669,
    "KHR-GL43.shaders.loops.for_uniform_iterations.infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001670,
    "KHR-GL43.shaders.loops.for_uniform_iterations.infinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001671,
    "KHR-GL43.shaders.loops.for_uniform_iterations.infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001672,
    "KHR-GL43.shaders.loops.for_uniform_iterations.infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001673,
    "KHR-GL43.shaders.loops.for_uniform_iterations.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001674,
    "KHR-GL43.shaders.loops.for_uniform_iterations.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001675,
    "KHR-GL43.shaders.loops.for_uniform_iterations.single_statement_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001676,
    "KHR-GL43.shaders.loops.for_uniform_iterations.single_statement_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001677,
    "KHR-GL43.shaders.loops.for_uniform_iterations.compound_statement_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001678,
    "KHR-GL43.shaders.loops.for_uniform_iterations.compound_statement_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001679,
    "KHR-GL43.shaders.loops.for_uniform_iterations.sequence_statement_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001680,
    "KHR-GL43.shaders.loops.for_uniform_iterations.sequence_statement_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001681,
    "KHR-GL43.shaders.loops.for_uniform_iterations.no_iterations_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001682,
    "KHR-GL43.shaders.loops.for_uniform_iterations.no_iterations_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001683,
    "KHR-GL43.shaders.loops.for_uniform_iterations.single_iteration_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001684,
    "KHR-GL43.shaders.loops.for_uniform_iterations.single_iteration_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001685,
    "KHR-GL43.shaders.loops.for_uniform_iterations.select_iteration_count_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001686,
    "KHR-GL43.shaders.loops.for_uniform_iterations.select_iteration_count_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001687,
    "KHR-GL43.shaders.loops.for_uniform_iterations.conditional_continue_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001688,
    "KHR-GL43.shaders.loops.for_uniform_iterations.conditional_continue_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001689,
    "KHR-GL43.shaders.loops.for_uniform_iterations.unconditional_continue_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001690,
    "KHR-GL43.shaders.loops.for_uniform_iterations.unconditional_continue_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001691,
    "KHR-GL43.shaders.loops.for_uniform_iterations.only_continue_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001692,
    "KHR-GL43.shaders.loops.for_uniform_iterations.only_continue_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001693,
    "KHR-GL43.shaders.loops.for_uniform_iterations.double_continue_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001694,
    "KHR-GL43.shaders.loops.for_uniform_iterations.double_continue_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001695,
    "KHR-GL43.shaders.loops.for_uniform_iterations.conditional_break_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001696,
    "KHR-GL43.shaders.loops.for_uniform_iterations.conditional_break_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001697,
    "KHR-GL43.shaders.loops.for_uniform_iterations.unconditional_break_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001698,
    "KHR-GL43.shaders.loops.for_uniform_iterations.unconditional_break_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001699,
    "KHR-GL43.shaders.loops.for_uniform_iterations.pre_increment_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001700,
    "KHR-GL43.shaders.loops.for_uniform_iterations.pre_increment_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001701,
    "KHR-GL43.shaders.loops.for_uniform_iterations.post_increment_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001702,
    "KHR-GL43.shaders.loops.for_uniform_iterations.post_increment_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001703,
    "KHR-GL43.shaders.loops.for_uniform_iterations.mixed_break_continue_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001704,
    "KHR-GL43.shaders.loops.for_uniform_iterations.mixed_break_continue_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001705,
    "KHR-GL43.shaders.loops.for_uniform_iterations.vector_counter_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001706,
    "KHR-GL43.shaders.loops.for_uniform_iterations.vector_counter_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001707,
    "KHR-GL43.shaders.loops.for_uniform_iterations.101_iterations_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001708,
    "KHR-GL43.shaders.loops.for_uniform_iterations.101_iterations_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001709,
    "KHR-GL43.shaders.loops.for_uniform_iterations.sequence_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001710,
    "KHR-GL43.shaders.loops.for_uniform_iterations.sequence_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001711,
    "KHR-GL43.shaders.loops.for_uniform_iterations.nested_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001712,
    "KHR-GL43.shaders.loops.for_uniform_iterations.nested_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001713,
    "KHR-GL43.shaders.loops.for_uniform_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001714,
    "KHR-GL43.shaders.loops.for_uniform_iterations.nested_sequence_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001715,
    "KHR-GL43.shaders.loops.for_uniform_iterations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001716,
    "KHR-GL43.shaders.loops.for_uniform_iterations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001717,
    "KHR-GL43.shaders.loops.for_uniform_iterations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001718,
    "KHR-GL43.shaders.loops.for_uniform_iterations.nested_tricky_dataflow_2_fragment");
