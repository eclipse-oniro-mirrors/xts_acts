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
#include "../Gl43masterBaseFunc.h"
#include "../ActsGl43master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002147,
    "KHR-GL43.shaders.preprocessor.basic.correct_phases_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002148,
    "KHR-GL43.shaders.preprocessor.basic.correct_phases_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002149,
    "KHR-GL43.shaders.preprocessor.basic.invalid_identifier_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002150,
    "KHR-GL43.shaders.preprocessor.basic.invalid_identifier_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002151,
    "KHR-GL43.shaders.preprocessor.basic.null_directive_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002152,
    "KHR-GL43.shaders.preprocessor.basic.null_directive_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002153,
    "KHR-GL43.shaders.preprocessor.basic.invalid_directive_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002154,
    "KHR-GL43.shaders.preprocessor.basic.invalid_directive_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002155,
    "KHR-GL43.shaders.preprocessor.basic.missing_identifier_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002156,
    "KHR-GL43.shaders.preprocessor.basic.missing_identifier_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002157,
    "KHR-GL43.shaders.preprocessor.basic.empty_object_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002158,
    "KHR-GL43.shaders.preprocessor.basic.empty_object_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002159,
    "KHR-GL43.shaders.preprocessor.basic.empty_function_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002160,
    "KHR-GL43.shaders.preprocessor.basic.empty_function_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002161,
    "KHR-GL43.shaders.preprocessor.basic.empty_directive_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002162,
    "KHR-GL43.shaders.preprocessor.basic.empty_directive_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002163,
    "KHR-GL43.shaders.preprocessor.basic.token_pasting_1_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002164,
    "KHR-GL43.shaders.preprocessor.basic.token_pasting_1_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002165,
    "KHR-GL43.shaders.preprocessor.basic.token_pasting_2_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002166,
    "KHR-GL43.shaders.preprocessor.basic.token_pasting_2_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002167,
    "KHR-GL43.shaders.preprocessor.basic.stringification_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002168,
    "KHR-GL43.shaders.preprocessor.basic.stringification_fragment");
