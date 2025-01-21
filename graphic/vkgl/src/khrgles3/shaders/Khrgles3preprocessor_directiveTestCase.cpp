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

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001182,
        "KHR-GLES3.shaders.preprocessor.",
        "directive.version_is_less_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001183,
        "KHR-GLES3.shaders.preprocessor.d",
        "irective.version_is_less_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001184,
        "KHR-GLES3.shaders.preprocessor.",
        "directive.version_is_more_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001185,
        "KHR-GLES3.shaders.preprocessor.d",
        "irective.version_is_more_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001186,
        "KHR-GLES3.shaders.preprocessor.di",
        "rective.version_missing_es_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001187,
        "KHR-GLES3.shaders.preprocessor.dir",
        "ective.version_missing_es_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001188,
        "KHR-GLES3.shaders.preprocessor.",
        "directive.version_missing_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001189,
        "KHR-GLES3.shaders.preprocessor.d",
        "irective.version_missing_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001190,
        "KHR-GLES3.shaders.preprocessor.directi",
        "ve.version_not_first_statement_1_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001191,
        "KHR-GLES3.shaders.preprocessor.directiv",
        "e.version_not_first_statement_1_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001192,
        "KHR-GLES3.shaders.preprocessor.directi",
        "ve.version_not_first_statement_2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001193,
        "KHR-GLES3.shaders.preprocessor.directiv",
        "e.version_not_first_statement_2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001194,
        "KHR-GLES3.shaders.preprocessor.dire",
        "ctive.version_invalid_token_1_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001195,
        "KHR-GLES3.shaders.preprocessor.direc",
        "tive.version_invalid_token_1_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001196,
        "KHR-GLES3.shaders.preprocessor.dire",
        "ctive.version_invalid_token_2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001197,
        "KHR-GLES3.shaders.preprocessor.direc",
        "tive.version_invalid_token_2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001198,
        "KHR-GLES3.shaders.preprocessor.",
        "directive.invalid_version_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001199,
        "KHR-GLES3.shaders.preprocessor.d",
        "irective.invalid_version_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001200,
        "KHR-GLES3.shaders.preprocessor.d",
        "irective.additional_tokens_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001201,
        "KHR-GLES3.shaders.preprocessor.di",
        "rective.additional_tokens_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001202,
        "KHR-GLES3.shaders.preprocessor.dir",
        "ective.error_with_no_tokens_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001203,
        "KHR-GLES3.shaders.preprocessor.dire",
        "ctive.error_with_no_tokens_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001204,
        "KHR-GLES3.shaders.preproce",
        "ssor.directive.error_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001205,
        "KHR-GLES3.shaders.preproces",
        "sor.directive.error_fragment");
