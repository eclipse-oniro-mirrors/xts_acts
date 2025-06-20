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

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002523,
    "KHR-GL43.shaders.preprocessor.invalid_expressions.invalid_unary_expr_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002524,
    "KHR-GL43.shaders.preprocessor.invalid_expressions.invalid_unary_expr_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002525,
    "KHR-GL43.shaders.preprocessor.invalid_expressions.invalid_binary_expr_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002526,
    "KHR-GL43.shaders.preprocessor.invalid_expressions.invalid_binary_expr_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002527,
    "KHR-GL43.shaders.preprocessor.invalid_expressions.missing_expr_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002528,
    "KHR-GL43.shaders.preprocessor.invalid_expressions.missing_expr_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002529,
    "KHR-GL43.shaders.preprocessor.invalid_expressions.invalid_expr_1_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002530,
    "KHR-GL43.shaders.preprocessor.invalid_expressions.invalid_expr_1_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002531,
    "KHR-GL43.shaders.preprocessor.invalid_expressions.invalid_expr_2_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002532,
    "KHR-GL43.shaders.preprocessor.invalid_expressions.invalid_expr_2_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002533,
    "KHR-GL43.shaders.preprocessor.invalid_expressions.invalid_expr_3_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002534,
    "KHR-GL43.shaders.preprocessor.invalid_expressions.invalid_expr_3_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002535,
    "KHR-GL43.shaders.preprocessor.invalid_expressions.unopened_parenthesis_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002536,
    "KHR-GL43.shaders.preprocessor.invalid_expressions.unopened_parenthesis_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002537,
    "KHR-GL43.shaders.preprocessor.invalid_expressions.unclosed_parenthesis_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002538,
    "KHR-GL43.shaders.preprocessor.invalid_expressions.unclosed_parenthesis_fragment");
