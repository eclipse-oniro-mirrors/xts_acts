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

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030845,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.srgb8_alpha8_rgb10_a2ui.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030846,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.srgb8_alpha8_rgb10_a2ui.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030847,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.srgb8_alpha8_rgb10_a2ui.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030848,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_",
        "32_bits.srgb8_alpha8_rgb10_a2ui.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030849,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.srgb8_alpha8_rgb10_a2ui.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030850,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.srgb8_alpha8_rgb10_a2ui.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030851,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.srgb8_alpha8_rgb10_a2ui.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030852,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.srgb8_alpha8_rgb10_a2ui.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030853,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_",
        "32_bits.srgb8_alpha8_rgb10_a2ui.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030854,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.srgb8_alpha8_rgb10_a2ui.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030855,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.srgb8_alpha8_rgb10_a2ui.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030856,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.srgb8_alpha8_rgb10_a2ui.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030857,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.srgb8_alpha8_rgb10_a2ui.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030858,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.srgb8_alpha8_rgb10_a2ui.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030859,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.srgb8_alpha8_rgb10_a2ui.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030860,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_",
        "32_bits.srgb8_alpha8_rgb10_a2ui.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030861,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_",
        "32_bits.srgb8_alpha8_rgb10_a2ui.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030862,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.srgb8_alpha8_rgb10_a2ui.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030863,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_32_",
        "bits.srgb8_alpha8_rgb10_a2ui.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030864,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_32",
        "_bits.srgb8_alpha8_rgb10_a2ui.texture2d_array_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030865,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.srgb8_alpha8_rgb10_a2ui.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030866,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.srgb8_alpha8_rgb10_a2ui.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030867,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.srgb8_alpha8_rgb10_a2ui.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030868,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_32",
        "_bits.srgb8_alpha8_rgb10_a2ui.renderbuffer_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030869,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_",
        "32_bits.srgb8_alpha8_rgb10_a2ui.renderbuffer_to_renderbuffer");
