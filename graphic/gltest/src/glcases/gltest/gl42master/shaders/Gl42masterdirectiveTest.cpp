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

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002419,
    "KHR-GL42.shaders.preprocessor.directive.version_with_profile_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002420,
    "KHR-GL42.shaders.preprocessor.directive.version_with_profile_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002421,
    "KHR-GL42.shaders.preprocessor.directive.version_leading_whitespace_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002422,
    "KHR-GL42.shaders.preprocessor.directive.version_leading_whitespace_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002423,
    "KHR-GL42.shaders.preprocessor.directive.version_leading_comment_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002424,
    "KHR-GL42.shaders.preprocessor.directive.version_leading_comment_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002425,
    "KHR-GL42.shaders.preprocessor.directive.version_is_less_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002426,
    "KHR-GL42.shaders.preprocessor.directive.version_is_less_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002427,
    "KHR-GL42.shaders.preprocessor.directive.version_is_more_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002428,
    "KHR-GL42.shaders.preprocessor.directive.version_is_more_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002429,
    "KHR-GL42.shaders.preprocessor.directive.version_invalid_profile_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002430,
    "KHR-GL42.shaders.preprocessor.directive.version_invalid_profile_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002431,
    "KHR-GL42.shaders.preprocessor.directive.version_missing_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002432,
    "KHR-GL42.shaders.preprocessor.directive.version_missing_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002433,
    "KHR-GL42.shaders.preprocessor.directive.version_not_first_statement_1_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002434,
    "KHR-GL42.shaders.preprocessor.directive.version_not_first_statement_1_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002435,
    "KHR-GL42.shaders.preprocessor.directive.version_not_first_statement_2_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002436,
    "KHR-GL42.shaders.preprocessor.directive.version_not_first_statement_2_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002437,
    "KHR-GL42.shaders.preprocessor.directive.version_invalid_token_1_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002438,
    "KHR-GL42.shaders.preprocessor.directive.version_invalid_token_1_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002439,
    "KHR-GL42.shaders.preprocessor.directive.version_invalid_token_2_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002440,
    "KHR-GL42.shaders.preprocessor.directive.version_invalid_token_2_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002441,
    "KHR-GL42.shaders.preprocessor.directive.invalid_version_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002442,
    "KHR-GL42.shaders.preprocessor.directive.invalid_version_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002443,
    "KHR-GL42.shaders.preprocessor.directive.additional_tokens_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002444,
    "KHR-GL42.shaders.preprocessor.directive.additional_tokens_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002445,
    "KHR-GL42.shaders.preprocessor.directive.error_with_no_tokens_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002446,
    "KHR-GL42.shaders.preprocessor.directive.error_with_no_tokens_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002447,
    "KHR-GL42.shaders.preprocessor.directive.error_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002448,
    "KHR-GL42.shaders.preprocessor.directive.error_fragment");
