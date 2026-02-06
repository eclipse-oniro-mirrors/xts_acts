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

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026830,
        "dEQP-GLES3.functional.texture.specificat",
        "ion.texstorage3d.format.rgba32f_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026831,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texstorage3d.format.rgba32f_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026832,
        "dEQP-GLES3.functional.texture.specificat",
        "ion.texstorage3d.format.rgba32i_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026833,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texstorage3d.format.rgba32i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026834,
        "dEQP-GLES3.functional.texture.specificat",
        "ion.texstorage3d.format.rgba32ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026835,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texstorage3d.format.rgba32ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026836,
        "dEQP-GLES3.functional.texture.specificat",
        "ion.texstorage3d.format.rgba16f_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026837,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texstorage3d.format.rgba16f_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026838,
        "dEQP-GLES3.functional.texture.specificat",
        "ion.texstorage3d.format.rgba16i_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026839,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texstorage3d.format.rgba16i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026840,
        "dEQP-GLES3.functional.texture.specificat",
        "ion.texstorage3d.format.rgba16ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026841,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texstorage3d.format.rgba16ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026842,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texstorage3d.format.rgba8_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026843,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texstorage3d.format.rgba8_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026844,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texstorage3d.format.rgba8i_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026845,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texstorage3d.format.rgba8i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026846,
        "dEQP-GLES3.functional.texture.specificat",
        "ion.texstorage3d.format.rgba8ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026847,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texstorage3d.format.rgba8ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026848,
        "dEQP-GLES3.functional.texture.specificatio",
        "n.texstorage3d.format.srgb8_alpha8_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026849,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texstorage3d.format.srgb8_alpha8_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026850,
        "dEQP-GLES3.functional.texture.specificat",
        "ion.texstorage3d.format.rgb10_a2_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026851,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texstorage3d.format.rgb10_a2_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026852,
        "dEQP-GLES3.functional.texture.specificati",
        "on.texstorage3d.format.rgb10_a2ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026853,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texstorage3d.format.rgb10_a2ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026854,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texstorage3d.format.rgba4_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026855,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texstorage3d.format.rgba4_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026856,
        "dEQP-GLES3.functional.texture.specificat",
        "ion.texstorage3d.format.rgb5_a1_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026857,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texstorage3d.format.rgb5_a1_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026858,
        "dEQP-GLES3.functional.texture.specificatio",
        "n.texstorage3d.format.rgba8_snorm_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026859,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texstorage3d.format.rgba8_snorm_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026860,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texstorage3d.format.rgb8_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026861,
        "dEQP-GLES3.functional.texture.speci",
        "fication.texstorage3d.format.rgb8_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026862,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texstorage3d.format.rgb565_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026863,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texstorage3d.format.rgb565_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026864,
        "dEQP-GLES3.functional.texture.specification",
        ".texstorage3d.format.r11f_g11f_b10f_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026865,
        "dEQP-GLES3.functional.texture.specificat",
        "ion.texstorage3d.format.r11f_g11f_b10f_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026866,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texstorage3d.format.rgb32f_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026867,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texstorage3d.format.rgb32f_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026868,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texstorage3d.format.rgb32i_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026869,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texstorage3d.format.rgb32i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026870,
        "dEQP-GLES3.functional.texture.specificat",
        "ion.texstorage3d.format.rgb32ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026871,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texstorage3d.format.rgb32ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026872,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texstorage3d.format.rgb16f_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026873,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texstorage3d.format.rgb16f_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026874,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texstorage3d.format.rgb16i_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026875,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texstorage3d.format.rgb16i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026876,
        "dEQP-GLES3.functional.texture.specificat",
        "ion.texstorage3d.format.rgb16ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026877,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texstorage3d.format.rgb16ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026878,
        "dEQP-GLES3.functional.texture.specificati",
        "on.texstorage3d.format.rgb8_snorm_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026879,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texstorage3d.format.rgb8_snorm_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026880,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texstorage3d.format.rgb8i_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026881,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texstorage3d.format.rgb8i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026882,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texstorage3d.format.rgb8ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026883,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texstorage3d.format.rgb8ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026884,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texstorage3d.format.srgb8_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026885,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texstorage3d.format.srgb8_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026886,
        "dEQP-GLES3.functional.texture.specificat",
        "ion.texstorage3d.format.rgb9_e5_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026887,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texstorage3d.format.rgb9_e5_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026888,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texstorage3d.format.rg32f_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026889,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texstorage3d.format.rg32f_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026890,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texstorage3d.format.rg32i_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026891,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texstorage3d.format.rg32i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026892,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texstorage3d.format.rg32ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026893,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texstorage3d.format.rg32ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026894,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texstorage3d.format.rg16f_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026895,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texstorage3d.format.rg16f_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026896,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texstorage3d.format.rg16i_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026897,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texstorage3d.format.rg16i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026898,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texstorage3d.format.rg16ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026899,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texstorage3d.format.rg16ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026900,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texstorage3d.format.rg8_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026901,
        "dEQP-GLES3.functional.texture.speci",
        "fication.texstorage3d.format.rg8_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026902,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texstorage3d.format.rg8i_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026903,
        "dEQP-GLES3.functional.texture.speci",
        "fication.texstorage3d.format.rg8i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026904,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texstorage3d.format.rg8ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026905,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texstorage3d.format.rg8ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026906,
        "dEQP-GLES3.functional.texture.specificati",
        "on.texstorage3d.format.rg8_snorm_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026907,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texstorage3d.format.rg8_snorm_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026908,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texstorage3d.format.r32f_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026909,
        "dEQP-GLES3.functional.texture.speci",
        "fication.texstorage3d.format.r32f_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026910,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texstorage3d.format.r32i_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026911,
        "dEQP-GLES3.functional.texture.speci",
        "fication.texstorage3d.format.r32i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026912,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texstorage3d.format.r32ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026913,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texstorage3d.format.r32ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026914,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texstorage3d.format.r16f_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026915,
        "dEQP-GLES3.functional.texture.speci",
        "fication.texstorage3d.format.r16f_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026916,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texstorage3d.format.r16i_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026917,
        "dEQP-GLES3.functional.texture.speci",
        "fication.texstorage3d.format.r16i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026918,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texstorage3d.format.r16ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026919,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texstorage3d.format.r16ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026920,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texstorage3d.format.r8_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026921,
        "dEQP-GLES3.functional.texture.spec",
        "ification.texstorage3d.format.r8_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026922,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texstorage3d.format.r8i_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026923,
        "dEQP-GLES3.functional.texture.speci",
        "fication.texstorage3d.format.r8i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026924,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texstorage3d.format.r8ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026925,
        "dEQP-GLES3.functional.texture.speci",
        "fication.texstorage3d.format.r8ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026926,
        "dEQP-GLES3.functional.texture.specificat",
        "ion.texstorage3d.format.r8_snorm_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026927,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texstorage3d.format.r8_snorm_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026928,
        "dEQP-GLES3.functional.texture.specification.t",
        "exstorage3d.format.depth_component32f_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026929,
        "dEQP-GLES3.functional.texture.specification.t",
        "exstorage3d.format.depth_component24_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026930,
        "dEQP-GLES3.functional.texture.specification.t",
        "exstorage3d.format.depth_component16_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026931,
        "dEQP-GLES3.functional.texture.specification.t",
        "exstorage3d.format.depth32f_stencil8_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026932,
        "dEQP-GLES3.functional.texture.specification.",
        "texstorage3d.format.depth24_stencil8_2d_array");
