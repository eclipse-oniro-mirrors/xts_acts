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

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027231,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.r32ui_rgba8i.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027232,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.r32ui_rgba8i.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027233,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.r32ui_rgba8i.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027234,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.r32ui_rgba8i.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027235,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.r32ui_rgba8i.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027236,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.r32ui_rgba8i.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027237,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.r32ui_rgba8i.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027238,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.r32ui_rgba8i.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027239,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.r32ui_rgba8i.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027240,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.r32ui_rgba8i.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027241,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.r32ui_rgba8i.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027242,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.r32ui_rgba8i.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027243,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_32_bits.r32ui_rgba8i.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027244,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.r32ui_rgba8i.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027245,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.r32ui_rgba8i.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027246,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.r32ui_rgba8i.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027247,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.r32ui_rgba8i.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027248,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.r32ui_rgba8i.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027249,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.r32ui_rgba8i.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027250,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.r32ui_rgba8i.texture2d_array_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027251,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.r32ui_rgba8i.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027252,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.r32ui_rgba8i.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027253,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.r32ui_rgba8i.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027254,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.r32ui_rgba8i.renderbuffer_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027255,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.r32ui_rgba8i.renderbuffer_to_renderbuffer");
