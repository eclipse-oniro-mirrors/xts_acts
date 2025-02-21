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

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033307,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rgb",
        "a.rgba_astc_5x5_khr_srgb8_alpha8_astc_5x5_khr.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033308,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rgb",
        "a.rgba_astc_5x5_khr_srgb8_alpha8_astc_5x5_khr.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033309,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rg",
        "ba.rgba_astc_5x5_khr_srgb8_alpha8_astc_5x5_khr.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033310,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rgba.r",
        "gba_astc_5x5_khr_srgb8_alpha8_astc_5x5_khr.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033311,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rgb",
        "a.rgba_astc_5x5_khr_srgb8_alpha8_astc_5x5_khr.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033312,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rgb",
        "a.rgba_astc_5x5_khr_srgb8_alpha8_astc_5x5_khr.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033313,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rg",
        "ba.rgba_astc_5x5_khr_srgb8_alpha8_astc_5x5_khr.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033314,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rgba.r",
        "gba_astc_5x5_khr_srgb8_alpha8_astc_5x5_khr.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033315,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rg",
        "ba.rgba_astc_5x5_khr_srgb8_alpha8_astc_5x5_khr.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033316,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rg",
        "ba.rgba_astc_5x5_khr_srgb8_alpha8_astc_5x5_khr.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033317,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_r",
        "gba.rgba_astc_5x5_khr_srgb8_alpha8_astc_5x5_khr.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033318,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rgba.",
        "rgba_astc_5x5_khr_srgb8_alpha8_astc_5x5_khr.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033319,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rgba.r",
        "gba_astc_5x5_khr_srgb8_alpha8_astc_5x5_khr.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033320,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rgba.r",
        "gba_astc_5x5_khr_srgb8_alpha8_astc_5x5_khr.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033321,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rgba.",
        "rgba_astc_5x5_khr_srgb8_alpha8_astc_5x5_khr.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033322,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rgba.rgba",
        "_astc_5x5_khr_srgb8_alpha8_astc_5x5_khr.texture2d_array_to_texture2d_array");
