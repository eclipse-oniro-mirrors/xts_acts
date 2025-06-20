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

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006087,
    "KHR-GL43.shader_bitfield_operation.bitfieldInsert.uint_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006088,
    "KHR-GL43.shader_bitfield_operation.bitfieldInsert.uint_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006089,
    "KHR-GL43.shader_bitfield_operation.bitfieldInsert.uint_2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006090,
    "KHR-GL43.shader_bitfield_operation.bitfieldInsert.uint_3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006091,
    "KHR-GL43.shader_bitfield_operation.bitfieldInsert.uvec2_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006092,
    "KHR-GL43.shader_bitfield_operation.bitfieldInsert.uvec2_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006093,
    "KHR-GL43.shader_bitfield_operation.bitfieldInsert.uvec2_2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006094,
    "KHR-GL43.shader_bitfield_operation.bitfieldInsert.uvec2_3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006095,
    "KHR-GL43.shader_bitfield_operation.bitfieldInsert.uvec3_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006096,
    "KHR-GL43.shader_bitfield_operation.bitfieldInsert.uvec3_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006097,
    "KHR-GL43.shader_bitfield_operation.bitfieldInsert.uvec3_2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006098,
    "KHR-GL43.shader_bitfield_operation.bitfieldInsert.uvec3_3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006099,
    "KHR-GL43.shader_bitfield_operation.bitfieldInsert.uvec4_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006100,
    "KHR-GL43.shader_bitfield_operation.bitfieldInsert.uvec4_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006101,
    "KHR-GL43.shader_bitfield_operation.bitfieldInsert.uvec4_2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006102,
    "KHR-GL43.shader_bitfield_operation.bitfieldInsert.uvec4_3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006103,
    "KHR-GL43.shader_bitfield_operation.bitfieldInsert.int_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006104,
    "KHR-GL43.shader_bitfield_operation.bitfieldInsert.int_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006105,
    "KHR-GL43.shader_bitfield_operation.bitfieldInsert.int_2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006106,
    "KHR-GL43.shader_bitfield_operation.bitfieldInsert.int_3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006107,
    "KHR-GL43.shader_bitfield_operation.bitfieldInsert.ivec2_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006108,
    "KHR-GL43.shader_bitfield_operation.bitfieldInsert.ivec2_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006109,
    "KHR-GL43.shader_bitfield_operation.bitfieldInsert.ivec2_2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006110,
    "KHR-GL43.shader_bitfield_operation.bitfieldInsert.ivec2_3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006111,
    "KHR-GL43.shader_bitfield_operation.bitfieldInsert.ivec3_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006112,
    "KHR-GL43.shader_bitfield_operation.bitfieldInsert.ivec3_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006113,
    "KHR-GL43.shader_bitfield_operation.bitfieldInsert.ivec3_2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006114,
    "KHR-GL43.shader_bitfield_operation.bitfieldInsert.ivec3_3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006115,
    "KHR-GL43.shader_bitfield_operation.bitfieldInsert.ivec4_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006116,
    "KHR-GL43.shader_bitfield_operation.bitfieldInsert.ivec4_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006117,
    "KHR-GL43.shader_bitfield_operation.bitfieldInsert.ivec4_2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006118,
    "KHR-GL43.shader_bitfield_operation.bitfieldInsert.ivec4_3");
