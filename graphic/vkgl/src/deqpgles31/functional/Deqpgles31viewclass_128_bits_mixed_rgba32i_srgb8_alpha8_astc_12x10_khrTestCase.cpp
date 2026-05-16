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
#include "../ActsDeqpgles310038TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037339,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mi",
        "xed.rgba32i_srgb8_alpha8_astc_12x10_khr.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037340,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mi",
        "xed.rgba32i_srgb8_alpha8_astc_12x10_khr.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037341,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.rgba32i_srgb8_alpha8_astc_12x10_khr.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037342,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed",
        ".rgba32i_srgb8_alpha8_astc_12x10_khr.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037343,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mi",
        "xed.rgba32i_srgb8_alpha8_astc_12x10_khr.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037344,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mi",
        "xed.rgba32i_srgb8_alpha8_astc_12x10_khr.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037345,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.rgba32i_srgb8_alpha8_astc_12x10_khr.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037346,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed",
        ".rgba32i_srgb8_alpha8_astc_12x10_khr.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037347,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.rgba32i_srgb8_alpha8_astc_12x10_khr.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037348,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.rgba32i_srgb8_alpha8_astc_12x10_khr.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037349,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_",
        "mixed.rgba32i_srgb8_alpha8_astc_12x10_khr.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037350,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixe",
        "d.rgba32i_srgb8_alpha8_astc_12x10_khr.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037351,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed",
        ".rgba32i_srgb8_alpha8_astc_12x10_khr.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037352,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed",
        ".rgba32i_srgb8_alpha8_astc_12x10_khr.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037353,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixe",
        "d.rgba32i_srgb8_alpha8_astc_12x10_khr.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037354,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed.rg",
        "ba32i_srgb8_alpha8_astc_12x10_khr.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037355,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixe",
        "d.rgba32i_srgb8_alpha8_astc_12x10_khr.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037356,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixe",
        "d.rgba32i_srgb8_alpha8_astc_12x10_khr.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037357,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mix",
        "ed.rgba32i_srgb8_alpha8_astc_12x10_khr.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037358,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed.r",
        "gba32i_srgb8_alpha8_astc_12x10_khr.renderbuffer_to_texture2d_array");
