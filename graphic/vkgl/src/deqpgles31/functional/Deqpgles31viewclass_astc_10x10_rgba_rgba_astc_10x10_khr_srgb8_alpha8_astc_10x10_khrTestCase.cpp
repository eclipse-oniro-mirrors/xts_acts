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

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033883,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x10_rgba",
        ".rgba_astc_10x10_khr_srgb8_alpha8_astc_10x10_khr.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033884,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x10_rgba",
        ".rgba_astc_10x10_khr_srgb8_alpha8_astc_10x10_khr.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033885,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x10_rgb",
        "a.rgba_astc_10x10_khr_srgb8_alpha8_astc_10x10_khr.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033886,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x10_rgba.rg",
        "ba_astc_10x10_khr_srgb8_alpha8_astc_10x10_khr.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033887,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x10_rgba",
        ".rgba_astc_10x10_khr_srgb8_alpha8_astc_10x10_khr.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033888,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x10_rgba",
        ".rgba_astc_10x10_khr_srgb8_alpha8_astc_10x10_khr.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033889,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x10_rgb",
        "a.rgba_astc_10x10_khr_srgb8_alpha8_astc_10x10_khr.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033890,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x10_rgba.rg",
        "ba_astc_10x10_khr_srgb8_alpha8_astc_10x10_khr.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033891,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x10_rgb",
        "a.rgba_astc_10x10_khr_srgb8_alpha8_astc_10x10_khr.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033892,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x10_rgb",
        "a.rgba_astc_10x10_khr_srgb8_alpha8_astc_10x10_khr.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033893,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x10_rg",
        "ba.rgba_astc_10x10_khr_srgb8_alpha8_astc_10x10_khr.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033894,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x10_rgba.r",
        "gba_astc_10x10_khr_srgb8_alpha8_astc_10x10_khr.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033895,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x10_rgba.rg",
        "ba_astc_10x10_khr_srgb8_alpha8_astc_10x10_khr.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033896,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x10_rgba.rg",
        "ba_astc_10x10_khr_srgb8_alpha8_astc_10x10_khr.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033897,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x10_rgba.r",
        "gba_astc_10x10_khr_srgb8_alpha8_astc_10x10_khr.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033898,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x10_rgba.rgba_",
        "astc_10x10_khr_srgb8_alpha8_astc_10x10_khr.texture2d_array_to_texture2d_array");
