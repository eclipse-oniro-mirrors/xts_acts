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

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001206,
    "KHR-GL42.shaders.arrays.unnamed_parameter.float_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001207,
    "KHR-GL42.shaders.arrays.unnamed_parameter.float_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001208,
    "KHR-GL42.shaders.arrays.unnamed_parameter.int_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001209,
    "KHR-GL42.shaders.arrays.unnamed_parameter.int_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001210,
    "KHR-GL42.shaders.arrays.unnamed_parameter.bool_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001211,
    "KHR-GL42.shaders.arrays.unnamed_parameter.bool_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001212,
    "KHR-GL42.shaders.arrays.unnamed_parameter.struct_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001213,
    "KHR-GL42.shaders.arrays.unnamed_parameter.struct_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001214,
    "KHR-GL42.shaders.arrays.unnamed_parameter.float_vec3_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001215,
    "KHR-GL42.shaders.arrays.unnamed_parameter.float_vec3_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001216,
    "KHR-GL42.shaders.arrays.unnamed_parameter.int_vec3_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001217,
    "KHR-GL42.shaders.arrays.unnamed_parameter.int_vec3_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001218,
    "KHR-GL42.shaders.arrays.unnamed_parameter.bool_vec3_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001219,
    "KHR-GL42.shaders.arrays.unnamed_parameter.bool_vec3_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001220,
    "KHR-GL42.shaders.arrays.unnamed_parameter.float_mat3_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001221,
    "KHR-GL42.shaders.arrays.unnamed_parameter.float_mat3_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001222,
    "KHR-GL42.shaders.arrays.unnamed_parameter.int_mat3_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001223,
    "KHR-GL42.shaders.arrays.unnamed_parameter.int_mat3_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001224,
    "KHR-GL42.shaders.arrays.unnamed_parameter.bool_mat3_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_001225,
    "KHR-GL42.shaders.arrays.unnamed_parameter.bool_mat3_fragment");
