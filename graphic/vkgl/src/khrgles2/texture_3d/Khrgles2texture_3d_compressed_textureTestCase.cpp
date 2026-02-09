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

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000382,
        "KHR-GLES2.texture_3d.compres",
        "sed_texture.rgba_astc_4x4_khr");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000383,
        "KHR-GLES2.texture_3d.compres",
        "sed_texture.rgba_astc_5x4_khr");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000384,
        "KHR-GLES2.texture_3d.compres",
        "sed_texture.rgba_astc_5x5_khr");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000385,
        "KHR-GLES2.texture_3d.compres",
        "sed_texture.rgba_astc_6x5_khr");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000386,
        "KHR-GLES2.texture_3d.compres",
        "sed_texture.rgba_astc_6x6_khr");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000387,
        "KHR-GLES2.texture_3d.compres",
        "sed_texture.rgba_astc_8x5_khr");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000388,
        "KHR-GLES2.texture_3d.compres",
        "sed_texture.rgba_astc_8x6_khr");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000389,
        "KHR-GLES2.texture_3d.compres",
        "sed_texture.rgba_astc_8x8_khr");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000390,
        "KHR-GLES2.texture_3d.compress",
        "ed_texture.rgba_astc_10x5_khr");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000391,
        "KHR-GLES2.texture_3d.compress",
        "ed_texture.rgba_astc_10x6_khr");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000392,
        "KHR-GLES2.texture_3d.compress",
        "ed_texture.rgba_astc_10x8_khr");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000393,
        "KHR-GLES2.texture_3d.compress",
        "ed_texture.rgba_astc_10x10_khr");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000394,
        "KHR-GLES2.texture_3d.compress",
        "ed_texture.rgba_astc_12x10_khr");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000395,
        "KHR-GLES2.texture_3d.compress",
        "ed_texture.rgba_astc_12x12_khr");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000396,
        "KHR-GLES2.texture_3d.compressed_",
        "texture.srgb8_alpha8_astc_4x4_khr");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000397,
        "KHR-GLES2.texture_3d.compressed_",
        "texture.srgb8_alpha8_astc_5x4_khr");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000398,
        "KHR-GLES2.texture_3d.compressed_",
        "texture.srgb8_alpha8_astc_5x5_khr");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000399,
        "KHR-GLES2.texture_3d.compressed_",
        "texture.srgb8_alpha8_astc_6x5_khr");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000400,
        "KHR-GLES2.texture_3d.compressed_",
        "texture.srgb8_alpha8_astc_6x6_khr");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000401,
        "KHR-GLES2.texture_3d.compressed_",
        "texture.srgb8_alpha8_astc_8x5_khr");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000402,
        "KHR-GLES2.texture_3d.compressed_",
        "texture.srgb8_alpha8_astc_8x6_khr");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000403,
        "KHR-GLES2.texture_3d.compressed_",
        "texture.srgb8_alpha8_astc_8x8_khr");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000404,
        "KHR-GLES2.texture_3d.compressed_",
        "texture.sgb8_alpha8_astc_10x5_khr");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000405,
        "KHR-GLES2.texture_3d.compressed_t",
        "exture.srgb8_alpha8_astc_10x6_khr");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000406,
        "KHR-GLES2.texture_3d.compressed_t",
        "exture.srgb8_alpha8_astc_10x8_khr");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000407,
        "KHR-GLES2.texture_3d.compressed_t",
        "exture.srgb8_alpha8_astc_10x10_khr");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000408,
        "KHR-GLES2.texture_3d.compressed_t",
        "exture.srgb8_alpha8_astc_12x10_khr");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000409,
        "KHR-GLES2.texture_3d.compressed_t",
        "exture.srgb8_alpha8_astc_12x12_khr");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000410,
        "KHR-GLES2.texture_3d.compressed_te",
        "xture.negative_compressed_tex_image");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000411,
        "KHR-GLES2.texture_3d.compressed_text",
        "ure.negative_compressed_tex_sub_image");
