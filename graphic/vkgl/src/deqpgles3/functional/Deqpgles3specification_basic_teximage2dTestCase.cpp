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

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025712,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage2d.rgba32f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025713,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_teximage2d.rgba32f_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025714,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage2d.rgba32i_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025715,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_teximage2d.rgba32i_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025716,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_teximage2d.rgba32ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025717,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_teximage2d.rgba32ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025718,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage2d.rgba16f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025719,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_teximage2d.rgba16f_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025720,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage2d.rgba16i_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025721,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_teximage2d.rgba16i_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025722,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_teximage2d.rgba16ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025723,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_teximage2d.rgba16ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025724,
        "dEQP-GLES3.functional.texture.spec",
        "ification.basic_teximage2d.rgba8_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025725,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage2d.rgba8_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025726,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage2d.rgba8i_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025727,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_teximage2d.rgba8i_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025728,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage2d.rgba8ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025729,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_teximage2d.rgba8ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025730,
        "dEQP-GLES3.functional.texture.specific",
        "ation.basic_teximage2d.srgb8_alpha8_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025731,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.basic_teximage2d.srgb8_alpha8_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025732,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_teximage2d.rgb10_a2_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025733,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_teximage2d.rgb10_a2_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025734,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_teximage2d.rgb10_a2ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025735,
        "dEQP-GLES3.functional.texture.specific",
        "ation.basic_teximage2d.rgb10_a2ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025736,
        "dEQP-GLES3.functional.texture.spec",
        "ification.basic_teximage2d.rgba4_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025737,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage2d.rgba4_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025738,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage2d.rgb5_a1_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025739,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_teximage2d.rgb5_a1_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025740,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_teximage2d.rgba8_snorm_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025741,
        "dEQP-GLES3.functional.texture.specific",
        "ation.basic_teximage2d.rgba8_snorm_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025742,
        "dEQP-GLES3.functional.texture.spec",
        "ification.basic_teximage2d.rgb8_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025743,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage2d.rgb8_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025744,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage2d.rgb565_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025745,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_teximage2d.rgb565_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025746,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.basic_teximage2d.r11f_g11f_b10f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025747,
        "dEQP-GLES3.functional.texture.specificat",
        "ion.basic_teximage2d.r11f_g11f_b10f_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025748,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage2d.rgb32f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025749,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_teximage2d.rgb32f_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025750,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage2d.rgb32i_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025751,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_teximage2d.rgb32i_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025752,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage2d.rgb32ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025753,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_teximage2d.rgb32ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025754,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage2d.rgb16f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025755,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_teximage2d.rgb16f_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025756,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage2d.rgb16i_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025757,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_teximage2d.rgb16i_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025758,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage2d.rgb16ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025759,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_teximage2d.rgb16ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025760,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_teximage2d.rgb8_snorm_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025761,
        "dEQP-GLES3.functional.texture.specific",
        "ation.basic_teximage2d.rgb8_snorm_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025762,
        "dEQP-GLES3.functional.texture.spec",
        "ification.basic_teximage2d.rgb8i_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025763,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage2d.rgb8i_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025764,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage2d.rgb8ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025765,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_teximage2d.rgb8ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025766,
        "dEQP-GLES3.functional.texture.spec",
        "ification.basic_teximage2d.srgb8_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025767,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage2d.srgb8_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025768,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage2d.rgb9_e5_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025769,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_teximage2d.rgb9_e5_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025770,
        "dEQP-GLES3.functional.texture.spec",
        "ification.basic_teximage2d.rg32f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025771,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage2d.rg32f_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025772,
        "dEQP-GLES3.functional.texture.spec",
        "ification.basic_teximage2d.rg32i_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025773,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage2d.rg32i_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025774,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage2d.rg32ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025775,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_teximage2d.rg32ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025776,
        "dEQP-GLES3.functional.texture.spec",
        "ification.basic_teximage2d.rg16f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025777,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage2d.rg16f_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025778,
        "dEQP-GLES3.functional.texture.spec",
        "ification.basic_teximage2d.rg16i_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025779,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage2d.rg16i_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025780,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage2d.rg16ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025781,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_teximage2d.rg16ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025782,
        "dEQP-GLES3.functional.texture.spe",
        "cification.basic_teximage2d.rg8_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025783,
        "dEQP-GLES3.functional.texture.spec",
        "ification.basic_teximage2d.rg8_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025784,
        "dEQP-GLES3.functional.texture.spec",
        "ification.basic_teximage2d.rg8i_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025785,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage2d.rg8i_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025786,
        "dEQP-GLES3.functional.texture.spec",
        "ification.basic_teximage2d.rg8ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025787,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage2d.rg8ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025788,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_teximage2d.rg8_snorm_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025789,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_teximage2d.rg8_snorm_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025790,
        "dEQP-GLES3.functional.texture.spec",
        "ification.basic_teximage2d.r32f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025791,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage2d.r32f_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025792,
        "dEQP-GLES3.functional.texture.spec",
        "ification.basic_teximage2d.r32i_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025793,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage2d.r32i_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025794,
        "dEQP-GLES3.functional.texture.spec",
        "ification.basic_teximage2d.r32ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025795,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage2d.r32ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025796,
        "dEQP-GLES3.functional.texture.spec",
        "ification.basic_teximage2d.r16f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025797,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage2d.r16f_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025798,
        "dEQP-GLES3.functional.texture.spec",
        "ification.basic_teximage2d.r16i_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025799,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage2d.r16i_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025800,
        "dEQP-GLES3.functional.texture.spec",
        "ification.basic_teximage2d.r16ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025801,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage2d.r16ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025802,
        "dEQP-GLES3.functional.texture.spe",
        "cification.basic_teximage2d.r8_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025803,
        "dEQP-GLES3.functional.texture.spec",
        "ification.basic_teximage2d.r8_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025804,
        "dEQP-GLES3.functional.texture.spe",
        "cification.basic_teximage2d.r8i_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025805,
        "dEQP-GLES3.functional.texture.spec",
        "ification.basic_teximage2d.r8i_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025806,
        "dEQP-GLES3.functional.texture.spec",
        "ification.basic_teximage2d.r8ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025807,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_teximage2d.r8ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025808,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_teximage2d.r8_snorm_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025809,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_teximage2d.r8_snorm_cube");
