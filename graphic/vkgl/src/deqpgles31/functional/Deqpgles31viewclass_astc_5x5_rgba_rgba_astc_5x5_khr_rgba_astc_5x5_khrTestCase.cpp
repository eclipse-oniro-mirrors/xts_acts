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

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033291,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5",
        "_rgba.rgba_astc_5x5_khr_rgba_astc_5x5_khr.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033292,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5",
        "_rgba.rgba_astc_5x5_khr_rgba_astc_5x5_khr.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033293,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x",
        "5_rgba.rgba_astc_5x5_khr_rgba_astc_5x5_khr.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033294,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rg",
        "ba.rgba_astc_5x5_khr_rgba_astc_5x5_khr.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033295,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5",
        "_rgba.rgba_astc_5x5_khr_rgba_astc_5x5_khr.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033296,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5",
        "_rgba.rgba_astc_5x5_khr_rgba_astc_5x5_khr.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033297,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x",
        "5_rgba.rgba_astc_5x5_khr_rgba_astc_5x5_khr.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033298,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rg",
        "ba.rgba_astc_5x5_khr_rgba_astc_5x5_khr.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033299,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x",
        "5_rgba.rgba_astc_5x5_khr_rgba_astc_5x5_khr.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033300,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x",
        "5_rgba.rgba_astc_5x5_khr_rgba_astc_5x5_khr.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033301,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5",
        "x5_rgba.rgba_astc_5x5_khr_rgba_astc_5x5_khr.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033302,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_r",
        "gba.rgba_astc_5x5_khr_rgba_astc_5x5_khr.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033303,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rg",
        "ba.rgba_astc_5x5_khr_rgba_astc_5x5_khr.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033304,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rg",
        "ba.rgba_astc_5x5_khr_rgba_astc_5x5_khr.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033305,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_r",
        "gba.rgba_astc_5x5_khr_rgba_astc_5x5_khr.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033306,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rgba.",
        "rgba_astc_5x5_khr_rgba_astc_5x5_khr.texture2d_array_to_texture2d_array");
