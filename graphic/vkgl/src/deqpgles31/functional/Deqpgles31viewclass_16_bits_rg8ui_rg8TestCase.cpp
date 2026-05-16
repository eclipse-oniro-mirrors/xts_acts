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
#include "../ActsDeqpgles310033TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032495,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_16_bits.rg8ui_rg8.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032496,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_16_bits.rg8ui_rg8.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032497,
        "dEQP-GLES31.functional.copy_image.non_compressed",
        ".viewclass_16_bits.rg8ui_rg8.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032498,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_16_bits.rg8ui_rg8.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032499,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_16_bits.rg8ui_rg8.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032500,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_16_bits.rg8ui_rg8.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032501,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_16_bits.rg8ui_rg8.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032502,
        "dEQP-GLES31.functional.copy_image.non_compressed",
        ".viewclass_16_bits.rg8ui_rg8.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032503,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_16_bits.rg8ui_rg8.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032504,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_16_bits.rg8ui_rg8.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032505,
        "dEQP-GLES31.functional.copy_image.non_compressed",
        ".viewclass_16_bits.rg8ui_rg8.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032506,
        "dEQP-GLES31.functional.copy_image.non_compressed",
        ".viewclass_16_bits.rg8ui_rg8.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032507,
        "dEQP-GLES31.functional.copy_image.non_compresse",
        "d.viewclass_16_bits.rg8ui_rg8.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032508,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_16_bits.rg8ui_rg8.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032509,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_16_bits.rg8ui_rg8.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032510,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_16_bits.rg8ui_rg8.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032511,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_16_bits.rg8ui_rg8.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032512,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_16_bits.rg8ui_rg8.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032513,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_16_bits.rg8ui_rg8.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032514,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_16_bits.rg8ui_rg8.texture2d_array_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032515,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_16_bits.rg8ui_rg8.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032516,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_16_bits.rg8ui_rg8.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032517,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_16_bits.rg8ui_rg8.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032518,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_16_bits.rg8ui_rg8.renderbuffer_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032519,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_16_bits.rg8ui_rg8.renderbuffer_to_renderbuffer");
