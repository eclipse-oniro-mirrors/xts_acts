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

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033659,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rgba.sr",
        "gb8_alpha8_astc_8x8_khr_srgb8_alpha8_astc_8x8_khr.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033660,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rgba.sr",
        "gb8_alpha8_astc_8x8_khr_srgb8_alpha8_astc_8x8_khr.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033661,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rgba.s",
        "rgb8_alpha8_astc_8x8_khr_srgb8_alpha8_astc_8x8_khr.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033662,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rgba.srgb8",
        "_alpha8_astc_8x8_khr_srgb8_alpha8_astc_8x8_khr.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033663,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rgba.sr",
        "gb8_alpha8_astc_8x8_khr_srgb8_alpha8_astc_8x8_khr.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033664,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rgba.sr",
        "gb8_alpha8_astc_8x8_khr_srgb8_alpha8_astc_8x8_khr.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033665,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rgba.s",
        "rgb8_alpha8_astc_8x8_khr_srgb8_alpha8_astc_8x8_khr.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033666,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rgba.srgb8",
        "_alpha8_astc_8x8_khr_srgb8_alpha8_astc_8x8_khr.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033667,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rgba.s",
        "rgb8_alpha8_astc_8x8_khr_srgb8_alpha8_astc_8x8_khr.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033668,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rgba.s",
        "rgb8_alpha8_astc_8x8_khr_srgb8_alpha8_astc_8x8_khr.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033669,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rgba.",
        "srgb8_alpha8_astc_8x8_khr_srgb8_alpha8_astc_8x8_khr.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033670,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rgba.srgb",
        "8_alpha8_astc_8x8_khr_srgb8_alpha8_astc_8x8_khr.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033671,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rgba.srgb8",
        "_alpha8_astc_8x8_khr_srgb8_alpha8_astc_8x8_khr.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033672,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rgba.srgb8",
        "_alpha8_astc_8x8_khr_srgb8_alpha8_astc_8x8_khr.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033673,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rgba.srgb",
        "8_alpha8_astc_8x8_khr_srgb8_alpha8_astc_8x8_khr.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033674,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rgba.srgb8_al",
        "pha8_astc_8x8_khr_srgb8_alpha8_astc_8x8_khr.texture2d_array_to_texture2d_array");
