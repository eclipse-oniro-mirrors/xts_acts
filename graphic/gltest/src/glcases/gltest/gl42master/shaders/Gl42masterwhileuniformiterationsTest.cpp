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

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001843,
    "KHR-GL42.shaders.loops.while_uniform_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001844,
    "KHR-GL42.shaders.loops.while_uniform_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001845,
    "KHR-GL42.shaders.loops.while_uniform_iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001846,
    "KHR-GL42.shaders.loops.while_uniform_iterations.basic_mediump_int_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001847,
    "KHR-GL42.shaders.loops.while_uniform_iterations.basic_mediump_float_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001848,
    "KHR-GL42.shaders.loops.while_uniform_iterations.basic_mediump_float_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001849,
    "KHR-GL42.shaders.loops.while_uniform_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001850,
    "KHR-GL42.shaders.loops.while_uniform_iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001851,
    "KHR-GL42.shaders.loops.while_uniform_iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001852,
    "KHR-GL42.shaders.loops.while_uniform_iterations.basic_highp_float_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001853,
    "KHR-GL42.shaders.loops.while_uniform_iterations.empty_body_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001854,
    "KHR-GL42.shaders.loops.while_uniform_iterations.empty_body_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001855,
    "KHR-GL42.shaders.loops.while_uniform_iterations.infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001856,
    "KHR-GL42.shaders.loops.while_uniform_iterations.infinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001857,
    "KHR-GL42.shaders.loops.while_uniform_iterations.infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001858,
    "KHR-GL42.shaders.loops.while_uniform_iterations.infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001859,
    "KHR-GL42.shaders.loops.while_uniform_iterations.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001860,
    "KHR-GL42.shaders.loops.while_uniform_iterations.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001861,
    "KHR-GL42.shaders.loops.while_uniform_iterations.single_statement_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001862,
    "KHR-GL42.shaders.loops.while_uniform_iterations.single_statement_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001863,
    "KHR-GL42.shaders.loops.while_uniform_iterations.compound_statement_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001864,
    "KHR-GL42.shaders.loops.while_uniform_iterations.compound_statement_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001865,
    "KHR-GL42.shaders.loops.while_uniform_iterations.sequence_statement_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001866,
    "KHR-GL42.shaders.loops.while_uniform_iterations.sequence_statement_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001867,
    "KHR-GL42.shaders.loops.while_uniform_iterations.no_iterations_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001868,
    "KHR-GL42.shaders.loops.while_uniform_iterations.no_iterations_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001869,
    "KHR-GL42.shaders.loops.while_uniform_iterations.single_iteration_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001870,
    "KHR-GL42.shaders.loops.while_uniform_iterations.single_iteration_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001871,
    "KHR-GL42.shaders.loops.while_uniform_iterations.select_iteration_count_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001872,
    "KHR-GL42.shaders.loops.while_uniform_iterations.select_iteration_count_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001873,
    "KHR-GL42.shaders.loops.while_uniform_iterations.conditional_continue_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001874,
    "KHR-GL42.shaders.loops.while_uniform_iterations.conditional_continue_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001875,
    "KHR-GL42.shaders.loops.while_uniform_iterations.unconditional_continue_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001876,
    "KHR-GL42.shaders.loops.while_uniform_iterations.unconditional_continue_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001877,
    "KHR-GL42.shaders.loops.while_uniform_iterations.only_continue_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001878,
    "KHR-GL42.shaders.loops.while_uniform_iterations.only_continue_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001879,
    "KHR-GL42.shaders.loops.while_uniform_iterations.double_continue_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001880,
    "KHR-GL42.shaders.loops.while_uniform_iterations.double_continue_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001881,
    "KHR-GL42.shaders.loops.while_uniform_iterations.conditional_break_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001882,
    "KHR-GL42.shaders.loops.while_uniform_iterations.conditional_break_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001883,
    "KHR-GL42.shaders.loops.while_uniform_iterations.unconditional_break_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001884,
    "KHR-GL42.shaders.loops.while_uniform_iterations.unconditional_break_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001885,
    "KHR-GL42.shaders.loops.while_uniform_iterations.pre_increment_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001886,
    "KHR-GL42.shaders.loops.while_uniform_iterations.pre_increment_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001887,
    "KHR-GL42.shaders.loops.while_uniform_iterations.post_increment_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001888,
    "KHR-GL42.shaders.loops.while_uniform_iterations.post_increment_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001889,
    "KHR-GL42.shaders.loops.while_uniform_iterations.mixed_break_continue_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001890,
    "KHR-GL42.shaders.loops.while_uniform_iterations.mixed_break_continue_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001891,
    "KHR-GL42.shaders.loops.while_uniform_iterations.vector_counter_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001892,
    "KHR-GL42.shaders.loops.while_uniform_iterations.vector_counter_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001893,
    "KHR-GL42.shaders.loops.while_uniform_iterations.101_iterations_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001894,
    "KHR-GL42.shaders.loops.while_uniform_iterations.101_iterations_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001895,
    "KHR-GL42.shaders.loops.while_uniform_iterations.sequence_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001896,
    "KHR-GL42.shaders.loops.while_uniform_iterations.sequence_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001897,
    "KHR-GL42.shaders.loops.while_uniform_iterations.nested_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001898,
    "KHR-GL42.shaders.loops.while_uniform_iterations.nested_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001899,
    "KHR-GL42.shaders.loops.while_uniform_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001900,
    "KHR-GL42.shaders.loops.while_uniform_iterations.nested_sequence_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001901,
    "KHR-GL42.shaders.loops.while_uniform_iterations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001902,
    "KHR-GL42.shaders.loops.while_uniform_iterations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001903,
    "KHR-GL42.shaders.loops.while_uniform_iterations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001904,
    "KHR-GL42.shaders.loops.while_uniform_iterations.nested_tricky_dataflow_2_fragment");
