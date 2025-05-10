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

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033611,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8",
        "_rgba.rgba_astc_8x8_khr_rgba_astc_8x8_khr.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033612,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8",
        "_rgba.rgba_astc_8x8_khr_rgba_astc_8x8_khr.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033613,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x",
        "8_rgba.rgba_astc_8x8_khr_rgba_astc_8x8_khr.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033614,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rg",
        "ba.rgba_astc_8x8_khr_rgba_astc_8x8_khr.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033615,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8",
        "_rgba.rgba_astc_8x8_khr_rgba_astc_8x8_khr.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033616,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8",
        "_rgba.rgba_astc_8x8_khr_rgba_astc_8x8_khr.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033617,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x",
        "8_rgba.rgba_astc_8x8_khr_rgba_astc_8x8_khr.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033618,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rg",
        "ba.rgba_astc_8x8_khr_rgba_astc_8x8_khr.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033619,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x",
        "8_rgba.rgba_astc_8x8_khr_rgba_astc_8x8_khr.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033620,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x",
        "8_rgba.rgba_astc_8x8_khr_rgba_astc_8x8_khr.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033621,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8",
        "x8_rgba.rgba_astc_8x8_khr_rgba_astc_8x8_khr.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033622,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_r",
        "gba.rgba_astc_8x8_khr_rgba_astc_8x8_khr.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033623,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rg",
        "ba.rgba_astc_8x8_khr_rgba_astc_8x8_khr.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033624,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rg",
        "ba.rgba_astc_8x8_khr_rgba_astc_8x8_khr.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033625,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_r",
        "gba.rgba_astc_8x8_khr_rgba_astc_8x8_khr.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033626,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x8_rgba.",
        "rgba_astc_8x8_khr_rgba_astc_8x8_khr.texture2d_array_to_texture2d_array");
