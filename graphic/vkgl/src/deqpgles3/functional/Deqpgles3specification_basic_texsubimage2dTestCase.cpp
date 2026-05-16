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

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025995,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_texsubimage2d.rgba32f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025996,
        "dEQP-GLES3.functional.texture.specific",
        "ation.basic_texsubimage2d.rgba32f_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025997,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_texsubimage2d.rgba32i_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025998,
        "dEQP-GLES3.functional.texture.specific",
        "ation.basic_texsubimage2d.rgba32i_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025999,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_texsubimage2d.rgba32ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026000,
        "dEQP-GLES3.functional.texture.specific",
        "ation.basic_texsubimage2d.rgba32ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026001,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_texsubimage2d.rgba16f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026002,
        "dEQP-GLES3.functional.texture.specific",
        "ation.basic_texsubimage2d.rgba16f_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026003,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_texsubimage2d.rgba16i_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026004,
        "dEQP-GLES3.functional.texture.specific",
        "ation.basic_texsubimage2d.rgba16i_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026005,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_texsubimage2d.rgba16ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026006,
        "dEQP-GLES3.functional.texture.specific",
        "ation.basic_texsubimage2d.rgba16ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026007,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_texsubimage2d.rgba8_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026008,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_texsubimage2d.rgba8_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026009,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_texsubimage2d.rgba8i_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026010,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_texsubimage2d.rgba8i_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026011,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_texsubimage2d.rgba8ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026012,
        "dEQP-GLES3.functional.texture.specific",
        "ation.basic_texsubimage2d.rgba8ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026013,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.basic_texsubimage2d.srgb8_alpha8_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026014,
        "dEQP-GLES3.functional.texture.specificat",
        "ion.basic_texsubimage2d.srgb8_alpha8_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026015,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_texsubimage2d.rgb10_a2_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026016,
        "dEQP-GLES3.functional.texture.specific",
        "ation.basic_texsubimage2d.rgb10_a2_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026017,
        "dEQP-GLES3.functional.texture.specific",
        "ation.basic_texsubimage2d.rgb10_a2ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026018,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.basic_texsubimage2d.rgb10_a2ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026019,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_texsubimage2d.rgba4_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026020,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_texsubimage2d.rgba4_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026021,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_texsubimage2d.rgb5_a1_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026022,
        "dEQP-GLES3.functional.texture.specific",
        "ation.basic_texsubimage2d.rgb5_a1_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026023,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.basic_texsubimage2d.rgba8_snorm_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026024,
        "dEQP-GLES3.functional.texture.specificat",
        "ion.basic_texsubimage2d.rgba8_snorm_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026025,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_texsubimage2d.rgb8_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026026,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_texsubimage2d.rgb8_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026027,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_texsubimage2d.rgb565_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026028,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_texsubimage2d.rgb565_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026029,
        "dEQP-GLES3.functional.texture.specificat",
        "ion.basic_texsubimage2d.r11f_g11f_b10f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026030,
        "dEQP-GLES3.functional.texture.specificati",
        "on.basic_texsubimage2d.r11f_g11f_b10f_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026031,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_texsubimage2d.rgb32f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026032,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_texsubimage2d.rgb32f_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026033,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_texsubimage2d.rgb32i_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026034,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_texsubimage2d.rgb32i_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026035,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_texsubimage2d.rgb32ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026036,
        "dEQP-GLES3.functional.texture.specific",
        "ation.basic_texsubimage2d.rgb32ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026037,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_texsubimage2d.rgb16f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026038,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_texsubimage2d.rgb16f_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026039,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_texsubimage2d.rgb16i_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026040,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_texsubimage2d.rgb16i_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026041,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_texsubimage2d.rgb16ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026042,
        "dEQP-GLES3.functional.texture.specific",
        "ation.basic_texsubimage2d.rgb16ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026043,
        "dEQP-GLES3.functional.texture.specific",
        "ation.basic_texsubimage2d.rgb8_snorm_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026044,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.basic_texsubimage2d.rgb8_snorm_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026045,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_texsubimage2d.rgb8i_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026046,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_texsubimage2d.rgb8i_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026047,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_texsubimage2d.rgb8ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026048,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_texsubimage2d.rgb8ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026049,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_texsubimage2d.srgb8_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026050,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_texsubimage2d.srgb8_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026051,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_texsubimage2d.rgb9_e5_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026052,
        "dEQP-GLES3.functional.texture.specific",
        "ation.basic_texsubimage2d.rgb9_e5_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026053,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_texsubimage2d.rg32f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026054,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_texsubimage2d.rg32f_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026055,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_texsubimage2d.rg32i_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026056,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_texsubimage2d.rg32i_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026057,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_texsubimage2d.rg32ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026058,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_texsubimage2d.rg32ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026059,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_texsubimage2d.rg16f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026060,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_texsubimage2d.rg16f_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026061,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_texsubimage2d.rg16i_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026062,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_texsubimage2d.rg16i_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026063,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_texsubimage2d.rg16ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026064,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_texsubimage2d.rg16ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026065,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_texsubimage2d.rg8_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026066,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_texsubimage2d.rg8_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026067,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_texsubimage2d.rg8i_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026068,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_texsubimage2d.rg8i_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026069,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_texsubimage2d.rg8ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026070,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_texsubimage2d.rg8ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026071,
        "dEQP-GLES3.functional.texture.specific",
        "ation.basic_texsubimage2d.rg8_snorm_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026072,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.basic_texsubimage2d.rg8_snorm_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026073,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_texsubimage2d.r32f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026074,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_texsubimage2d.r32f_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026075,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_texsubimage2d.r32i_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026076,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_texsubimage2d.r32i_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026077,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_texsubimage2d.r32ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026078,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_texsubimage2d.r32ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026079,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_texsubimage2d.r16f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026080,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_texsubimage2d.r16f_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026081,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_texsubimage2d.r16i_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026082,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_texsubimage2d.r16i_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026083,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_texsubimage2d.r16ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026084,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_texsubimage2d.r16ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026085,
        "dEQP-GLES3.functional.texture.spec",
        "ification.basic_texsubimage2d.r8_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026086,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_texsubimage2d.r8_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026087,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_texsubimage2d.r8i_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026088,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_texsubimage2d.r8i_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026089,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_texsubimage2d.r8ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026090,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_texsubimage2d.r8ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026091,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_texsubimage2d.r8_snorm_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_026092,
        "dEQP-GLES3.functional.texture.specific",
        "ation.basic_texsubimage2d.r8_snorm_cube");
