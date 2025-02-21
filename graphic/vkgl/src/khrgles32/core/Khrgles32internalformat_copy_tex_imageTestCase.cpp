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

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001113,
        "KHR-GLES32.core.internal",
        "format.copy_tex_image.rgb");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001114,
        "KHR-GLES32.core.internalf",
        "ormat.copy_tex_image.rgba");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001115,
        "KHR-GLES32.core.internalf",
        "ormat.copy_tex_image.alpha");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001116,
        "KHR-GLES32.core.internalfor",
        "mat.copy_tex_image.luminance");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001117,
        "KHR-GLES32.core.internalformat",
        ".copy_tex_image.luminance_alpha");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001118,
        "KHR-GLES32.core.internalf",
        "ormat.copy_tex_image.rgba4");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001119,
        "KHR-GLES32.core.internalfo",
        "rmat.copy_tex_image.rgb5_a1");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001120,
        "KHR-GLES32.core.internalfo",
        "rmat.copy_tex_image.rgb565");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001121,
        "KHR-GLES32.core.internalf",
        "ormat.copy_tex_image.rgba8");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001122,
        "KHR-GLES32.core.internalf",
        "ormat.copy_tex_image.rgb8");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001123,
        "KHR-GLES32.core.internalforma",
        "t.copy_tex_image.srgb8_alpha8");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001124,
        "KHR-GLES32.core.internalf",
        "ormat.copy_tex_image.srgb8");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001125,
        "KHR-GLES32.core.internalformat",
        ".copy_tex_image.r11f_g11f_b10f");
