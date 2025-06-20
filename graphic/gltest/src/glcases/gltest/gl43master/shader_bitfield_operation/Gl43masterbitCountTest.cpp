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

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006154,
    "KHR-GL43.shader_bitfield_operation.bitCount.uint_zero");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006155,
    "KHR-GL43.shader_bitfield_operation.bitCount.uint_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006156,
    "KHR-GL43.shader_bitfield_operation.bitCount.uint_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006157,
    "KHR-GL43.shader_bitfield_operation.bitCount.uint_2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006158,
    "KHR-GL43.shader_bitfield_operation.bitCount.uint_3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006159,
    "KHR-GL43.shader_bitfield_operation.bitCount.uvec2_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006160,
    "KHR-GL43.shader_bitfield_operation.bitCount.uvec2_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006161,
    "KHR-GL43.shader_bitfield_operation.bitCount.uvec2_2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006162,
    "KHR-GL43.shader_bitfield_operation.bitCount.uvec2_3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006163,
    "KHR-GL43.shader_bitfield_operation.bitCount.uvec3_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006164,
    "KHR-GL43.shader_bitfield_operation.bitCount.uvec3_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006165,
    "KHR-GL43.shader_bitfield_operation.bitCount.uvec3_2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006166,
    "KHR-GL43.shader_bitfield_operation.bitCount.uvec3_3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006167,
    "KHR-GL43.shader_bitfield_operation.bitCount.uvec4_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006168,
    "KHR-GL43.shader_bitfield_operation.bitCount.uvec4_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006169,
    "KHR-GL43.shader_bitfield_operation.bitCount.uvec4_2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006170,
    "KHR-GL43.shader_bitfield_operation.bitCount.uvec4_3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006171,
    "KHR-GL43.shader_bitfield_operation.bitCount.int_zero");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006172,
    "KHR-GL43.shader_bitfield_operation.bitCount.int_minus_one");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006173,
    "KHR-GL43.shader_bitfield_operation.bitCount.int_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006174,
    "KHR-GL43.shader_bitfield_operation.bitCount.int_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006175,
    "KHR-GL43.shader_bitfield_operation.bitCount.int_2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006176,
    "KHR-GL43.shader_bitfield_operation.bitCount.int_3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006177,
    "KHR-GL43.shader_bitfield_operation.bitCount.ivec2_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006178,
    "KHR-GL43.shader_bitfield_operation.bitCount.ivec2_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006179,
    "KHR-GL43.shader_bitfield_operation.bitCount.ivec2_2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006180,
    "KHR-GL43.shader_bitfield_operation.bitCount.ivec2_3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006181,
    "KHR-GL43.shader_bitfield_operation.bitCount.ivec3_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006182,
    "KHR-GL43.shader_bitfield_operation.bitCount.ivec3_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006183,
    "KHR-GL43.shader_bitfield_operation.bitCount.ivec3_2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006184,
    "KHR-GL43.shader_bitfield_operation.bitCount.ivec3_3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006185,
    "KHR-GL43.shader_bitfield_operation.bitCount.ivec4_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006186,
    "KHR-GL43.shader_bitfield_operation.bitCount.ivec4_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006187,
    "KHR-GL43.shader_bitfield_operation.bitCount.ivec4_2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006188,
    "KHR-GL43.shader_bitfield_operation.bitCount.ivec4_3");
