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

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029438,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.r11f_g11f_b10f_rg16i.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029439,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.r11f_g11f_b10f_rg16i.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029440,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.r11f_g11f_b10f_rg16i.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029441,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.r11f_g11f_b10f_rg16i.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029442,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.r11f_g11f_b10f_rg16i.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029443,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.r11f_g11f_b10f_rg16i.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029444,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.r11f_g11f_b10f_rg16i.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029445,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.r11f_g11f_b10f_rg16i.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029446,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.r11f_g11f_b10f_rg16i.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029447,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.r11f_g11f_b10f_rg16i.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029448,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.r11f_g11f_b10f_rg16i.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029449,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.r11f_g11f_b10f_rg16i.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029450,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.r11f_g11f_b10f_rg16i.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029451,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.r11f_g11f_b10f_rg16i.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029452,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.r11f_g11f_b10f_rg16i.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029453,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.r11f_g11f_b10f_rg16i.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029454,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.r11f_g11f_b10f_rg16i.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029455,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.r11f_g11f_b10f_rg16i.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029456,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_32",
        "_bits.r11f_g11f_b10f_rg16i.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310030TestSuite, TestCase_029457,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_",
        "32_bits.r11f_g11f_b10f_rg16i.texture2d_array_to_renderbuffer");
