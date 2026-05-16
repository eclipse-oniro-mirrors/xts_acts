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

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001282,
        "KHR-GLES3.shaders.preprocessor.invalid",
        "_expressions.invalid_unary_expr_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001283,
        "KHR-GLES3.shaders.preprocessor.invalid_",
        "expressions.invalid_unary_expr_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001284,
        "KHR-GLES3.shaders.preprocessor.invalid",
        "_expressions.invalid_binary_expr_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001285,
        "KHR-GLES3.shaders.preprocessor.invalid_",
        "expressions.invalid_binary_expr_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001286,
        "KHR-GLES3.shaders.preprocessor.inva",
        "lid_expressions.missing_expr_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001287,
        "KHR-GLES3.shaders.preprocessor.inval",
        "id_expressions.missing_expr_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001288,
        "KHR-GLES3.shaders.preprocessor.inval",
        "id_expressions.invalid_expr_1_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001289,
        "KHR-GLES3.shaders.preprocessor.invali",
        "d_expressions.invalid_expr_1_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001290,
        "KHR-GLES3.shaders.preprocessor.inval",
        "id_expressions.invalid_expr_2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001291,
        "KHR-GLES3.shaders.preprocessor.invali",
        "d_expressions.invalid_expr_2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001292,
        "KHR-GLES3.shaders.preprocessor.inval",
        "id_expressions.invalid_expr_3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001293,
        "KHR-GLES3.shaders.preprocessor.invali",
        "d_expressions.invalid_expr_3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001294,
        "KHR-GLES3.shaders.preprocessor.invalid_",
        "expressions.unopened_parenthesis_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001295,
        "KHR-GLES3.shaders.preprocessor.invalid_e",
        "xpressions.unopened_parenthesis_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001296,
        "KHR-GLES3.shaders.preprocessor.invalid_",
        "expressions.unclosed_parenthesis_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001297,
        "KHR-GLES3.shaders.preprocessor.invalid_e",
        "xpressions.unclosed_parenthesis_fragment");
