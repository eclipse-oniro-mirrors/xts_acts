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

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001967,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001968,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001969,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001970,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.basic_mediump_int_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001971,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.basic_mediump_float_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001972,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.basic_mediump_float_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001973,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001974,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001975,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001976,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.basic_highp_float_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001977,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.empty_body_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001978,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.empty_body_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001979,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001980,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.infinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001981,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001982,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001983,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001984,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001985,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.single_statement_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001986,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.single_statement_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001987,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.compound_statement_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001988,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.compound_statement_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001989,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.sequence_statement_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001990,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.sequence_statement_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001991,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.single_iteration_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001992,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.single_iteration_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001993,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.select_iteration_count_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001994,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.select_iteration_count_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001995,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.conditional_continue_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001996,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.conditional_continue_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001997,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.unconditional_continue_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001998,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.unconditional_continue_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001999,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.only_continue_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002000,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.only_continue_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002001,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.double_continue_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002002,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.double_continue_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002003,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.conditional_break_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002004,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.conditional_break_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002005,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.unconditional_break_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002006,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.unconditional_break_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002007,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.pre_increment_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002008,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.pre_increment_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002009,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.post_increment_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002010,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.post_increment_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002011,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.mixed_break_continue_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002012,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.mixed_break_continue_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002013,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.vector_counter_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002014,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.vector_counter_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002015,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.101_iterations_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002016,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.101_iterations_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002017,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.sequence_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002018,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.sequence_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002019,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.nested_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002020,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.nested_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002021,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002022,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.nested_sequence_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002023,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002024,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002025,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002026,
    "KHR-GL43.shaders.loops.do_while_constant_iterations.nested_tricky_dataflow_2_fragment");
