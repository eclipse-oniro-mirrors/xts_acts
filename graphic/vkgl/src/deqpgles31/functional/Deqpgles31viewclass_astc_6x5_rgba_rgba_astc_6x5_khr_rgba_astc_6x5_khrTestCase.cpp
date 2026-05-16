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

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033355,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x5",
        "_rgba.rgba_astc_6x5_khr_rgba_astc_6x5_khr.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033356,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x5",
        "_rgba.rgba_astc_6x5_khr_rgba_astc_6x5_khr.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033357,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x",
        "5_rgba.rgba_astc_6x5_khr_rgba_astc_6x5_khr.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033358,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x5_rg",
        "ba.rgba_astc_6x5_khr_rgba_astc_6x5_khr.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033359,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x5",
        "_rgba.rgba_astc_6x5_khr_rgba_astc_6x5_khr.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033360,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x5",
        "_rgba.rgba_astc_6x5_khr_rgba_astc_6x5_khr.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033361,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x",
        "5_rgba.rgba_astc_6x5_khr_rgba_astc_6x5_khr.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033362,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x5_rg",
        "ba.rgba_astc_6x5_khr_rgba_astc_6x5_khr.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033363,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x",
        "5_rgba.rgba_astc_6x5_khr_rgba_astc_6x5_khr.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033364,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x",
        "5_rgba.rgba_astc_6x5_khr_rgba_astc_6x5_khr.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033365,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6",
        "x5_rgba.rgba_astc_6x5_khr_rgba_astc_6x5_khr.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033366,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x5_r",
        "gba.rgba_astc_6x5_khr_rgba_astc_6x5_khr.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033367,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x5_rg",
        "ba.rgba_astc_6x5_khr_rgba_astc_6x5_khr.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033368,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x5_rg",
        "ba.rgba_astc_6x5_khr_rgba_astc_6x5_khr.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033369,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x5_r",
        "gba.rgba_astc_6x5_khr_rgba_astc_6x5_khr.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033370,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_6x5_rgba.",
        "rgba_astc_6x5_khr_rgba_astc_6x5_khr.texture2d_array_to_texture2d_array");
