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
#include "../Khrgles32BaseFunc.h"
#include "../ActsKhrgles320002TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001126,
        "KHR-GLES32.core.internal",
        "format.renderbuffer.rgba8");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001127,
        "KHR-GLES32.core.internal",
        "format.renderbuffer.rgb8");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001128,
        "KHR-GLES32.core.internalf",
        "ormat.renderbuffer.rgb5_a1");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001129,
        "KHR-GLES32.core.internalform",
        "at.renderbuffer.srgb8_alpha8");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001130,
        "KHR-GLES32.core.internalformat.",
        "renderbuffer.depth_component32f");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001131,
        "KHR-GLES32.core.internalformat",
        ".renderbuffer.depth32f_stencil8");
