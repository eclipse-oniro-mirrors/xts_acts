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

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000021,
        "KHR-GLES2.texture_3d.filt",
        "ering.sizes.4x8x8_nearest");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000022,
        "KHR-GLES2.texture_3d.fil",
        "tering.sizes.4x8x8_linear");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000023,
        "KHR-GLES2.texture_3d.filtering.s",
        "izes.4x8x8_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000024,
        "KHR-GLES2.texture_3d.filtering.s",
        "izes.4x8x8_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000025,
        "KHR-GLES2.texture_3d.filtering.s",
        "izes.4x8x8_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000026,
        "KHR-GLES2.texture_3d.filtering.",
        "sizes.4x8x8_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000027,
        "KHR-GLES2.texture_3d.filte",
        "ring.sizes.32x64x16_nearest");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000028,
        "KHR-GLES2.texture_3d.filte",
        "ring.sizes.32x64x16_linear");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000029,
        "KHR-GLES2.texture_3d.filtering.siz",
        "es.32x64x16_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000030,
        "KHR-GLES2.texture_3d.filtering.si",
        "zes.32x64x16_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000031,
        "KHR-GLES2.texture_3d.filtering.si",
        "zes.32x64x16_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000032,
        "KHR-GLES2.texture_3d.filtering.si",
        "zes.32x64x16_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000033,
        "KHR-GLES2.texture_3d.filter",
        "ing.sizes.128x32x64_nearest");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000034,
        "KHR-GLES2.texture_3d.filte",
        "ring.sizes.128x32x64_linear");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000035,
        "KHR-GLES2.texture_3d.filtering.siz",
        "es.128x32x64_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000036,
        "KHR-GLES2.texture_3d.filtering.siz",
        "es.128x32x64_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000037,
        "KHR-GLES2.texture_3d.filtering.siz",
        "es.128x32x64_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000038,
        "KHR-GLES2.texture_3d.filtering.si",
        "zes.128x32x64_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000039,
        "KHR-GLES2.texture_3d.filt",
        "ering.sizes.3x7x5_nearest");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000040,
        "KHR-GLES2.texture_3d.fil",
        "tering.sizes.3x7x5_linear");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000041,
        "KHR-GLES2.texture_3d.filtering.s",
        "izes.3x7x5_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000042,
        "KHR-GLES2.texture_3d.filtering.s",
        "izes.3x7x5_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000043,
        "KHR-GLES2.texture_3d.filtering.s",
        "izes.3x7x5_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000044,
        "KHR-GLES2.texture_3d.filtering.",
        "sizes.3x7x5_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000045,
        "KHR-GLES2.texture_3d.filte",
        "ring.sizes.63x63x63_nearest");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000046,
        "KHR-GLES2.texture_3d.filte",
        "ring.sizes.63x63x63_linear");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000047,
        "KHR-GLES2.texture_3d.filtering.siz",
        "es.63x63x63_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000048,
        "KHR-GLES2.texture_3d.filtering.si",
        "zes.63x63x63_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000049,
        "KHR-GLES2.texture_3d.filtering.si",
        "zes.63x63x63_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000050,
        "KHR-GLES2.texture_3d.filtering.si",
        "zes.63x63x63_linear_mipmap_linear");
