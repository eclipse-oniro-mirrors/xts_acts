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

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033339,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rgba.sr",
        "gb8_alpha8_astc_5x5_khr_srgb8_alpha8_astc_5x5_khr.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033340,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rgba.sr",
        "gb8_alpha8_astc_5x5_khr_srgb8_alpha8_astc_5x5_khr.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033341,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rgba.s",
        "rgb8_alpha8_astc_5x5_khr_srgb8_alpha8_astc_5x5_khr.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033342,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rgba.srgb8",
        "_alpha8_astc_5x5_khr_srgb8_alpha8_astc_5x5_khr.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033343,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rgba.sr",
        "gb8_alpha8_astc_5x5_khr_srgb8_alpha8_astc_5x5_khr.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033344,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rgba.sr",
        "gb8_alpha8_astc_5x5_khr_srgb8_alpha8_astc_5x5_khr.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033345,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rgba.s",
        "rgb8_alpha8_astc_5x5_khr_srgb8_alpha8_astc_5x5_khr.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033346,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rgba.srgb8",
        "_alpha8_astc_5x5_khr_srgb8_alpha8_astc_5x5_khr.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033347,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rgba.s",
        "rgb8_alpha8_astc_5x5_khr_srgb8_alpha8_astc_5x5_khr.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033348,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rgba.s",
        "rgb8_alpha8_astc_5x5_khr_srgb8_alpha8_astc_5x5_khr.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033349,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rgba.",
        "srgb8_alpha8_astc_5x5_khr_srgb8_alpha8_astc_5x5_khr.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033350,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rgba.srgb",
        "8_alpha8_astc_5x5_khr_srgb8_alpha8_astc_5x5_khr.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033351,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rgba.srgb8",
        "_alpha8_astc_5x5_khr_srgb8_alpha8_astc_5x5_khr.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033352,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rgba.srgb8",
        "_alpha8_astc_5x5_khr_srgb8_alpha8_astc_5x5_khr.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033353,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rgba.srgb",
        "8_alpha8_astc_5x5_khr_srgb8_alpha8_astc_5x5_khr.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033354,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_5x5_rgba.srgb8_al",
        "pha8_astc_5x5_khr_srgb8_alpha8_astc_5x5_khr.texture2d_array_to_texture2d_array");
