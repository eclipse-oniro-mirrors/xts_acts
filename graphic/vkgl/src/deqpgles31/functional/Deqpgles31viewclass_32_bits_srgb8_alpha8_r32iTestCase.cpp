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

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030630,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.srgb8_alpha8_r32i.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030631,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.srgb8_alpha8_r32i.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030632,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.srgb8_alpha8_r32i.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030633,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.srgb8_alpha8_r32i.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030634,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.srgb8_alpha8_r32i.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030635,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.srgb8_alpha8_r32i.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030636,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.srgb8_alpha8_r32i.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030637,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.srgb8_alpha8_r32i.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030638,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.srgb8_alpha8_r32i.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030639,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.srgb8_alpha8_r32i.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030640,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.srgb8_alpha8_r32i.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030641,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.srgb8_alpha8_r32i.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030642,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.srgb8_alpha8_r32i.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030643,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.srgb8_alpha8_r32i.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030644,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.srgb8_alpha8_r32i.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030645,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.srgb8_alpha8_r32i.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030646,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.srgb8_alpha8_r32i.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030647,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.srgb8_alpha8_r32i.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030648,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_",
        "32_bits.srgb8_alpha8_r32i.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030649,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.srgb8_alpha8_r32i.texture2d_array_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030650,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.srgb8_alpha8_r32i.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030651,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.srgb8_alpha8_r32i.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030652,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.srgb8_alpha8_r32i.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030653,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.srgb8_alpha8_r32i.renderbuffer_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030654,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.srgb8_alpha8_r32i.renderbuffer_to_renderbuffer");
