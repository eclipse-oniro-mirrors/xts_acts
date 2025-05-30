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

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033771,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x6_rgba",
        ".srgb8_alpha8_astc_10x6_khr_rgba_astc_10x6_khr.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033772,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x6_rgba",
        ".srgb8_alpha8_astc_10x6_khr_rgba_astc_10x6_khr.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033773,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x6_rgb",
        "a.srgb8_alpha8_astc_10x6_khr_rgba_astc_10x6_khr.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033774,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x6_rgba.sr",
        "gb8_alpha8_astc_10x6_khr_rgba_astc_10x6_khr.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033775,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x6_rgba",
        ".srgb8_alpha8_astc_10x6_khr_rgba_astc_10x6_khr.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033776,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x6_rgba",
        ".srgb8_alpha8_astc_10x6_khr_rgba_astc_10x6_khr.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033777,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x6_rgb",
        "a.srgb8_alpha8_astc_10x6_khr_rgba_astc_10x6_khr.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033778,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x6_rgba.sr",
        "gb8_alpha8_astc_10x6_khr_rgba_astc_10x6_khr.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033779,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x6_rgb",
        "a.srgb8_alpha8_astc_10x6_khr_rgba_astc_10x6_khr.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033780,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x6_rgb",
        "a.srgb8_alpha8_astc_10x6_khr_rgba_astc_10x6_khr.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033781,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x6_rg",
        "ba.srgb8_alpha8_astc_10x6_khr_rgba_astc_10x6_khr.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033782,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x6_rgba.s",
        "rgb8_alpha8_astc_10x6_khr_rgba_astc_10x6_khr.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033783,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x6_rgba.sr",
        "gb8_alpha8_astc_10x6_khr_rgba_astc_10x6_khr.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033784,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x6_rgba.sr",
        "gb8_alpha8_astc_10x6_khr_rgba_astc_10x6_khr.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033785,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x6_rgba.s",
        "rgb8_alpha8_astc_10x6_khr_rgba_astc_10x6_khr.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033786,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x6_rgba.srgb8",
        "_alpha8_astc_10x6_khr_rgba_astc_10x6_khr.texture2d_array_to_texture2d_array");
