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

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000423,
        "dEQP-GLES2.functional.shaders.pre",
        "processor.directive.version_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000424,
        "dEQP-GLES2.functional.shaders.prep",
        "rocessor.directive.version_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000425,
        "dEQP-GLES2.functional.shaders.preproc",
        "essor.directive.version_is_less_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000426,
        "dEQP-GLES2.functional.shaders.preproce",
        "ssor.directive.version_is_less_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000427,
        "dEQP-GLES2.functional.shaders.preproc",
        "essor.directive.version_is_more_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000428,
        "dEQP-GLES2.functional.shaders.preproce",
        "ssor.directive.version_is_more_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000429,
        "dEQP-GLES2.functional.shaders.preproc",
        "essor.directive.version_missing_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000430,
        "dEQP-GLES2.functional.shaders.preproce",
        "ssor.directive.version_missing_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000431,
        "dEQP-GLES2.functional.shaders.preprocessor.d",
        "irective.version_not_first_statement_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000432,
        "dEQP-GLES2.functional.shaders.preprocessor.di",
        "rective.version_not_first_statement_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000433,
        "dEQP-GLES2.functional.shaders.preprocessor.d",
        "irective.version_not_first_statement_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000434,
        "dEQP-GLES2.functional.shaders.preprocessor.di",
        "rective.version_not_first_statement_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000435,
        "dEQP-GLES2.functional.shaders.preprocesso",
        "r.directive.version_invalid_token_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000436,
        "dEQP-GLES2.functional.shaders.preprocessor",
        ".directive.version_invalid_token_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000437,
        "dEQP-GLES2.functional.shaders.preprocesso",
        "r.directive.version_invalid_token_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000438,
        "dEQP-GLES2.functional.shaders.preprocessor",
        ".directive.version_invalid_token_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000439,
        "dEQP-GLES2.functional.shaders.preproc",
        "essor.directive.invalid_version_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000440,
        "dEQP-GLES2.functional.shaders.preproce",
        "ssor.directive.invalid_version_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000441,
        "dEQP-GLES2.functional.shaders.preproce",
        "ssor.directive.additional_tokens_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000442,
        "dEQP-GLES2.functional.shaders.preproces",
        "sor.directive.additional_tokens_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000443,
        "dEQP-GLES2.functional.shaders.preprocess",
        "or.directive.error_with_no_tokens_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000444,
        "dEQP-GLES2.functional.shaders.preprocesso",
        "r.directive.error_with_no_tokens_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000445,
        "dEQP-GLES2.functional.shaders.pr",
        "eprocessor.directive.error_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000446,
        "dEQP-GLES2.functional.shaders.pre",
        "processor.directive.error_fragment");
