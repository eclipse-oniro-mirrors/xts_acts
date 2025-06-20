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
#include "../Gl42masterBaseFunc.h"
#include "../ActsGl42master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002457,
    "KHR-GL42.shaders.preprocessor.extensions.basic_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002458,
    "KHR-GL42.shaders.preprocessor.extensions.basic_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002459,
    "KHR-GL42.shaders.preprocessor.extensions.macro_exp_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002460,
    "KHR-GL42.shaders.preprocessor.extensions.macro_exp_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002461,
    "KHR-GL42.shaders.preprocessor.extensions.missing_extension_name_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002462,
    "KHR-GL42.shaders.preprocessor.extensions.missing_extension_name_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002463,
    "KHR-GL42.shaders.preprocessor.extensions.invalid_extension_name_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002464,
    "KHR-GL42.shaders.preprocessor.extensions.invalid_extension_name_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002465,
    "KHR-GL42.shaders.preprocessor.extensions.missing_colon_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002466,
    "KHR-GL42.shaders.preprocessor.extensions.missing_colon_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002467,
    "KHR-GL42.shaders.preprocessor.extensions.expected_colon_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002468,
    "KHR-GL42.shaders.preprocessor.extensions.expected_colon_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002469,
    "KHR-GL42.shaders.preprocessor.extensions.missing_behavior_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002470,
    "KHR-GL42.shaders.preprocessor.extensions.missing_behavior_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002471,
    "KHR-GL42.shaders.preprocessor.extensions.invalid_behavior_1_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002472,
    "KHR-GL42.shaders.preprocessor.extensions.invalid_behavior_1_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002473,
    "KHR-GL42.shaders.preprocessor.extensions.invalid_behavior_2_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002474,
    "KHR-GL42.shaders.preprocessor.extensions.invalid_behavior_2_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002475,
    "KHR-GL42.shaders.preprocessor.extensions.invalid_char_in_name_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002476,
    "KHR-GL42.shaders.preprocessor.extensions.invalid_char_in_name_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002477,
    "KHR-GL42.shaders.preprocessor.extensions.invalid_char_in_behavior_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002478,
    "KHR-GL42.shaders.preprocessor.extensions.invalid_char_in_behavior_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002479,
    "KHR-GL42.shaders.preprocessor.extensions.unterminated_comment_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002480,
    "KHR-GL42.shaders.preprocessor.extensions.unterminated_comment_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002481,
    "KHR-GL42.shaders.preprocessor.extensions.after_non_preprocessing_tokens_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002482,
    "KHR-GL42.shaders.preprocessor.extensions.after_non_preprocessing_tokens_fragment");
