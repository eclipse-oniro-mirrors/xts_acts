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

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033211,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_4x4_rgba.sr",
        "gb8_alpha8_astc_4x4_khr_srgb8_alpha8_astc_4x4_khr.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033212,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_4x4_rgba.sr",
        "gb8_alpha8_astc_4x4_khr_srgb8_alpha8_astc_4x4_khr.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033213,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_4x4_rgba.s",
        "rgb8_alpha8_astc_4x4_khr_srgb8_alpha8_astc_4x4_khr.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033214,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_4x4_rgba.srgb8",
        "_alpha8_astc_4x4_khr_srgb8_alpha8_astc_4x4_khr.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033215,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_4x4_rgba.sr",
        "gb8_alpha8_astc_4x4_khr_srgb8_alpha8_astc_4x4_khr.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033216,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_4x4_rgba.sr",
        "gb8_alpha8_astc_4x4_khr_srgb8_alpha8_astc_4x4_khr.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033217,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_4x4_rgba.s",
        "rgb8_alpha8_astc_4x4_khr_srgb8_alpha8_astc_4x4_khr.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033218,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_4x4_rgba.srgb8",
        "_alpha8_astc_4x4_khr_srgb8_alpha8_astc_4x4_khr.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033219,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_4x4_rgba.s",
        "rgb8_alpha8_astc_4x4_khr_srgb8_alpha8_astc_4x4_khr.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033220,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_4x4_rgba.s",
        "rgb8_alpha8_astc_4x4_khr_srgb8_alpha8_astc_4x4_khr.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033221,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_4x4_rgba.",
        "srgb8_alpha8_astc_4x4_khr_srgb8_alpha8_astc_4x4_khr.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033222,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_4x4_rgba.srgb",
        "8_alpha8_astc_4x4_khr_srgb8_alpha8_astc_4x4_khr.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033223,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_4x4_rgba.srgb8",
        "_alpha8_astc_4x4_khr_srgb8_alpha8_astc_4x4_khr.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033224,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_4x4_rgba.srgb8",
        "_alpha8_astc_4x4_khr_srgb8_alpha8_astc_4x4_khr.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033225,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_4x4_rgba.srgb",
        "8_alpha8_astc_4x4_khr_srgb8_alpha8_astc_4x4_khr.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033226,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_4x4_rgba.srgb8_al",
        "pha8_astc_4x4_khr_srgb8_alpha8_astc_4x4_khr.texture2d_array_to_texture2d_array");
