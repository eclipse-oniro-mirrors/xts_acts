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
#include "../ActsDeqpgles30001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000910,
        "dEQP-GLES3.functional.shaders.preprocessor.in",
        "valid_function_definitions.arguments_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000911,
        "dEQP-GLES3.functional.shaders.preprocessor.inv",
        "alid_function_definitions.arguments_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000912,
        "dEQP-GLES3.functional.shaders.preprocessor.in",
        "valid_function_definitions.arguments_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000913,
        "dEQP-GLES3.functional.shaders.preprocessor.inv",
        "alid_function_definitions.arguments_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000914,
        "dEQP-GLES3.functional.shaders.preprocessor.in",
        "valid_function_definitions.arguments_3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000915,
        "dEQP-GLES3.functional.shaders.preprocessor.inv",
        "alid_function_definitions.arguments_3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000916,
        "dEQP-GLES3.functional.shaders.preprocessor.in",
        "valid_function_definitions.arguments_4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000917,
        "dEQP-GLES3.functional.shaders.preprocessor.inv",
        "alid_function_definitions.arguments_4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000918,
        "dEQP-GLES3.functional.shaders.preprocessor.in",
        "valid_function_definitions.arguments_5_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000919,
        "dEQP-GLES3.functional.shaders.preprocessor.inv",
        "alid_function_definitions.arguments_5_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000920,
        "dEQP-GLES3.functional.shaders.preprocessor.in",
        "valid_function_definitions.arguments_6_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000921,
        "dEQP-GLES3.functional.shaders.preprocessor.inv",
        "alid_function_definitions.arguments_6_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000922,
        "dEQP-GLES3.functional.shaders.preprocessor.in",
        "valid_function_definitions.arguments_7_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000923,
        "dEQP-GLES3.functional.shaders.preprocessor.inv",
        "alid_function_definitions.arguments_7_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000924,
        "dEQP-GLES3.functional.shaders.preprocessor.in",
        "valid_function_definitions.arguments_8_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000925,
        "dEQP-GLES3.functional.shaders.preprocessor.inv",
        "alid_function_definitions.arguments_8_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000926,
        "dEQP-GLES3.functional.shaders.preprocessor.inval",
        "id_function_definitions.unique_param_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000927,
        "dEQP-GLES3.functional.shaders.preprocessor.invali",
        "d_function_definitions.unique_param_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000928,
        "dEQP-GLES3.functional.shaders.preprocessor.inva",
        "lid_function_definitions.argument_list_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000929,
        "dEQP-GLES3.functional.shaders.preprocessor.inval",
        "id_function_definitions.argument_list_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000930,
        "dEQP-GLES3.functional.shaders.preprocessor.inva",
        "lid_function_definitions.argument_list_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000931,
        "dEQP-GLES3.functional.shaders.preprocessor.inval",
        "id_function_definitions.argument_list_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000932,
        "dEQP-GLES3.functional.shaders.preprocessor.inva",
        "lid_function_definitions.argument_list_3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000933,
        "dEQP-GLES3.functional.shaders.preprocessor.inval",
        "id_function_definitions.argument_list_3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000934,
        "dEQP-GLES3.functional.shaders.preprocessor.invalid_",
        "function_definitions.no_closing_parenthesis_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000935,
        "dEQP-GLES3.functional.shaders.preprocessor.invalid_f",
        "unction_definitions.no_closing_parenthesis_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000936,
        "dEQP-GLES3.functional.shaders.preprocessor.invalid_",
        "function_definitions.no_closing_parenthesis_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000937,
        "dEQP-GLES3.functional.shaders.preprocessor.invalid_f",
        "unction_definitions.no_closing_parenthesis_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000938,
        "dEQP-GLES3.functional.shaders.preprocessor.invalid_",
        "function_definitions.no_closing_parenthesis_3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000939,
        "dEQP-GLES3.functional.shaders.preprocessor.invalid_f",
        "unction_definitions.no_closing_parenthesis_3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000940,
        "dEQP-GLES3.functional.shaders.preprocessor.invalid_",
        "function_definitions.no_closing_parenthesis_4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000941,
        "dEQP-GLES3.functional.shaders.preprocessor.invalid_f",
        "unction_definitions.no_closing_parenthesis_4_fragment");
