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
#include "../Gl40masterBaseFunc.h"
#include "../ActsGl40master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl40master0001TestSuite, TestCase_003790,
    "KHR-GL40.pixelstoragemodes.teximage2d.rgb10a2.0_0");

static SHRINK_HWTEST_SF(ActsGl40master0001TestSuite, TestCase_003791,
    "KHR-GL40.pixelstoragemodes.teximage2d.rgb10a2.1_0");

static SHRINK_HWTEST_SF(ActsGl40master0001TestSuite, TestCase_003792,
    "KHR-GL40.pixelstoragemodes.teximage2d.rgb10a2.16_0");

static SHRINK_HWTEST_SF(ActsGl40master0001TestSuite, TestCase_003793,
    "KHR-GL40.pixelstoragemodes.teximage2d.rgb10a2.1_1");

static SHRINK_HWTEST_SF(ActsGl40master0001TestSuite, TestCase_003794,
    "KHR-GL40.pixelstoragemodes.teximage2d.rgb10a2.16_1");

static SHRINK_HWTEST_SF(ActsGl40master0001TestSuite, TestCase_003795,
    "KHR-GL40.pixelstoragemodes.teximage2d.rgb10a2.16_16");

static SHRINK_HWTEST_SF(ActsGl40master0001TestSuite, TestCase_004210,
    "KHR-GL40.pixelstoragemodes.teximage3d.rgb10a2.0_0_0");

static SHRINK_HWTEST_SF(ActsGl40master0001TestSuite, TestCase_004211,
    "KHR-GL40.pixelstoragemodes.teximage3d.rgb10a2.1_0_0");

static SHRINK_HWTEST_SF(ActsGl40master0001TestSuite, TestCase_004212,
    "KHR-GL40.pixelstoragemodes.teximage3d.rgb10a2.16_0_0");

static SHRINK_HWTEST_SF(ActsGl40master0001TestSuite, TestCase_004213,
    "KHR-GL40.pixelstoragemodes.teximage3d.rgb10a2.1_1_0");

static SHRINK_HWTEST_SF(ActsGl40master0001TestSuite, TestCase_004214,
    "KHR-GL40.pixelstoragemodes.teximage3d.rgb10a2.16_1_0");

static SHRINK_HWTEST_SF(ActsGl40master0001TestSuite, TestCase_004215,
    "KHR-GL40.pixelstoragemodes.teximage3d.rgb10a2.16_16_0");

static SHRINK_HWTEST_SF(ActsGl40master0001TestSuite, TestCase_004216,
    "KHR-GL40.pixelstoragemodes.teximage3d.rgb10a2.1_1_1");

static SHRINK_HWTEST_SF(ActsGl40master0001TestSuite, TestCase_004217,
    "KHR-GL40.pixelstoragemodes.teximage3d.rgb10a2.16_1_1");

static SHRINK_HWTEST_SF(ActsGl40master0001TestSuite, TestCase_004218,
    "KHR-GL40.pixelstoragemodes.teximage3d.rgb10a2.16_16_1");

static SHRINK_HWTEST_SF(ActsGl40master0001TestSuite, TestCase_004219,
    "KHR-GL40.pixelstoragemodes.teximage3d.rgb10a2.16_16_4");
