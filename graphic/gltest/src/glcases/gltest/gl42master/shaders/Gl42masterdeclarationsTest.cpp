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

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001270,
    "KHR-GL42.shaders.declarations.declarations.missing_variable_name_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001271,
    "KHR-GL42.shaders.declarations.declarations.missing_variable_name_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001272,
    "KHR-GL42.shaders.declarations.declarations.comma_preceding_variable_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001273,
    "KHR-GL42.shaders.declarations.declarations.comma_preceding_variable_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001274,
    "KHR-GL42.shaders.declarations.declarations.comma_following_variable_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001275,
    "KHR-GL42.shaders.declarations.declarations.comma_following_variable_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001276,
    "KHR-GL42.shaders.declarations.declarations.struct_missing_attribute_name_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001277,
    "KHR-GL42.shaders.declarations.declarations.struct_missing_attribute_name_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001278,
    "KHR-GL42.shaders.declarations.declarations.struct_comma_preceding_attribute_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001279,
    "KHR-GL42.shaders.declarations.declarations.struct_comma_preceding_attribute_fragment");
