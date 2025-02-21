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
#include "../ActsDeqpgles30002TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001100,
        "dEQP-GLES3.functional.shaders.preproc",
        "essor.directive.version_is_less_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001101,
        "dEQP-GLES3.functional.shaders.preproce",
        "ssor.directive.version_is_less_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001102,
        "dEQP-GLES3.functional.shaders.preproc",
        "essor.directive.version_is_more_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001103,
        "dEQP-GLES3.functional.shaders.preproce",
        "ssor.directive.version_is_more_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001104,
        "dEQP-GLES3.functional.shaders.preproces",
        "sor.directive.version_missing_es_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001105,
        "dEQP-GLES3.functional.shaders.preprocess",
        "or.directive.version_missing_es_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001106,
        "dEQP-GLES3.functional.shaders.preproc",
        "essor.directive.version_missing_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001107,
        "dEQP-GLES3.functional.shaders.preproce",
        "ssor.directive.version_missing_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001108,
        "dEQP-GLES3.functional.shaders.preprocessor.d",
        "irective.version_not_first_statement_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001109,
        "dEQP-GLES3.functional.shaders.preprocessor.di",
        "rective.version_not_first_statement_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001110,
        "dEQP-GLES3.functional.shaders.preprocessor.d",
        "irective.version_not_first_statement_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001111,
        "dEQP-GLES3.functional.shaders.preprocessor.di",
        "rective.version_not_first_statement_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001112,
        "dEQP-GLES3.functional.shaders.preprocesso",
        "r.directive.version_invalid_token_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001113,
        "dEQP-GLES3.functional.shaders.preprocessor",
        ".directive.version_invalid_token_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001114,
        "dEQP-GLES3.functional.shaders.preprocesso",
        "r.directive.version_invalid_token_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001115,
        "dEQP-GLES3.functional.shaders.preprocessor",
        ".directive.version_invalid_token_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001116,
        "dEQP-GLES3.functional.shaders.preproc",
        "essor.directive.invalid_version_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001117,
        "dEQP-GLES3.functional.shaders.preproce",
        "ssor.directive.invalid_version_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001118,
        "dEQP-GLES3.functional.shaders.preproce",
        "ssor.directive.additional_tokens_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001119,
        "dEQP-GLES3.functional.shaders.preproces",
        "sor.directive.additional_tokens_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001120,
        "dEQP-GLES3.functional.shaders.preprocess",
        "or.directive.error_with_no_tokens_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001121,
        "dEQP-GLES3.functional.shaders.preprocesso",
        "r.directive.error_with_no_tokens_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001122,
        "dEQP-GLES3.functional.shaders.pr",
        "eprocessor.directive.error_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001123,
        "dEQP-GLES3.functional.shaders.pre",
        "processor.directive.error_fragment");
