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

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001214,
        "KHR-GLES3.shaders.preproces",
        "sor.extensions.basic_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001215,
        "KHR-GLES3.shaders.preprocess",
        "or.extensions.basic_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001216,
        "KHR-GLES3.shaders.preprocesso",
        "r.extensions.macro_exp_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001217,
        "KHR-GLES3.shaders.preprocessor",
        ".extensions.macro_exp_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001218,
        "KHR-GLES3.shaders.preprocessor.exte",
        "nsions.missing_extension_name_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001219,
        "KHR-GLES3.shaders.preprocessor.exten",
        "sions.missing_extension_name_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001220,
        "KHR-GLES3.shaders.preprocessor.exte",
        "nsions.invalid_extension_name_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001221,
        "KHR-GLES3.shaders.preprocessor.exten",
        "sions.invalid_extension_name_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001222,
        "KHR-GLES3.shaders.preprocessor.",
        "extensions.missing_colon_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001223,
        "KHR-GLES3.shaders.preprocessor.e",
        "xtensions.missing_colon_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001224,
        "KHR-GLES3.shaders.preprocessor.",
        "extensions.expected_colon_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001225,
        "KHR-GLES3.shaders.preprocessor.e",
        "xtensions.expected_colon_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001226,
        "KHR-GLES3.shaders.preprocessor.e",
        "xtensions.missing_behavior_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001227,
        "KHR-GLES3.shaders.preprocessor.ex",
        "tensions.missing_behavior_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001228,
        "KHR-GLES3.shaders.preprocessor.ex",
        "tensions.invalid_behavior_1_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001229,
        "KHR-GLES3.shaders.preprocessor.ext",
        "ensions.invalid_behavior_1_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001230,
        "KHR-GLES3.shaders.preprocessor.ex",
        "tensions.invalid_behavior_2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001231,
        "KHR-GLES3.shaders.preprocessor.ext",
        "ensions.invalid_behavior_2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001232,
        "KHR-GLES3.shaders.preprocessor.ex",
        "tensions.invalid_behavior_3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001233,
        "KHR-GLES3.shaders.preprocessor.ext",
        "ensions.invalid_behavior_3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001234,
        "KHR-GLES3.shaders.preprocessor.ext",
        "ensions.invalid_char_in_name_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001235,
        "KHR-GLES3.shaders.preprocessor.exte",
        "nsions.invalid_char_in_name_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001236,
        "KHR-GLES3.shaders.preprocessor.exten",
        "sions.invalid_char_in_behavior_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001237,
        "KHR-GLES3.shaders.preprocessor.extens",
        "ions.invalid_char_in_behavior_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001238,
        "KHR-GLES3.shaders.preprocessor.ext",
        "ensions.unterminated_comment_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001239,
        "KHR-GLES3.shaders.preprocessor.exte",
        "nsions.unterminated_comment_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001240,
        "KHR-GLES3.shaders.preprocessor.extensio",
        "ns.after_non_preprocessing_tokens_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001241,
        "KHR-GLES3.shaders.preprocessor.extension",
        "s.after_non_preprocessing_tokens_fragment");
