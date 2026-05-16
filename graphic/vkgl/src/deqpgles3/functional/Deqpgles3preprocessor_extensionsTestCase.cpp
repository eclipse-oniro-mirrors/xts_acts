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

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001148,
        "dEQP-GLES3.functional.shaders.pre",
        "processor.extensions.basic_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001149,
        "dEQP-GLES3.functional.shaders.prep",
        "rocessor.extensions.basic_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001150,
        "dEQP-GLES3.functional.shaders.prepr",
        "ocessor.extensions.macro_exp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001151,
        "dEQP-GLES3.functional.shaders.prepro",
        "cessor.extensions.macro_exp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001152,
        "dEQP-GLES3.functional.shaders.preprocesso",
        "r.extensions.missing_extension_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001153,
        "dEQP-GLES3.functional.shaders.preprocessor",
        ".extensions.missing_extension_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001154,
        "dEQP-GLES3.functional.shaders.preprocesso",
        "r.extensions.invalid_extension_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001155,
        "dEQP-GLES3.functional.shaders.preprocessor",
        ".extensions.invalid_extension_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001156,
        "dEQP-GLES3.functional.shaders.preproc",
        "essor.extensions.missing_colon_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001157,
        "dEQP-GLES3.functional.shaders.preproce",
        "ssor.extensions.missing_colon_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001158,
        "dEQP-GLES3.functional.shaders.preproc",
        "essor.extensions.expected_colon_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001159,
        "dEQP-GLES3.functional.shaders.preproce",
        "ssor.extensions.expected_colon_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001160,
        "dEQP-GLES3.functional.shaders.preproce",
        "ssor.extensions.missing_behavior_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001161,
        "dEQP-GLES3.functional.shaders.preproces",
        "sor.extensions.missing_behavior_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001162,
        "dEQP-GLES3.functional.shaders.preproces",
        "sor.extensions.invalid_behavior_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001163,
        "dEQP-GLES3.functional.shaders.preprocess",
        "or.extensions.invalid_behavior_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001164,
        "dEQP-GLES3.functional.shaders.preproces",
        "sor.extensions.invalid_behavior_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001165,
        "dEQP-GLES3.functional.shaders.preprocess",
        "or.extensions.invalid_behavior_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001166,
        "dEQP-GLES3.functional.shaders.preprocess",
        "or.extensions.invalid_char_in_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001167,
        "dEQP-GLES3.functional.shaders.preprocesso",
        "r.extensions.invalid_char_in_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001168,
        "dEQP-GLES3.functional.shaders.preprocessor",
        ".extensions.invalid_char_in_behavior_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001169,
        "dEQP-GLES3.functional.shaders.preprocessor.",
        "extensions.invalid_char_in_behavior_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001170,
        "dEQP-GLES3.functional.shaders.preprocess",
        "or.extensions.unterminated_comment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001171,
        "dEQP-GLES3.functional.shaders.preprocesso",
        "r.extensions.unterminated_comment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001172,
        "dEQP-GLES3.functional.shaders.preprocessor.ex",
        "tensions.after_non_preprocessing_tokens_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001173,
        "dEQP-GLES3.functional.shaders.preprocessor.ext",
        "ensions.after_non_preprocessing_tokens_fragment");
