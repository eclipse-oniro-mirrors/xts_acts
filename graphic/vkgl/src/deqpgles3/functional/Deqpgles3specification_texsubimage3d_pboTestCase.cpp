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

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026593,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texsubimage3d_pbo.rgba32f_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026594,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texsubimage3d_pbo.rgba32f_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026595,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texsubimage3d_pbo.rgba32i_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026596,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texsubimage3d_pbo.rgba32i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026597,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texsubimage3d_pbo.rgba32ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026598,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texsubimage3d_pbo.rgba32ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026599,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texsubimage3d_pbo.rgba16f_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026600,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texsubimage3d_pbo.rgba16f_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026601,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texsubimage3d_pbo.rgba16i_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026602,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texsubimage3d_pbo.rgba16i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026603,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texsubimage3d_pbo.rgba16ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026604,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texsubimage3d_pbo.rgba16ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026605,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texsubimage3d_pbo.rgba8_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026606,
        "dEQP-GLES3.functional.texture.speci",
        "fication.texsubimage3d_pbo.rgba8_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026607,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texsubimage3d_pbo.rgba8i_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026608,
        "dEQP-GLES3.functional.texture.speci",
        "fication.texsubimage3d_pbo.rgba8i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026609,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texsubimage3d_pbo.rgba8ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026610,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texsubimage3d_pbo.rgba8ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026611,
        "dEQP-GLES3.functional.texture.specificati",
        "on.texsubimage3d_pbo.srgb8_alpha8_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026612,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texsubimage3d_pbo.srgb8_alpha8_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026613,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texsubimage3d_pbo.rgb10_a2_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026614,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texsubimage3d_pbo.rgb10_a2_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026615,
        "dEQP-GLES3.functional.texture.specificat",
        "ion.texsubimage3d_pbo.rgb10_a2ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026616,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texsubimage3d_pbo.rgb10_a2ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026617,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texsubimage3d_pbo.rgba4_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026618,
        "dEQP-GLES3.functional.texture.speci",
        "fication.texsubimage3d_pbo.rgba4_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026619,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texsubimage3d_pbo.rgb5_a1_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026620,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texsubimage3d_pbo.rgb5_a1_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026621,
        "dEQP-GLES3.functional.texture.specificati",
        "on.texsubimage3d_pbo.rgba8_snorm_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026622,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texsubimage3d_pbo.rgba8_snorm_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026623,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texsubimage3d_pbo.rgb8_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026624,
        "dEQP-GLES3.functional.texture.spec",
        "ification.texsubimage3d_pbo.rgb8_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026625,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texsubimage3d_pbo.rgb565_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026626,
        "dEQP-GLES3.functional.texture.speci",
        "fication.texsubimage3d_pbo.rgb565_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026627,
        "dEQP-GLES3.functional.texture.specificatio",
        "n.texsubimage3d_pbo.r11f_g11f_b10f_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026628,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texsubimage3d_pbo.r11f_g11f_b10f_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026629,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texsubimage3d_pbo.rgb32f_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026630,
        "dEQP-GLES3.functional.texture.speci",
        "fication.texsubimage3d_pbo.rgb32f_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026631,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texsubimage3d_pbo.rgb32i_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026632,
        "dEQP-GLES3.functional.texture.speci",
        "fication.texsubimage3d_pbo.rgb32i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026633,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texsubimage3d_pbo.rgb32ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026634,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texsubimage3d_pbo.rgb32ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026635,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texsubimage3d_pbo.rgb16f_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026636,
        "dEQP-GLES3.functional.texture.speci",
        "fication.texsubimage3d_pbo.rgb16f_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026637,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texsubimage3d_pbo.rgb16i_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026638,
        "dEQP-GLES3.functional.texture.speci",
        "fication.texsubimage3d_pbo.rgb16i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026639,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texsubimage3d_pbo.rgb16ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026640,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texsubimage3d_pbo.rgb16ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026641,
        "dEQP-GLES3.functional.texture.specificat",
        "ion.texsubimage3d_pbo.rgb8_snorm_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026642,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texsubimage3d_pbo.rgb8_snorm_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026643,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texsubimage3d_pbo.rgb8i_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026644,
        "dEQP-GLES3.functional.texture.speci",
        "fication.texsubimage3d_pbo.rgb8i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026645,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texsubimage3d_pbo.rgb8ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026646,
        "dEQP-GLES3.functional.texture.speci",
        "fication.texsubimage3d_pbo.rgb8ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026647,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texsubimage3d_pbo.srgb8_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026648,
        "dEQP-GLES3.functional.texture.speci",
        "fication.texsubimage3d_pbo.srgb8_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026649,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texsubimage3d_pbo.rgb9_e5_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026650,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texsubimage3d_pbo.rgb9_e5_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026651,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texsubimage3d_pbo.rg32f_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026652,
        "dEQP-GLES3.functional.texture.speci",
        "fication.texsubimage3d_pbo.rg32f_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026653,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texsubimage3d_pbo.rg32i_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026654,
        "dEQP-GLES3.functional.texture.speci",
        "fication.texsubimage3d_pbo.rg32i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026655,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texsubimage3d_pbo.rg32ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026656,
        "dEQP-GLES3.functional.texture.speci",
        "fication.texsubimage3d_pbo.rg32ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026657,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texsubimage3d_pbo.rg16f_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026658,
        "dEQP-GLES3.functional.texture.speci",
        "fication.texsubimage3d_pbo.rg16f_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026659,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texsubimage3d_pbo.rg16i_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026660,
        "dEQP-GLES3.functional.texture.speci",
        "fication.texsubimage3d_pbo.rg16i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026661,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texsubimage3d_pbo.rg16ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026662,
        "dEQP-GLES3.functional.texture.speci",
        "fication.texsubimage3d_pbo.rg16ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026663,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texsubimage3d_pbo.rg8_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026664,
        "dEQP-GLES3.functional.texture.spec",
        "ification.texsubimage3d_pbo.rg8_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026665,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texsubimage3d_pbo.rg8i_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026666,
        "dEQP-GLES3.functional.texture.spec",
        "ification.texsubimage3d_pbo.rg8i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026667,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texsubimage3d_pbo.rg8ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026668,
        "dEQP-GLES3.functional.texture.speci",
        "fication.texsubimage3d_pbo.rg8ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026669,
        "dEQP-GLES3.functional.texture.specificat",
        "ion.texsubimage3d_pbo.rg8_snorm_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026670,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texsubimage3d_pbo.rg8_snorm_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026671,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texsubimage3d_pbo.r32f_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026672,
        "dEQP-GLES3.functional.texture.spec",
        "ification.texsubimage3d_pbo.r32f_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026673,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texsubimage3d_pbo.r32i_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026674,
        "dEQP-GLES3.functional.texture.spec",
        "ification.texsubimage3d_pbo.r32i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026675,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texsubimage3d_pbo.r32ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026676,
        "dEQP-GLES3.functional.texture.speci",
        "fication.texsubimage3d_pbo.r32ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026677,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texsubimage3d_pbo.r16f_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026678,
        "dEQP-GLES3.functional.texture.spec",
        "ification.texsubimage3d_pbo.r16f_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026679,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texsubimage3d_pbo.r16i_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026680,
        "dEQP-GLES3.functional.texture.spec",
        "ification.texsubimage3d_pbo.r16i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026681,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texsubimage3d_pbo.r16ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026682,
        "dEQP-GLES3.functional.texture.speci",
        "fication.texsubimage3d_pbo.r16ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026683,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texsubimage3d_pbo.r8_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026684,
        "dEQP-GLES3.functional.texture.spe",
        "cification.texsubimage3d_pbo.r8_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026685,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texsubimage3d_pbo.r8i_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026686,
        "dEQP-GLES3.functional.texture.spec",
        "ification.texsubimage3d_pbo.r8i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026687,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texsubimage3d_pbo.r8ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026688,
        "dEQP-GLES3.functional.texture.spec",
        "ification.texsubimage3d_pbo.r8ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026689,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texsubimage3d_pbo.r8_snorm_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026690,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texsubimage3d_pbo.r8_snorm_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026691,
        "dEQP-GLES3.functional.texture.specificati",
        "on.texsubimage3d_pbo.rgb8_offset_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026692,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texsubimage3d_pbo.rgb8_offset_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026693,
        "dEQP-GLES3.functional.texture.specification.",
        "texsubimage3d_pbo.rgb8_image_height_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026694,
        "dEQP-GLES3.functional.texture.specificati",
        "on.texsubimage3d_pbo.rgb8_image_height_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026695,
        "dEQP-GLES3.functional.texture.specification",
        ".texsubimage3d_pbo.rgb8_row_length_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026696,
        "dEQP-GLES3.functional.texture.specificat",
        "ion.texsubimage3d_pbo.rgb8_row_length_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026697,
        "dEQP-GLES3.functional.texture.specification",
        ".texsubimage3d_pbo.rgb8_skip_images_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026698,
        "dEQP-GLES3.functional.texture.specificat",
        "ion.texsubimage3d_pbo.rgb8_skip_images_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026699,
        "dEQP-GLES3.functional.texture.specificatio",
        "n.texsubimage3d_pbo.rgb8_skip_rows_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026700,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texsubimage3d_pbo.rgb8_skip_rows_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026701,
        "dEQP-GLES3.functional.texture.specification",
        ".texsubimage3d_pbo.rgb8_skip_pixels_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026702,
        "dEQP-GLES3.functional.texture.specificat",
        "ion.texsubimage3d_pbo.rgb8_skip_pixels_3d");
