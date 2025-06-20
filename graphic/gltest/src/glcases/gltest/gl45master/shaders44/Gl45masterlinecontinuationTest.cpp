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
#include "../Gl45masterBaseFunc.h"
#include "../ActsGl45master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007747,
    "KHR-GL45.shaders44.preprocessor.line_continuation.comment_vertex");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007748,
    "KHR-GL45.shaders44.preprocessor.line_continuation.comment_fragment");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007749,
    "KHR-GL45.shaders44.preprocessor.line_continuation.define_vertex");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007750,
    "KHR-GL45.shaders44.preprocessor.line_continuation.define_fragment");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007751,
    "KHR-GL45.shaders44.preprocessor.line_continuation.preprocessing_token_vertex");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007752,
    "KHR-GL45.shaders44.preprocessor.line_continuation.preprocessing_token_fragment");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007753,
    "KHR-GL45.shaders44.preprocessor.line_continuation.token_vertex");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007754,
    "KHR-GL45.shaders44.preprocessor.line_continuation.token_fragment");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007755,
    "KHR-GL45.shaders44.preprocessor.line_continuation.middle_of_line_vertex");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007756,
    "KHR-GL45.shaders44.preprocessor.line_continuation.middle_of_line_fragment");
