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

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004310,
    "KHR-GL42.pixelstoragemodes.compressedteximage2d.rgb_s3tc_dxt1.0_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004311,
    "KHR-GL42.pixelstoragemodes.compressedteximage2d.rgb_s3tc_dxt1.4_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004312,
    "KHR-GL42.pixelstoragemodes.compressedteximage2d.rgb_s3tc_dxt1.16_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004313,
    "KHR-GL42.pixelstoragemodes.compressedteximage2d.rgb_s3tc_dxt1.32_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004314,
    "KHR-GL42.pixelstoragemodes.compressedteximage2d.rgb_s3tc_dxt1.0_4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004315,
    "KHR-GL42.pixelstoragemodes.compressedteximage2d.rgb_s3tc_dxt1.4_4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004316,
    "KHR-GL42.pixelstoragemodes.compressedteximage2d.rgb_s3tc_dxt1.16_4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004317,
    "KHR-GL42.pixelstoragemodes.compressedteximage2d.rgb_s3tc_dxt1.32_4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004318,
    "KHR-GL42.pixelstoragemodes.compressedteximage2d.rgb_s3tc_dxt1.0_16");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004319,
    "KHR-GL42.pixelstoragemodes.compressedteximage2d.rgb_s3tc_dxt1.4_16");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004320,
    "KHR-GL42.pixelstoragemodes.compressedteximage2d.rgb_s3tc_dxt1.16_16");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004321,
    "KHR-GL42.pixelstoragemodes.compressedteximage2d.rgb_s3tc_dxt1.32_16");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004322,
    "KHR-GL42.pixelstoragemodes.compressedteximage2d.rgb_s3tc_dxt1.0_32");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004323,
    "KHR-GL42.pixelstoragemodes.compressedteximage2d.rgb_s3tc_dxt1.4_32");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004324,
    "KHR-GL42.pixelstoragemodes.compressedteximage2d.rgb_s3tc_dxt1.16_32");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004325,
    "KHR-GL42.pixelstoragemodes.compressedteximage2d.rgb_s3tc_dxt1.32_32");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004342,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.0_0_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004343,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.4_0_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004344,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.16_0_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004345,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.32_0_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004346,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.0_4_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004347,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.4_4_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004348,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.16_4_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004349,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.32_4_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004350,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.0_16_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004351,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.4_16_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004352,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.16_16_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004353,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.32_16_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004354,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.0_32_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004355,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.4_32_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004356,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.16_32_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004357,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.32_32_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004358,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.0_0_1");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004359,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.4_0_1");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004360,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.16_0_1");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004361,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.32_0_1");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004362,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.0_4_1");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004363,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.4_4_1");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004364,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.16_4_1");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004365,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.32_4_1");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004366,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.0_16_1");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004367,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.4_16_1");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004368,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.16_16_1");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004369,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.32_16_1");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004370,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.0_32_1");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004371,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.4_32_1");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004372,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.16_32_1");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004373,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.32_32_1");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004374,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.0_0_4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004375,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.4_0_4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004376,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.16_0_4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004377,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.32_0_4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004378,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.0_4_4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004379,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.4_4_4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004380,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.16_4_4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004381,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.32_4_4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004382,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.0_16_4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004383,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.4_16_4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004384,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.16_16_4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004385,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.32_16_4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004386,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.0_32_4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004387,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.4_32_4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004388,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.16_32_4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004389,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.32_32_4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004390,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.0_0_8");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004391,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.4_0_8");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004392,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.16_0_8");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004393,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.32_0_8");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004394,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.0_4_8");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004395,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.4_4_8");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004396,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.16_4_8");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004397,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.32_4_8");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004398,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.0_16_8");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004399,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.4_16_8");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004400,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.16_16_8");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004401,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.32_16_8");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004402,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.0_32_8");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004403,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.4_32_8");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004404,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.16_32_8");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004405,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgb_s3tc_dxt1.32_32_8");
