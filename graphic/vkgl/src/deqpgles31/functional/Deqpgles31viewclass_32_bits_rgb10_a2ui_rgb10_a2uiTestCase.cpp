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

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029865,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.rgb10_a2ui_rgb10_a2ui.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029866,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.rgb10_a2ui_rgb10_a2ui.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029867,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rgb10_a2ui_rgb10_a2ui.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029868,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.rgb10_a2ui_rgb10_a2ui.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029869,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.rgb10_a2ui_rgb10_a2ui.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029870,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.rgb10_a2ui_rgb10_a2ui.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029871,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.rgb10_a2ui_rgb10_a2ui.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029872,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rgb10_a2ui_rgb10_a2ui.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029873,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.rgb10_a2ui_rgb10_a2ui.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029874,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.rgb10_a2ui_rgb10_a2ui.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029875,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rgb10_a2ui_rgb10_a2ui.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029876,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rgb10_a2ui_rgb10_a2ui.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029877,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rgb10_a2ui_rgb10_a2ui.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029878,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.rgb10_a2ui_rgb10_a2ui.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029879,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.rgb10_a2ui_rgb10_a2ui.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029880,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.rgb10_a2ui_rgb10_a2ui.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029881,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.rgb10_a2ui_rgb10_a2ui.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029882,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.rgb10_a2ui_rgb10_a2ui.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029883,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_32",
        "_bits.rgb10_a2ui_rgb10_a2ui.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029884,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_3",
        "2_bits.rgb10_a2ui_rgb10_a2ui.texture2d_array_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029885,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.rgb10_a2ui_rgb10_a2ui.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029886,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.rgb10_a2ui_rgb10_a2ui.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029887,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.rgb10_a2ui_rgb10_a2ui.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029888,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_3",
        "2_bits.rgb10_a2ui_rgb10_a2ui.renderbuffer_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029889,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.rgb10_a2ui_rgb10_a2ui.renderbuffer_to_renderbuffer");
