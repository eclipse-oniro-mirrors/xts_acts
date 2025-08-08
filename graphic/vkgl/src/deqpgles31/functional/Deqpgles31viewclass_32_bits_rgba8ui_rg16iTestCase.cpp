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
#include "../ActsDeqpgles310030TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029138,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rgba8ui_rg16i.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029139,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rgba8ui_rg16i.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029140,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rgba8ui_rg16i.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029141,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rgba8ui_rg16i.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029142,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rgba8ui_rg16i.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029143,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rgba8ui_rg16i.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029144,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rgba8ui_rg16i.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029145,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rgba8ui_rg16i.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029146,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rgba8ui_rg16i.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029147,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rgba8ui_rg16i.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029148,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rgba8ui_rg16i.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029149,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rgba8ui_rg16i.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029150,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_32_bits.rgba8ui_rg16i.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029151,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rgba8ui_rg16i.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029152,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rgba8ui_rg16i.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029153,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rgba8ui_rg16i.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029154,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rgba8ui_rg16i.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029155,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rgba8ui_rg16i.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029156,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.rgba8ui_rg16i.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029157,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.rgba8ui_rg16i.texture2d_array_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029158,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rgba8ui_rg16i.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029159,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rgba8ui_rg16i.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029160,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rgba8ui_rg16i.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029161,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.rgba8ui_rg16i.renderbuffer_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029162,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rgba8ui_rg16i.renderbuffer_to_renderbuffer");
