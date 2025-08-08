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

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029458,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.r11f_g11f_b10f_rg16ui.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029459,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.r11f_g11f_b10f_rg16ui.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029460,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.r11f_g11f_b10f_rg16ui.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029461,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.r11f_g11f_b10f_rg16ui.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029462,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.r11f_g11f_b10f_rg16ui.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029463,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.r11f_g11f_b10f_rg16ui.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029464,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.r11f_g11f_b10f_rg16ui.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029465,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.r11f_g11f_b10f_rg16ui.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029466,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.r11f_g11f_b10f_rg16ui.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029467,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.r11f_g11f_b10f_rg16ui.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029468,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.r11f_g11f_b10f_rg16ui.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029469,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.r11f_g11f_b10f_rg16ui.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029470,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.r11f_g11f_b10f_rg16ui.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029471,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.r11f_g11f_b10f_rg16ui.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029472,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.r11f_g11f_b10f_rg16ui.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029473,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.r11f_g11f_b10f_rg16ui.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029474,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.r11f_g11f_b10f_rg16ui.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029475,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.r11f_g11f_b10f_rg16ui.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029476,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_32",
        "_bits.r11f_g11f_b10f_rg16ui.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029477,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_3",
        "2_bits.r11f_g11f_b10f_rg16ui.texture2d_array_to_renderbuffer");
