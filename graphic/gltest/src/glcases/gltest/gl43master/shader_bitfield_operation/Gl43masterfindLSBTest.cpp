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

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006189,
    "KHR-GL43.shader_bitfield_operation.findLSB.uint_zero");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006190,
    "KHR-GL43.shader_bitfield_operation.findLSB.uint_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006191,
    "KHR-GL43.shader_bitfield_operation.findLSB.uint_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006192,
    "KHR-GL43.shader_bitfield_operation.findLSB.uint_2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006193,
    "KHR-GL43.shader_bitfield_operation.findLSB.uint_3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006194,
    "KHR-GL43.shader_bitfield_operation.findLSB.uvec2_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006195,
    "KHR-GL43.shader_bitfield_operation.findLSB.uvec2_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006196,
    "KHR-GL43.shader_bitfield_operation.findLSB.uvec2_2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006197,
    "KHR-GL43.shader_bitfield_operation.findLSB.uvec2_3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006198,
    "KHR-GL43.shader_bitfield_operation.findLSB.uvec3_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006199,
    "KHR-GL43.shader_bitfield_operation.findLSB.uvec3_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006200,
    "KHR-GL43.shader_bitfield_operation.findLSB.uvec3_2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006201,
    "KHR-GL43.shader_bitfield_operation.findLSB.uvec3_3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006202,
    "KHR-GL43.shader_bitfield_operation.findLSB.uvec4_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006203,
    "KHR-GL43.shader_bitfield_operation.findLSB.uvec4_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006204,
    "KHR-GL43.shader_bitfield_operation.findLSB.uvec4_2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006205,
    "KHR-GL43.shader_bitfield_operation.findLSB.uvec4_3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006206,
    "KHR-GL43.shader_bitfield_operation.findLSB.int_zero");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006207,
    "KHR-GL43.shader_bitfield_operation.findLSB.int_minus_one");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006208,
    "KHR-GL43.shader_bitfield_operation.findLSB.int_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006209,
    "KHR-GL43.shader_bitfield_operation.findLSB.int_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006210,
    "KHR-GL43.shader_bitfield_operation.findLSB.int_2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006211,
    "KHR-GL43.shader_bitfield_operation.findLSB.int_3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006212,
    "KHR-GL43.shader_bitfield_operation.findLSB.ivec2_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006213,
    "KHR-GL43.shader_bitfield_operation.findLSB.ivec2_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006214,
    "KHR-GL43.shader_bitfield_operation.findLSB.ivec2_2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006215,
    "KHR-GL43.shader_bitfield_operation.findLSB.ivec2_3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006216,
    "KHR-GL43.shader_bitfield_operation.findLSB.ivec3_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006217,
    "KHR-GL43.shader_bitfield_operation.findLSB.ivec3_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006218,
    "KHR-GL43.shader_bitfield_operation.findLSB.ivec3_2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006219,
    "KHR-GL43.shader_bitfield_operation.findLSB.ivec3_3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006220,
    "KHR-GL43.shader_bitfield_operation.findLSB.ivec4_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006221,
    "KHR-GL43.shader_bitfield_operation.findLSB.ivec4_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006222,
    "KHR-GL43.shader_bitfield_operation.findLSB.ivec4_2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006223,
    "KHR-GL43.shader_bitfield_operation.findLSB.ivec4_3");
