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

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030775,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.srgb8_alpha8_rgba8i.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030776,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.srgb8_alpha8_rgba8i.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030777,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.srgb8_alpha8_rgba8i.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030778,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.srgb8_alpha8_rgba8i.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030779,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.srgb8_alpha8_rgba8i.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030780,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.srgb8_alpha8_rgba8i.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030781,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.srgb8_alpha8_rgba8i.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030782,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.srgb8_alpha8_rgba8i.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030783,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.srgb8_alpha8_rgba8i.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030784,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.srgb8_alpha8_rgba8i.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030785,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.srgb8_alpha8_rgba8i.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030786,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.srgb8_alpha8_rgba8i.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030787,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.srgb8_alpha8_rgba8i.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030788,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.srgb8_alpha8_rgba8i.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030789,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.srgb8_alpha8_rgba8i.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030790,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.srgb8_alpha8_rgba8i.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030791,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.srgb8_alpha8_rgba8i.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030792,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.srgb8_alpha8_rgba8i.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030793,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_3",
        "2_bits.srgb8_alpha8_rgba8i.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030794,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_",
        "32_bits.srgb8_alpha8_rgba8i.texture2d_array_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030795,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.srgb8_alpha8_rgba8i.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030796,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.srgb8_alpha8_rgba8i.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030797,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.srgb8_alpha8_rgba8i.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030798,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_",
        "32_bits.srgb8_alpha8_rgba8i.renderbuffer_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030799,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.srgb8_alpha8_rgba8i.renderbuffer_to_renderbuffer");
