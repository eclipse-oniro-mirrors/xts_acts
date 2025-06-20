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

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002217,
    "KHR-GL42.shaders.preprocessor.comments.multiline_comment_define_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002218,
    "KHR-GL42.shaders.preprocessor.comments.multiline_comment_define_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002219,
    "KHR-GL42.shaders.preprocessor.comments.nested_comment_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002220,
    "KHR-GL42.shaders.preprocessor.comments.nested_comment_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002221,
    "KHR-GL42.shaders.preprocessor.comments.invalid_comment_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002222,
    "KHR-GL42.shaders.preprocessor.comments.invalid_comment_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002223,
    "KHR-GL42.shaders.preprocessor.comments.unterminated_comment_1_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002224,
    "KHR-GL42.shaders.preprocessor.comments.unterminated_comment_1_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002225,
    "KHR-GL42.shaders.preprocessor.comments.unterminated_comment_2_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002226,
    "KHR-GL42.shaders.preprocessor.comments.unterminated_comment_2_fragment");
