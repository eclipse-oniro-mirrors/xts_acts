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
#include "../Deqpgles31BaseFunc.h"
#include "../ActsDeqpgles310034TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033643,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rgb",
        "a.srgb8_alpha8_astc_8x8_khr_rgba_astc_8x8_khr.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033644,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rgb",
        "a.srgb8_alpha8_astc_8x8_khr_rgba_astc_8x8_khr.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033645,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rg",
        "ba.srgb8_alpha8_astc_8x8_khr_rgba_astc_8x8_khr.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033646,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rgba.s",
        "rgb8_alpha8_astc_8x8_khr_rgba_astc_8x8_khr.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033647,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rgb",
        "a.srgb8_alpha8_astc_8x8_khr_rgba_astc_8x8_khr.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033648,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rgb",
        "a.srgb8_alpha8_astc_8x8_khr_rgba_astc_8x8_khr.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033649,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rg",
        "ba.srgb8_alpha8_astc_8x8_khr_rgba_astc_8x8_khr.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033650,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rgba.s",
        "rgb8_alpha8_astc_8x8_khr_rgba_astc_8x8_khr.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033651,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rg",
        "ba.srgb8_alpha8_astc_8x8_khr_rgba_astc_8x8_khr.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033652,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rg",
        "ba.srgb8_alpha8_astc_8x8_khr_rgba_astc_8x8_khr.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033653,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_r",
        "gba.srgb8_alpha8_astc_8x8_khr_rgba_astc_8x8_khr.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033654,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rgba.",
        "srgb8_alpha8_astc_8x8_khr_rgba_astc_8x8_khr.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033655,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rgba.s",
        "rgb8_alpha8_astc_8x8_khr_rgba_astc_8x8_khr.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033656,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rgba.s",
        "rgb8_alpha8_astc_8x8_khr_rgba_astc_8x8_khr.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033657,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rgba.",
        "srgb8_alpha8_astc_8x8_khr_rgba_astc_8x8_khr.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033658,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rgba.srgb",
        "8_alpha8_astc_8x8_khr_rgba_astc_8x8_khr.texture2d_array_to_texture2d_array");
