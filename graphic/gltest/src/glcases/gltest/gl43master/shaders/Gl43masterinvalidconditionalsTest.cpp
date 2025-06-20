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

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002343,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.empty_if_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002344,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.empty_if_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002345,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.empty_ifdef_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002346,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.empty_ifdef_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002347,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.empty_ifndef_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002348,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.empty_ifndef_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002349,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.invalid_ifdef_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002350,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.invalid_ifdef_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002351,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.invalid_ifndef_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002352,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.invalid_ifndef_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002353,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.empty_if_defined_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002354,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.empty_if_defined_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002355,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.unterminated_if_1_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002356,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.unterminated_if_1_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002357,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.unterminated_if_2_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002358,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.unterminated_if_2_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002359,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.unterminated_ifdef_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002360,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.unterminated_ifdef_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002361,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.unterminated_ifndef_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002362,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.unterminated_ifndef_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002363,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.unterminated_else_1_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002364,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.unterminated_else_1_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002365,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.unterminated_else_2_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002366,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.unterminated_else_2_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002367,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.unterminated_elif_1_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002368,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.unterminated_elif_1_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002369,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.unterminated_elif_2_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002370,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.unterminated_elif_2_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002371,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.unterminated_elif_3_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002372,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.unterminated_elif_3_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002373,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.elif_after_else_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002374,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.elif_after_else_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002375,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.else_without_if_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002376,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.else_without_if_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002377,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.elif_without_if_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002378,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.elif_without_if_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002379,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.endif_without_if_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002380,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.endif_without_if_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002381,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.else_after_else_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002382,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.else_after_else_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002383,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.nested_elif_without_if_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002384,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.nested_elif_without_if_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002385,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.if_float_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002386,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.if_float_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002387,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.tokens_after_if_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002388,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.tokens_after_if_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002389,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.tokens_after_elif_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002390,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.tokens_after_elif_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002391,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.tokens_after_else_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002392,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.tokens_after_else_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002393,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.tokens_after_endif_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002394,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.tokens_after_endif_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002395,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.tokens_after_ifdef_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002396,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.tokens_after_ifdef_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002397,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.tokens_after_ifndef_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002398,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.tokens_after_ifndef_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002399,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.unterminated_nested_blocks_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002400,
    "KHR-GL43.shaders.preprocessor.invalid_conditionals.unterminated_nested_blocks_fragment");
