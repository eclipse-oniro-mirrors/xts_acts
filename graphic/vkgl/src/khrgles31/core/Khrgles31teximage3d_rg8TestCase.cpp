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

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003095,
        "KHR-GLES31.core.pixelstorag",
        "emodes.teximage3d.rg8.0_0_0");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003096,
        "KHR-GLES31.core.pixelstorag",
        "emodes.teximage3d.rg8.1_0_0");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003097,
        "KHR-GLES31.core.pixelstorag",
        "emodes.teximage3d.rg8.16_0_0");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003098,
        "KHR-GLES31.core.pixelstorag",
        "emodes.teximage3d.rg8.1_1_0");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003099,
        "KHR-GLES31.core.pixelstorag",
        "emodes.teximage3d.rg8.16_1_0");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003100,
        "KHR-GLES31.core.pixelstorage",
        "modes.teximage3d.rg8.16_16_0");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003101,
        "KHR-GLES31.core.pixelstorag",
        "emodes.teximage3d.rg8.1_1_1");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003102,
        "KHR-GLES31.core.pixelstorag",
        "emodes.teximage3d.rg8.16_1_1");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003103,
        "KHR-GLES31.core.pixelstorage",
        "modes.teximage3d.rg8.16_16_1");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003104,
        "KHR-GLES31.core.pixelstorage",
        "modes.teximage3d.rg8.16_16_4");