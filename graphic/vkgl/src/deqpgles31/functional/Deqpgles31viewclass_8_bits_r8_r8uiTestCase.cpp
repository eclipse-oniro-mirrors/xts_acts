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

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032772,
        "dEQP-GLES31.functional.copy_image.non_compressed",
        ".viewclass_8_bits.r8_r8ui.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032773,
        "dEQP-GLES31.functional.copy_image.non_compressed",
        ".viewclass_8_bits.r8_r8ui.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032774,
        "dEQP-GLES31.functional.copy_image.non_compresse",
        "d.viewclass_8_bits.r8_r8ui.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032775,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_8_bits.r8_r8ui.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032776,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_8_bits.r8_r8ui.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032777,
        "dEQP-GLES31.functional.copy_image.non_compressed",
        ".viewclass_8_bits.r8_r8ui.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032778,
        "dEQP-GLES31.functional.copy_image.non_compressed",
        ".viewclass_8_bits.r8_r8ui.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032779,
        "dEQP-GLES31.functional.copy_image.non_compresse",
        "d.viewclass_8_bits.r8_r8ui.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032780,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_8_bits.r8_r8ui.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032781,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_8_bits.r8_r8ui.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032782,
        "dEQP-GLES31.functional.copy_image.non_compresse",
        "d.viewclass_8_bits.r8_r8ui.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032783,
        "dEQP-GLES31.functional.copy_image.non_compresse",
        "d.viewclass_8_bits.r8_r8ui.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032784,
        "dEQP-GLES31.functional.copy_image.non_compress",
        "ed.viewclass_8_bits.r8_r8ui.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032785,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_8_bits.r8_r8ui.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032786,
        "dEQP-GLES31.functional.copy_image.non_compressed",
        ".viewclass_8_bits.r8_r8ui.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032787,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_8_bits.r8_r8ui.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032788,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_8_bits.r8_r8ui.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032789,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_8_bits.r8_r8ui.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032790,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_8_bits.r8_r8ui.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032791,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_8_bits.r8_r8ui.texture2d_array_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032792,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_8_bits.r8_r8ui.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032793,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_8_bits.r8_r8ui.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032794,
        "dEQP-GLES31.functional.copy_image.non_compressed",
        ".viewclass_8_bits.r8_r8ui.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032795,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_8_bits.r8_r8ui.renderbuffer_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032796,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_8_bits.r8_r8ui.renderbuffer_to_renderbuffer");
