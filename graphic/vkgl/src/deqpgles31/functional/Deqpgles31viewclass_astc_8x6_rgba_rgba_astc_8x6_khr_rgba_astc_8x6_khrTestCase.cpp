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

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033547,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x6",
        "_rgba.rgba_astc_8x6_khr_rgba_astc_8x6_khr.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033548,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x6",
        "_rgba.rgba_astc_8x6_khr_rgba_astc_8x6_khr.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033549,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x",
        "6_rgba.rgba_astc_8x6_khr_rgba_astc_8x6_khr.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033550,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x6_rg",
        "ba.rgba_astc_8x6_khr_rgba_astc_8x6_khr.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033551,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x6",
        "_rgba.rgba_astc_8x6_khr_rgba_astc_8x6_khr.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033552,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x6",
        "_rgba.rgba_astc_8x6_khr_rgba_astc_8x6_khr.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033553,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x",
        "6_rgba.rgba_astc_8x6_khr_rgba_astc_8x6_khr.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033554,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x6_rg",
        "ba.rgba_astc_8x6_khr_rgba_astc_8x6_khr.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033555,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x",
        "6_rgba.rgba_astc_8x6_khr_rgba_astc_8x6_khr.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033556,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x",
        "6_rgba.rgba_astc_8x6_khr_rgba_astc_8x6_khr.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033557,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8",
        "x6_rgba.rgba_astc_8x6_khr_rgba_astc_8x6_khr.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033558,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x6_r",
        "gba.rgba_astc_8x6_khr_rgba_astc_8x6_khr.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033559,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x6_rg",
        "ba.rgba_astc_8x6_khr_rgba_astc_8x6_khr.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033560,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x6_rg",
        "ba.rgba_astc_8x6_khr_rgba_astc_8x6_khr.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033561,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x6_r",
        "gba.rgba_astc_8x6_khr_rgba_astc_8x6_khr.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033562,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x6_rgba.",
        "rgba_astc_8x6_khr_rgba_astc_8x6_khr.texture2d_array_to_texture2d_array");
