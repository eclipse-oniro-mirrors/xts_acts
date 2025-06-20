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

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002169,
    "KHR-GL42.shaders.preprocessor.definitions.define_value_and_function_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002170,
    "KHR-GL42.shaders.preprocessor.definitions.define_value_and_function_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002171,
    "KHR-GL42.shaders.preprocessor.definitions.undefine_object_invalid_syntax_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002172,
    "KHR-GL42.shaders.preprocessor.definitions.undefine_object_invalid_syntax_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002173,
    "KHR-GL42.shaders.preprocessor.definitions.undefine_function_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002174,
    "KHR-GL42.shaders.preprocessor.definitions.undefine_function_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002175,
    "KHR-GL42.shaders.preprocessor.definitions.undefine_version_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002176,
    "KHR-GL42.shaders.preprocessor.definitions.undefine_version_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002177,
    "KHR-GL42.shaders.preprocessor.definitions.undefine_core_profile_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002178,
    "KHR-GL42.shaders.preprocessor.definitions.undefine_core_profile_fragment");
