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
#include "../Khrgles31BaseFunc.h"
#include "../ActsKhrgles310004TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003275,
        "KHR-GLES31.core.pixelstoragem",
        "odes.teximage3d.rgb16ui.0_0_0");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003276,
        "KHR-GLES31.core.pixelstoragem",
        "odes.teximage3d.rgb16ui.1_0_0");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003277,
        "KHR-GLES31.core.pixelstoragem",
        "odes.teximage3d.rgb16ui.16_0_0");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003278,
        "KHR-GLES31.core.pixelstoragem",
        "odes.teximage3d.rgb16ui.1_1_0");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003279,
        "KHR-GLES31.core.pixelstoragem",
        "odes.teximage3d.rgb16ui.16_1_0");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003280,
        "KHR-GLES31.core.pixelstoragemo",
        "des.teximage3d.rgb16ui.16_16_0");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003281,
        "KHR-GLES31.core.pixelstoragem",
        "odes.teximage3d.rgb16ui.1_1_1");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003282,
        "KHR-GLES31.core.pixelstoragem",
        "odes.teximage3d.rgb16ui.16_1_1");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003283,
        "KHR-GLES31.core.pixelstoragemo",
        "des.teximage3d.rgb16ui.16_16_1");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003284,
        "KHR-GLES31.core.pixelstoragemo",
        "des.teximage3d.rgb16ui.16_16_4");
