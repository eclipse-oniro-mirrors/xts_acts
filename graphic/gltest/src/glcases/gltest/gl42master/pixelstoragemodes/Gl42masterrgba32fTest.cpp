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

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003802,
    "KHR-GL42.pixelstoragemodes.teximage2d.rgba32f.0_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003803,
    "KHR-GL42.pixelstoragemodes.teximage2d.rgba32f.1_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003804,
    "KHR-GL42.pixelstoragemodes.teximage2d.rgba32f.16_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003805,
    "KHR-GL42.pixelstoragemodes.teximage2d.rgba32f.1_1");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003806,
    "KHR-GL42.pixelstoragemodes.teximage2d.rgba32f.16_1");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003807,
    "KHR-GL42.pixelstoragemodes.teximage2d.rgba32f.16_16");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004230,
    "KHR-GL42.pixelstoragemodes.teximage3d.rgba32f.0_0_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004231,
    "KHR-GL42.pixelstoragemodes.teximage3d.rgba32f.1_0_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004232,
    "KHR-GL42.pixelstoragemodes.teximage3d.rgba32f.16_0_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004233,
    "KHR-GL42.pixelstoragemodes.teximage3d.rgba32f.1_1_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004234,
    "KHR-GL42.pixelstoragemodes.teximage3d.rgba32f.16_1_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004235,
    "KHR-GL42.pixelstoragemodes.teximage3d.rgba32f.16_16_0");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004236,
    "KHR-GL42.pixelstoragemodes.teximage3d.rgba32f.1_1_1");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004237,
    "KHR-GL42.pixelstoragemodes.teximage3d.rgba32f.16_1_1");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004238,
    "KHR-GL42.pixelstoragemodes.teximage3d.rgba32f.16_16_1");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_004239,
    "KHR-GL42.pixelstoragemodes.teximage3d.rgba32f.16_16_4");
