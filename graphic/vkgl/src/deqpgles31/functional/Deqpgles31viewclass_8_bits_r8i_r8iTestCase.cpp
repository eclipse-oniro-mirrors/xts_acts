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

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032842,
        "dEQP-GLES31.functional.copy_image.non_compressed",
        ".viewclass_8_bits.r8i_r8i.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032843,
        "dEQP-GLES31.functional.copy_image.non_compressed",
        ".viewclass_8_bits.r8i_r8i.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032844,
        "dEQP-GLES31.functional.copy_image.non_compresse",
        "d.viewclass_8_bits.r8i_r8i.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032845,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_8_bits.r8i_r8i.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032846,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_8_bits.r8i_r8i.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032847,
        "dEQP-GLES31.functional.copy_image.non_compressed",
        ".viewclass_8_bits.r8i_r8i.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032848,
        "dEQP-GLES31.functional.copy_image.non_compressed",
        ".viewclass_8_bits.r8i_r8i.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032849,
        "dEQP-GLES31.functional.copy_image.non_compresse",
        "d.viewclass_8_bits.r8i_r8i.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032850,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_8_bits.r8i_r8i.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032851,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_8_bits.r8i_r8i.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032852,
        "dEQP-GLES31.functional.copy_image.non_compresse",
        "d.viewclass_8_bits.r8i_r8i.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032853,
        "dEQP-GLES31.functional.copy_image.non_compresse",
        "d.viewclass_8_bits.r8i_r8i.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032854,
        "dEQP-GLES31.functional.copy_image.non_compress",
        "ed.viewclass_8_bits.r8i_r8i.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032855,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_8_bits.r8i_r8i.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032856,
        "dEQP-GLES31.functional.copy_image.non_compressed",
        ".viewclass_8_bits.r8i_r8i.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032857,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_8_bits.r8i_r8i.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032858,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_8_bits.r8i_r8i.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032859,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_8_bits.r8i_r8i.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032860,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_8_bits.r8i_r8i.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032861,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_8_bits.r8i_r8i.texture2d_array_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032862,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_8_bits.r8i_r8i.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032863,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_8_bits.r8i_r8i.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032864,
        "dEQP-GLES31.functional.copy_image.non_compressed",
        ".viewclass_8_bits.r8i_r8i.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032865,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_8_bits.r8i_r8i.renderbuffer_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310033TestSuite, TestCase_032866,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_8_bits.r8i_r8i.renderbuffer_to_renderbuffer");
