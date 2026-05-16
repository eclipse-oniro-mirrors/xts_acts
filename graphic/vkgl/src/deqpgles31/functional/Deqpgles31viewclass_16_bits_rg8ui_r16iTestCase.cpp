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

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032445,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_16_bits.rg8ui_r16i.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032446,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_16_bits.rg8ui_r16i.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032447,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_16_bits.rg8ui_r16i.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032448,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_16_bits.rg8ui_r16i.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032449,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_16_bits.rg8ui_r16i.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032450,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_16_bits.rg8ui_r16i.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032451,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_16_bits.rg8ui_r16i.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032452,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_16_bits.rg8ui_r16i.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032453,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_16_bits.rg8ui_r16i.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032454,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_16_bits.rg8ui_r16i.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032455,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_16_bits.rg8ui_r16i.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032456,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_16_bits.rg8ui_r16i.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032457,
        "dEQP-GLES31.functional.copy_image.non_compressed",
        ".viewclass_16_bits.rg8ui_r16i.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032458,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_16_bits.rg8ui_r16i.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032459,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_16_bits.rg8ui_r16i.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032460,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_16_bits.rg8ui_r16i.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032461,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_16_bits.rg8ui_r16i.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032462,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_16_bits.rg8ui_r16i.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032463,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_16_bits.rg8ui_r16i.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032464,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_16_bits.rg8ui_r16i.texture2d_array_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032465,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_16_bits.rg8ui_r16i.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032466,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_16_bits.rg8ui_r16i.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032467,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_16_bits.rg8ui_r16i.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032468,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_16_bits.rg8ui_r16i.renderbuffer_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032469,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_16_bits.rg8ui_r16i.renderbuffer_to_renderbuffer");
