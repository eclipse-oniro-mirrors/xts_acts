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

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002869,
        "KHR-GLES31.core.pixelstorag",
        "emodes.teximage2d.rgb32f.0_0");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002870,
        "KHR-GLES31.core.pixelstorag",
        "emodes.teximage2d.rgb32f.1_0");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002871,
        "KHR-GLES31.core.pixelstorage",
        "modes.teximage2d.rgb32f.16_0");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002872,
        "KHR-GLES31.core.pixelstorag",
        "emodes.teximage2d.rgb32f.1_1");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002873,
        "KHR-GLES31.core.pixelstorage",
        "modes.teximage2d.rgb32f.16_1");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002874,
        "KHR-GLES31.core.pixelstorage",
        "modes.teximage2d.rgb32f.16_16");