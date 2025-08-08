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

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029398,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.r11f_g11f_b10f_r32i.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029399,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.r11f_g11f_b10f_r32i.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029400,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.r11f_g11f_b10f_r32i.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029401,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.r11f_g11f_b10f_r32i.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029402,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.r11f_g11f_b10f_r32i.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029403,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.r11f_g11f_b10f_r32i.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029404,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.r11f_g11f_b10f_r32i.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029405,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.r11f_g11f_b10f_r32i.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029406,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.r11f_g11f_b10f_r32i.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029407,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.r11f_g11f_b10f_r32i.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029408,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.r11f_g11f_b10f_r32i.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029409,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.r11f_g11f_b10f_r32i.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029410,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_32_bits.r11f_g11f_b10f_r32i.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029411,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.r11f_g11f_b10f_r32i.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029412,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.r11f_g11f_b10f_r32i.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029413,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.r11f_g11f_b10f_r32i.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029414,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.r11f_g11f_b10f_r32i.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029415,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.r11f_g11f_b10f_r32i.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029416,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_3",
        "2_bits.r11f_g11f_b10f_r32i.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029417,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_",
        "32_bits.r11f_g11f_b10f_r32i.texture2d_array_to_renderbuffer");
