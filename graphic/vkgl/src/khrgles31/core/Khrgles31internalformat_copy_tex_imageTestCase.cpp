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

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002349,
        "KHR-GLES31.core.internal",
        "format.copy_tex_image.rgb");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002350,
        "KHR-GLES31.core.internalf",
        "ormat.copy_tex_image.rgba");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002351,
        "KHR-GLES31.core.internalf",
        "ormat.copy_tex_image.alpha");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002352,
        "KHR-GLES31.core.internalfor",
        "mat.copy_tex_image.luminance");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002353,
        "KHR-GLES31.core.internalformat",
        ".copy_tex_image.luminance_alpha");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002354,
        "KHR-GLES31.core.internalf",
        "ormat.copy_tex_image.rgba4");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002355,
        "KHR-GLES31.core.internalfo",
        "rmat.copy_tex_image.rgb5_a1");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002356,
        "KHR-GLES31.core.internalfo",
        "rmat.copy_tex_image.rgb565");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002357,
        "KHR-GLES31.core.internalf",
        "ormat.copy_tex_image.rgba8");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002358,
        "KHR-GLES31.core.internalf",
        "ormat.copy_tex_image.rgb8");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002359,
        "KHR-GLES31.core.internalforma",
        "t.copy_tex_image.srgb8_alpha8");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002360,
        "KHR-GLES31.core.internalf",
        "ormat.copy_tex_image.srgb8");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002361,
        "KHR-GLES31.core.internalformat",
        ".copy_tex_image.r11f_g11f_b10f");
