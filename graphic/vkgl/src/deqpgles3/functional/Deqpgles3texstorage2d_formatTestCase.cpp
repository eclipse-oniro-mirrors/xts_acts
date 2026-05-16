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

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026708,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texstorage2d.format.rgba32f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026709,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texstorage2d.format.rgba32f_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026710,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texstorage2d.format.rgba32i_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026711,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texstorage2d.format.rgba32i_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026712,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texstorage2d.format.rgba32ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026713,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texstorage2d.format.rgba32ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026714,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texstorage2d.format.rgba16f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026715,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texstorage2d.format.rgba16f_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026716,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texstorage2d.format.rgba16i_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026717,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texstorage2d.format.rgba16i_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026718,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texstorage2d.format.rgba16ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026719,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texstorage2d.format.rgba16ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026720,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texstorage2d.format.rgba8_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026721,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texstorage2d.format.rgba8_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026722,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texstorage2d.format.rgba8i_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026723,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texstorage2d.format.rgba8i_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026724,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texstorage2d.format.rgba8ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026725,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texstorage2d.format.rgba8ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026726,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texstorage2d.format.srgb8_alpha8_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026727,
        "dEQP-GLES3.functional.texture.specificat",
        "ion.texstorage2d.format.srgb8_alpha8_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026728,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texstorage2d.format.rgb10_a2_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026729,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texstorage2d.format.rgb10_a2_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026730,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texstorage2d.format.rgb10_a2ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026731,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texstorage2d.format.rgb10_a2ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026732,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texstorage2d.format.rgba4_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026733,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texstorage2d.format.rgba4_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026734,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texstorage2d.format.rgb5_a1_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026735,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texstorage2d.format.rgb5_a1_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026736,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texstorage2d.format.rgba8_snorm_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026737,
        "dEQP-GLES3.functional.texture.specificat",
        "ion.texstorage2d.format.rgba8_snorm_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026738,
        "dEQP-GLES3.functional.texture.speci",
        "fication.texstorage2d.format.rgb8_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026739,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texstorage2d.format.rgb8_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026740,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texstorage2d.format.rgb565_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026741,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texstorage2d.format.rgb565_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026742,
        "dEQP-GLES3.functional.texture.specificat",
        "ion.texstorage2d.format.r11f_g11f_b10f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026743,
        "dEQP-GLES3.functional.texture.specificati",
        "on.texstorage2d.format.r11f_g11f_b10f_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026744,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texstorage2d.format.rgb32f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026745,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texstorage2d.format.rgb32f_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026746,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texstorage2d.format.rgb32i_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026747,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texstorage2d.format.rgb32i_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026748,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texstorage2d.format.rgb32ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026749,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texstorage2d.format.rgb32ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026750,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texstorage2d.format.rgb16f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026751,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texstorage2d.format.rgb16f_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026752,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texstorage2d.format.rgb16i_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026753,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texstorage2d.format.rgb16i_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026754,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texstorage2d.format.rgb16ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026755,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texstorage2d.format.rgb16ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026756,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texstorage2d.format.rgb8_snorm_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026757,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texstorage2d.format.rgb8_snorm_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026758,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texstorage2d.format.rgb8i_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026759,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texstorage2d.format.rgb8i_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026760,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texstorage2d.format.rgb8ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026761,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texstorage2d.format.rgb8ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026762,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texstorage2d.format.srgb8_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026763,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texstorage2d.format.srgb8_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026764,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texstorage2d.format.rgb9_e5_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026765,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texstorage2d.format.rgb9_e5_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026766,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texstorage2d.format.rg32f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026767,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texstorage2d.format.rg32f_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026768,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texstorage2d.format.rg32i_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026769,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texstorage2d.format.rg32i_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026770,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texstorage2d.format.rg32ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026771,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texstorage2d.format.rg32ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026772,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texstorage2d.format.rg16f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026773,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texstorage2d.format.rg16f_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026774,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texstorage2d.format.rg16i_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026775,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texstorage2d.format.rg16i_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026776,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texstorage2d.format.rg16ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026777,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texstorage2d.format.rg16ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026778,
        "dEQP-GLES3.functional.texture.speci",
        "fication.texstorage2d.format.rg8_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026779,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texstorage2d.format.rg8_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026780,
        "dEQP-GLES3.functional.texture.speci",
        "fication.texstorage2d.format.rg8i_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026781,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texstorage2d.format.rg8i_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026782,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texstorage2d.format.rg8ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026783,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texstorage2d.format.rg8ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026784,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texstorage2d.format.rg8_snorm_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026785,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texstorage2d.format.rg8_snorm_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026786,
        "dEQP-GLES3.functional.texture.speci",
        "fication.texstorage2d.format.r32f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026787,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texstorage2d.format.r32f_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026788,
        "dEQP-GLES3.functional.texture.speci",
        "fication.texstorage2d.format.r32i_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026789,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texstorage2d.format.r32i_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026790,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texstorage2d.format.r32ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026791,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texstorage2d.format.r32ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026792,
        "dEQP-GLES3.functional.texture.speci",
        "fication.texstorage2d.format.r16f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026793,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texstorage2d.format.r16f_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026794,
        "dEQP-GLES3.functional.texture.speci",
        "fication.texstorage2d.format.r16i_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026795,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texstorage2d.format.r16i_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026796,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texstorage2d.format.r16ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026797,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texstorage2d.format.r16ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026798,
        "dEQP-GLES3.functional.texture.spec",
        "ification.texstorage2d.format.r8_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026799,
        "dEQP-GLES3.functional.texture.speci",
        "fication.texstorage2d.format.r8_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026800,
        "dEQP-GLES3.functional.texture.speci",
        "fication.texstorage2d.format.r8i_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026801,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texstorage2d.format.r8i_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026802,
        "dEQP-GLES3.functional.texture.speci",
        "fication.texstorage2d.format.r8ui_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026803,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texstorage2d.format.r8ui_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026804,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texstorage2d.format.r8_snorm_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026805,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texstorage2d.format.r8_snorm_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026806,
        "dEQP-GLES3.functional.texture.specificatio",
        "n.texstorage2d.format.depth_component32f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026807,
        "dEQP-GLES3.functional.texture.specification",
        ".texstorage2d.format.depth_component32f_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026808,
        "dEQP-GLES3.functional.texture.specificatio",
        "n.texstorage2d.format.depth_component24_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026809,
        "dEQP-GLES3.functional.texture.specification",
        ".texstorage2d.format.depth_component24_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026810,
        "dEQP-GLES3.functional.texture.specificatio",
        "n.texstorage2d.format.depth_component16_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026811,
        "dEQP-GLES3.functional.texture.specification",
        ".texstorage2d.format.depth_component16_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026812,
        "dEQP-GLES3.functional.texture.specificatio",
        "n.texstorage2d.format.depth32f_stencil8_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026813,
        "dEQP-GLES3.functional.texture.specification",
        ".texstorage2d.format.depth32f_stencil8_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026814,
        "dEQP-GLES3.functional.texture.specificati",
        "on.texstorage2d.format.depth24_stencil8_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026815,
        "dEQP-GLES3.functional.texture.specificatio",
        "n.texstorage2d.format.depth24_stencil8_cube");
