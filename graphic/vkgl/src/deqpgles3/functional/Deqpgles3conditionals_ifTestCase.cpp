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
#include "../ActsDeqpgles30003TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002751,
        "dEQP-GLES3.functional.shaders.cond",
        "itionals.if.single_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002752,
        "dEQP-GLES3.functional.shaders.condi",
        "tionals.if.single_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002753,
        "dEQP-GLES3.functional.shaders.condi",
        "tionals.if.compound_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002754,
        "dEQP-GLES3.functional.shaders.condit",
        "ionals.if.compound_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002755,
        "dEQP-GLES3.functional.shaders.condit",
        "ionals.if.sequence_statements_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002756,
        "dEQP-GLES3.functional.shaders.conditi",
        "onals.if.sequence_statements_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002757,
        "dEQP-GLES3.functional.shaders.condi",
        "tionals.if.sequence_condition_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002758,
        "dEQP-GLES3.functional.shaders.condit",
        "ionals.if.sequence_condition_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002759,
        "dEQP-GLES3.functional.shaders.condi",
        "tionals.if.complex_condition_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002760,
        "dEQP-GLES3.functional.shaders.condit",
        "ionals.if.complex_condition_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002761,
        "dEQP-GLES3.functional.shaders.",
        "conditionals.if.if_else_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002762,
        "dEQP-GLES3.functional.shaders.c",
        "onditionals.if.if_else_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002763,
        "dEQP-GLES3.functional.shaders.c",
        "onditionals.if.if_elseif_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002764,
        "dEQP-GLES3.functional.shaders.co",
        "nditionals.if.if_elseif_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002765,
        "dEQP-GLES3.functional.shaders.con",
        "ditionals.if.if_elseif_else_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002766,
        "dEQP-GLES3.functional.shaders.cond",
        "itionals.if.if_elseif_else_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002767,
        "dEQP-GLES3.functional.shaders.condit",
        "ionals.if.mixed_if_elseif_else_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002768,
        "dEQP-GLES3.functional.shaders.conditi",
        "onals.if.mixed_if_elseif_else_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002769,
        "dEQP-GLES3.functional.shaders.conditionals.",
        "if.constant_conditional_assignment_to_matrix");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002770,
        "dEQP-GLES3.functional.shaders.conditionals",
        ".if.input_conditional_assignment_to_matrix");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002771,
        "dEQP-GLES3.functional.shaders.conditionals.",
        "if.uniform_conditional_assignment_to_matrix");
