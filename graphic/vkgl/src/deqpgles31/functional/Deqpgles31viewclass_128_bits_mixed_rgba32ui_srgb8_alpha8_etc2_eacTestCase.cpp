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

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035039,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_",
        "mixed.rgba32ui_srgb8_alpha8_etc2_eac.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035040,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits",
        "_mixed.rgba32ui_srgb8_alpha8_etc2_eac.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035041,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_",
        "mixed.rgba32ui_srgb8_alpha8_etc2_eac.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035042,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits",
        "_mixed.rgba32ui_srgb8_alpha8_etc2_eac.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035043,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits",
        "_mixed.rgba32ui_srgb8_alpha8_etc2_eac.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035044,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bit",
        "s_mixed.rgba32ui_srgb8_alpha8_etc2_eac.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035045,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mix",
        "ed.rgba32ui_srgb8_alpha8_etc2_eac.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035046,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mi",
        "xed.rgba32ui_srgb8_alpha8_etc2_eac.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035047,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.rgba32ui_srgb8_alpha8_etc2_eac.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310036TestSuite, TestCase_035048,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_",
        "mixed.rgba32ui_srgb8_alpha8_etc2_eac.renderbuffer_to_cubemap");
