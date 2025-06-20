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

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003724,
    "KHR-GL43.pixelstoragemodes.teximage2d.rgb32f.0_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003725,
    "KHR-GL43.pixelstoragemodes.teximage2d.rgb32f.1_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003726,
    "KHR-GL43.pixelstoragemodes.teximage2d.rgb32f.16_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003727,
    "KHR-GL43.pixelstoragemodes.teximage2d.rgb32f.1_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003728,
    "KHR-GL43.pixelstoragemodes.teximage2d.rgb32f.16_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003729,
    "KHR-GL43.pixelstoragemodes.teximage2d.rgb32f.16_16");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004100,
    "KHR-GL43.pixelstoragemodes.teximage3d.rgb32f.0_0_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004101,
    "KHR-GL43.pixelstoragemodes.teximage3d.rgb32f.1_0_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004102,
    "KHR-GL43.pixelstoragemodes.teximage3d.rgb32f.16_0_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004103,
    "KHR-GL43.pixelstoragemodes.teximage3d.rgb32f.1_1_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004104,
    "KHR-GL43.pixelstoragemodes.teximage3d.rgb32f.16_1_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004105,
    "KHR-GL43.pixelstoragemodes.teximage3d.rgb32f.16_16_0");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004106,
    "KHR-GL43.pixelstoragemodes.teximage3d.rgb32f.1_1_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004107,
    "KHR-GL43.pixelstoragemodes.teximage3d.rgb32f.16_1_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004108,
    "KHR-GL43.pixelstoragemodes.teximage3d.rgb32f.16_16_1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004109,
    "KHR-GL43.pixelstoragemodes.teximage3d.rgb32f.16_16_4");
