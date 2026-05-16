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

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000237,
        "dEQP-GLES2.functional.shaders.preprocessor.in",
        "valid_function_definitions.arguments_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000238,
        "dEQP-GLES2.functional.shaders.preprocessor.inv",
        "alid_function_definitions.arguments_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000239,
        "dEQP-GLES2.functional.shaders.preprocessor.in",
        "valid_function_definitions.arguments_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000240,
        "dEQP-GLES2.functional.shaders.preprocessor.inv",
        "alid_function_definitions.arguments_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000241,
        "dEQP-GLES2.functional.shaders.preprocessor.in",
        "valid_function_definitions.arguments_3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000242,
        "dEQP-GLES2.functional.shaders.preprocessor.inv",
        "alid_function_definitions.arguments_3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000243,
        "dEQP-GLES2.functional.shaders.preprocessor.in",
        "valid_function_definitions.arguments_4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000244,
        "dEQP-GLES2.functional.shaders.preprocessor.inv",
        "alid_function_definitions.arguments_4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000245,
        "dEQP-GLES2.functional.shaders.preprocessor.in",
        "valid_function_definitions.arguments_5_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000246,
        "dEQP-GLES2.functional.shaders.preprocessor.inv",
        "alid_function_definitions.arguments_5_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000247,
        "dEQP-GLES2.functional.shaders.preprocessor.in",
        "valid_function_definitions.arguments_6_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000248,
        "dEQP-GLES2.functional.shaders.preprocessor.inv",
        "alid_function_definitions.arguments_6_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000249,
        "dEQP-GLES2.functional.shaders.preprocessor.in",
        "valid_function_definitions.arguments_7_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000250,
        "dEQP-GLES2.functional.shaders.preprocessor.inv",
        "alid_function_definitions.arguments_7_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000251,
        "dEQP-GLES2.functional.shaders.preprocessor.in",
        "valid_function_definitions.arguments_8_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000252,
        "dEQP-GLES2.functional.shaders.preprocessor.inv",
        "alid_function_definitions.arguments_8_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000253,
        "dEQP-GLES2.functional.shaders.preprocessor.inval",
        "id_function_definitions.unique_param_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000254,
        "dEQP-GLES2.functional.shaders.preprocessor.invali",
        "d_function_definitions.unique_param_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000255,
        "dEQP-GLES2.functional.shaders.preprocessor.inva",
        "lid_function_definitions.argument_list_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000256,
        "dEQP-GLES2.functional.shaders.preprocessor.inval",
        "id_function_definitions.argument_list_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000257,
        "dEQP-GLES2.functional.shaders.preprocessor.inva",
        "lid_function_definitions.argument_list_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000258,
        "dEQP-GLES2.functional.shaders.preprocessor.inval",
        "id_function_definitions.argument_list_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000259,
        "dEQP-GLES2.functional.shaders.preprocessor.inva",
        "lid_function_definitions.argument_list_3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000260,
        "dEQP-GLES2.functional.shaders.preprocessor.inval",
        "id_function_definitions.argument_list_3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000261,
        "dEQP-GLES2.functional.shaders.preprocessor.invalid_",
        "function_definitions.no_closing_parenthesis_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000262,
        "dEQP-GLES2.functional.shaders.preprocessor.invalid_f",
        "unction_definitions.no_closing_parenthesis_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000263,
        "dEQP-GLES2.functional.shaders.preprocessor.invalid_",
        "function_definitions.no_closing_parenthesis_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000264,
        "dEQP-GLES2.functional.shaders.preprocessor.invalid_f",
        "unction_definitions.no_closing_parenthesis_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000265,
        "dEQP-GLES2.functional.shaders.preprocessor.invalid_",
        "function_definitions.no_closing_parenthesis_3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000266,
        "dEQP-GLES2.functional.shaders.preprocessor.invalid_f",
        "unction_definitions.no_closing_parenthesis_3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000267,
        "dEQP-GLES2.functional.shaders.preprocessor.invalid_",
        "function_definitions.no_closing_parenthesis_4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000268,
        "dEQP-GLES2.functional.shaders.preprocessor.invalid_f",
        "unction_definitions.no_closing_parenthesis_4_fragment");
