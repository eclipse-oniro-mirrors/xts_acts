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
#include "../Khrgles3BaseFunc.h"
#include "../ActsKhrgles30001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000996,
        "KHR-GLES3.shaders.preprocessor.invalid_",
        "function_definitions.arguments_1_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000997,
        "KHR-GLES3.shaders.preprocessor.invalid_f",
        "unction_definitions.arguments_1_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000998,
        "KHR-GLES3.shaders.preprocessor.invalid_",
        "function_definitions.arguments_2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000999,
        "KHR-GLES3.shaders.preprocessor.invalid_f",
        "unction_definitions.arguments_2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_001000,
        "KHR-GLES3.shaders.preprocessor.invalid_",
        "function_definitions.arguments_3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_001001,
        "KHR-GLES3.shaders.preprocessor.invalid_f",
        "unction_definitions.arguments_3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_001002,
        "KHR-GLES3.shaders.preprocessor.invalid_",
        "function_definitions.arguments_4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_001003,
        "KHR-GLES3.shaders.preprocessor.invalid_f",
        "unction_definitions.arguments_4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_001004,
        "KHR-GLES3.shaders.preprocessor.invalid_",
        "function_definitions.arguments_5_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_001005,
        "KHR-GLES3.shaders.preprocessor.invalid_f",
        "unction_definitions.arguments_5_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_001006,
        "KHR-GLES3.shaders.preprocessor.invalid_",
        "function_definitions.arguments_6_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_001007,
        "KHR-GLES3.shaders.preprocessor.invalid_f",
        "unction_definitions.arguments_6_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_001008,
        "KHR-GLES3.shaders.preprocessor.invalid_",
        "function_definitions.arguments_7_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_001009,
        "KHR-GLES3.shaders.preprocessor.invalid_f",
        "unction_definitions.arguments_7_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_001010,
        "KHR-GLES3.shaders.preprocessor.invalid_",
        "function_definitions.arguments_8_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_001011,
        "KHR-GLES3.shaders.preprocessor.invalid_f",
        "unction_definitions.arguments_8_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_001012,
        "KHR-GLES3.shaders.preprocessor.invalid_fun",
        "ction_definitions.unique_param_name_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_001013,
        "KHR-GLES3.shaders.preprocessor.invalid_func",
        "tion_definitions.unique_param_name_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_001014,
        "KHR-GLES3.shaders.preprocessor.invalid_fu",
        "nction_definitions.argument_list_1_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_001015,
        "KHR-GLES3.shaders.preprocessor.invalid_fun",
        "ction_definitions.argument_list_1_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_001016,
        "KHR-GLES3.shaders.preprocessor.invalid_fu",
        "nction_definitions.argument_list_2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_001017,
        "KHR-GLES3.shaders.preprocessor.invalid_fun",
        "ction_definitions.argument_list_2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_001018,
        "KHR-GLES3.shaders.preprocessor.invalid_fu",
        "nction_definitions.argument_list_3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_001019,
        "KHR-GLES3.shaders.preprocessor.invalid_fun",
        "ction_definitions.argument_list_3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_001020,
        "KHR-GLES3.shaders.preprocessor.invalid_functi",
        "on_definitions.no_closing_parenthesis_1_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_001021,
        "KHR-GLES3.shaders.preprocessor.invalid_functio",
        "n_definitions.no_closing_parenthesis_1_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_001022,
        "KHR-GLES3.shaders.preprocessor.invalid_functi",
        "on_definitions.no_closing_parenthesis_2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_001023,
        "KHR-GLES3.shaders.preprocessor.invalid_functio",
        "n_definitions.no_closing_parenthesis_2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_001024,
        "KHR-GLES3.shaders.preprocessor.invalid_functi",
        "on_definitions.no_closing_parenthesis_3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_001025,
        "KHR-GLES3.shaders.preprocessor.invalid_functio",
        "n_definitions.no_closing_parenthesis_3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_001026,
        "KHR-GLES3.shaders.preprocessor.invalid_functi",
        "on_definitions.no_closing_parenthesis_4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_001027,
        "KHR-GLES3.shaders.preprocessor.invalid_functio",
        "n_definitions.no_closing_parenthesis_4_fragment");
