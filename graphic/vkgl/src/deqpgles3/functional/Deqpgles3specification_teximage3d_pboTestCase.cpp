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
#include "../ActsDeqpgles30027TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026408,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.teximage3d_pbo.rgba32f_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026409,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage3d_pbo.rgba32f_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026410,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.teximage3d_pbo.rgba32i_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026411,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage3d_pbo.rgba32i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026412,
        "dEQP-GLES3.functional.texture.specific",
        "ation.teximage3d_pbo.rgba32ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026413,
        "dEQP-GLES3.functional.texture.speci",
        "fication.teximage3d_pbo.rgba32ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026414,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.teximage3d_pbo.rgba16f_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026415,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage3d_pbo.rgba16f_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026416,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.teximage3d_pbo.rgba16i_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026417,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage3d_pbo.rgba16i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026418,
        "dEQP-GLES3.functional.texture.specific",
        "ation.teximage3d_pbo.rgba16ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026419,
        "dEQP-GLES3.functional.texture.speci",
        "fication.teximage3d_pbo.rgba16ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026420,
        "dEQP-GLES3.functional.texture.specif",
        "ication.teximage3d_pbo.rgba8_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026421,
        "dEQP-GLES3.functional.texture.spe",
        "cification.teximage3d_pbo.rgba8_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026422,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.teximage3d_pbo.rgba8i_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026423,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage3d_pbo.rgba8i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026424,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.teximage3d_pbo.rgba8ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026425,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage3d_pbo.rgba8ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026426,
        "dEQP-GLES3.functional.texture.specificat",
        "ion.teximage3d_pbo.srgb8_alpha8_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026427,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.teximage3d_pbo.srgb8_alpha8_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026428,
        "dEQP-GLES3.functional.texture.specific",
        "ation.teximage3d_pbo.rgb10_a2_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026429,
        "dEQP-GLES3.functional.texture.speci",
        "fication.teximage3d_pbo.rgb10_a2_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026430,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.teximage3d_pbo.rgb10_a2ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026431,
        "dEQP-GLES3.functional.texture.specif",
        "ication.teximage3d_pbo.rgb10_a2ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026432,
        "dEQP-GLES3.functional.texture.specif",
        "ication.teximage3d_pbo.rgba4_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026433,
        "dEQP-GLES3.functional.texture.spe",
        "cification.teximage3d_pbo.rgba4_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026434,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.teximage3d_pbo.rgb5_a1_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026435,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage3d_pbo.rgb5_a1_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026436,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.teximage3d_pbo.rgba8_snorm_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026437,
        "dEQP-GLES3.functional.texture.specif",
        "ication.teximage3d_pbo.rgba8_snorm_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026438,
        "dEQP-GLES3.functional.texture.specif",
        "ication.teximage3d_pbo.rgb8_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026439,
        "dEQP-GLES3.functional.texture.spe",
        "cification.teximage3d_pbo.rgb8_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026440,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.teximage3d_pbo.rgb565_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026441,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage3d_pbo.rgb565_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026442,
        "dEQP-GLES3.functional.texture.specificati",
        "on.teximage3d_pbo.r11f_g11f_b10f_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026443,
        "dEQP-GLES3.functional.texture.specific",
        "ation.teximage3d_pbo.r11f_g11f_b10f_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026444,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.teximage3d_pbo.rgb32f_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026445,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage3d_pbo.rgb32f_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026446,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.teximage3d_pbo.rgb32i_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026447,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage3d_pbo.rgb32i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026448,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.teximage3d_pbo.rgb32ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026449,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage3d_pbo.rgb32ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026450,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.teximage3d_pbo.rgb16f_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026451,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage3d_pbo.rgb16f_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026452,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.teximage3d_pbo.rgb16i_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026453,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage3d_pbo.rgb16i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026454,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.teximage3d_pbo.rgb16ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026455,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage3d_pbo.rgb16ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026456,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.teximage3d_pbo.rgb8_snorm_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026457,
        "dEQP-GLES3.functional.texture.specif",
        "ication.teximage3d_pbo.rgb8_snorm_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026458,
        "dEQP-GLES3.functional.texture.specif",
        "ication.teximage3d_pbo.rgb8i_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026459,
        "dEQP-GLES3.functional.texture.spe",
        "cification.teximage3d_pbo.rgb8i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026460,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.teximage3d_pbo.rgb8ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026461,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage3d_pbo.rgb8ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026462,
        "dEQP-GLES3.functional.texture.specif",
        "ication.teximage3d_pbo.srgb8_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026463,
        "dEQP-GLES3.functional.texture.spe",
        "cification.teximage3d_pbo.srgb8_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026464,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.teximage3d_pbo.rgb9_e5_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026465,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage3d_pbo.rgb9_e5_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026466,
        "dEQP-GLES3.functional.texture.specif",
        "ication.teximage3d_pbo.rg32f_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026467,
        "dEQP-GLES3.functional.texture.spe",
        "cification.teximage3d_pbo.rg32f_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026468,
        "dEQP-GLES3.functional.texture.specif",
        "ication.teximage3d_pbo.rg32i_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026469,
        "dEQP-GLES3.functional.texture.spe",
        "cification.teximage3d_pbo.rg32i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026470,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.teximage3d_pbo.rg32ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026471,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage3d_pbo.rg32ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026472,
        "dEQP-GLES3.functional.texture.specif",
        "ication.teximage3d_pbo.rg16f_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026473,
        "dEQP-GLES3.functional.texture.spe",
        "cification.teximage3d_pbo.rg16f_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026474,
        "dEQP-GLES3.functional.texture.specif",
        "ication.teximage3d_pbo.rg16i_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026475,
        "dEQP-GLES3.functional.texture.spe",
        "cification.teximage3d_pbo.rg16i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026476,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.teximage3d_pbo.rg16ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026477,
        "dEQP-GLES3.functional.texture.spec",
        "ification.teximage3d_pbo.rg16ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026478,
        "dEQP-GLES3.functional.texture.speci",
        "fication.teximage3d_pbo.rg8_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026479,
        "dEQP-GLES3.functional.texture.sp",
        "ecification.teximage3d_pbo.rg8_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026480,
        "dEQP-GLES3.functional.texture.specif",
        "ication.teximage3d_pbo.rg8i_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026481,
        "dEQP-GLES3.functional.texture.spe",
        "cification.teximage3d_pbo.rg8i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026482,
        "dEQP-GLES3.functional.texture.specif",
        "ication.teximage3d_pbo.rg8ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026483,
        "dEQP-GLES3.functional.texture.spe",
        "cification.teximage3d_pbo.rg8ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026484,
        "dEQP-GLES3.functional.texture.specific",
        "ation.teximage3d_pbo.rg8_snorm_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026485,
        "dEQP-GLES3.functional.texture.speci",
        "fication.teximage3d_pbo.rg8_snorm_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026486,
        "dEQP-GLES3.functional.texture.specif",
        "ication.teximage3d_pbo.r32f_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026487,
        "dEQP-GLES3.functional.texture.spe",
        "cification.teximage3d_pbo.r32f_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026488,
        "dEQP-GLES3.functional.texture.specif",
        "ication.teximage3d_pbo.r32i_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026489,
        "dEQP-GLES3.functional.texture.spe",
        "cification.teximage3d_pbo.r32i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026490,
        "dEQP-GLES3.functional.texture.specif",
        "ication.teximage3d_pbo.r32ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026491,
        "dEQP-GLES3.functional.texture.spe",
        "cification.teximage3d_pbo.r32ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026492,
        "dEQP-GLES3.functional.texture.specif",
        "ication.teximage3d_pbo.r16f_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026493,
        "dEQP-GLES3.functional.texture.spe",
        "cification.teximage3d_pbo.r16f_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026494,
        "dEQP-GLES3.functional.texture.specif",
        "ication.teximage3d_pbo.r16i_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026495,
        "dEQP-GLES3.functional.texture.spe",
        "cification.teximage3d_pbo.r16i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026496,
        "dEQP-GLES3.functional.texture.specif",
        "ication.teximage3d_pbo.r16ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026497,
        "dEQP-GLES3.functional.texture.spe",
        "cification.teximage3d_pbo.r16ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026498,
        "dEQP-GLES3.functional.texture.speci",
        "fication.teximage3d_pbo.r8_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026499,
        "dEQP-GLES3.functional.texture.sp",
        "ecification.teximage3d_pbo.r8_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026500,
        "dEQP-GLES3.functional.texture.speci",
        "fication.teximage3d_pbo.r8i_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026501,
        "dEQP-GLES3.functional.texture.sp",
        "ecification.teximage3d_pbo.r8i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026502,
        "dEQP-GLES3.functional.texture.specif",
        "ication.teximage3d_pbo.r8ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026503,
        "dEQP-GLES3.functional.texture.spe",
        "cification.teximage3d_pbo.r8ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026504,
        "dEQP-GLES3.functional.texture.specific",
        "ation.teximage3d_pbo.r8_snorm_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026505,
        "dEQP-GLES3.functional.texture.speci",
        "fication.teximage3d_pbo.r8_snorm_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026506,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.teximage3d_pbo.rgb8_offset_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026507,
        "dEQP-GLES3.functional.texture.specif",
        "ication.teximage3d_pbo.rgb8_offset_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026508,
        "dEQP-GLES3.functional.texture.specificati",
        "on.teximage3d_pbo.rgb8_alignment_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026509,
        "dEQP-GLES3.functional.texture.specific",
        "ation.teximage3d_pbo.rgb8_alignment_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026510,
        "dEQP-GLES3.functional.texture.specificatio",
        "n.teximage3d_pbo.rgb8_image_height_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026511,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.teximage3d_pbo.rgb8_image_height_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026512,
        "dEQP-GLES3.functional.texture.specificati",
        "on.teximage3d_pbo.rgb8_row_length_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026513,
        "dEQP-GLES3.functional.texture.specific",
        "ation.teximage3d_pbo.rgb8_row_length_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026514,
        "dEQP-GLES3.functional.texture.specificatio",
        "n.teximage3d_pbo.rgb8_skip_images_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026515,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.teximage3d_pbo.rgb8_skip_images_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026516,
        "dEQP-GLES3.functional.texture.specificati",
        "on.teximage3d_pbo.rgb8_skip_rows_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026517,
        "dEQP-GLES3.functional.texture.specific",
        "ation.teximage3d_pbo.rgb8_skip_rows_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026518,
        "dEQP-GLES3.functional.texture.specificatio",
        "n.teximage3d_pbo.rgb8_skip_pixels_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026519,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.teximage3d_pbo.rgb8_skip_pixels_3d");
