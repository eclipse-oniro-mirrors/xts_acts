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

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037259,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mi",
        "xed.rgba32i_srgb8_alpha8_astc_10x8_khr.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037260,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mi",
        "xed.rgba32i_srgb8_alpha8_astc_10x8_khr.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037261,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.rgba32i_srgb8_alpha8_astc_10x8_khr.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037262,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed",
        ".rgba32i_srgb8_alpha8_astc_10x8_khr.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037263,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mi",
        "xed.rgba32i_srgb8_alpha8_astc_10x8_khr.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037264,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mi",
        "xed.rgba32i_srgb8_alpha8_astc_10x8_khr.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037265,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.rgba32i_srgb8_alpha8_astc_10x8_khr.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037266,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed",
        ".rgba32i_srgb8_alpha8_astc_10x8_khr.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037267,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.rgba32i_srgb8_alpha8_astc_10x8_khr.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037268,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.rgba32i_srgb8_alpha8_astc_10x8_khr.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037269,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_",
        "mixed.rgba32i_srgb8_alpha8_astc_10x8_khr.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037270,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixe",
        "d.rgba32i_srgb8_alpha8_astc_10x8_khr.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037271,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed",
        ".rgba32i_srgb8_alpha8_astc_10x8_khr.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037272,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed",
        ".rgba32i_srgb8_alpha8_astc_10x8_khr.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037273,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixe",
        "d.rgba32i_srgb8_alpha8_astc_10x8_khr.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037274,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed.rg",
        "ba32i_srgb8_alpha8_astc_10x8_khr.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037275,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mix",
        "ed.rgba32i_srgb8_alpha8_astc_10x8_khr.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037276,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mix",
        "ed.rgba32i_srgb8_alpha8_astc_10x8_khr.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037277,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mi",
        "xed.rgba32i_srgb8_alpha8_astc_10x8_khr.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037278,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed.",
        "rgba32i_srgb8_alpha8_astc_10x8_khr.renderbuffer_to_texture2d_array");
