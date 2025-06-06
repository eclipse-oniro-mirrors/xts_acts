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

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002743,
        "KHR-GLES31.core.pixelstora",
        "gemodes.teximage2d.r8ui.0_0");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002744,
        "KHR-GLES31.core.pixelstora",
        "gemodes.teximage2d.r8ui.1_0");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002745,
        "KHR-GLES31.core.pixelstorag",
        "emodes.teximage2d.r8ui.16_0");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002746,
        "KHR-GLES31.core.pixelstora",
        "gemodes.teximage2d.r8ui.1_1");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002747,
        "KHR-GLES31.core.pixelstorag",
        "emodes.teximage2d.r8ui.16_1");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002748,
        "KHR-GLES31.core.pixelstorag",
        "emodes.teximage2d.r8ui.16_16");
