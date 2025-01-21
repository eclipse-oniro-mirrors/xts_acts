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
#include "../Khrgles2BaseFunc.h"
#include "../ActsKhrgles20001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000449,
        "KHR-GLES2.core.internalf",
        "ormat.copy_tex_image.rgb");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000450,
        "KHR-GLES2.core.internalf",
        "ormat.copy_tex_image.rgba");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000451,
        "KHR-GLES2.core.internalfo",
        "rmat.copy_tex_image.alpha");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000452,
        "KHR-GLES2.core.internalform",
        "at.copy_tex_image.luminance");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000453,
        "KHR-GLES2.core.internalformat.",
        "copy_tex_image.luminance_alpha");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000454,
        "KHR-GLES2.core.internalfor",
        "mat.copy_tex_image.rgb5_a1");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000455,
        "KHR-GLES2.core.internalfo",
        "rmat.copy_tex_image.rgb565");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000456,
        "KHR-GLES2.core.internalfo",
        "rmat.copy_tex_image.rgba4");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000457,
        "KHR-GLES2.core.internalformat.cop",
        "y_tex_image.luminance4_alpha4_oes");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000458,
        "KHR-GLES2.core.internalformat.cop",
        "y_tex_image.luminance8_alpha8_oes");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000459,
        "KHR-GLES2.core.internalformat",
        ".copy_tex_image.luminance8_oes");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000460,
        "KHR-GLES2.core.internalform",
        "at.copy_tex_image.alpha8_oes");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000461,
        "KHR-GLES2.core.internalfor",
        "mat.copy_tex_image.rgb10_a2");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000462,
        "KHR-GLES2.core.internalfo",
        "rmat.copy_tex_image.rgb10");
