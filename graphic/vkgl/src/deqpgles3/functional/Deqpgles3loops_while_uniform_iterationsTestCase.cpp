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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30007TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006963,
        "dEQP-GLES3.functional.shaders.loops.while",
        "_uniform_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006964,
        "dEQP-GLES3.functional.shaders.loops.while_",
        "uniform_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006965,
        "dEQP-GLES3.functional.shaders.loops.while_",
        "uniform_iterations.basic_lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006966,
        "dEQP-GLES3.functional.shaders.loops.while_u",
        "niform_iterations.basic_lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006967,
        "dEQP-GLES3.functional.shaders.loops.while_",
        "uniform_iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006968,
        "dEQP-GLES3.functional.shaders.loops.while_u",
        "niform_iterations.basic_mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006969,
        "dEQP-GLES3.functional.shaders.loops.while_u",
        "niform_iterations.basic_mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006970,
        "dEQP-GLES3.functional.shaders.loops.while_un",
        "iform_iterations.basic_mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006971,
        "dEQP-GLES3.functional.shaders.loops.while",
        "_uniform_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006972,
        "dEQP-GLES3.functional.shaders.loops.while_",
        "uniform_iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006973,
        "dEQP-GLES3.functional.shaders.loops.while_",
        "uniform_iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006974,
        "dEQP-GLES3.functional.shaders.loops.while_u",
        "niform_iterations.basic_highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006975,
        "dEQP-GLES3.functional.shaders.loops.whi",
        "le_uniform_iterations.empty_body_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006976,
        "dEQP-GLES3.functional.shaders.loops.whil",
        "e_uniform_iterations.empty_body_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006977,
        "dEQP-GLES3.functional.shaders.loops.while_uniform_ite",
        "rations.infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006978,
        "dEQP-GLES3.functional.shaders.loops.while_uniform_iter",
        "ations.infinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006979,
        "dEQP-GLES3.functional.shaders.loops.while_uniform_ite",
        "rations.infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006980,
        "dEQP-GLES3.functional.shaders.loops.while_uniform_iter",
        "ations.infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006981,
        "dEQP-GLES3.functional.shaders.loops.while_uniform",
        "_iterations.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006982,
        "dEQP-GLES3.functional.shaders.loops.while_uniform_",
        "iterations.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006983,
        "dEQP-GLES3.functional.shaders.loops.while_",
        "uniform_iterations.single_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006984,
        "dEQP-GLES3.functional.shaders.loops.while_u",
        "niform_iterations.single_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006985,
        "dEQP-GLES3.functional.shaders.loops.while_u",
        "niform_iterations.compound_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006986,
        "dEQP-GLES3.functional.shaders.loops.while_un",
        "iform_iterations.compound_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006987,
        "dEQP-GLES3.functional.shaders.loops.while_u",
        "niform_iterations.sequence_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006988,
        "dEQP-GLES3.functional.shaders.loops.while_un",
        "iform_iterations.sequence_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006989,
        "dEQP-GLES3.functional.shaders.loops.whil",
        "e_uniform_iterations.no_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006990,
        "dEQP-GLES3.functional.shaders.loops.while",
        "_uniform_iterations.no_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006991,
        "dEQP-GLES3.functional.shaders.loops.while_",
        "uniform_iterations.single_iteration_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006992,
        "dEQP-GLES3.functional.shaders.loops.while_u",
        "niform_iterations.single_iteration_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006993,
        "dEQP-GLES3.functional.shaders.loops.while_uni",
        "form_iterations.select_iteration_count_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006994,
        "dEQP-GLES3.functional.shaders.loops.while_unif",
        "orm_iterations.select_iteration_count_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006995,
        "dEQP-GLES3.functional.shaders.loops.while_un",
        "iform_iterations.conditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006996,
        "dEQP-GLES3.functional.shaders.loops.while_uni",
        "form_iterations.conditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006997,
        "dEQP-GLES3.functional.shaders.loops.while_uni",
        "form_iterations.unconditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006998,
        "dEQP-GLES3.functional.shaders.loops.while_unif",
        "orm_iterations.unconditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006999,
        "dEQP-GLES3.functional.shaders.loops.whil",
        "e_uniform_iterations.only_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007000,
        "dEQP-GLES3.functional.shaders.loops.while",
        "_uniform_iterations.only_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007001,
        "dEQP-GLES3.functional.shaders.loops.while",
        "_uniform_iterations.double_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007002,
        "dEQP-GLES3.functional.shaders.loops.while_",
        "uniform_iterations.double_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007003,
        "dEQP-GLES3.functional.shaders.loops.while_",
        "uniform_iterations.conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007004,
        "dEQP-GLES3.functional.shaders.loops.while_u",
        "niform_iterations.conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007005,
        "dEQP-GLES3.functional.shaders.loops.while_u",
        "niform_iterations.unconditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007006,
        "dEQP-GLES3.functional.shaders.loops.while_un",
        "iform_iterations.unconditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007007,
        "dEQP-GLES3.functional.shaders.loops.whil",
        "e_uniform_iterations.pre_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007008,
        "dEQP-GLES3.functional.shaders.loops.while",
        "_uniform_iterations.pre_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007009,
        "dEQP-GLES3.functional.shaders.loops.while",
        "_uniform_iterations.post_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007010,
        "dEQP-GLES3.functional.shaders.loops.while_",
        "uniform_iterations.post_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007011,
        "dEQP-GLES3.functional.shaders.loops.while_un",
        "iform_iterations.mixed_break_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007012,
        "dEQP-GLES3.functional.shaders.loops.while_uni",
        "form_iterations.mixed_break_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007013,
        "dEQP-GLES3.functional.shaders.loops.while",
        "_uniform_iterations.vector_counter_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007014,
        "dEQP-GLES3.functional.shaders.loops.while_",
        "uniform_iterations.vector_counter_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007015,
        "dEQP-GLES3.functional.shaders.loops.while",
        "_uniform_iterations.101_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007016,
        "dEQP-GLES3.functional.shaders.loops.while_",
        "uniform_iterations.101_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007017,
        "dEQP-GLES3.functional.shaders.loops.wh",
        "ile_uniform_iterations.sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007018,
        "dEQP-GLES3.functional.shaders.loops.whi",
        "le_uniform_iterations.sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007019,
        "dEQP-GLES3.functional.shaders.loops.w",
        "hile_uniform_iterations.nested_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007020,
        "dEQP-GLES3.functional.shaders.loops.wh",
        "ile_uniform_iterations.nested_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007021,
        "dEQP-GLES3.functional.shaders.loops.while",
        "_uniform_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007022,
        "dEQP-GLES3.functional.shaders.loops.while_",
        "uniform_iterations.nested_sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007023,
        "dEQP-GLES3.functional.shaders.loops.while_unif",
        "orm_iterations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007024,
        "dEQP-GLES3.functional.shaders.loops.while_unifo",
        "rm_iterations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007025,
        "dEQP-GLES3.functional.shaders.loops.while_unif",
        "orm_iterations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007026,
        "dEQP-GLES3.functional.shaders.loops.while_unifo",
        "rm_iterations.nested_tricky_dataflow_2_fragment");
