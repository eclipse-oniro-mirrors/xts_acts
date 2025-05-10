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

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033931,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x10_",
        "rgba.rgba_astc_12x10_khr_rgba_astc_12x10_khr.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033932,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x10_",
        "rgba.rgba_astc_12x10_khr_rgba_astc_12x10_khr.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033933,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x10",
        "_rgba.rgba_astc_12x10_khr_rgba_astc_12x10_khr.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033934,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x10_rgb",
        "a.rgba_astc_12x10_khr_rgba_astc_12x10_khr.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033935,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x10_",
        "rgba.rgba_astc_12x10_khr_rgba_astc_12x10_khr.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033936,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x10_",
        "rgba.rgba_astc_12x10_khr_rgba_astc_12x10_khr.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033937,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x10",
        "_rgba.rgba_astc_12x10_khr_rgba_astc_12x10_khr.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033938,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x10_rgb",
        "a.rgba_astc_12x10_khr_rgba_astc_12x10_khr.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033939,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x10",
        "_rgba.rgba_astc_12x10_khr_rgba_astc_12x10_khr.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033940,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x10",
        "_rgba.rgba_astc_12x10_khr_rgba_astc_12x10_khr.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033941,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x1",
        "0_rgba.rgba_astc_12x10_khr_rgba_astc_12x10_khr.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033942,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x10_rg",
        "ba.rgba_astc_12x10_khr_rgba_astc_12x10_khr.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033943,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x10_rgb",
        "a.rgba_astc_12x10_khr_rgba_astc_12x10_khr.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033944,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x10_rgb",
        "a.rgba_astc_12x10_khr_rgba_astc_12x10_khr.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033945,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x10_rg",
        "ba.rgba_astc_12x10_khr_rgba_astc_12x10_khr.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033946,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x10_rgba.r",
        "gba_astc_12x10_khr_rgba_astc_12x10_khr.texture2d_array_to_texture2d_array");
