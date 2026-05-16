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

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033371,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x5_rgb",
        "a.rgba_astc_6x5_khr_srgb8_alpha8_astc_6x5_khr.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033372,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x5_rgb",
        "a.rgba_astc_6x5_khr_srgb8_alpha8_astc_6x5_khr.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033373,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x5_rg",
        "ba.rgba_astc_6x5_khr_srgb8_alpha8_astc_6x5_khr.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033374,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x5_rgba.r",
        "gba_astc_6x5_khr_srgb8_alpha8_astc_6x5_khr.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033375,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x5_rgb",
        "a.rgba_astc_6x5_khr_srgb8_alpha8_astc_6x5_khr.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033376,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x5_rgb",
        "a.rgba_astc_6x5_khr_srgb8_alpha8_astc_6x5_khr.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033377,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x5_rg",
        "ba.rgba_astc_6x5_khr_srgb8_alpha8_astc_6x5_khr.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033378,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x5_rgba.r",
        "gba_astc_6x5_khr_srgb8_alpha8_astc_6x5_khr.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033379,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x5_rg",
        "ba.rgba_astc_6x5_khr_srgb8_alpha8_astc_6x5_khr.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033380,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x5_rg",
        "ba.rgba_astc_6x5_khr_srgb8_alpha8_astc_6x5_khr.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033381,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x5_r",
        "gba.rgba_astc_6x5_khr_srgb8_alpha8_astc_6x5_khr.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033382,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x5_rgba.",
        "rgba_astc_6x5_khr_srgb8_alpha8_astc_6x5_khr.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033383,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x5_rgba.r",
        "gba_astc_6x5_khr_srgb8_alpha8_astc_6x5_khr.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033384,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x5_rgba.r",
        "gba_astc_6x5_khr_srgb8_alpha8_astc_6x5_khr.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033385,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x5_rgba.",
        "rgba_astc_6x5_khr_srgb8_alpha8_astc_6x5_khr.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033386,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x5_rgba.rgba",
        "_astc_6x5_khr_srgb8_alpha8_astc_6x5_khr.texture2d_array_to_texture2d_array");
