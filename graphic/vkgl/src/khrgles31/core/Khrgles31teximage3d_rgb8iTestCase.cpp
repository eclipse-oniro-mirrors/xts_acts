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

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003265,
        "KHR-GLES31.core.pixelstorage",
        "modes.teximage3d.rgb8i.0_0_0");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003266,
        "KHR-GLES31.core.pixelstorage",
        "modes.teximage3d.rgb8i.1_0_0");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003267,
        "KHR-GLES31.core.pixelstorage",
        "modes.teximage3d.rgb8i.16_0_0");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003268,
        "KHR-GLES31.core.pixelstorage",
        "modes.teximage3d.rgb8i.1_1_0");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003269,
        "KHR-GLES31.core.pixelstorage",
        "modes.teximage3d.rgb8i.16_1_0");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003270,
        "KHR-GLES31.core.pixelstoragem",
        "odes.teximage3d.rgb8i.16_16_0");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003271,
        "KHR-GLES31.core.pixelstorage",
        "modes.teximage3d.rgb8i.1_1_1");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003272,
        "KHR-GLES31.core.pixelstorage",
        "modes.teximage3d.rgb8i.16_1_1");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003273,
        "KHR-GLES31.core.pixelstoragem",
        "odes.teximage3d.rgb8i.16_16_1");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003274,
        "KHR-GLES31.core.pixelstoragem",
        "odes.teximage3d.rgb8i.16_16_4");
