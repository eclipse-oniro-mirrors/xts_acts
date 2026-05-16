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
#include "../ActsKhrgles30002TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001106,
        "KHR-GLES3.shaders.preprocessor.in",
        "valid_conditionals.empty_if_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001107,
        "KHR-GLES3.shaders.preprocessor.inv",
        "alid_conditionals.empty_if_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001108,
        "KHR-GLES3.shaders.preprocessor.inva",
        "lid_conditionals.empty_ifdef_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001109,
        "KHR-GLES3.shaders.preprocessor.inval",
        "id_conditionals.empty_ifdef_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001110,
        "KHR-GLES3.shaders.preprocessor.inva",
        "lid_conditionals.empty_ifndef_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001111,
        "KHR-GLES3.shaders.preprocessor.inval",
        "id_conditionals.empty_ifndef_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001112,
        "KHR-GLES3.shaders.preprocessor.inval",
        "id_conditionals.invalid_ifdef_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001113,
        "KHR-GLES3.shaders.preprocessor.invali",
        "d_conditionals.invalid_ifdef_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001114,
        "KHR-GLES3.shaders.preprocessor.inval",
        "id_conditionals.invalid_ifndef_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001115,
        "KHR-GLES3.shaders.preprocessor.invali",
        "d_conditionals.invalid_ifndef_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001116,
        "KHR-GLES3.shaders.preprocessor.invali",
        "d_conditionals.empty_if_defined_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001117,
        "KHR-GLES3.shaders.preprocessor.invalid",
        "_conditionals.empty_if_defined_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001118,
        "KHR-GLES3.shaders.preprocessor.invalid",
        "_conditionals.unterminated_if_1_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001119,
        "KHR-GLES3.shaders.preprocessor.invalid_",
        "conditionals.unterminated_if_1_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001120,
        "KHR-GLES3.shaders.preprocessor.invalid",
        "_conditionals.unterminated_if_2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001121,
        "KHR-GLES3.shaders.preprocessor.invalid_",
        "conditionals.unterminated_if_2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001122,
        "KHR-GLES3.shaders.preprocessor.invalid",
        "_conditionals.unterminated_ifdef_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001123,
        "KHR-GLES3.shaders.preprocessor.invalid_",
        "conditionals.unterminated_ifdef_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001124,
        "KHR-GLES3.shaders.preprocessor.invalid_",
        "conditionals.unterminated_ifndef_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001125,
        "KHR-GLES3.shaders.preprocessor.invalid_c",
        "onditionals.unterminated_ifndef_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001126,
        "KHR-GLES3.shaders.preprocessor.invalid_",
        "conditionals.unterminated_else_1_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001127,
        "KHR-GLES3.shaders.preprocessor.invalid_c",
        "onditionals.unterminated_else_1_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001128,
        "KHR-GLES3.shaders.preprocessor.invalid_",
        "conditionals.unterminated_else_2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001129,
        "KHR-GLES3.shaders.preprocessor.invalid_c",
        "onditionals.unterminated_else_2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001130,
        "KHR-GLES3.shaders.preprocessor.invalid_",
        "conditionals.unterminated_elif_1_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001131,
        "KHR-GLES3.shaders.preprocessor.invalid_c",
        "onditionals.unterminated_elif_1_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001132,
        "KHR-GLES3.shaders.preprocessor.invalid_",
        "conditionals.unterminated_elif_2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001133,
        "KHR-GLES3.shaders.preprocessor.invalid_c",
        "onditionals.unterminated_elif_2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001134,
        "KHR-GLES3.shaders.preprocessor.invalid_",
        "conditionals.unterminated_elif_3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001135,
        "KHR-GLES3.shaders.preprocessor.invalid_c",
        "onditionals.unterminated_elif_3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001136,
        "KHR-GLES3.shaders.preprocessor.invali",
        "d_conditionals.elif_after_else_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001137,
        "KHR-GLES3.shaders.preprocessor.invalid",
        "_conditionals.elif_after_else_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001138,
        "KHR-GLES3.shaders.preprocessor.invali",
        "d_conditionals.else_without_if_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001139,
        "KHR-GLES3.shaders.preprocessor.invalid",
        "_conditionals.else_without_if_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001140,
        "KHR-GLES3.shaders.preprocessor.invali",
        "d_conditionals.elif_without_if_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001141,
        "KHR-GLES3.shaders.preprocessor.invalid",
        "_conditionals.elif_without_if_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001142,
        "KHR-GLES3.shaders.preprocessor.invali",
        "d_conditionals.endif_without_if_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001143,
        "KHR-GLES3.shaders.preprocessor.invalid",
        "_conditionals.endif_without_if_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001144,
        "KHR-GLES3.shaders.preprocessor.invali",
        "d_conditionals.else_after_else_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001145,
        "KHR-GLES3.shaders.preprocessor.invalid",
        "_conditionals.else_after_else_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001146,
        "KHR-GLES3.shaders.preprocessor.invalid_c",
        "onditionals.nested_elif_without_if_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001147,
        "KHR-GLES3.shaders.preprocessor.invalid_co",
        "nditionals.nested_elif_without_if_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001148,
        "KHR-GLES3.shaders.preprocessor.in",
        "valid_conditionals.if_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001149,
        "KHR-GLES3.shaders.preprocessor.inv",
        "alid_conditionals.if_float_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001150,
        "KHR-GLES3.shaders.preprocessor.invali",
        "d_conditionals.tokens_after_if_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001151,
        "KHR-GLES3.shaders.preprocessor.invalid",
        "_conditionals.tokens_after_if_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001152,
        "KHR-GLES3.shaders.preprocessor.invalid",
        "_conditionals.tokens_after_elif_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001153,
        "KHR-GLES3.shaders.preprocessor.invalid_",
        "conditionals.tokens_after_elif_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001154,
        "KHR-GLES3.shaders.preprocessor.invalid",
        "_conditionals.tokens_after_else_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001155,
        "KHR-GLES3.shaders.preprocessor.invalid_",
        "conditionals.tokens_after_else_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001156,
        "KHR-GLES3.shaders.preprocessor.invalid",
        "_conditionals.tokens_after_endif_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001157,
        "KHR-GLES3.shaders.preprocessor.invalid_",
        "conditionals.tokens_after_endif_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001158,
        "KHR-GLES3.shaders.preprocessor.invalid",
        "_conditionals.tokens_after_ifdef_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001159,
        "KHR-GLES3.shaders.preprocessor.invalid_",
        "conditionals.tokens_after_ifdef_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001160,
        "KHR-GLES3.shaders.preprocessor.invalid_",
        "conditionals.tokens_after_ifndef_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001161,
        "KHR-GLES3.shaders.preprocessor.invalid_c",
        "onditionals.tokens_after_ifndef_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001162,
        "KHR-GLES3.shaders.preprocessor.invalid_con",
        "ditionals.unterminated_nested_blocks_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001163,
        "KHR-GLES3.shaders.preprocessor.invalid_cond",
        "itionals.unterminated_nested_blocks_fragment");
