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

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036199,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mix",
        "ed.srgb8_alpha8_astc_12x12_khr_rgba32ui.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036200,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mix",
        "ed.srgb8_alpha8_astc_12x12_khr_rgba32ui.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036201,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mi",
        "xed.srgb8_alpha8_astc_12x12_khr_rgba32ui.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036202,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed.",
        "srgb8_alpha8_astc_12x12_khr_rgba32ui.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036203,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixe",
        "d.srgb8_alpha8_astc_12x12_khr_rgba32ui.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036204,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mix",
        "ed.srgb8_alpha8_astc_12x12_khr_rgba32ui.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036205,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mix",
        "ed.srgb8_alpha8_astc_12x12_khr_rgba32ui.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036206,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mi",
        "xed.srgb8_alpha8_astc_12x12_khr_rgba32ui.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036207,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed.",
        "srgb8_alpha8_astc_12x12_khr_rgba32ui.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036208,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixe",
        "d.srgb8_alpha8_astc_12x12_khr_rgba32ui.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036209,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mi",
        "xed.srgb8_alpha8_astc_12x12_khr_rgba32ui.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036210,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mi",
        "xed.srgb8_alpha8_astc_12x12_khr_rgba32ui.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036211,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.srgb8_alpha8_astc_12x12_khr_rgba32ui.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036212,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed",
        ".srgb8_alpha8_astc_12x12_khr_rgba32ui.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036213,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mix",
        "ed.srgb8_alpha8_astc_12x12_khr_rgba32ui.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036214,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed.",
        "srgb8_alpha8_astc_12x12_khr_rgba32ui.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036215,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed.",
        "srgb8_alpha8_astc_12x12_khr_rgba32ui.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036216,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed",
        ".srgb8_alpha8_astc_12x12_khr_rgba32ui.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036217,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed.srg",
        "b8_alpha8_astc_12x12_khr_rgba32ui.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036218,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed.s",
        "rgb8_alpha8_astc_12x12_khr_rgba32ui.texture2d_array_to_renderbuffer");
