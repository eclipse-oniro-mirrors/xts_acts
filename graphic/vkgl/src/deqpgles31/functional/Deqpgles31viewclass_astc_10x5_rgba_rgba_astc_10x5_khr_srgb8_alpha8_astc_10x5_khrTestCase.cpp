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

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033691,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x5_rgba",
        ".rgba_astc_10x5_khr_srgb8_alpha8_astc_10x5_khr.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033692,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x5_rgba",
        ".rgba_astc_10x5_khr_srgb8_alpha8_astc_10x5_khr.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033693,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x5_rgb",
        "a.rgba_astc_10x5_khr_srgb8_alpha8_astc_10x5_khr.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033694,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x5_rgba.rg",
        "ba_astc_10x5_khr_srgb8_alpha8_astc_10x5_khr.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033695,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x5_rgba",
        ".rgba_astc_10x5_khr_srgb8_alpha8_astc_10x5_khr.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033696,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x5_rgba",
        ".rgba_astc_10x5_khr_srgb8_alpha8_astc_10x5_khr.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033697,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x5_rgb",
        "a.rgba_astc_10x5_khr_srgb8_alpha8_astc_10x5_khr.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033698,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x5_rgba.rg",
        "ba_astc_10x5_khr_srgb8_alpha8_astc_10x5_khr.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033699,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x5_rgb",
        "a.rgba_astc_10x5_khr_srgb8_alpha8_astc_10x5_khr.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033700,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x5_rgb",
        "a.rgba_astc_10x5_khr_srgb8_alpha8_astc_10x5_khr.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033701,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x5_rg",
        "ba.rgba_astc_10x5_khr_srgb8_alpha8_astc_10x5_khr.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033702,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x5_rgba.r",
        "gba_astc_10x5_khr_srgb8_alpha8_astc_10x5_khr.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033703,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x5_rgba.rg",
        "ba_astc_10x5_khr_srgb8_alpha8_astc_10x5_khr.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033704,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x5_rgba.rg",
        "ba_astc_10x5_khr_srgb8_alpha8_astc_10x5_khr.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033705,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x5_rgba.r",
        "gba_astc_10x5_khr_srgb8_alpha8_astc_10x5_khr.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033706,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x5_rgba.rgba_",
        "astc_10x5_khr_srgb8_alpha8_astc_10x5_khr.texture2d_array_to_texture2d_array");
