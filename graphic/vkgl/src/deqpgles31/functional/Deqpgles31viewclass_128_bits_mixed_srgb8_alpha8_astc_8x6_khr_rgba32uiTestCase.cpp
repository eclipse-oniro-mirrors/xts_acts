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

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035919,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mi",
        "xed.srgb8_alpha8_astc_8x6_khr_rgba32ui.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035920,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mi",
        "xed.srgb8_alpha8_astc_8x6_khr_rgba32ui.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035921,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.srgb8_alpha8_astc_8x6_khr_rgba32ui.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035922,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed",
        ".srgb8_alpha8_astc_8x6_khr_rgba32ui.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035923,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mix",
        "ed.srgb8_alpha8_astc_8x6_khr_rgba32ui.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035924,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mi",
        "xed.srgb8_alpha8_astc_8x6_khr_rgba32ui.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035925,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mi",
        "xed.srgb8_alpha8_astc_8x6_khr_rgba32ui.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035926,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.srgb8_alpha8_astc_8x6_khr_rgba32ui.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035927,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed",
        ".srgb8_alpha8_astc_8x6_khr_rgba32ui.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035928,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mix",
        "ed.srgb8_alpha8_astc_8x6_khr_rgba32ui.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035929,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.srgb8_alpha8_astc_8x6_khr_rgba32ui.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035930,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.srgb8_alpha8_astc_8x6_khr_rgba32ui.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035931,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_",
        "mixed.srgb8_alpha8_astc_8x6_khr_rgba32ui.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035932,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixe",
        "d.srgb8_alpha8_astc_8x6_khr_rgba32ui.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035933,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mi",
        "xed.srgb8_alpha8_astc_8x6_khr_rgba32ui.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035934,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed",
        ".srgb8_alpha8_astc_8x6_khr_rgba32ui.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035935,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed",
        ".srgb8_alpha8_astc_8x6_khr_rgba32ui.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035936,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixe",
        "d.srgb8_alpha8_astc_8x6_khr_rgba32ui.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035937,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed.sr",
        "gb8_alpha8_astc_8x6_khr_rgba32ui.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035938,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed.",
        "srgb8_alpha8_astc_8x6_khr_rgba32ui.texture2d_array_to_renderbuffer");
