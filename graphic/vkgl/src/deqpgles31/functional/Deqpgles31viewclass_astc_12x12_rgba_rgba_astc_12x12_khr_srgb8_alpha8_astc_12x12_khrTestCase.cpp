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
#include "../ActsDeqpgles310035TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034011,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x12_rgba",
        ".rgba_astc_12x12_khr_srgb8_alpha8_astc_12x12_khr.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034012,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x12_rgba",
        ".rgba_astc_12x12_khr_srgb8_alpha8_astc_12x12_khr.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034013,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x12_rgb",
        "a.rgba_astc_12x12_khr_srgb8_alpha8_astc_12x12_khr.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034014,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x12_rgba.rg",
        "ba_astc_12x12_khr_srgb8_alpha8_astc_12x12_khr.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034015,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x12_rgba",
        ".rgba_astc_12x12_khr_srgb8_alpha8_astc_12x12_khr.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034016,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x12_rgba",
        ".rgba_astc_12x12_khr_srgb8_alpha8_astc_12x12_khr.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034017,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x12_rgb",
        "a.rgba_astc_12x12_khr_srgb8_alpha8_astc_12x12_khr.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034018,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x12_rgba.rg",
        "ba_astc_12x12_khr_srgb8_alpha8_astc_12x12_khr.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034019,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x12_rgb",
        "a.rgba_astc_12x12_khr_srgb8_alpha8_astc_12x12_khr.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034020,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x12_rgb",
        "a.rgba_astc_12x12_khr_srgb8_alpha8_astc_12x12_khr.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034021,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x12_rg",
        "ba.rgba_astc_12x12_khr_srgb8_alpha8_astc_12x12_khr.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034022,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x12_rgba.r",
        "gba_astc_12x12_khr_srgb8_alpha8_astc_12x12_khr.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034023,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x12_rgba.rg",
        "ba_astc_12x12_khr_srgb8_alpha8_astc_12x12_khr.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034024,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x12_rgba.rg",
        "ba_astc_12x12_khr_srgb8_alpha8_astc_12x12_khr.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034025,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x12_rgba.r",
        "gba_astc_12x12_khr_srgb8_alpha8_astc_12x12_khr.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034026,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x12_rgba.rgba_",
        "astc_12x12_khr_srgb8_alpha8_astc_12x12_khr.texture2d_array_to_texture2d_array");
