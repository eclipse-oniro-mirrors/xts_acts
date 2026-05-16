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

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035379,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bit",
        "s_mixed.rgba32ui_rgba_astc_8x8_khr.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035380,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bit",
        "s_mixed.rgba32ui_rgba_astc_8x8_khr.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035381,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bi",
        "ts_mixed.rgba32ui_rgba_astc_8x8_khr.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035382,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.rgba32ui_rgba_astc_8x8_khr.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035383,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bit",
        "s_mixed.rgba32ui_rgba_astc_8x8_khr.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035384,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bit",
        "s_mixed.rgba32ui_rgba_astc_8x8_khr.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035385,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bi",
        "ts_mixed.rgba32ui_rgba_astc_8x8_khr.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035386,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.rgba32ui_rgba_astc_8x8_khr.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035387,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bi",
        "ts_mixed.rgba32ui_rgba_astc_8x8_khr.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035388,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bi",
        "ts_mixed.rgba32ui_rgba_astc_8x8_khr.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035389,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_b",
        "its_mixed.rgba32ui_rgba_astc_8x8_khr.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035390,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_",
        "mixed.rgba32ui_rgba_astc_8x8_khr.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035391,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.rgba32ui_rgba_astc_8x8_khr.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035392,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.rgba32ui_rgba_astc_8x8_khr.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035393,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_",
        "mixed.rgba32ui_rgba_astc_8x8_khr.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035394,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixe",
        "d.rgba32ui_rgba_astc_8x8_khr.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035395,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits",
        "_mixed.rgba32ui_rgba_astc_8x8_khr.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035396,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits",
        "_mixed.rgba32ui_rgba_astc_8x8_khr.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035397,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bit",
        "s_mixed.rgba32ui_rgba_astc_8x8_khr.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035398,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mi",
        "xed.rgba32ui_rgba_astc_8x8_khr.renderbuffer_to_texture2d_array");
