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

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026296,
        "dEQP-GLES3.functional.texture.specific",
        "ation.basic_teximage3d.rgba32f_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026297,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage3d.rgba32f_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026298,
        "dEQP-GLES3.functional.texture.specific",
        "ation.basic_teximage3d.rgba32i_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026299,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage3d.rgba32i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026300,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.basic_teximage3d.rgba32ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026301,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_teximage3d.rgba32ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026302,
        "dEQP-GLES3.functional.texture.specific",
        "ation.basic_teximage3d.rgba16f_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026303,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage3d.rgba16f_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026304,
        "dEQP-GLES3.functional.texture.specific",
        "ation.basic_teximage3d.rgba16i_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026305,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage3d.rgba16i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026306,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.basic_teximage3d.rgba16ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026307,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_teximage3d.rgba16ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026308,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_teximage3d.rgba8_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026309,
        "dEQP-GLES3.functional.texture.spec",
        "ification.basic_teximage3d.rgba8_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026310,
        "dEQP-GLES3.functional.texture.specific",
        "ation.basic_teximage3d.rgba8i_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026311,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage3d.rgba8i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026312,
        "dEQP-GLES3.functional.texture.specific",
        "ation.basic_teximage3d.rgba8ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026313,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage3d.rgba8ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026314,
        "dEQP-GLES3.functional.texture.specificati",
        "on.basic_teximage3d.srgb8_alpha8_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026315,
        "dEQP-GLES3.functional.texture.specific",
        "ation.basic_teximage3d.srgb8_alpha8_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026316,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.basic_teximage3d.rgb10_a2_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026317,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_teximage3d.rgb10_a2_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026318,
        "dEQP-GLES3.functional.texture.specificat",
        "ion.basic_teximage3d.rgb10_a2ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026319,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_teximage3d.rgb10_a2ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026320,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_teximage3d.rgba4_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026321,
        "dEQP-GLES3.functional.texture.spec",
        "ification.basic_teximage3d.rgba4_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026322,
        "dEQP-GLES3.functional.texture.specific",
        "ation.basic_teximage3d.rgb5_a1_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026323,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage3d.rgb5_a1_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026324,
        "dEQP-GLES3.functional.texture.specificat",
        "ion.basic_teximage3d.rgba8_snorm_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026325,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_teximage3d.rgba8_snorm_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026326,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_teximage3d.rgb8_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026327,
        "dEQP-GLES3.functional.texture.spec",
        "ification.basic_teximage3d.rgb8_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026328,
        "dEQP-GLES3.functional.texture.specific",
        "ation.basic_teximage3d.rgb565_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026329,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage3d.rgb565_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026330,
        "dEQP-GLES3.functional.texture.specificatio",
        "n.basic_teximage3d.r11f_g11f_b10f_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026331,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.basic_teximage3d.r11f_g11f_b10f_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026332,
        "dEQP-GLES3.functional.texture.specific",
        "ation.basic_teximage3d.rgb32f_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026333,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage3d.rgb32f_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026334,
        "dEQP-GLES3.functional.texture.specific",
        "ation.basic_teximage3d.rgb32i_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026335,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage3d.rgb32i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026336,
        "dEQP-GLES3.functional.texture.specific",
        "ation.basic_teximage3d.rgb32ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026337,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage3d.rgb32ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026338,
        "dEQP-GLES3.functional.texture.specific",
        "ation.basic_teximage3d.rgb16f_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026339,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage3d.rgb16f_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026340,
        "dEQP-GLES3.functional.texture.specific",
        "ation.basic_teximage3d.rgb16i_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026341,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage3d.rgb16i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026342,
        "dEQP-GLES3.functional.texture.specific",
        "ation.basic_teximage3d.rgb16ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026343,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage3d.rgb16ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026344,
        "dEQP-GLES3.functional.texture.specificat",
        "ion.basic_teximage3d.rgb8_snorm_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026345,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_teximage3d.rgb8_snorm_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026346,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_teximage3d.rgb8i_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026347,
        "dEQP-GLES3.functional.texture.spec",
        "ification.basic_teximage3d.rgb8i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026348,
        "dEQP-GLES3.functional.texture.specific",
        "ation.basic_teximage3d.rgb8ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026349,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage3d.rgb8ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026350,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_teximage3d.srgb8_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026351,
        "dEQP-GLES3.functional.texture.spec",
        "ification.basic_teximage3d.srgb8_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026352,
        "dEQP-GLES3.functional.texture.specific",
        "ation.basic_teximage3d.rgb9_e5_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026353,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage3d.rgb9_e5_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026354,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_teximage3d.rg32f_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026355,
        "dEQP-GLES3.functional.texture.spec",
        "ification.basic_teximage3d.rg32f_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026356,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_teximage3d.rg32i_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026357,
        "dEQP-GLES3.functional.texture.spec",
        "ification.basic_teximage3d.rg32i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026358,
        "dEQP-GLES3.functional.texture.specific",
        "ation.basic_teximage3d.rg32ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026359,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage3d.rg32ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026360,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_teximage3d.rg16f_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026361,
        "dEQP-GLES3.functional.texture.spec",
        "ification.basic_teximage3d.rg16f_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026362,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_teximage3d.rg16i_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026363,
        "dEQP-GLES3.functional.texture.spec",
        "ification.basic_teximage3d.rg16i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026364,
        "dEQP-GLES3.functional.texture.specific",
        "ation.basic_teximage3d.rg16ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026365,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage3d.rg16ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026366,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_teximage3d.rg8_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026367,
        "dEQP-GLES3.functional.texture.spe",
        "cification.basic_teximage3d.rg8_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026368,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_teximage3d.rg8i_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026369,
        "dEQP-GLES3.functional.texture.spec",
        "ification.basic_teximage3d.rg8i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026370,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_teximage3d.rg8ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026371,
        "dEQP-GLES3.functional.texture.spec",
        "ification.basic_teximage3d.rg8ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026372,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.basic_teximage3d.rg8_snorm_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026373,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_teximage3d.rg8_snorm_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026374,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_teximage3d.r32f_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026375,
        "dEQP-GLES3.functional.texture.spec",
        "ification.basic_teximage3d.r32f_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026376,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_teximage3d.r32i_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026377,
        "dEQP-GLES3.functional.texture.spec",
        "ification.basic_teximage3d.r32i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026378,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_teximage3d.r32ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026379,
        "dEQP-GLES3.functional.texture.spec",
        "ification.basic_teximage3d.r32ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026380,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_teximage3d.r16f_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026381,
        "dEQP-GLES3.functional.texture.spec",
        "ification.basic_teximage3d.r16f_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026382,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_teximage3d.r16i_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026383,
        "dEQP-GLES3.functional.texture.spec",
        "ification.basic_teximage3d.r16i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026384,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_teximage3d.r16ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026385,
        "dEQP-GLES3.functional.texture.spec",
        "ification.basic_teximage3d.r16ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026386,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_teximage3d.r8_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026387,
        "dEQP-GLES3.functional.texture.spe",
        "cification.basic_teximage3d.r8_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026388,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_teximage3d.r8i_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026389,
        "dEQP-GLES3.functional.texture.spe",
        "cification.basic_teximage3d.r8i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026390,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_teximage3d.r8ui_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026391,
        "dEQP-GLES3.functional.texture.spec",
        "ification.basic_teximage3d.r8ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026392,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.basic_teximage3d.r8_snorm_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026393,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_teximage3d.r8_snorm_3d");
