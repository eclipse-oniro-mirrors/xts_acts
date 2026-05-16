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

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030000,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rgb10_a2_r32i.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030001,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rgb10_a2_r32i.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030002,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rgb10_a2_r32i.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030003,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rgb10_a2_r32i.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030004,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rgb10_a2_r32i.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030005,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rgb10_a2_r32i.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030006,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rgb10_a2_r32i.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030007,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rgb10_a2_r32i.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030008,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rgb10_a2_r32i.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030009,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rgb10_a2_r32i.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030010,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rgb10_a2_r32i.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030011,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rgb10_a2_r32i.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030012,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_32_bits.rgb10_a2_r32i.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030013,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rgb10_a2_r32i.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030014,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rgb10_a2_r32i.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030015,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rgb10_a2_r32i.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030016,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rgb10_a2_r32i.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030017,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rgb10_a2_r32i.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030018,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.rgb10_a2_r32i.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030019,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.rgb10_a2_r32i.texture2d_array_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030020,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rgb10_a2_r32i.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030021,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rgb10_a2_r32i.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030022,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rgb10_a2_r32i.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030023,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.rgb10_a2_r32i.renderbuffer_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030024,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rgb10_a2_r32i.renderbuffer_to_renderbuffer");
