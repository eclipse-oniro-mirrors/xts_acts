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

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001260,
    "KHR-GL42.shaders.arrays.invalid.multidimensional_array1_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001261,
    "KHR-GL42.shaders.arrays.invalid.multidimensional_array1_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001262,
    "KHR-GL42.shaders.arrays.invalid.multidimensional_array2_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001263,
    "KHR-GL42.shaders.arrays.invalid.multidimensional_array2_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001264,
    "KHR-GL42.shaders.arrays.invalid.dynamic_expression_array_size_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001265,
    "KHR-GL42.shaders.arrays.invalid.dynamic_expression_array_size_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001266,
    "KHR-GL42.shaders.arrays.invalid.constructor_c-style1_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001267,
    "KHR-GL42.shaders.arrays.invalid.constructor_c-style1_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001268,
    "KHR-GL42.shaders.arrays.invalid.constructor_c-style2_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001269,
    "KHR-GL42.shaders.arrays.invalid.constructor_c-style2_fragment");
