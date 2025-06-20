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

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002255,
    "KHR-GL42.shaders.preprocessor.invalid_function_definitions.arguments_1_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002256,
    "KHR-GL42.shaders.preprocessor.invalid_function_definitions.arguments_1_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002257,
    "KHR-GL42.shaders.preprocessor.invalid_function_definitions.arguments_2_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002258,
    "KHR-GL42.shaders.preprocessor.invalid_function_definitions.arguments_2_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002259,
    "KHR-GL42.shaders.preprocessor.invalid_function_definitions.arguments_3_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002260,
    "KHR-GL42.shaders.preprocessor.invalid_function_definitions.arguments_3_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002261,
    "KHR-GL42.shaders.preprocessor.invalid_function_definitions.arguments_4_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002262,
    "KHR-GL42.shaders.preprocessor.invalid_function_definitions.arguments_4_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002263,
    "KHR-GL42.shaders.preprocessor.invalid_function_definitions.arguments_5_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002264,
    "KHR-GL42.shaders.preprocessor.invalid_function_definitions.arguments_5_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002265,
    "KHR-GL42.shaders.preprocessor.invalid_function_definitions.arguments_6_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002266,
    "KHR-GL42.shaders.preprocessor.invalid_function_definitions.arguments_6_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002267,
    "KHR-GL42.shaders.preprocessor.invalid_function_definitions.arguments_7_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002268,
    "KHR-GL42.shaders.preprocessor.invalid_function_definitions.arguments_7_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002269,
    "KHR-GL42.shaders.preprocessor.invalid_function_definitions.arguments_8_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002270,
    "KHR-GL42.shaders.preprocessor.invalid_function_definitions.arguments_8_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002271,
    "KHR-GL42.shaders.preprocessor.invalid_function_definitions.unique_param_name_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002272,
    "KHR-GL42.shaders.preprocessor.invalid_function_definitions.unique_param_name_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002273,
    "KHR-GL42.shaders.preprocessor.invalid_function_definitions.argument_list_1_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002274,
    "KHR-GL42.shaders.preprocessor.invalid_function_definitions.argument_list_1_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002275,
    "KHR-GL42.shaders.preprocessor.invalid_function_definitions.argument_list_2_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002276,
    "KHR-GL42.shaders.preprocessor.invalid_function_definitions.argument_list_2_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002277,
    "KHR-GL42.shaders.preprocessor.invalid_function_definitions.argument_list_3_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002278,
    "KHR-GL42.shaders.preprocessor.invalid_function_definitions.argument_list_3_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002279,
    "KHR-GL42.shaders.preprocessor.invalid_function_definitions.no_closing_parenthesis_1_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002280,
    "KHR-GL42.shaders.preprocessor.invalid_function_definitions.no_closing_parenthesis_1_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002281,
    "KHR-GL42.shaders.preprocessor.invalid_function_definitions.no_closing_parenthesis_2_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002282,
    "KHR-GL42.shaders.preprocessor.invalid_function_definitions.no_closing_parenthesis_2_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002283,
    "KHR-GL42.shaders.preprocessor.invalid_function_definitions.no_closing_parenthesis_3_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002284,
    "KHR-GL42.shaders.preprocessor.invalid_function_definitions.no_closing_parenthesis_3_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002285,
    "KHR-GL42.shaders.preprocessor.invalid_function_definitions.no_closing_parenthesis_4_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002286,
    "KHR-GL42.shaders.preprocessor.invalid_function_definitions.no_closing_parenthesis_4_fragment");
