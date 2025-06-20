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

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003700,
    "KHR-GL43.pixelstoragemodes.teximage2d.rgb565.0_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003701,
    "KHR-GL43.pixelstoragemodes.teximage2d.rgb565.1_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003702,
    "KHR-GL43.pixelstoragemodes.teximage2d.rgb565.16_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003703,
    "KHR-GL43.pixelstoragemodes.teximage2d.rgb565.1_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003704,
    "KHR-GL43.pixelstoragemodes.teximage2d.rgb565.16_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003705,
    "KHR-GL43.pixelstoragemodes.teximage2d.rgb565.16_16");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004060,
    "KHR-GL43.pixelstoragemodes.teximage3d.rgb565.0_0_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004061,
    "KHR-GL43.pixelstoragemodes.teximage3d.rgb565.1_0_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004062,
    "KHR-GL43.pixelstoragemodes.teximage3d.rgb565.16_0_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004063,
    "KHR-GL43.pixelstoragemodes.teximage3d.rgb565.1_1_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004064,
    "KHR-GL43.pixelstoragemodes.teximage3d.rgb565.16_1_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004065,
    "KHR-GL43.pixelstoragemodes.teximage3d.rgb565.16_16_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004066,
    "KHR-GL43.pixelstoragemodes.teximage3d.rgb565.1_1_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004067,
    "KHR-GL43.pixelstoragemodes.teximage3d.rgb565.16_1_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004068,
    "KHR-GL43.pixelstoragemodes.teximage3d.rgb565.16_16_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004069,
    "KHR-GL43.pixelstoragemodes.teximage3d.rgb565.16_16_4");
