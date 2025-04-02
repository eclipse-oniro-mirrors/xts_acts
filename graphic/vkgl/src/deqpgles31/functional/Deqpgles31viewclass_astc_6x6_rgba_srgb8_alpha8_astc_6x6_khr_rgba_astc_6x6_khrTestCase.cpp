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

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033451,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x6_rgb",
        "a.srgb8_alpha8_astc_6x6_khr_rgba_astc_6x6_khr.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033452,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x6_rgb",
        "a.srgb8_alpha8_astc_6x6_khr_rgba_astc_6x6_khr.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033453,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x6_rg",
        "ba.srgb8_alpha8_astc_6x6_khr_rgba_astc_6x6_khr.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033454,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x6_rgba.s",
        "rgb8_alpha8_astc_6x6_khr_rgba_astc_6x6_khr.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033455,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x6_rgb",
        "a.srgb8_alpha8_astc_6x6_khr_rgba_astc_6x6_khr.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033456,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x6_rgb",
        "a.srgb8_alpha8_astc_6x6_khr_rgba_astc_6x6_khr.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033457,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x6_rg",
        "ba.srgb8_alpha8_astc_6x6_khr_rgba_astc_6x6_khr.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033458,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x6_rgba.s",
        "rgb8_alpha8_astc_6x6_khr_rgba_astc_6x6_khr.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033459,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x6_rg",
        "ba.srgb8_alpha8_astc_6x6_khr_rgba_astc_6x6_khr.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033460,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x6_rg",
        "ba.srgb8_alpha8_astc_6x6_khr_rgba_astc_6x6_khr.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033461,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x6_r",
        "gba.srgb8_alpha8_astc_6x6_khr_rgba_astc_6x6_khr.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033462,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x6_rgba.",
        "srgb8_alpha8_astc_6x6_khr_rgba_astc_6x6_khr.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033463,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x6_rgba.s",
        "rgb8_alpha8_astc_6x6_khr_rgba_astc_6x6_khr.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033464,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x6_rgba.s",
        "rgb8_alpha8_astc_6x6_khr_rgba_astc_6x6_khr.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033465,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x6_rgba.",
        "srgb8_alpha8_astc_6x6_khr_rgba_astc_6x6_khr.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033466,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x6_rgba.srgb",
        "8_alpha8_astc_6x6_khr_rgba_astc_6x6_khr.texture2d_array_to_texture2d_array");
