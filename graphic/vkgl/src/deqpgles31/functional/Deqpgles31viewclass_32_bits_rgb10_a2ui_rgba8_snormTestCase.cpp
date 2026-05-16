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

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029915,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.rgb10_a2ui_rgba8_snorm.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029916,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.rgb10_a2ui_rgba8_snorm.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029917,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.rgb10_a2ui_rgba8_snorm.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029918,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_",
        "32_bits.rgb10_a2ui_rgba8_snorm.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029919,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.rgb10_a2ui_rgba8_snorm.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029920,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.rgb10_a2ui_rgba8_snorm.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029921,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.rgb10_a2ui_rgba8_snorm.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029922,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_",
        "32_bits.rgb10_a2ui_rgba8_snorm.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029923,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.rgb10_a2ui_rgba8_snorm.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029924,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.rgb10_a2ui_rgba8_snorm.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029925,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rgb10_a2ui_rgba8_snorm.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029926,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.rgb10_a2ui_rgba8_snorm.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029927,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_",
        "32_bits.rgb10_a2ui_rgba8_snorm.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029928,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_",
        "32_bits.rgb10_a2ui_rgba8_snorm.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029929,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.rgb10_a2ui_rgba8_snorm.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029930,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_32_",
        "bits.rgb10_a2ui_rgba8_snorm.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029931,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.rgb10_a2ui_rgba8_snorm.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029932,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.rgb10_a2ui_rgba8_snorm.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029933,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.rgb10_a2ui_rgba8_snorm.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029934,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_3",
        "2_bits.rgb10_a2ui_rgba8_snorm.renderbuffer_to_texture2d_array");
