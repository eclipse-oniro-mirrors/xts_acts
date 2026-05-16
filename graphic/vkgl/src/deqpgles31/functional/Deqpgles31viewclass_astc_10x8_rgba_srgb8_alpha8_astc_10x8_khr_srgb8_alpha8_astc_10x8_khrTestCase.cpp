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

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033851,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x8_rgba.srg",
        "b8_alpha8_astc_10x8_khr_srgb8_alpha8_astc_10x8_khr.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033852,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x8_rgba.srg",
        "b8_alpha8_astc_10x8_khr_srgb8_alpha8_astc_10x8_khr.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033853,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x8_rgba.sr",
        "gb8_alpha8_astc_10x8_khr_srgb8_alpha8_astc_10x8_khr.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033854,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x8_rgba.srgb8_",
        "alpha8_astc_10x8_khr_srgb8_alpha8_astc_10x8_khr.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033855,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x8_rgba.srg",
        "b8_alpha8_astc_10x8_khr_srgb8_alpha8_astc_10x8_khr.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033856,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x8_rgba.srg",
        "b8_alpha8_astc_10x8_khr_srgb8_alpha8_astc_10x8_khr.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033857,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x8_rgba.sr",
        "gb8_alpha8_astc_10x8_khr_srgb8_alpha8_astc_10x8_khr.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033858,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x8_rgba.srgb8_",
        "alpha8_astc_10x8_khr_srgb8_alpha8_astc_10x8_khr.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033859,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x8_rgba.sr",
        "gb8_alpha8_astc_10x8_khr_srgb8_alpha8_astc_10x8_khr.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033860,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x8_rgba.sr",
        "gb8_alpha8_astc_10x8_khr_srgb8_alpha8_astc_10x8_khr.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033861,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x8_rgba.s",
        "rgb8_alpha8_astc_10x8_khr_srgb8_alpha8_astc_10x8_khr.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033862,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x8_rgba.srgb8",
        "_alpha8_astc_10x8_khr_srgb8_alpha8_astc_10x8_khr.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033863,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x8_rgba.srgb8_",
        "alpha8_astc_10x8_khr_srgb8_alpha8_astc_10x8_khr.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033864,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x8_rgba.srgb8_",
        "alpha8_astc_10x8_khr_srgb8_alpha8_astc_10x8_khr.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033865,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x8_rgba.srgb8",
        "_alpha8_astc_10x8_khr_srgb8_alpha8_astc_10x8_khr.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033866,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_10x8_rgba.srgb8_alp",
        "ha8_astc_10x8_khr_srgb8_alpha8_astc_10x8_khr.texture2d_array_to_texture2d_array");
