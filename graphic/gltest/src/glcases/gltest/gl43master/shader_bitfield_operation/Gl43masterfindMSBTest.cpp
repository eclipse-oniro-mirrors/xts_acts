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

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006224,
    "KHR-GL43.shader_bitfield_operation.findMSB.uint_zero");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006225,
    "KHR-GL43.shader_bitfield_operation.findMSB.uint_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006226,
    "KHR-GL43.shader_bitfield_operation.findMSB.uint_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006227,
    "KHR-GL43.shader_bitfield_operation.findMSB.uint_2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006228,
    "KHR-GL43.shader_bitfield_operation.findMSB.uint_3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006229,
    "KHR-GL43.shader_bitfield_operation.findMSB.uvec2_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006230,
    "KHR-GL43.shader_bitfield_operation.findMSB.uvec2_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006231,
    "KHR-GL43.shader_bitfield_operation.findMSB.uvec2_2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006232,
    "KHR-GL43.shader_bitfield_operation.findMSB.uvec2_3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006233,
    "KHR-GL43.shader_bitfield_operation.findMSB.uvec3_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006234,
    "KHR-GL43.shader_bitfield_operation.findMSB.uvec3_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006235,
    "KHR-GL43.shader_bitfield_operation.findMSB.uvec3_2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006236,
    "KHR-GL43.shader_bitfield_operation.findMSB.uvec3_3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006237,
    "KHR-GL43.shader_bitfield_operation.findMSB.uvec4_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006238,
    "KHR-GL43.shader_bitfield_operation.findMSB.uvec4_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006239,
    "KHR-GL43.shader_bitfield_operation.findMSB.uvec4_2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006240,
    "KHR-GL43.shader_bitfield_operation.findMSB.uvec4_3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006241,
    "KHR-GL43.shader_bitfield_operation.findMSB.int_zero");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006242,
    "KHR-GL43.shader_bitfield_operation.findMSB.int_minus_one");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006243,
    "KHR-GL43.shader_bitfield_operation.findMSB.int_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006244,
    "KHR-GL43.shader_bitfield_operation.findMSB.int_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006245,
    "KHR-GL43.shader_bitfield_operation.findMSB.int_2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006246,
    "KHR-GL43.shader_bitfield_operation.findMSB.int_3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006247,
    "KHR-GL43.shader_bitfield_operation.findMSB.ivec2_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006248,
    "KHR-GL43.shader_bitfield_operation.findMSB.ivec2_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006249,
    "KHR-GL43.shader_bitfield_operation.findMSB.ivec2_2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006250,
    "KHR-GL43.shader_bitfield_operation.findMSB.ivec2_3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006251,
    "KHR-GL43.shader_bitfield_operation.findMSB.ivec3_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006252,
    "KHR-GL43.shader_bitfield_operation.findMSB.ivec3_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006253,
    "KHR-GL43.shader_bitfield_operation.findMSB.ivec3_2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006254,
    "KHR-GL43.shader_bitfield_operation.findMSB.ivec3_3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006255,
    "KHR-GL43.shader_bitfield_operation.findMSB.ivec4_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006256,
    "KHR-GL43.shader_bitfield_operation.findMSB.ivec4_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006257,
    "KHR-GL43.shader_bitfield_operation.findMSB.ivec4_2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006258,
    "KHR-GL43.shader_bitfield_operation.findMSB.ivec4_3");
