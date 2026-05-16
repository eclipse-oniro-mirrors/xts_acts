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

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033323,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rgb",
        "a.srgb8_alpha8_astc_5x5_khr_rgba_astc_5x5_khr.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033324,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rgb",
        "a.srgb8_alpha8_astc_5x5_khr_rgba_astc_5x5_khr.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033325,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rg",
        "ba.srgb8_alpha8_astc_5x5_khr_rgba_astc_5x5_khr.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033326,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rgba.s",
        "rgb8_alpha8_astc_5x5_khr_rgba_astc_5x5_khr.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033327,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rgb",
        "a.srgb8_alpha8_astc_5x5_khr_rgba_astc_5x5_khr.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033328,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rgb",
        "a.srgb8_alpha8_astc_5x5_khr_rgba_astc_5x5_khr.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033329,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rg",
        "ba.srgb8_alpha8_astc_5x5_khr_rgba_astc_5x5_khr.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033330,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rgba.s",
        "rgb8_alpha8_astc_5x5_khr_rgba_astc_5x5_khr.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033331,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rg",
        "ba.srgb8_alpha8_astc_5x5_khr_rgba_astc_5x5_khr.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033332,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rg",
        "ba.srgb8_alpha8_astc_5x5_khr_rgba_astc_5x5_khr.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033333,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_r",
        "gba.srgb8_alpha8_astc_5x5_khr_rgba_astc_5x5_khr.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033334,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rgba.",
        "srgb8_alpha8_astc_5x5_khr_rgba_astc_5x5_khr.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033335,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rgba.s",
        "rgb8_alpha8_astc_5x5_khr_rgba_astc_5x5_khr.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033336,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rgba.s",
        "rgb8_alpha8_astc_5x5_khr_rgba_astc_5x5_khr.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033337,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rgba.",
        "srgb8_alpha8_astc_5x5_khr_rgba_astc_5x5_khr.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033338,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rgba.srgb",
        "8_alpha8_astc_5x5_khr_rgba_astc_5x5_khr.texture2d_array_to_texture2d_array");
