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

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033803,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x8_",
        "rgba.rgba_astc_10x8_khr_rgba_astc_10x8_khr.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033804,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x8_",
        "rgba.rgba_astc_10x8_khr_rgba_astc_10x8_khr.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033805,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x8",
        "_rgba.rgba_astc_10x8_khr_rgba_astc_10x8_khr.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033806,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x8_rgb",
        "a.rgba_astc_10x8_khr_rgba_astc_10x8_khr.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033807,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x8_",
        "rgba.rgba_astc_10x8_khr_rgba_astc_10x8_khr.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033808,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x8_",
        "rgba.rgba_astc_10x8_khr_rgba_astc_10x8_khr.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033809,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x8",
        "_rgba.rgba_astc_10x8_khr_rgba_astc_10x8_khr.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033810,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x8_rgb",
        "a.rgba_astc_10x8_khr_rgba_astc_10x8_khr.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033811,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x8",
        "_rgba.rgba_astc_10x8_khr_rgba_astc_10x8_khr.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033812,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x8",
        "_rgba.rgba_astc_10x8_khr_rgba_astc_10x8_khr.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033813,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x",
        "8_rgba.rgba_astc_10x8_khr_rgba_astc_10x8_khr.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033814,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x8_rg",
        "ba.rgba_astc_10x8_khr_rgba_astc_10x8_khr.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033815,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x8_rgb",
        "a.rgba_astc_10x8_khr_rgba_astc_10x8_khr.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033816,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x8_rgb",
        "a.rgba_astc_10x8_khr_rgba_astc_10x8_khr.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033817,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x8_rg",
        "ba.rgba_astc_10x8_khr_rgba_astc_10x8_khr.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033818,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x8_rgba.r",
        "gba_astc_10x8_khr_rgba_astc_10x8_khr.texture2d_array_to_texture2d_array");
