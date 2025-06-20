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

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001186,
    "KHR-GL42.shaders.arrays.return.float_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001187,
    "KHR-GL42.shaders.arrays.return.float_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001188,
    "KHR-GL42.shaders.arrays.return.int_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001189,
    "KHR-GL42.shaders.arrays.return.int_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001190,
    "KHR-GL42.shaders.arrays.return.bool_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001191,
    "KHR-GL42.shaders.arrays.return.bool_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001192,
    "KHR-GL42.shaders.arrays.return.float_vec3_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001193,
    "KHR-GL42.shaders.arrays.return.float_vec3_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001194,
    "KHR-GL42.shaders.arrays.return.struct_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001195,
    "KHR-GL42.shaders.arrays.return.struct_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001196,
    "KHR-GL42.shaders.arrays.return.int_vec3_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001197,
    "KHR-GL42.shaders.arrays.return.int_vec3_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001198,
    "KHR-GL42.shaders.arrays.return.bool_vec3_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001199,
    "KHR-GL42.shaders.arrays.return.bool_vec3_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001200,
    "KHR-GL42.shaders.arrays.return.float_mat3_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001201,
    "KHR-GL42.shaders.arrays.return.float_mat3_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001202,
    "KHR-GL42.shaders.arrays.return.int_mat3_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001203,
    "KHR-GL42.shaders.arrays.return.int_mat3_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001204,
    "KHR-GL42.shaders.arrays.return.bool_mat3_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001205,
    "KHR-GL42.shaders.arrays.return.bool_mat3_fragment");
