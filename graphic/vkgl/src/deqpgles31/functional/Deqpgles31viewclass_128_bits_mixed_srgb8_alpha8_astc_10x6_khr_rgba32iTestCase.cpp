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

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037239,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mi",
        "xed.srgb8_alpha8_astc_10x6_khr_rgba32i.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037240,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mi",
        "xed.srgb8_alpha8_astc_10x6_khr_rgba32i.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037241,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.srgb8_alpha8_astc_10x6_khr_rgba32i.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037242,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed",
        ".srgb8_alpha8_astc_10x6_khr_rgba32i.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037243,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mix",
        "ed.srgb8_alpha8_astc_10x6_khr_rgba32i.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037244,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mi",
        "xed.srgb8_alpha8_astc_10x6_khr_rgba32i.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037245,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mi",
        "xed.srgb8_alpha8_astc_10x6_khr_rgba32i.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037246,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.srgb8_alpha8_astc_10x6_khr_rgba32i.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037247,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed",
        ".srgb8_alpha8_astc_10x6_khr_rgba32i.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037248,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mix",
        "ed.srgb8_alpha8_astc_10x6_khr_rgba32i.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037249,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.srgb8_alpha8_astc_10x6_khr_rgba32i.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037250,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.srgb8_alpha8_astc_10x6_khr_rgba32i.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037251,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_",
        "mixed.srgb8_alpha8_astc_10x6_khr_rgba32i.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037252,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixe",
        "d.srgb8_alpha8_astc_10x6_khr_rgba32i.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037253,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mi",
        "xed.srgb8_alpha8_astc_10x6_khr_rgba32i.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037254,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed",
        ".srgb8_alpha8_astc_10x6_khr_rgba32i.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037255,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed",
        ".srgb8_alpha8_astc_10x6_khr_rgba32i.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037256,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixe",
        "d.srgb8_alpha8_astc_10x6_khr_rgba32i.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037257,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed.sr",
        "gb8_alpha8_astc_10x6_khr_rgba32i.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037258,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed.",
        "srgb8_alpha8_astc_10x6_khr_rgba32i.texture2d_array_to_renderbuffer");
