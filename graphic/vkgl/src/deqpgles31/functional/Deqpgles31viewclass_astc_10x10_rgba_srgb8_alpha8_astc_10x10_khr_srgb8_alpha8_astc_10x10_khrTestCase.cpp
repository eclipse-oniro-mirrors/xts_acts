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

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033915,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x10_rgba.srg",
        "b8_alpha8_astc_10x10_khr_srgb8_alpha8_astc_10x10_khr.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033916,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x10_rgba.srg",
        "b8_alpha8_astc_10x10_khr_srgb8_alpha8_astc_10x10_khr.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033917,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x10_rgba.sr",
        "gb8_alpha8_astc_10x10_khr_srgb8_alpha8_astc_10x10_khr.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033918,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x10_rgba.srgb8_",
        "alpha8_astc_10x10_khr_srgb8_alpha8_astc_10x10_khr.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033919,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x10_rgba.srg",
        "b8_alpha8_astc_10x10_khr_srgb8_alpha8_astc_10x10_khr.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033920,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x10_rgba.srg",
        "b8_alpha8_astc_10x10_khr_srgb8_alpha8_astc_10x10_khr.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033921,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x10_rgba.sr",
        "gb8_alpha8_astc_10x10_khr_srgb8_alpha8_astc_10x10_khr.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033922,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x10_rgba.srgb8_",
        "alpha8_astc_10x10_khr_srgb8_alpha8_astc_10x10_khr.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033923,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x10_rgba.sr",
        "gb8_alpha8_astc_10x10_khr_srgb8_alpha8_astc_10x10_khr.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033924,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x10_rgba.sr",
        "gb8_alpha8_astc_10x10_khr_srgb8_alpha8_astc_10x10_khr.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033925,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x10_rgba.s",
        "rgb8_alpha8_astc_10x10_khr_srgb8_alpha8_astc_10x10_khr.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033926,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x10_rgba.srgb8",
        "_alpha8_astc_10x10_khr_srgb8_alpha8_astc_10x10_khr.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033927,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x10_rgba.srgb8_",
        "alpha8_astc_10x10_khr_srgb8_alpha8_astc_10x10_khr.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033928,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x10_rgba.srgb8_",
        "alpha8_astc_10x10_khr_srgb8_alpha8_astc_10x10_khr.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033929,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x10_rgba.srgb8",
        "_alpha8_astc_10x10_khr_srgb8_alpha8_astc_10x10_khr.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033930,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x10_rgba.srgb8_alp",
        "ha8_astc_10x10_khr_srgb8_alpha8_astc_10x10_khr.texture2d_array_to_texture2d_array");
