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
#include "../ActsDeqpgles310036TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035939,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mi",
        "xed.rgba32ui_srgb8_alpha8_astc_8x8_khr.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035940,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mi",
        "xed.rgba32ui_srgb8_alpha8_astc_8x8_khr.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035941,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.rgba32ui_srgb8_alpha8_astc_8x8_khr.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035942,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed",
        ".rgba32ui_srgb8_alpha8_astc_8x8_khr.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035943,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mi",
        "xed.rgba32ui_srgb8_alpha8_astc_8x8_khr.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035944,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mi",
        "xed.rgba32ui_srgb8_alpha8_astc_8x8_khr.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035945,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.rgba32ui_srgb8_alpha8_astc_8x8_khr.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035946,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed",
        ".rgba32ui_srgb8_alpha8_astc_8x8_khr.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035947,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.rgba32ui_srgb8_alpha8_astc_8x8_khr.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035948,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.rgba32ui_srgb8_alpha8_astc_8x8_khr.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035949,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_",
        "mixed.rgba32ui_srgb8_alpha8_astc_8x8_khr.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035950,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixe",
        "d.rgba32ui_srgb8_alpha8_astc_8x8_khr.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035951,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed",
        ".rgba32ui_srgb8_alpha8_astc_8x8_khr.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035952,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed",
        ".rgba32ui_srgb8_alpha8_astc_8x8_khr.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035953,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixe",
        "d.rgba32ui_srgb8_alpha8_astc_8x8_khr.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035954,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed.rg",
        "ba32ui_srgb8_alpha8_astc_8x8_khr.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035955,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mix",
        "ed.rgba32ui_srgb8_alpha8_astc_8x8_khr.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035956,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mix",
        "ed.rgba32ui_srgb8_alpha8_astc_8x8_khr.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035957,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mi",
        "xed.rgba32ui_srgb8_alpha8_astc_8x8_khr.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035958,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed.",
        "rgba32ui_srgb8_alpha8_astc_8x8_khr.renderbuffer_to_texture2d_array");