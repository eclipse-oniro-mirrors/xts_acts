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
#include "../ActsDeqpgles20001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000543,
        "dEQP-GLES2.functional.shaders.preprocessor.i",
        "nvalid_expressions.invalid_unary_expr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000544,
        "dEQP-GLES2.functional.shaders.preprocessor.in",
        "valid_expressions.invalid_unary_expr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000545,
        "dEQP-GLES2.functional.shaders.preprocessor.i",
        "nvalid_expressions.invalid_binary_expr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000546,
        "dEQP-GLES2.functional.shaders.preprocessor.in",
        "valid_expressions.invalid_binary_expr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000547,
        "dEQP-GLES2.functional.shaders.preprocesso",
        "r.invalid_expressions.missing_expr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000548,
        "dEQP-GLES2.functional.shaders.preprocessor",
        ".invalid_expressions.missing_expr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000549,
        "dEQP-GLES2.functional.shaders.preprocessor",
        ".invalid_expressions.invalid_expr_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000550,
        "dEQP-GLES2.functional.shaders.preprocessor.",
        "invalid_expressions.invalid_expr_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000551,
        "dEQP-GLES2.functional.shaders.preprocessor",
        ".invalid_expressions.invalid_expr_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000552,
        "dEQP-GLES2.functional.shaders.preprocessor.",
        "invalid_expressions.invalid_expr_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000553,
        "dEQP-GLES2.functional.shaders.preprocessor",
        ".invalid_expressions.invalid_expr_3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000554,
        "dEQP-GLES2.functional.shaders.preprocessor.",
        "invalid_expressions.invalid_expr_3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000555,
        "dEQP-GLES2.functional.shaders.preprocessor.in",
        "valid_expressions.unopened_parenthesis_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000556,
        "dEQP-GLES2.functional.shaders.preprocessor.inv",
        "alid_expressions.unopened_parenthesis_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000557,
        "dEQP-GLES2.functional.shaders.preprocessor.in",
        "valid_expressions.unclosed_parenthesis_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000558,
        "dEQP-GLES2.functional.shaders.preprocessor.inv",
        "alid_expressions.unclosed_parenthesis_fragment");
