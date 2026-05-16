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

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036239,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits",
        "_mixed.rgba32i_srgb8_alpha8_etc2_eac.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036240,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bit",
        "s_mixed.rgba32i_srgb8_alpha8_etc2_eac.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036241,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits",
        "_mixed.rgba32i_srgb8_alpha8_etc2_eac.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036242,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bit",
        "s_mixed.rgba32i_srgb8_alpha8_etc2_eac.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036243,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bit",
        "s_mixed.rgba32i_srgb8_alpha8_etc2_eac.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036244,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bi",
        "ts_mixed.rgba32i_srgb8_alpha8_etc2_eac.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036245,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mi",
        "xed.rgba32i_srgb8_alpha8_etc2_eac.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036246,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.rgba32i_srgb8_alpha8_etc2_eac.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036247,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.rgba32i_srgb8_alpha8_etc2_eac.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036248,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_",
        "mixed.rgba32i_srgb8_alpha8_etc2_eac.renderbuffer_to_cubemap");
