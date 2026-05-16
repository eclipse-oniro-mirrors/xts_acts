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

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033723,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x5_rgba.srg",
        "b8_alpha8_astc_10x5_khr_srgb8_alpha8_astc_10x5_khr.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033724,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x5_rgba.srg",
        "b8_alpha8_astc_10x5_khr_srgb8_alpha8_astc_10x5_khr.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033725,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x5_rgba.sr",
        "gb8_alpha8_astc_10x5_khr_srgb8_alpha8_astc_10x5_khr.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033726,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x5_rgba.srgb8_",
        "alpha8_astc_10x5_khr_srgb8_alpha8_astc_10x5_khr.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033727,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x5_rgba.srg",
        "b8_alpha8_astc_10x5_khr_srgb8_alpha8_astc_10x5_khr.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033728,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x5_rgba.srg",
        "b8_alpha8_astc_10x5_khr_srgb8_alpha8_astc_10x5_khr.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033729,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x5_rgba.sr",
        "gb8_alpha8_astc_10x5_khr_srgb8_alpha8_astc_10x5_khr.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033730,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x5_rgba.srgb8_",
        "alpha8_astc_10x5_khr_srgb8_alpha8_astc_10x5_khr.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033731,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x5_rgba.sr",
        "gb8_alpha8_astc_10x5_khr_srgb8_alpha8_astc_10x5_khr.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033732,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x5_rgba.sr",
        "gb8_alpha8_astc_10x5_khr_srgb8_alpha8_astc_10x5_khr.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033733,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x5_rgba.s",
        "rgb8_alpha8_astc_10x5_khr_srgb8_alpha8_astc_10x5_khr.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033734,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x5_rgba.srgb8",
        "_alpha8_astc_10x5_khr_srgb8_alpha8_astc_10x5_khr.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033735,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x5_rgba.srgb8_",
        "alpha8_astc_10x5_khr_srgb8_alpha8_astc_10x5_khr.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033736,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x5_rgba.srgb8_",
        "alpha8_astc_10x5_khr_srgb8_alpha8_astc_10x5_khr.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033737,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x5_rgba.srgb8",
        "_alpha8_astc_10x5_khr_srgb8_alpha8_astc_10x5_khr.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033738,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x5_rgba.srgb8_alp",
        "ha8_astc_10x5_khr_srgb8_alpha8_astc_10x5_khr.texture2d_array_to_texture2d_array");
