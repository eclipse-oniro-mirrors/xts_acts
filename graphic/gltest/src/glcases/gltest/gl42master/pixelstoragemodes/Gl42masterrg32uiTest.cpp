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

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003682,
    "KHR-GL42.pixelstoragemodes.teximage2d.rg32ui.0_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003683,
    "KHR-GL42.pixelstoragemodes.teximage2d.rg32ui.1_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003684,
    "KHR-GL42.pixelstoragemodes.teximage2d.rg32ui.16_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003685,
    "KHR-GL42.pixelstoragemodes.teximage2d.rg32ui.1_1");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003686,
    "KHR-GL42.pixelstoragemodes.teximage2d.rg32ui.16_1");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003687,
    "KHR-GL42.pixelstoragemodes.teximage2d.rg32ui.16_16");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004030,
    "KHR-GL42.pixelstoragemodes.teximage3d.rg32ui.0_0_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004031,
    "KHR-GL42.pixelstoragemodes.teximage3d.rg32ui.1_0_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004032,
    "KHR-GL42.pixelstoragemodes.teximage3d.rg32ui.16_0_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004033,
    "KHR-GL42.pixelstoragemodes.teximage3d.rg32ui.1_1_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004034,
    "KHR-GL42.pixelstoragemodes.teximage3d.rg32ui.16_1_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004035,
    "KHR-GL42.pixelstoragemodes.teximage3d.rg32ui.16_16_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004036,
    "KHR-GL42.pixelstoragemodes.teximage3d.rg32ui.1_1_1");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004037,
    "KHR-GL42.pixelstoragemodes.teximage3d.rg32ui.16_1_1");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004038,
    "KHR-GL42.pixelstoragemodes.teximage3d.rg32ui.16_16_1");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004039,
    "KHR-GL42.pixelstoragemodes.teximage3d.rg32ui.16_16_4");
