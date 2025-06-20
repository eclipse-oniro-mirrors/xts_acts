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

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006119,
    "KHR-GL43.shader_bitfield_operation.bitfieldReverse.uint_zero");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006120,
    "KHR-GL43.shader_bitfield_operation.bitfieldReverse.uint_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006121,
    "KHR-GL43.shader_bitfield_operation.bitfieldReverse.uint_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006122,
    "KHR-GL43.shader_bitfield_operation.bitfieldReverse.uint_2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006123,
    "KHR-GL43.shader_bitfield_operation.bitfieldReverse.uint_3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006124,
    "KHR-GL43.shader_bitfield_operation.bitfieldReverse.uvec2_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006125,
    "KHR-GL43.shader_bitfield_operation.bitfieldReverse.uvec2_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006126,
    "KHR-GL43.shader_bitfield_operation.bitfieldReverse.uvec2_2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006127,
    "KHR-GL43.shader_bitfield_operation.bitfieldReverse.uvec2_3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006128,
    "KHR-GL43.shader_bitfield_operation.bitfieldReverse.uvec3_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006129,
    "KHR-GL43.shader_bitfield_operation.bitfieldReverse.uvec3_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006130,
    "KHR-GL43.shader_bitfield_operation.bitfieldReverse.uvec3_2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006131,
    "KHR-GL43.shader_bitfield_operation.bitfieldReverse.uvec3_3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006132,
    "KHR-GL43.shader_bitfield_operation.bitfieldReverse.uvec4_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006133,
    "KHR-GL43.shader_bitfield_operation.bitfieldReverse.uvec4_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006134,
    "KHR-GL43.shader_bitfield_operation.bitfieldReverse.uvec4_2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006135,
    "KHR-GL43.shader_bitfield_operation.bitfieldReverse.uvec4_3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006136,
    "KHR-GL43.shader_bitfield_operation.bitfieldReverse.int_zero");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006137,
    "KHR-GL43.shader_bitfield_operation.bitfieldReverse.int_minus_one");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006138,
    "KHR-GL43.shader_bitfield_operation.bitfieldReverse.int_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006139,
    "KHR-GL43.shader_bitfield_operation.bitfieldReverse.int_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006140,
    "KHR-GL43.shader_bitfield_operation.bitfieldReverse.int_2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006141,
    "KHR-GL43.shader_bitfield_operation.bitfieldReverse.int_3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006142,
    "KHR-GL43.shader_bitfield_operation.bitfieldReverse.ivec2_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006143,
    "KHR-GL43.shader_bitfield_operation.bitfieldReverse.ivec2_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006144,
    "KHR-GL43.shader_bitfield_operation.bitfieldReverse.ivec2_2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006145,
    "KHR-GL43.shader_bitfield_operation.bitfieldReverse.ivec2_3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006146,
    "KHR-GL43.shader_bitfield_operation.bitfieldReverse.ivec3_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006147,
    "KHR-GL43.shader_bitfield_operation.bitfieldReverse.ivec3_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006148,
    "KHR-GL43.shader_bitfield_operation.bitfieldReverse.ivec3_2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006149,
    "KHR-GL43.shader_bitfield_operation.bitfieldReverse.ivec3_3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006150,
    "KHR-GL43.shader_bitfield_operation.bitfieldReverse.ivec4_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006151,
    "KHR-GL43.shader_bitfield_operation.bitfieldReverse.ivec4_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006152,
    "KHR-GL43.shader_bitfield_operation.bitfieldReverse.ivec4_2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006153,
    "KHR-GL43.shader_bitfield_operation.bitfieldReverse.ivec4_3");
