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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30026TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025877,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage2d_pbo.rgba32f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025878,
        "dEQP-GLES3.functional.texture.speci",
        "fication.teximage2d_pbo.rgba32f_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025879,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage2d_pbo.rgba32i_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025880,
        "dEQP-GLES3.functional.texture.speci",
        "fication.teximage2d_pbo.rgba32i_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025881,
        "dEQP-GLES3.functional.texture.speci",
        "fication.teximage2d_pbo.rgba32ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025882,
        "dEQP-GLES3.functional.texture.specif",
        "ication.teximage2d_pbo.rgba32ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025883,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage2d_pbo.rgba16f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025884,
        "dEQP-GLES3.functional.texture.speci",
        "fication.teximage2d_pbo.rgba16f_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025885,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage2d_pbo.rgba16i_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025886,
        "dEQP-GLES3.functional.texture.speci",
        "fication.teximage2d_pbo.rgba16i_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025887,
        "dEQP-GLES3.functional.texture.speci",
        "fication.teximage2d_pbo.rgba16ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025888,
        "dEQP-GLES3.functional.texture.specif",
        "ication.teximage2d_pbo.rgba16ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025889,
        "dEQP-GLES3.functional.texture.spe",
        "cification.teximage2d_pbo.rgba8_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025890,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage2d_pbo.rgba8_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025891,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage2d_pbo.rgba8i_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025892,
        "dEQP-GLES3.functional.texture.speci",
        "fication.teximage2d_pbo.rgba8i_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025893,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage2d_pbo.rgba8ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025894,
        "dEQP-GLES3.functional.texture.speci",
        "fication.teximage2d_pbo.rgba8ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025895,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.teximage2d_pbo.srgb8_alpha8_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025896,
        "dEQP-GLES3.functional.texture.specific",
        "ation.teximage2d_pbo.srgb8_alpha8_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025897,
        "dEQP-GLES3.functional.texture.speci",
        "fication.teximage2d_pbo.rgb10_a2_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025898,
        "dEQP-GLES3.functional.texture.specif",
        "ication.teximage2d_pbo.rgb10_a2_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025899,
        "dEQP-GLES3.functional.texture.specif",
        "ication.teximage2d_pbo.rgb10_a2ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025900,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.teximage2d_pbo.rgb10_a2ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025901,
        "dEQP-GLES3.functional.texture.spe",
        "cification.teximage2d_pbo.rgba4_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025902,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage2d_pbo.rgba4_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025903,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage2d_pbo.rgb5_a1_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025904,
        "dEQP-GLES3.functional.texture.speci",
        "fication.teximage2d_pbo.rgb5_a1_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025905,
        "dEQP-GLES3.functional.texture.specif",
        "ication.teximage2d_pbo.rgba8_snorm_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025906,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.teximage2d_pbo.rgba8_snorm_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025907,
        "dEQP-GLES3.functional.texture.spe",
        "cification.teximage2d_pbo.rgb8_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025908,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage2d_pbo.rgb8_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025909,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage2d_pbo.rgb565_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025910,
        "dEQP-GLES3.functional.texture.speci",
        "fication.teximage2d_pbo.rgb565_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025911,
        "dEQP-GLES3.functional.texture.specific",
        "ation.teximage2d_pbo.r11f_g11f_b10f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025912,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.teximage2d_pbo.r11f_g11f_b10f_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025913,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage2d_pbo.rgb32f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025914,
        "dEQP-GLES3.functional.texture.speci",
        "fication.teximage2d_pbo.rgb32f_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025915,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage2d_pbo.rgb32i_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025916,
        "dEQP-GLES3.functional.texture.speci",
        "fication.teximage2d_pbo.rgb32i_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025917,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage2d_pbo.rgb32ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025918,
        "dEQP-GLES3.functional.texture.speci",
        "fication.teximage2d_pbo.rgb32ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025919,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage2d_pbo.rgb16f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025920,
        "dEQP-GLES3.functional.texture.speci",
        "fication.teximage2d_pbo.rgb16f_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025921,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage2d_pbo.rgb16i_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025922,
        "dEQP-GLES3.functional.texture.speci",
        "fication.teximage2d_pbo.rgb16i_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025923,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage2d_pbo.rgb16ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025924,
        "dEQP-GLES3.functional.texture.speci",
        "fication.teximage2d_pbo.rgb16ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025925,
        "dEQP-GLES3.functional.texture.specif",
        "ication.teximage2d_pbo.rgb8_snorm_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025926,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.teximage2d_pbo.rgb8_snorm_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025927,
        "dEQP-GLES3.functional.texture.spe",
        "cification.teximage2d_pbo.rgb8i_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025928,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage2d_pbo.rgb8i_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025929,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage2d_pbo.rgb8ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025930,
        "dEQP-GLES3.functional.texture.speci",
        "fication.teximage2d_pbo.rgb8ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025931,
        "dEQP-GLES3.functional.texture.spe",
        "cification.teximage2d_pbo.srgb8_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025932,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage2d_pbo.srgb8_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025933,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage2d_pbo.rgb9_e5_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025934,
        "dEQP-GLES3.functional.texture.speci",
        "fication.teximage2d_pbo.rgb9_e5_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025935,
        "dEQP-GLES3.functional.texture.spe",
        "cification.teximage2d_pbo.rg32f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025936,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage2d_pbo.rg32f_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025937,
        "dEQP-GLES3.functional.texture.spe",
        "cification.teximage2d_pbo.rg32i_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025938,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage2d_pbo.rg32i_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025939,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage2d_pbo.rg32ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025940,
        "dEQP-GLES3.functional.texture.speci",
        "fication.teximage2d_pbo.rg32ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025941,
        "dEQP-GLES3.functional.texture.spe",
        "cification.teximage2d_pbo.rg16f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025942,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage2d_pbo.rg16f_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025943,
        "dEQP-GLES3.functional.texture.spe",
        "cification.teximage2d_pbo.rg16i_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025944,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage2d_pbo.rg16i_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025945,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage2d_pbo.rg16ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025946,
        "dEQP-GLES3.functional.texture.speci",
        "fication.teximage2d_pbo.rg16ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025947,
        "dEQP-GLES3.functional.texture.sp",
        "ecification.teximage2d_pbo.rg8_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025948,
        "dEQP-GLES3.functional.texture.spe",
        "cification.teximage2d_pbo.rg8_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025949,
        "dEQP-GLES3.functional.texture.spe",
        "cification.teximage2d_pbo.rg8i_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025950,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage2d_pbo.rg8i_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025951,
        "dEQP-GLES3.functional.texture.spe",
        "cification.teximage2d_pbo.rg8ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025952,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage2d_pbo.rg8ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025953,
        "dEQP-GLES3.functional.texture.speci",
        "fication.teximage2d_pbo.rg8_snorm_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025954,
        "dEQP-GLES3.functional.texture.specif",
        "ication.teximage2d_pbo.rg8_snorm_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025955,
        "dEQP-GLES3.functional.texture.spe",
        "cification.teximage2d_pbo.r32f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025956,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage2d_pbo.r32f_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025957,
        "dEQP-GLES3.functional.texture.spe",
        "cification.teximage2d_pbo.r32i_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025958,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage2d_pbo.r32i_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025959,
        "dEQP-GLES3.functional.texture.spe",
        "cification.teximage2d_pbo.r32ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025960,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage2d_pbo.r32ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025961,
        "dEQP-GLES3.functional.texture.spe",
        "cification.teximage2d_pbo.r16f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025962,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage2d_pbo.r16f_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025963,
        "dEQP-GLES3.functional.texture.spe",
        "cification.teximage2d_pbo.r16i_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025964,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage2d_pbo.r16i_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025965,
        "dEQP-GLES3.functional.texture.spe",
        "cification.teximage2d_pbo.r16ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025966,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage2d_pbo.r16ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025967,
        "dEQP-GLES3.functional.texture.sp",
        "ecification.teximage2d_pbo.r8_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025968,
        "dEQP-GLES3.functional.texture.spe",
        "cification.teximage2d_pbo.r8_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025969,
        "dEQP-GLES3.functional.texture.sp",
        "ecification.teximage2d_pbo.r8i_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025970,
        "dEQP-GLES3.functional.texture.spe",
        "cification.teximage2d_pbo.r8i_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025971,
        "dEQP-GLES3.functional.texture.spe",
        "cification.teximage2d_pbo.r8ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025972,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage2d_pbo.r8ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025973,
        "dEQP-GLES3.functional.texture.speci",
        "fication.teximage2d_pbo.r8_snorm_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025974,
        "dEQP-GLES3.functional.texture.specif",
        "ication.teximage2d_pbo.r8_snorm_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025975,
        "dEQP-GLES3.functional.texture.specif",
        "ication.teximage2d_pbo.rgb8_offset_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025976,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.teximage2d_pbo.rgb8_offset_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025977,
        "dEQP-GLES3.functional.texture.specific",
        "ation.teximage2d_pbo.rgb8_alignment_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025978,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.teximage2d_pbo.rgb8_alignment_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025979,
        "dEQP-GLES3.functional.texture.specific",
        "ation.teximage2d_pbo.rgb8_row_length_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025980,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.teximage2d_pbo.rgb8_row_length_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025981,
        "dEQP-GLES3.functional.texture.specific",
        "ation.teximage2d_pbo.rgb8_skip_rows_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025982,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.teximage2d_pbo.rgb8_skip_rows_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025983,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.teximage2d_pbo.rgb8_skip_pixels_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025984,
        "dEQP-GLES3.functional.texture.specificat",
        "ion.teximage2d_pbo.rgb8_skip_pixels_cube");
