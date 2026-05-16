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

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030960,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rgb9_e5_r32i.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030961,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rgb9_e5_r32i.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030962,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rgb9_e5_r32i.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030963,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rgb9_e5_r32i.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030964,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rgb9_e5_r32i.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030965,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rgb9_e5_r32i.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030966,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rgb9_e5_r32i.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030967,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rgb9_e5_r32i.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030968,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rgb9_e5_r32i.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030969,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rgb9_e5_r32i.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030970,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rgb9_e5_r32i.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030971,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rgb9_e5_r32i.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030972,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_32_bits.rgb9_e5_r32i.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030973,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rgb9_e5_r32i.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030974,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rgb9_e5_r32i.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030975,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rgb9_e5_r32i.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030976,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rgb9_e5_r32i.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030977,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rgb9_e5_r32i.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030978,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.rgb9_e5_r32i.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030979,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.rgb9_e5_r32i.texture2d_array_to_renderbuffer");
