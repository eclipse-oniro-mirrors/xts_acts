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

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033483,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x5",
        "_rgba.rgba_astc_8x5_khr_rgba_astc_8x5_khr.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033484,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x5",
        "_rgba.rgba_astc_8x5_khr_rgba_astc_8x5_khr.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033485,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x",
        "5_rgba.rgba_astc_8x5_khr_rgba_astc_8x5_khr.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033486,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x5_rg",
        "ba.rgba_astc_8x5_khr_rgba_astc_8x5_khr.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033487,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x5",
        "_rgba.rgba_astc_8x5_khr_rgba_astc_8x5_khr.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033488,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x5",
        "_rgba.rgba_astc_8x5_khr_rgba_astc_8x5_khr.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033489,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x",
        "5_rgba.rgba_astc_8x5_khr_rgba_astc_8x5_khr.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033490,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x5_rg",
        "ba.rgba_astc_8x5_khr_rgba_astc_8x5_khr.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033491,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x",
        "5_rgba.rgba_astc_8x5_khr_rgba_astc_8x5_khr.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033492,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x",
        "5_rgba.rgba_astc_8x5_khr_rgba_astc_8x5_khr.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033493,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8",
        "x5_rgba.rgba_astc_8x5_khr_rgba_astc_8x5_khr.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033494,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x5_r",
        "gba.rgba_astc_8x5_khr_rgba_astc_8x5_khr.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033495,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x5_rg",
        "ba.rgba_astc_8x5_khr_rgba_astc_8x5_khr.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033496,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x5_rg",
        "ba.rgba_astc_8x5_khr_rgba_astc_8x5_khr.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033497,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x5_r",
        "gba.rgba_astc_8x5_khr_rgba_astc_8x5_khr.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033498,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x5_rgba.",
        "rgba_astc_8x5_khr_rgba_astc_8x5_khr.texture2d_array_to_texture2d_array");
