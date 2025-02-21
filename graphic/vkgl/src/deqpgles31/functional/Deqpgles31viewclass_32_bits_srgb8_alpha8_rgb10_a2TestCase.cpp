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
#include "../ActsDeqpgles310031TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030870,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.srgb8_alpha8_rgb10_a2.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030871,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.srgb8_alpha8_rgb10_a2.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030872,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.srgb8_alpha8_rgb10_a2.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030873,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.srgb8_alpha8_rgb10_a2.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030874,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.srgb8_alpha8_rgb10_a2.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030875,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.srgb8_alpha8_rgb10_a2.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030876,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.srgb8_alpha8_rgb10_a2.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030877,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.srgb8_alpha8_rgb10_a2.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030878,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.srgb8_alpha8_rgb10_a2.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030879,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.srgb8_alpha8_rgb10_a2.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030880,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.srgb8_alpha8_rgb10_a2.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030881,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.srgb8_alpha8_rgb10_a2.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030882,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.srgb8_alpha8_rgb10_a2.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030883,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.srgb8_alpha8_rgb10_a2.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030884,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.srgb8_alpha8_rgb10_a2.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030885,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.srgb8_alpha8_rgb10_a2.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030886,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.srgb8_alpha8_rgb10_a2.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030887,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.srgb8_alpha8_rgb10_a2.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030888,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_32",
        "_bits.srgb8_alpha8_rgb10_a2.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030889,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_3",
        "2_bits.srgb8_alpha8_rgb10_a2.texture2d_array_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030890,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.srgb8_alpha8_rgb10_a2.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030891,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.srgb8_alpha8_rgb10_a2.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030892,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.srgb8_alpha8_rgb10_a2.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030893,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_3",
        "2_bits.srgb8_alpha8_rgb10_a2.renderbuffer_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030894,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.srgb8_alpha8_rgb10_a2.renderbuffer_to_renderbuffer");
