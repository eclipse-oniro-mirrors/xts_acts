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

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035559,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits",
        "_mixed.rgba_astc_10x10_khr_rgba32ui.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035560,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits",
        "_mixed.rgba_astc_10x10_khr_rgba32ui.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035561,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bit",
        "s_mixed.rgba_astc_10x10_khr_rgba32ui.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035562,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mi",
        "xed.rgba_astc_10x10_khr_rgba32ui.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035563,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_",
        "mixed.rgba_astc_10x10_khr_rgba32ui.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035564,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits",
        "_mixed.rgba_astc_10x10_khr_rgba32ui.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035565,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits",
        "_mixed.rgba_astc_10x10_khr_rgba32ui.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035566,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bit",
        "s_mixed.rgba_astc_10x10_khr_rgba32ui.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035567,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mi",
        "xed.rgba_astc_10x10_khr_rgba32ui.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035568,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_",
        "mixed.rgba_astc_10x10_khr_rgba32ui.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035569,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bit",
        "s_mixed.rgba_astc_10x10_khr_rgba32ui.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035570,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bit",
        "s_mixed.rgba_astc_10x10_khr_rgba32ui.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035571,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bi",
        "ts_mixed.rgba_astc_10x10_khr_rgba32ui.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035572,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.rgba_astc_10x10_khr_rgba32ui.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035573,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits",
        "_mixed.rgba_astc_10x10_khr_rgba32ui.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035574,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mi",
        "xed.rgba_astc_10x10_khr_rgba32ui.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035575,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mi",
        "xed.rgba_astc_10x10_khr_rgba32ui.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035576,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.rgba_astc_10x10_khr_rgba32ui.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035577,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixed",
        ".rgba_astc_10x10_khr_rgba32ui.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035578,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mix",
        "ed.rgba_astc_10x10_khr_rgba32ui.texture2d_array_to_renderbuffer");
