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

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004326,
    "KHR-GL42.pixelstoragemodes.compressedteximage2d.rgba_astc_8x5.0_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004327,
    "KHR-GL42.pixelstoragemodes.compressedteximage2d.rgba_astc_8x5.8_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004328,
    "KHR-GL42.pixelstoragemodes.compressedteximage2d.rgba_astc_8x5.16_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004329,
    "KHR-GL42.pixelstoragemodes.compressedteximage2d.rgba_astc_8x5.32_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004330,
    "KHR-GL42.pixelstoragemodes.compressedteximage2d.rgba_astc_8x5.0_5");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004331,
    "KHR-GL42.pixelstoragemodes.compressedteximage2d.rgba_astc_8x5.8_5");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004332,
    "KHR-GL42.pixelstoragemodes.compressedteximage2d.rgba_astc_8x5.16_5");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004333,
    "KHR-GL42.pixelstoragemodes.compressedteximage2d.rgba_astc_8x5.32_5");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004334,
    "KHR-GL42.pixelstoragemodes.compressedteximage2d.rgba_astc_8x5.0_15");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004335,
    "KHR-GL42.pixelstoragemodes.compressedteximage2d.rgba_astc_8x5.8_15");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004336,
    "KHR-GL42.pixelstoragemodes.compressedteximage2d.rgba_astc_8x5.16_15");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004337,
    "KHR-GL42.pixelstoragemodes.compressedteximage2d.rgba_astc_8x5.32_15");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004338,
    "KHR-GL42.pixelstoragemodes.compressedteximage2d.rgba_astc_8x5.0_30");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004339,
    "KHR-GL42.pixelstoragemodes.compressedteximage2d.rgba_astc_8x5.8_30");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004340,
    "KHR-GL42.pixelstoragemodes.compressedteximage2d.rgba_astc_8x5.16_30");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004341,
    "KHR-GL42.pixelstoragemodes.compressedteximage2d.rgba_astc_8x5.32_30");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004406,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.0_0_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004407,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.8_0_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004408,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.16_0_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004409,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.32_0_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004410,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.0_5_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004411,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.8_5_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004412,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.16_5_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004413,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.32_5_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004414,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.0_15_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004415,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.8_15_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004416,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.16_15_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004417,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.32_15_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004418,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.0_30_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004419,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.8_30_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004420,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.16_30_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004421,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.32_30_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004422,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.0_0_1");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004423,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.8_0_1");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004424,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.16_0_1");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004425,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.32_0_1");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004426,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.0_5_1");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004427,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.8_5_1");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004428,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.16_5_1");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004429,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.32_5_1");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004430,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.0_15_1");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004431,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.8_15_1");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004432,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.16_15_1");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004433,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.32_15_1");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004434,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.0_30_1");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004435,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.8_30_1");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004436,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.16_30_1");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004437,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.32_30_1");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004438,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.0_0_4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004439,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.8_0_4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004440,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.16_0_4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004441,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.32_0_4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004442,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.0_5_4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004443,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.8_5_4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004444,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.16_5_4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004445,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.32_5_4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004446,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.0_15_4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004447,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.8_15_4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004448,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.16_15_4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004449,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.32_15_4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004450,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.0_30_4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004451,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.8_30_4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004452,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.16_30_4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004453,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.32_30_4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004454,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.0_0_8");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004455,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.8_0_8");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004456,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.16_0_8");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004457,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.32_0_8");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004458,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.0_5_8");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004459,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.8_5_8");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004460,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.16_5_8");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004461,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.32_5_8");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004462,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.0_15_8");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004463,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.8_15_8");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004464,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.16_15_8");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004465,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.32_15_8");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004466,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.0_30_8");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004467,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.8_30_8");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004468,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.16_30_8");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004469,
    "KHR-GL42.pixelstoragemodes.compressedteximage3d.rgba_astc_8x5.32_30_8");
