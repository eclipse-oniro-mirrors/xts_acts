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

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028213,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.rg16ui_r11f_g11f_b10f.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028214,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.rg16ui_r11f_g11f_b10f.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028215,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rg16ui_r11f_g11f_b10f.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028216,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.rg16ui_r11f_g11f_b10f.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028217,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.rg16ui_r11f_g11f_b10f.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028218,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_32_bits.rg16ui_r11f_g11f_b10f.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028219,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rg16ui_r11f_g11f_b10f.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028220,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.rg16ui_r11f_g11f_b10f.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028221,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rg16ui_r11f_g11f_b10f.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028222,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_32_bits.rg16ui_r11f_g11f_b10f.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028223,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_32_bits.rg16ui_r11f_g11f_b10f.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028224,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.rg16ui_r11f_g11f_b10f.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028225,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.rg16ui_r11f_g11f_b10f.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028226,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_32_bits.rg16ui_r11f_g11f_b10f.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028227,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.rg16ui_r11f_g11f_b10f.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028228,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_32",
        "_bits.rg16ui_r11f_g11f_b10f.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028229,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.rg16ui_r11f_g11f_b10f.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028230,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_32_bits.rg16ui_r11f_g11f_b10f.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028231,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_32_bits.rg16ui_r11f_g11f_b10f.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310029TestSuite, TestCase_028232,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_3",
        "2_bits.rg16ui_r11f_g11f_b10f.renderbuffer_to_texture2d_array");
