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

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033595,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x6_rgba.sr",
        "gb8_alpha8_astc_8x6_khr_srgb8_alpha8_astc_8x6_khr.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033596,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x6_rgba.sr",
        "gb8_alpha8_astc_8x6_khr_srgb8_alpha8_astc_8x6_khr.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033597,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x6_rgba.s",
        "rgb8_alpha8_astc_8x6_khr_srgb8_alpha8_astc_8x6_khr.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033598,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x6_rgba.srgb8",
        "_alpha8_astc_8x6_khr_srgb8_alpha8_astc_8x6_khr.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033599,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x6_rgba.sr",
        "gb8_alpha8_astc_8x6_khr_srgb8_alpha8_astc_8x6_khr.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033600,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x6_rgba.sr",
        "gb8_alpha8_astc_8x6_khr_srgb8_alpha8_astc_8x6_khr.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033601,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x6_rgba.s",
        "rgb8_alpha8_astc_8x6_khr_srgb8_alpha8_astc_8x6_khr.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033602,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x6_rgba.srgb8",
        "_alpha8_astc_8x6_khr_srgb8_alpha8_astc_8x6_khr.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033603,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x6_rgba.s",
        "rgb8_alpha8_astc_8x6_khr_srgb8_alpha8_astc_8x6_khr.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033604,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x6_rgba.s",
        "rgb8_alpha8_astc_8x6_khr_srgb8_alpha8_astc_8x6_khr.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033605,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x6_rgba.",
        "srgb8_alpha8_astc_8x6_khr_srgb8_alpha8_astc_8x6_khr.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033606,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x6_rgba.srgb",
        "8_alpha8_astc_8x6_khr_srgb8_alpha8_astc_8x6_khr.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033607,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x6_rgba.srgb8",
        "_alpha8_astc_8x6_khr_srgb8_alpha8_astc_8x6_khr.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033608,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x6_rgba.srgb8",
        "_alpha8_astc_8x6_khr_srgb8_alpha8_astc_8x6_khr.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033609,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x6_rgba.srgb",
        "8_alpha8_astc_8x6_khr_srgb8_alpha8_astc_8x6_khr.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033610,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_8x6_rgba.srgb8_al",
        "pha8_astc_8x6_khr_srgb8_alpha8_astc_8x6_khr.texture2d_array_to_texture2d_array");
