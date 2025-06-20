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

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003820,
    "KHR-GL43.pixelstoragemodes.teximage2d.rgb10a2ui.0_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003821,
    "KHR-GL43.pixelstoragemodes.teximage2d.rgb10a2ui.1_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003822,
    "KHR-GL43.pixelstoragemodes.teximage2d.rgb10a2ui.16_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003823,
    "KHR-GL43.pixelstoragemodes.teximage2d.rgb10a2ui.1_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003824,
    "KHR-GL43.pixelstoragemodes.teximage2d.rgb10a2ui.16_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003825,
    "KHR-GL43.pixelstoragemodes.teximage2d.rgb10a2ui.16_16");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004260,
    "KHR-GL43.pixelstoragemodes.teximage3d.rgb10a2ui.0_0_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004261,
    "KHR-GL43.pixelstoragemodes.teximage3d.rgb10a2ui.1_0_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004262,
    "KHR-GL43.pixelstoragemodes.teximage3d.rgb10a2ui.16_0_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004263,
    "KHR-GL43.pixelstoragemodes.teximage3d.rgb10a2ui.1_1_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004264,
    "KHR-GL43.pixelstoragemodes.teximage3d.rgb10a2ui.16_1_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004265,
    "KHR-GL43.pixelstoragemodes.teximage3d.rgb10a2ui.16_16_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004266,
    "KHR-GL43.pixelstoragemodes.teximage3d.rgb10a2ui.1_1_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004267,
    "KHR-GL43.pixelstoragemodes.teximage3d.rgb10a2ui.16_1_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004268,
    "KHR-GL43.pixelstoragemodes.teximage3d.rgb10a2ui.16_16_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004269,
    "KHR-GL43.pixelstoragemodes.teximage3d.rgb10a2ui.16_16_4");
