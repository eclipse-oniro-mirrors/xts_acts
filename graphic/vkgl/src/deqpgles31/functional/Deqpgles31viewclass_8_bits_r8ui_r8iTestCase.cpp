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

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032937,
        "dEQP-GLES31.functional.copy_image.non_compressed",
        ".viewclass_8_bits.r8ui_r8i.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032938,
        "dEQP-GLES31.functional.copy_image.non_compressed",
        ".viewclass_8_bits.r8ui_r8i.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032939,
        "dEQP-GLES31.functional.copy_image.non_compresse",
        "d.viewclass_8_bits.r8ui_r8i.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032940,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_8_bits.r8ui_r8i.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032941,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_8_bits.r8ui_r8i.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032942,
        "dEQP-GLES31.functional.copy_image.non_compressed",
        ".viewclass_8_bits.r8ui_r8i.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032943,
        "dEQP-GLES31.functional.copy_image.non_compressed",
        ".viewclass_8_bits.r8ui_r8i.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032944,
        "dEQP-GLES31.functional.copy_image.non_compresse",
        "d.viewclass_8_bits.r8ui_r8i.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032945,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_8_bits.r8ui_r8i.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032946,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_8_bits.r8ui_r8i.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032947,
        "dEQP-GLES31.functional.copy_image.non_compresse",
        "d.viewclass_8_bits.r8ui_r8i.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032948,
        "dEQP-GLES31.functional.copy_image.non_compresse",
        "d.viewclass_8_bits.r8ui_r8i.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032949,
        "dEQP-GLES31.functional.copy_image.non_compress",
        "ed.viewclass_8_bits.r8ui_r8i.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032950,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_8_bits.r8ui_r8i.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032951,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_8_bits.r8ui_r8i.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032952,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_8_bits.r8ui_r8i.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032953,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_8_bits.r8ui_r8i.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032954,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_8_bits.r8ui_r8i.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032955,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_8_bits.r8ui_r8i.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032956,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_8_bits.r8ui_r8i.texture2d_array_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032957,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_8_bits.r8ui_r8i.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032958,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_8_bits.r8ui_r8i.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032959,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_8_bits.r8ui_r8i.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032960,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_8_bits.r8ui_r8i.renderbuffer_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032961,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_8_bits.r8ui_r8i.renderbuffer_to_renderbuffer");
