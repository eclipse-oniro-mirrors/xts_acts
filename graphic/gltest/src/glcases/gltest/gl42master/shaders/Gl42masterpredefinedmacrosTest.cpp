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

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002291,
    "KHR-GL42.shaders.preprocessor.predefined_macros.version_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002292,
    "KHR-GL42.shaders.preprocessor.predefined_macros.version_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002293,
    "KHR-GL42.shaders.preprocessor.predefined_macros.core_profile_defined_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002294,
    "KHR-GL42.shaders.preprocessor.predefined_macros.core_profile_defined_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002295,
    "KHR-GL42.shaders.preprocessor.predefined_macros.core_profile_value_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002296,
    "KHR-GL42.shaders.preprocessor.predefined_macros.core_profile_value_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002297,
    "KHR-GL42.shaders.preprocessor.predefined_macros.line_1_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002298,
    "KHR-GL42.shaders.preprocessor.predefined_macros.line_1_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002299,
    "KHR-GL42.shaders.preprocessor.predefined_macros.file_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002300,
    "KHR-GL42.shaders.preprocessor.predefined_macros.file_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002301,
    "KHR-GL42.shaders.preprocessor.predefined_macros.if_core_profile_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002302,
    "KHR-GL42.shaders.preprocessor.predefined_macros.if_core_profile_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002303,
    "KHR-GL42.shaders.preprocessor.predefined_macros.if_version_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002304,
    "KHR-GL42.shaders.preprocessor.predefined_macros.if_version_fragment");
