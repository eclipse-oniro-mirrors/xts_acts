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

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033531,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x5_rgba.sr",
        "gb8_alpha8_astc_8x5_khr_srgb8_alpha8_astc_8x5_khr.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033532,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x5_rgba.sr",
        "gb8_alpha8_astc_8x5_khr_srgb8_alpha8_astc_8x5_khr.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033533,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x5_rgba.s",
        "rgb8_alpha8_astc_8x5_khr_srgb8_alpha8_astc_8x5_khr.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033534,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x5_rgba.srgb8",
        "_alpha8_astc_8x5_khr_srgb8_alpha8_astc_8x5_khr.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033535,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x5_rgba.sr",
        "gb8_alpha8_astc_8x5_khr_srgb8_alpha8_astc_8x5_khr.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033536,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x5_rgba.sr",
        "gb8_alpha8_astc_8x5_khr_srgb8_alpha8_astc_8x5_khr.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033537,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x5_rgba.s",
        "rgb8_alpha8_astc_8x5_khr_srgb8_alpha8_astc_8x5_khr.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033538,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x5_rgba.srgb8",
        "_alpha8_astc_8x5_khr_srgb8_alpha8_astc_8x5_khr.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033539,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x5_rgba.s",
        "rgb8_alpha8_astc_8x5_khr_srgb8_alpha8_astc_8x5_khr.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033540,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x5_rgba.s",
        "rgb8_alpha8_astc_8x5_khr_srgb8_alpha8_astc_8x5_khr.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033541,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x5_rgba.",
        "srgb8_alpha8_astc_8x5_khr_srgb8_alpha8_astc_8x5_khr.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033542,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x5_rgba.srgb",
        "8_alpha8_astc_8x5_khr_srgb8_alpha8_astc_8x5_khr.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033543,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x5_rgba.srgb8",
        "_alpha8_astc_8x5_khr_srgb8_alpha8_astc_8x5_khr.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033544,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x5_rgba.srgb8",
        "_alpha8_astc_8x5_khr_srgb8_alpha8_astc_8x5_khr.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033545,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x5_rgba.srgb",
        "8_alpha8_astc_8x5_khr_srgb8_alpha8_astc_8x5_khr.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033546,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x5_rgba.srgb8_al",
        "pha8_astc_8x5_khr_srgb8_alpha8_astc_8x5_khr.texture2d_array_to_texture2d_array");
