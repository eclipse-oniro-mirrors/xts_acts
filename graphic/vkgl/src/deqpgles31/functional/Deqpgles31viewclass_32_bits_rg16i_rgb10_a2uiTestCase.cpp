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
#include "../ActsDeqpgles310028TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027883,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rg16i_rgb10_a2ui.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027884,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rg16i_rgb10_a2ui.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027885,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rg16i_rgb10_a2ui.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027886,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.rg16i_rgb10_a2ui.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027887,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rg16i_rgb10_a2ui.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027888,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rg16i_rgb10_a2ui.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027889,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rg16i_rgb10_a2ui.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027890,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rg16i_rgb10_a2ui.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027891,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.rg16i_rgb10_a2ui.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027892,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rg16i_rgb10_a2ui.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027893,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rg16i_rgb10_a2ui.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027894,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rg16i_rgb10_a2ui.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027895,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rg16i_rgb10_a2ui.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027896,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.rg16i_rgb10_a2ui.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027897,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rg16i_rgb10_a2ui.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027898,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.rg16i_rgb10_a2ui.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027899,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.rg16i_rgb10_a2ui.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027900,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.rg16i_rgb10_a2ui.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027901,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_",
        "32_bits.rg16i_rgb10_a2ui.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027902,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.rg16i_rgb10_a2ui.texture2d_array_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027903,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rg16i_rgb10_a2ui.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027904,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rg16i_rgb10_a2ui.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027905,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rg16i_rgb10_a2ui.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027906,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.rg16i_rgb10_a2ui.renderbuffer_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310028TestSuite, TestCase_027907,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.rg16i_rgb10_a2ui.renderbuffer_to_renderbuffer");
