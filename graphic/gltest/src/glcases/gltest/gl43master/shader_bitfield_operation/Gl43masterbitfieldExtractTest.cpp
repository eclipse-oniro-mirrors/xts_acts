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

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006055,
    "KHR-GL43.shader_bitfield_operation.bitfieldExtract.uint_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006056,
    "KHR-GL43.shader_bitfield_operation.bitfieldExtract.uint_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006057,
    "KHR-GL43.shader_bitfield_operation.bitfieldExtract.uint_2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006058,
    "KHR-GL43.shader_bitfield_operation.bitfieldExtract.uint_3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006059,
    "KHR-GL43.shader_bitfield_operation.bitfieldExtract.uvec2_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006060,
    "KHR-GL43.shader_bitfield_operation.bitfieldExtract.uvec2_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006061,
    "KHR-GL43.shader_bitfield_operation.bitfieldExtract.uvec2_2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006062,
    "KHR-GL43.shader_bitfield_operation.bitfieldExtract.uvec2_3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006063,
    "KHR-GL43.shader_bitfield_operation.bitfieldExtract.uvec3_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006064,
    "KHR-GL43.shader_bitfield_operation.bitfieldExtract.uvec3_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006065,
    "KHR-GL43.shader_bitfield_operation.bitfieldExtract.uvec3_2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006066,
    "KHR-GL43.shader_bitfield_operation.bitfieldExtract.uvec3_3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006067,
    "KHR-GL43.shader_bitfield_operation.bitfieldExtract.uvec4_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006068,
    "KHR-GL43.shader_bitfield_operation.bitfieldExtract.uvec4_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006069,
    "KHR-GL43.shader_bitfield_operation.bitfieldExtract.uvec4_2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006070,
    "KHR-GL43.shader_bitfield_operation.bitfieldExtract.uvec4_3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006071,
    "KHR-GL43.shader_bitfield_operation.bitfieldExtract.int_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006072,
    "KHR-GL43.shader_bitfield_operation.bitfieldExtract.int_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006073,
    "KHR-GL43.shader_bitfield_operation.bitfieldExtract.int_2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006074,
    "KHR-GL43.shader_bitfield_operation.bitfieldExtract.int_3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006075,
    "KHR-GL43.shader_bitfield_operation.bitfieldExtract.ivec2_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006076,
    "KHR-GL43.shader_bitfield_operation.bitfieldExtract.ivec2_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006077,
    "KHR-GL43.shader_bitfield_operation.bitfieldExtract.ivec2_2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006078,
    "KHR-GL43.shader_bitfield_operation.bitfieldExtract.ivec2_3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006079,
    "KHR-GL43.shader_bitfield_operation.bitfieldExtract.ivec3_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006080,
    "KHR-GL43.shader_bitfield_operation.bitfieldExtract.ivec3_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006081,
    "KHR-GL43.shader_bitfield_operation.bitfieldExtract.ivec3_2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006082,
    "KHR-GL43.shader_bitfield_operation.bitfieldExtract.ivec3_3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006083,
    "KHR-GL43.shader_bitfield_operation.bitfieldExtract.ivec4_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006084,
    "KHR-GL43.shader_bitfield_operation.bitfieldExtract.ivec4_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006085,
    "KHR-GL43.shader_bitfield_operation.bitfieldExtract.ivec4_2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006086,
    "KHR-GL43.shader_bitfield_operation.bitfieldExtract.ivec4_3");
