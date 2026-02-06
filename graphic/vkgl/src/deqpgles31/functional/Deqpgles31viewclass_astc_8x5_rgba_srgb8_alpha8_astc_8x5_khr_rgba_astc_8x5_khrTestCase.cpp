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

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033515,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x5_rgb",
        "a.srgb8_alpha8_astc_8x5_khr_rgba_astc_8x5_khr.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033516,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x5_rgb",
        "a.srgb8_alpha8_astc_8x5_khr_rgba_astc_8x5_khr.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033517,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x5_rg",
        "ba.srgb8_alpha8_astc_8x5_khr_rgba_astc_8x5_khr.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033518,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x5_rgba.s",
        "rgb8_alpha8_astc_8x5_khr_rgba_astc_8x5_khr.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033519,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x5_rgb",
        "a.srgb8_alpha8_astc_8x5_khr_rgba_astc_8x5_khr.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033520,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x5_rgb",
        "a.srgb8_alpha8_astc_8x5_khr_rgba_astc_8x5_khr.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033521,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x5_rg",
        "ba.srgb8_alpha8_astc_8x5_khr_rgba_astc_8x5_khr.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033522,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x5_rgba.s",
        "rgb8_alpha8_astc_8x5_khr_rgba_astc_8x5_khr.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033523,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x5_rg",
        "ba.srgb8_alpha8_astc_8x5_khr_rgba_astc_8x5_khr.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033524,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x5_rg",
        "ba.srgb8_alpha8_astc_8x5_khr_rgba_astc_8x5_khr.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033525,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x5_r",
        "gba.srgb8_alpha8_astc_8x5_khr_rgba_astc_8x5_khr.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033526,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x5_rgba.",
        "srgb8_alpha8_astc_8x5_khr_rgba_astc_8x5_khr.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033527,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x5_rgba.s",
        "rgb8_alpha8_astc_8x5_khr_rgba_astc_8x5_khr.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033528,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x5_rgba.s",
        "rgb8_alpha8_astc_8x5_khr_rgba_astc_8x5_khr.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033529,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x5_rgba.",
        "srgb8_alpha8_astc_8x5_khr_rgba_astc_8x5_khr.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033530,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x5_rgba.srgb",
        "8_alpha8_astc_8x5_khr_rgba_astc_8x5_khr.texture2d_array_to_texture2d_array");
