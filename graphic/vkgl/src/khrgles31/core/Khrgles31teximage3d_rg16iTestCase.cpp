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

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003165,
        "KHR-GLES31.core.pixelstorage",
        "modes.teximage3d.rg16i.0_0_0");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003166,
        "KHR-GLES31.core.pixelstorage",
        "modes.teximage3d.rg16i.1_0_0");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003167,
        "KHR-GLES31.core.pixelstorage",
        "modes.teximage3d.rg16i.16_0_0");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003168,
        "KHR-GLES31.core.pixelstorage",
        "modes.teximage3d.rg16i.1_1_0");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003169,
        "KHR-GLES31.core.pixelstorage",
        "modes.teximage3d.rg16i.16_1_0");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003170,
        "KHR-GLES31.core.pixelstoragem",
        "odes.teximage3d.rg16i.16_16_0");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003171,
        "KHR-GLES31.core.pixelstorage",
        "modes.teximage3d.rg16i.1_1_1");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003172,
        "KHR-GLES31.core.pixelstorage",
        "modes.teximage3d.rg16i.16_1_1");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003173,
        "KHR-GLES31.core.pixelstoragem",
        "odes.teximage3d.rg16i.16_16_1");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003174,
        "KHR-GLES31.core.pixelstoragem",
        "odes.teximage3d.rg16i.16_16_4");
