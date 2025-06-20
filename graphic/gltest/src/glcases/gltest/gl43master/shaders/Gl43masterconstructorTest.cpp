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

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001158,
    "KHR-GL43.shaders.arrays.constructor.float3_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001159,
    "KHR-GL43.shaders.arrays.constructor.float3_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001160,
    "KHR-GL43.shaders.arrays.constructor.float4_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001161,
    "KHR-GL43.shaders.arrays.constructor.float4_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001162,
    "KHR-GL43.shaders.arrays.constructor.int3_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001163,
    "KHR-GL43.shaders.arrays.constructor.int3_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001164,
    "KHR-GL43.shaders.arrays.constructor.int4_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001165,
    "KHR-GL43.shaders.arrays.constructor.int4_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001166,
    "KHR-GL43.shaders.arrays.constructor.bool3_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001167,
    "KHR-GL43.shaders.arrays.constructor.bool3_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001168,
    "KHR-GL43.shaders.arrays.constructor.bool4_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001169,
    "KHR-GL43.shaders.arrays.constructor.bool4_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001170,
    "KHR-GL43.shaders.arrays.constructor.struct3_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001171,
    "KHR-GL43.shaders.arrays.constructor.struct3_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001172,
    "KHR-GL43.shaders.arrays.constructor.struct4_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001173,
    "KHR-GL43.shaders.arrays.constructor.struct4_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001174,
    "KHR-GL43.shaders.arrays.constructor.float_vec3_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001175,
    "KHR-GL43.shaders.arrays.constructor.float_vec3_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001176,
    "KHR-GL43.shaders.arrays.constructor.int_vec3_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001177,
    "KHR-GL43.shaders.arrays.constructor.int_vec3_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001178,
    "KHR-GL43.shaders.arrays.constructor.bool_vec3_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001179,
    "KHR-GL43.shaders.arrays.constructor.bool_vec3_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001180,
    "KHR-GL43.shaders.arrays.constructor.float_mat3_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001181,
    "KHR-GL43.shaders.arrays.constructor.float_mat3_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001182,
    "KHR-GL43.shaders.arrays.constructor.int_mat3_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001183,
    "KHR-GL43.shaders.arrays.constructor.int_mat3_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001184,
    "KHR-GL43.shaders.arrays.constructor.bool_mat3_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_001185,
    "KHR-GL43.shaders.arrays.constructor.bool_mat3_fragment");
