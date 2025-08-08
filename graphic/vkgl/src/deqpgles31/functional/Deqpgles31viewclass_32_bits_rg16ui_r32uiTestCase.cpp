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
#include "../ActsDeqpgles310029TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028043,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rg16ui_r32ui.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028044,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rg16ui_r32ui.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028045,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rg16ui_r32ui.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028046,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rg16ui_r32ui.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028047,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rg16ui_r32ui.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028048,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rg16ui_r32ui.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028049,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rg16ui_r32ui.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028050,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rg16ui_r32ui.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028051,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rg16ui_r32ui.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028052,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rg16ui_r32ui.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028053,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rg16ui_r32ui.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028054,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rg16ui_r32ui.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028055,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_32_bits.rg16ui_r32ui.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028056,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rg16ui_r32ui.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028057,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rg16ui_r32ui.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028058,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rg16ui_r32ui.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028059,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rg16ui_r32ui.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028060,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rg16ui_r32ui.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028061,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.rg16ui_r32ui.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028062,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.rg16ui_r32ui.texture2d_array_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028063,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rg16ui_r32ui.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028064,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rg16ui_r32ui.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028065,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rg16ui_r32ui.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028066,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.rg16ui_r32ui.renderbuffer_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028067,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rg16ui_r32ui.renderbuffer_to_renderbuffer");
