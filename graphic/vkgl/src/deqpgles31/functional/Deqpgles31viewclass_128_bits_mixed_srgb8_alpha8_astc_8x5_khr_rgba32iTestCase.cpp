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

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037079,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.srgb8_alpha8_astc_8x5_khr_rgba32i.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037080,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.srgb8_alpha8_astc_8x5_khr_rgba32i.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037081,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_",
        "mixed.srgb8_alpha8_astc_8x5_khr_rgba32i.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037082,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixe",
        "d.srgb8_alpha8_astc_8x5_khr_rgba32i.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037083,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mix",
        "ed.srgb8_alpha8_astc_8x5_khr_rgba32i.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037084,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.srgb8_alpha8_astc_8x5_khr_rgba32i.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037085,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.srgb8_alpha8_astc_8x5_khr_rgba32i.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037086,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_",
        "mixed.srgb8_alpha8_astc_8x5_khr_rgba32i.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037087,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixe",
        "d.srgb8_alpha8_astc_8x5_khr_rgba32i.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037088,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mix",
        "ed.srgb8_alpha8_astc_8x5_khr_rgba32i.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037089,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_",
        "mixed.srgb8_alpha8_astc_8x5_khr_rgba32i.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037090,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_",
        "mixed.srgb8_alpha8_astc_8x5_khr_rgba32i.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037091,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits",
        "_mixed.srgb8_alpha8_astc_8x5_khr_rgba32i.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037092,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mix",
        "ed.srgb8_alpha8_astc_8x5_khr_rgba32i.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037093,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mi",
        "xed.srgb8_alpha8_astc_8x5_khr_rgba32i.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037094,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixe",
        "d.srgb8_alpha8_astc_8x5_khr_rgba32i.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037095,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixe",
        "d.srgb8_alpha8_astc_8x5_khr_rgba32i.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037096,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mix",
        "ed.srgb8_alpha8_astc_8x5_khr_rgba32i.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037097,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed.s",
        "rgb8_alpha8_astc_8x5_khr_rgba32i.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037098,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed.",
        "srgb8_alpha8_astc_8x5_khr_rgba32i.texture2d_array_to_renderbuffer");
