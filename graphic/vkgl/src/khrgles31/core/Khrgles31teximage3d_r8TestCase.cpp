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
#include "../ActsKhrgles310003TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002995,
        "KHR-GLES31.core.pixelstora",
        "gemodes.teximage3d.r8.0_0_0");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002996,
        "KHR-GLES31.core.pixelstora",
        "gemodes.teximage3d.r8.1_0_0");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002997,
        "KHR-GLES31.core.pixelstorag",
        "emodes.teximage3d.r8.16_0_0");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002998,
        "KHR-GLES31.core.pixelstora",
        "gemodes.teximage3d.r8.1_1_0");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002999,
        "KHR-GLES31.core.pixelstorag",
        "emodes.teximage3d.r8.16_1_0");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_003000,
        "KHR-GLES31.core.pixelstorag",
        "emodes.teximage3d.r8.16_16_0");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_003001,
        "KHR-GLES31.core.pixelstora",
        "gemodes.teximage3d.r8.1_1_1");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_003002,
        "KHR-GLES31.core.pixelstorag",
        "emodes.teximage3d.r8.16_1_1");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_003003,
        "KHR-GLES31.core.pixelstorag",
        "emodes.teximage3d.r8.16_16_1");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_003004,
        "KHR-GLES31.core.pixelstorag",
        "emodes.teximage3d.r8.16_16_4");