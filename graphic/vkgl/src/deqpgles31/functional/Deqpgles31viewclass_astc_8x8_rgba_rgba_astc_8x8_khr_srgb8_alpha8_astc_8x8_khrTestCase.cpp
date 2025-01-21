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

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033627,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rgb",
        "a.rgba_astc_8x8_khr_srgb8_alpha8_astc_8x8_khr.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033628,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rgb",
        "a.rgba_astc_8x8_khr_srgb8_alpha8_astc_8x8_khr.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033629,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rg",
        "ba.rgba_astc_8x8_khr_srgb8_alpha8_astc_8x8_khr.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033630,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rgba.r",
        "gba_astc_8x8_khr_srgb8_alpha8_astc_8x8_khr.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033631,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rgb",
        "a.rgba_astc_8x8_khr_srgb8_alpha8_astc_8x8_khr.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033632,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rgb",
        "a.rgba_astc_8x8_khr_srgb8_alpha8_astc_8x8_khr.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033633,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rg",
        "ba.rgba_astc_8x8_khr_srgb8_alpha8_astc_8x8_khr.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033634,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rgba.r",
        "gba_astc_8x8_khr_srgb8_alpha8_astc_8x8_khr.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033635,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rg",
        "ba.rgba_astc_8x8_khr_srgb8_alpha8_astc_8x8_khr.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033636,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rg",
        "ba.rgba_astc_8x8_khr_srgb8_alpha8_astc_8x8_khr.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033637,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_r",
        "gba.rgba_astc_8x8_khr_srgb8_alpha8_astc_8x8_khr.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033638,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rgba.",
        "rgba_astc_8x8_khr_srgb8_alpha8_astc_8x8_khr.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033639,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rgba.r",
        "gba_astc_8x8_khr_srgb8_alpha8_astc_8x8_khr.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033640,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rgba.r",
        "gba_astc_8x8_khr_srgb8_alpha8_astc_8x8_khr.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033641,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rgba.",
        "rgba_astc_8x8_khr_srgb8_alpha8_astc_8x8_khr.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033642,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rgba.rgba",
        "_astc_8x8_khr_srgb8_alpha8_astc_8x8_khr.texture2d_array_to_texture2d_array");
