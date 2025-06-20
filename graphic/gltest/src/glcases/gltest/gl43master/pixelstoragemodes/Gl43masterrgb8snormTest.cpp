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

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003706,
    "KHR-GL43.pixelstoragemodes.teximage2d.rgb8snorm.0_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003707,
    "KHR-GL43.pixelstoragemodes.teximage2d.rgb8snorm.1_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003708,
    "KHR-GL43.pixelstoragemodes.teximage2d.rgb8snorm.16_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003709,
    "KHR-GL43.pixelstoragemodes.teximage2d.rgb8snorm.1_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003710,
    "KHR-GL43.pixelstoragemodes.teximage2d.rgb8snorm.16_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003711,
    "KHR-GL43.pixelstoragemodes.teximage2d.rgb8snorm.16_16");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004070,
    "KHR-GL43.pixelstoragemodes.teximage3d.rgb8snorm.0_0_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004071,
    "KHR-GL43.pixelstoragemodes.teximage3d.rgb8snorm.1_0_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004072,
    "KHR-GL43.pixelstoragemodes.teximage3d.rgb8snorm.16_0_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004073,
    "KHR-GL43.pixelstoragemodes.teximage3d.rgb8snorm.1_1_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004074,
    "KHR-GL43.pixelstoragemodes.teximage3d.rgb8snorm.16_1_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004075,
    "KHR-GL43.pixelstoragemodes.teximage3d.rgb8snorm.16_16_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004076,
    "KHR-GL43.pixelstoragemodes.teximage3d.rgb8snorm.1_1_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004077,
    "KHR-GL43.pixelstoragemodes.teximage3d.rgb8snorm.16_1_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004078,
    "KHR-GL43.pixelstoragemodes.teximage3d.rgb8snorm.16_16_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004079,
    "KHR-GL43.pixelstoragemodes.teximage3d.rgb8snorm.16_16_4");
