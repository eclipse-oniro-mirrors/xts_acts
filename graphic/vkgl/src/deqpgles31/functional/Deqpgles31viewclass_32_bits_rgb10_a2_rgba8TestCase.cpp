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

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030120,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rgb10_a2_rgba8.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030121,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rgb10_a2_rgba8.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030122,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rgb10_a2_rgba8.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030123,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.rgb10_a2_rgba8.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030124,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rgb10_a2_rgba8.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030125,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rgb10_a2_rgba8.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030126,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rgb10_a2_rgba8.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030127,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rgb10_a2_rgba8.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030128,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.rgb10_a2_rgba8.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030129,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rgb10_a2_rgba8.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030130,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rgb10_a2_rgba8.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030131,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rgb10_a2_rgba8.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030132,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rgb10_a2_rgba8.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030133,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rgb10_a2_rgba8.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030134,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rgb10_a2_rgba8.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030135,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.rgb10_a2_rgba8.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030136,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.rgb10_a2_rgba8.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030137,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rgb10_a2_rgba8.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030138,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.rgb10_a2_rgba8.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030139,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.rgb10_a2_rgba8.texture2d_array_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030140,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rgb10_a2_rgba8.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030141,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rgb10_a2_rgba8.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030142,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rgb10_a2_rgba8.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030143,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.rgb10_a2_rgba8.renderbuffer_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310031TestSuite, TestCase_030144,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.rgb10_a2_rgba8.renderbuffer_to_renderbuffer");
