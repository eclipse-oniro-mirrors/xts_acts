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
#include "../ActsDeqpgles310028TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027281,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.r32ui_r11f_g11f_b10f.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027282,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.r32ui_r11f_g11f_b10f.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027283,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.r32ui_r11f_g11f_b10f.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027284,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.r32ui_r11f_g11f_b10f.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027285,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.r32ui_r11f_g11f_b10f.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027286,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.r32ui_r11f_g11f_b10f.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027287,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.r32ui_r11f_g11f_b10f.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027288,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.r32ui_r11f_g11f_b10f.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027289,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.r32ui_r11f_g11f_b10f.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027290,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.r32ui_r11f_g11f_b10f.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027291,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.r32ui_r11f_g11f_b10f.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027292,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.r32ui_r11f_g11f_b10f.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027293,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.r32ui_r11f_g11f_b10f.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027294,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.r32ui_r11f_g11f_b10f.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027295,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.r32ui_r11f_g11f_b10f.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027296,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_32",
        "_bits.r32ui_r11f_g11f_b10f.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027297,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.r32ui_r11f_g11f_b10f.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027298,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.r32ui_r11f_g11f_b10f.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027299,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.r32ui_r11f_g11f_b10f.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027300,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_",
        "32_bits.r32ui_r11f_g11f_b10f.renderbuffer_to_texture2d_array");
