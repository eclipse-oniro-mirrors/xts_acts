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

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_002243,
    "KHR-GL45.shaders.preprocessor.function_redefinitions.function_redefinition_1_vertex");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_002244,
    "KHR-GL45.shaders.preprocessor.function_redefinitions.function_redefinition_1_fragment");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_002245,
    "KHR-GL45.shaders.preprocessor.function_redefinitions.function_redefinition_2_vertex");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_002246,
    "KHR-GL45.shaders.preprocessor.function_redefinitions.function_redefinition_2_fragment");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_002247,
    "KHR-GL45.shaders.preprocessor.function_redefinitions.function_redefinition_3_vertex");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_002248,
    "KHR-GL45.shaders.preprocessor.function_redefinitions.function_redefinition_3_fragment");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_002249,
    "KHR-GL45.shaders.preprocessor.function_redefinitions.invalid_function_redefinition_param_1_vertex");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_002250,
    "KHR-GL45.shaders.preprocessor.function_redefinitions.invalid_function_redefinition_param_1_fragment");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_002251,
    "KHR-GL45.shaders.preprocessor.function_redefinitions.invalid_function_redefinition_param_2_vertex");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_002252,
    "KHR-GL45.shaders.preprocessor.function_redefinitions.invalid_function_redefinition_param_2_fragment");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_002253,
    "KHR-GL45.shaders.preprocessor.function_redefinitions.invalid_function_redefinition_param_3_vertex");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_002254,
    "KHR-GL45.shaders.preprocessor.function_redefinitions.invalid_function_redefinition_param_3_fragment");
