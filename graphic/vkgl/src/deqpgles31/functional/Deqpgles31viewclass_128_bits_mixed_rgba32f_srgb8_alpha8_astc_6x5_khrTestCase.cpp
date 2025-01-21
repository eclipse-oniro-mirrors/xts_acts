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

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034667,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.rgba32f_srgb8_alpha8_astc_6x5_khr.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034668,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.rgba32f_srgb8_alpha8_astc_6x5_khr.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034669,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_",
        "mixed.rgba32f_srgb8_alpha8_astc_6x5_khr.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034670,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixe",
        "d.rgba32f_srgb8_alpha8_astc_6x5_khr.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034671,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.rgba32f_srgb8_alpha8_astc_6x5_khr.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034672,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.rgba32f_srgb8_alpha8_astc_6x5_khr.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034673,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_",
        "mixed.rgba32f_srgb8_alpha8_astc_6x5_khr.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034674,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixe",
        "d.rgba32f_srgb8_alpha8_astc_6x5_khr.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034675,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_",
        "mixed.rgba32f_srgb8_alpha8_astc_6x5_khr.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034676,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_",
        "mixed.rgba32f_srgb8_alpha8_astc_6x5_khr.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034677,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits",
        "_mixed.rgba32f_srgb8_alpha8_astc_6x5_khr.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034678,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mix",
        "ed.rgba32f_srgb8_alpha8_astc_6x5_khr.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034679,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixe",
        "d.rgba32f_srgb8_alpha8_astc_6x5_khr.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034680,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixe",
        "d.rgba32f_srgb8_alpha8_astc_6x5_khr.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034681,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mix",
        "ed.rgba32f_srgb8_alpha8_astc_6x5_khr.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034682,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed.r",
        "gba32f_srgb8_alpha8_astc_6x5_khr.texture2d_array_to_texture2d_array");
