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

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030940,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.srgb8_alpha8_rgb9_e5.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030941,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.srgb8_alpha8_rgb9_e5.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030942,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.srgb8_alpha8_rgb9_e5.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030943,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.srgb8_alpha8_rgb9_e5.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030944,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.srgb8_alpha8_rgb9_e5.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030945,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.srgb8_alpha8_rgb9_e5.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030946,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.srgb8_alpha8_rgb9_e5.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030947,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.srgb8_alpha8_rgb9_e5.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030948,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.srgb8_alpha8_rgb9_e5.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030949,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.srgb8_alpha8_rgb9_e5.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030950,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.srgb8_alpha8_rgb9_e5.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030951,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.srgb8_alpha8_rgb9_e5.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030952,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.srgb8_alpha8_rgb9_e5.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030953,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.srgb8_alpha8_rgb9_e5.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030954,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.srgb8_alpha8_rgb9_e5.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030955,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_32",
        "_bits.srgb8_alpha8_rgb9_e5.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030956,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.srgb8_alpha8_rgb9_e5.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030957,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.srgb8_alpha8_rgb9_e5.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030958,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.srgb8_alpha8_rgb9_e5.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030959,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_",
        "32_bits.srgb8_alpha8_rgb9_e5.renderbuffer_to_texture2d_array");
