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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20002TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001301,
        "dEQP-GLES2.functional.shaders.cond",
        "itionals.if.single_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001302,
        "dEQP-GLES2.functional.shaders.condi",
        "tionals.if.single_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001303,
        "dEQP-GLES2.functional.shaders.condi",
        "tionals.if.compound_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001304,
        "dEQP-GLES2.functional.shaders.condit",
        "ionals.if.compound_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001305,
        "dEQP-GLES2.functional.shaders.condit",
        "ionals.if.sequence_statements_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001306,
        "dEQP-GLES2.functional.shaders.conditi",
        "onals.if.sequence_statements_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001307,
        "dEQP-GLES2.functional.shaders.condi",
        "tionals.if.sequence_condition_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001308,
        "dEQP-GLES2.functional.shaders.condit",
        "ionals.if.sequence_condition_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001309,
        "dEQP-GLES2.functional.shaders.condi",
        "tionals.if.complex_condition_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001310,
        "dEQP-GLES2.functional.shaders.condit",
        "ionals.if.complex_condition_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001311,
        "dEQP-GLES2.functional.shaders.",
        "conditionals.if.if_else_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001312,
        "dEQP-GLES2.functional.shaders.c",
        "onditionals.if.if_else_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001313,
        "dEQP-GLES2.functional.shaders.c",
        "onditionals.if.if_elseif_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001314,
        "dEQP-GLES2.functional.shaders.co",
        "nditionals.if.if_elseif_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001315,
        "dEQP-GLES2.functional.shaders.con",
        "ditionals.if.if_elseif_else_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001316,
        "dEQP-GLES2.functional.shaders.cond",
        "itionals.if.if_elseif_else_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001317,
        "dEQP-GLES2.functional.shaders.condit",
        "ionals.if.mixed_if_elseif_else_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001318,
        "dEQP-GLES2.functional.shaders.conditi",
        "onals.if.mixed_if_elseif_else_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001319,
        "dEQP-GLES2.functional.shaders.conditionals.",
        "if.constant_conditional_assignment_to_matrix");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001320,
        "dEQP-GLES2.functional.shaders.conditionals",
        ".if.input_conditional_assignment_to_matrix");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001321,
        "dEQP-GLES2.functional.shaders.conditionals.",
        "if.uniform_conditional_assignment_to_matrix");
