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

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033387,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x5_rgb",
        "a.srgb8_alpha8_astc_6x5_khr_rgba_astc_6x5_khr.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033388,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x5_rgb",
        "a.srgb8_alpha8_astc_6x5_khr_rgba_astc_6x5_khr.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033389,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x5_rg",
        "ba.srgb8_alpha8_astc_6x5_khr_rgba_astc_6x5_khr.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033390,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x5_rgba.s",
        "rgb8_alpha8_astc_6x5_khr_rgba_astc_6x5_khr.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033391,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x5_rgb",
        "a.srgb8_alpha8_astc_6x5_khr_rgba_astc_6x5_khr.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033392,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x5_rgb",
        "a.srgb8_alpha8_astc_6x5_khr_rgba_astc_6x5_khr.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033393,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x5_rg",
        "ba.srgb8_alpha8_astc_6x5_khr_rgba_astc_6x5_khr.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033394,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x5_rgba.s",
        "rgb8_alpha8_astc_6x5_khr_rgba_astc_6x5_khr.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033395,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x5_rg",
        "ba.srgb8_alpha8_astc_6x5_khr_rgba_astc_6x5_khr.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033396,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x5_rg",
        "ba.srgb8_alpha8_astc_6x5_khr_rgba_astc_6x5_khr.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033397,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x5_r",
        "gba.srgb8_alpha8_astc_6x5_khr_rgba_astc_6x5_khr.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033398,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x5_rgba.",
        "srgb8_alpha8_astc_6x5_khr_rgba_astc_6x5_khr.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033399,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x5_rgba.s",
        "rgb8_alpha8_astc_6x5_khr_rgba_astc_6x5_khr.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033400,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x5_rgba.s",
        "rgb8_alpha8_astc_6x5_khr_rgba_astc_6x5_khr.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033401,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x5_rgba.",
        "srgb8_alpha8_astc_6x5_khr_rgba_astc_6x5_khr.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033402,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x5_rgba.srgb",
        "8_alpha8_astc_6x5_khr_rgba_astc_6x5_khr.texture2d_array_to_texture2d_array");
