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
#include "../ActsDeqpgles310030TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029890,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rgb10_a2ui_rgb10_a2.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029891,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rgb10_a2ui_rgb10_a2.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029892,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rgb10_a2ui_rgb10_a2.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029893,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.rgb10_a2ui_rgb10_a2.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029894,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.rgb10_a2ui_rgb10_a2.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029895,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rgb10_a2ui_rgb10_a2.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029896,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rgb10_a2ui_rgb10_a2.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029897,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rgb10_a2ui_rgb10_a2.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029898,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.rgb10_a2ui_rgb10_a2.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029899,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.rgb10_a2ui_rgb10_a2.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029900,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rgb10_a2ui_rgb10_a2.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029901,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rgb10_a2ui_rgb10_a2.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029902,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rgb10_a2ui_rgb10_a2.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029903,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.rgb10_a2ui_rgb10_a2.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029904,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.rgb10_a2ui_rgb10_a2.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029905,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.rgb10_a2ui_rgb10_a2.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029906,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.rgb10_a2ui_rgb10_a2.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029907,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.rgb10_a2ui_rgb10_a2.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029908,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_3",
        "2_bits.rgb10_a2ui_rgb10_a2.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029909,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_",
        "32_bits.rgb10_a2ui_rgb10_a2.texture2d_array_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029910,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.rgb10_a2ui_rgb10_a2.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029911,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.rgb10_a2ui_rgb10_a2.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029912,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.rgb10_a2ui_rgb10_a2.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029913,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_",
        "32_bits.rgb10_a2ui_rgb10_a2.renderbuffer_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029914,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.rgb10_a2ui_rgb10_a2.renderbuffer_to_renderbuffer");
