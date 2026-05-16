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

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035419,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bit",
        "s_mixed.rgba32ui_rgba_astc_10x5_khr.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035420,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bit",
        "s_mixed.rgba32ui_rgba_astc_10x5_khr.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035421,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bi",
        "ts_mixed.rgba32ui_rgba_astc_10x5_khr.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035422,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.rgba32ui_rgba_astc_10x5_khr.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035423,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bit",
        "s_mixed.rgba32ui_rgba_astc_10x5_khr.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035424,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bit",
        "s_mixed.rgba32ui_rgba_astc_10x5_khr.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035425,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bi",
        "ts_mixed.rgba32ui_rgba_astc_10x5_khr.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035426,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.rgba32ui_rgba_astc_10x5_khr.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035427,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bi",
        "ts_mixed.rgba32ui_rgba_astc_10x5_khr.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035428,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bi",
        "ts_mixed.rgba32ui_rgba_astc_10x5_khr.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035429,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_b",
        "its_mixed.rgba32ui_rgba_astc_10x5_khr.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035430,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_",
        "mixed.rgba32ui_rgba_astc_10x5_khr.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035431,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.rgba32ui_rgba_astc_10x5_khr.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035432,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.rgba32ui_rgba_astc_10x5_khr.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035433,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_",
        "mixed.rgba32ui_rgba_astc_10x5_khr.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035434,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixe",
        "d.rgba32ui_rgba_astc_10x5_khr.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035435,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_",
        "mixed.rgba32ui_rgba_astc_10x5_khr.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035436,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_",
        "mixed.rgba32ui_rgba_astc_10x5_khr.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035437,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits",
        "_mixed.rgba32ui_rgba_astc_10x5_khr.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035438,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mix",
        "ed.rgba32ui_rgba_astc_10x5_khr.renderbuffer_to_texture2d_array");
