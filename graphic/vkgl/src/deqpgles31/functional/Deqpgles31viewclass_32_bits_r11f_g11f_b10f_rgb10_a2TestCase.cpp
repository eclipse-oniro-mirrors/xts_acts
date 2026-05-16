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

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029574,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.r11f_g11f_b10f_rgb10_a2.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029575,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.r11f_g11f_b10f_rgb10_a2.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029576,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.r11f_g11f_b10f_rgb10_a2.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029577,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_",
        "32_bits.r11f_g11f_b10f_rgb10_a2.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029578,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.r11f_g11f_b10f_rgb10_a2.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029579,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.r11f_g11f_b10f_rgb10_a2.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029580,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.r11f_g11f_b10f_rgb10_a2.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029581,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.r11f_g11f_b10f_rgb10_a2.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029582,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_",
        "32_bits.r11f_g11f_b10f_rgb10_a2.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029583,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.r11f_g11f_b10f_rgb10_a2.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029584,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.r11f_g11f_b10f_rgb10_a2.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029585,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.r11f_g11f_b10f_rgb10_a2.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029586,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.r11f_g11f_b10f_rgb10_a2.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029587,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.r11f_g11f_b10f_rgb10_a2.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029588,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.r11f_g11f_b10f_rgb10_a2.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029589,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_",
        "32_bits.r11f_g11f_b10f_rgb10_a2.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029590,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_",
        "32_bits.r11f_g11f_b10f_rgb10_a2.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029591,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.r11f_g11f_b10f_rgb10_a2.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029592,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_32_",
        "bits.r11f_g11f_b10f_rgb10_a2.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029593,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_32",
        "_bits.r11f_g11f_b10f_rgb10_a2.texture2d_array_to_renderbuffer");
