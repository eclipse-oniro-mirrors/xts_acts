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
#include "../ActsDeqpgles310035TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034603,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.rgba32f_srgb8_alpha8_astc_5x4_khr.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034604,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.rgba32f_srgb8_alpha8_astc_5x4_khr.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034605,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_",
        "mixed.rgba32f_srgb8_alpha8_astc_5x4_khr.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034606,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixe",
        "d.rgba32f_srgb8_alpha8_astc_5x4_khr.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034607,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.rgba32f_srgb8_alpha8_astc_5x4_khr.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034608,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.rgba32f_srgb8_alpha8_astc_5x4_khr.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034609,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_",
        "mixed.rgba32f_srgb8_alpha8_astc_5x4_khr.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034610,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixe",
        "d.rgba32f_srgb8_alpha8_astc_5x4_khr.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034611,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_",
        "mixed.rgba32f_srgb8_alpha8_astc_5x4_khr.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034612,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_",
        "mixed.rgba32f_srgb8_alpha8_astc_5x4_khr.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034613,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits",
        "_mixed.rgba32f_srgb8_alpha8_astc_5x4_khr.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034614,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mix",
        "ed.rgba32f_srgb8_alpha8_astc_5x4_khr.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034615,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixe",
        "d.rgba32f_srgb8_alpha8_astc_5x4_khr.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034616,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixe",
        "d.rgba32f_srgb8_alpha8_astc_5x4_khr.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034617,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mix",
        "ed.rgba32f_srgb8_alpha8_astc_5x4_khr.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034618,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed.r",
        "gba32f_srgb8_alpha8_astc_5x4_khr.texture2d_array_to_texture2d_array");