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
#include "../ActsDeqpgles310037TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036139,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mix",
        "ed.rgba32ui_srgb8_alpha8_astc_12x10_khr.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036140,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mix",
        "ed.rgba32ui_srgb8_alpha8_astc_12x10_khr.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036141,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mi",
        "xed.rgba32ui_srgb8_alpha8_astc_12x10_khr.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036142,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed.",
        "rgba32ui_srgb8_alpha8_astc_12x10_khr.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036143,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mix",
        "ed.rgba32ui_srgb8_alpha8_astc_12x10_khr.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036144,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mix",
        "ed.rgba32ui_srgb8_alpha8_astc_12x10_khr.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036145,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mi",
        "xed.rgba32ui_srgb8_alpha8_astc_12x10_khr.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036146,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed.",
        "rgba32ui_srgb8_alpha8_astc_12x10_khr.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036147,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mi",
        "xed.rgba32ui_srgb8_alpha8_astc_12x10_khr.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036148,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mi",
        "xed.rgba32ui_srgb8_alpha8_astc_12x10_khr.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036149,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.rgba32ui_srgb8_alpha8_astc_12x10_khr.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036150,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed",
        ".rgba32ui_srgb8_alpha8_astc_12x10_khr.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036151,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed.",
        "rgba32ui_srgb8_alpha8_astc_12x10_khr.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036152,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed.",
        "rgba32ui_srgb8_alpha8_astc_12x10_khr.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036153,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed",
        ".rgba32ui_srgb8_alpha8_astc_12x10_khr.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036154,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed.rgb",
        "a32ui_srgb8_alpha8_astc_12x10_khr.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036155,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixe",
        "d.rgba32ui_srgb8_alpha8_astc_12x10_khr.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036156,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixe",
        "d.rgba32ui_srgb8_alpha8_astc_12x10_khr.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036157,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mix",
        "ed.rgba32ui_srgb8_alpha8_astc_12x10_khr.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036158,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed.r",
        "gba32ui_srgb8_alpha8_astc_12x10_khr.renderbuffer_to_texture2d_array");
