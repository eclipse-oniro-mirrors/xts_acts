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
#include "../ActsDeqpgles310029TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028368,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rgba8_r32i.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028369,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rgba8_r32i.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028370,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_32_bits.rgba8_r32i.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028371,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rgba8_r32i.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028372,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rgba8_r32i.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028373,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rgba8_r32i.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028374,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rgba8_r32i.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028375,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_32_bits.rgba8_r32i.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028376,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rgba8_r32i.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028377,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rgba8_r32i.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028378,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_32_bits.rgba8_r32i.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028379,
        "dEQP-GLES31.functional.copy_image.non_compressed.",
        "viewclass_32_bits.rgba8_r32i.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028380,
        "dEQP-GLES31.functional.copy_image.non_compressed",
        ".viewclass_32_bits.rgba8_r32i.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028381,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rgba8_r32i.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028382,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rgba8_r32i.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028383,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rgba8_r32i.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028384,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rgba8_r32i.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028385,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rgba8_r32i.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028386,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.rgba8_r32i.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028387,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rgba8_r32i.texture2d_array_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028388,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rgba8_r32i.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028389,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rgba8_r32i.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028390,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rgba8_r32i.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028391,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rgba8_r32i.renderbuffer_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028392,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rgba8_r32i.renderbuffer_to_renderbuffer");
