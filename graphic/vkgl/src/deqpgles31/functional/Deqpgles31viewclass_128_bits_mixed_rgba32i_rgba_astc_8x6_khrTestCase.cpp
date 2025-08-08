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

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036539,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bi",
        "ts_mixed.rgba32i_rgba_astc_8x6_khr.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036540,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bi",
        "ts_mixed.rgba32i_rgba_astc_8x6_khr.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036541,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_b",
        "its_mixed.rgba32i_rgba_astc_8x6_khr.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036542,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_",
        "mixed.rgba32i_rgba_astc_8x6_khr.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036543,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bi",
        "ts_mixed.rgba32i_rgba_astc_8x6_khr.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036544,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bi",
        "ts_mixed.rgba32i_rgba_astc_8x6_khr.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036545,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_b",
        "its_mixed.rgba32i_rgba_astc_8x6_khr.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036546,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_",
        "mixed.rgba32i_rgba_astc_8x6_khr.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036547,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_b",
        "its_mixed.rgba32i_rgba_astc_8x6_khr.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036548,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_b",
        "its_mixed.rgba32i_rgba_astc_8x6_khr.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036549,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_",
        "bits_mixed.rgba32i_rgba_astc_8x6_khr.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036550,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits",
        "_mixed.rgba32i_rgba_astc_8x6_khr.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036551,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_",
        "mixed.rgba32i_rgba_astc_8x6_khr.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036552,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_",
        "mixed.rgba32i_rgba_astc_8x6_khr.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036553,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits",
        "_mixed.rgba32i_rgba_astc_8x6_khr.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036554,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mix",
        "ed.rgba32i_rgba_astc_8x6_khr.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036555,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits",
        "_mixed.rgba32i_rgba_astc_8x6_khr.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036556,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits",
        "_mixed.rgba32i_rgba_astc_8x6_khr.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036557,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bit",
        "s_mixed.rgba32i_rgba_astc_8x6_khr.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036558,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mi",
        "xed.rgba32i_rgba_astc_8x6_khr.renderbuffer_to_texture2d_array");
