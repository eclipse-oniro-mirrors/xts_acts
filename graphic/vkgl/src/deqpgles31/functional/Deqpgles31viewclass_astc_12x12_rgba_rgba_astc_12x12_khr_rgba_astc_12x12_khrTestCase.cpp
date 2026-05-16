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

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033995,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x12_",
        "rgba.rgba_astc_12x12_khr_rgba_astc_12x12_khr.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033996,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x12_",
        "rgba.rgba_astc_12x12_khr_rgba_astc_12x12_khr.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033997,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x12",
        "_rgba.rgba_astc_12x12_khr_rgba_astc_12x12_khr.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033998,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x12_rgb",
        "a.rgba_astc_12x12_khr_rgba_astc_12x12_khr.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033999,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x12_",
        "rgba.rgba_astc_12x12_khr_rgba_astc_12x12_khr.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_034000,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x12_",
        "rgba.rgba_astc_12x12_khr_rgba_astc_12x12_khr.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_034001,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x12",
        "_rgba.rgba_astc_12x12_khr_rgba_astc_12x12_khr.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_034002,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x12_rgb",
        "a.rgba_astc_12x12_khr_rgba_astc_12x12_khr.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_034003,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x12",
        "_rgba.rgba_astc_12x12_khr_rgba_astc_12x12_khr.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_034004,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x12",
        "_rgba.rgba_astc_12x12_khr_rgba_astc_12x12_khr.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_034005,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x1",
        "2_rgba.rgba_astc_12x12_khr_rgba_astc_12x12_khr.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_034006,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x12_rg",
        "ba.rgba_astc_12x12_khr_rgba_astc_12x12_khr.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_034007,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x12_rgb",
        "a.rgba_astc_12x12_khr_rgba_astc_12x12_khr.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_034008,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x12_rgb",
        "a.rgba_astc_12x12_khr_rgba_astc_12x12_khr.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_034009,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x12_rg",
        "ba.rgba_astc_12x12_khr_rgba_astc_12x12_khr.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_034010,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x12_rgba.r",
        "gba_astc_12x12_khr_rgba_astc_12x12_khr.texture2d_array_to_texture2d_array");
