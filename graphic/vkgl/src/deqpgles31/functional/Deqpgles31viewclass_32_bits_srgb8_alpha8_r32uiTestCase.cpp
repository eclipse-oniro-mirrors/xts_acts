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

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030655,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.srgb8_alpha8_r32ui.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030656,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.srgb8_alpha8_r32ui.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030657,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.srgb8_alpha8_r32ui.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030658,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.srgb8_alpha8_r32ui.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030659,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.srgb8_alpha8_r32ui.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030660,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.srgb8_alpha8_r32ui.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030661,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.srgb8_alpha8_r32ui.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030662,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.srgb8_alpha8_r32ui.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030663,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.srgb8_alpha8_r32ui.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030664,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.srgb8_alpha8_r32ui.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030665,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.srgb8_alpha8_r32ui.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030666,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.srgb8_alpha8_r32ui.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030667,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.srgb8_alpha8_r32ui.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030668,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.srgb8_alpha8_r32ui.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030669,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.srgb8_alpha8_r32ui.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030670,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.srgb8_alpha8_r32ui.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030671,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.srgb8_alpha8_r32ui.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030672,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.srgb8_alpha8_r32ui.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030673,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_3",
        "2_bits.srgb8_alpha8_r32ui.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030674,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.srgb8_alpha8_r32ui.texture2d_array_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030675,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.srgb8_alpha8_r32ui.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030676,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.srgb8_alpha8_r32ui.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030677,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.srgb8_alpha8_r32ui.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030678,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.srgb8_alpha8_r32ui.renderbuffer_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030679,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.srgb8_alpha8_r32ui.renderbuffer_to_renderbuffer");
