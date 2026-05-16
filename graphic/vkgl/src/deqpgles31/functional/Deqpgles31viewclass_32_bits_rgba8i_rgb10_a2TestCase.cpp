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

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028958,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rgba8i_rgb10_a2.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028959,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rgba8i_rgb10_a2.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028960,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rgba8i_rgb10_a2.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028961,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.rgba8i_rgb10_a2.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028962,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rgba8i_rgb10_a2.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028963,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rgba8i_rgb10_a2.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028964,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.rgba8i_rgb10_a2.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028965,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rgba8i_rgb10_a2.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028966,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.rgba8i_rgb10_a2.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028967,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rgba8i_rgb10_a2.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028968,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rgba8i_rgb10_a2.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028969,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_32_bits.rgba8i_rgb10_a2.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028970,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_32_bits.rgba8i_rgb10_a2.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028971,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rgba8i_rgb10_a2.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028972,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rgba8i_rgb10_a2.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028973,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.rgba8i_rgb10_a2.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028974,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.rgba8i_rgb10_a2.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028975,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rgba8i_rgb10_a2.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028976,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.rgba8i_rgb10_a2.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028977,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.rgba8i_rgb10_a2.texture2d_array_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028978,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rgba8i_rgb10_a2.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028979,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rgba8i_rgb10_a2.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028980,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rgba8i_rgb10_a2.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028981,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.rgba8i_rgb10_a2.renderbuffer_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028982,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.rgba8i_rgb10_a2.renderbuffer_to_renderbuffer");
