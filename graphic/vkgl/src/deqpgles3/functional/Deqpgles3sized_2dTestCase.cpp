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
#include "../ActsDeqpgles30022TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021887,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.2d.rgba32f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021888,
        "dEQP-GLES3.functional.texture",
        ".format.sized.2d.rgba32f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021889,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.2d.rgba32i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021890,
        "dEQP-GLES3.functional.texture",
        ".format.sized.2d.rgba32i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021891,
        "dEQP-GLES3.functional.texture",
        ".format.sized.2d.rgba32ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021892,
        "dEQP-GLES3.functional.texture",
        ".format.sized.2d.rgba32ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021893,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.2d.rgba16f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021894,
        "dEQP-GLES3.functional.texture",
        ".format.sized.2d.rgba16f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021895,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.2d.rgba16i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021896,
        "dEQP-GLES3.functional.texture",
        ".format.sized.2d.rgba16i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021897,
        "dEQP-GLES3.functional.texture",
        ".format.sized.2d.rgba16ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021898,
        "dEQP-GLES3.functional.texture",
        ".format.sized.2d.rgba16ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021899,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.2d.rgba8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021900,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.2d.rgba8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021901,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.2d.rgba8i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021902,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.2d.rgba8i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021903,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.2d.rgba8ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021904,
        "dEQP-GLES3.functional.texture",
        ".format.sized.2d.rgba8ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021905,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.2d.srgb8_alpha8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021906,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.2d.srgb8_alpha8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021907,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.2d.srgb_r8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021908,
        "dEQP-GLES3.functional.texture",
        ".format.sized.2d.srgb_r8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021909,
        "dEQP-GLES3.functional.texture",
        ".format.sized.2d.srgb_rg8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021910,
        "dEQP-GLES3.functional.texture",
        ".format.sized.2d.srgb_rg8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021911,
        "dEQP-GLES3.functional.texture",
        ".format.sized.2d.rgb10_a2_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021912,
        "dEQP-GLES3.functional.texture",
        ".format.sized.2d.rgb10_a2_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021913,
        "dEQP-GLES3.functional.texture.",
        "format.sized.2d.rgb10_a2ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021914,
        "dEQP-GLES3.functional.texture.",
        "format.sized.2d.rgb10_a2ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021915,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.2d.rgba4_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021916,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.2d.rgba4_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021917,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.2d.rgb5_a1_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021918,
        "dEQP-GLES3.functional.texture",
        ".format.sized.2d.rgb5_a1_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021919,
        "dEQP-GLES3.functional.texture.",
        "format.sized.2d.rgba8_snorm_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021920,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.2d.rgba8_snorm_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021921,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.2d.rgb8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021922,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.2d.rgb8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021923,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.2d.rgb565_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021924,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.2d.rgb565_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021925,
        "dEQP-GLES3.functional.texture.fo",
        "rmat.sized.2d.r11f_g11f_b10f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021926,
        "dEQP-GLES3.functional.texture.fo",
        "rmat.sized.2d.r11f_g11f_b10f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021927,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.2d.rgb32f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021928,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.2d.rgb32f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021929,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.2d.rgb32i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021930,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.2d.rgb32i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021931,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.2d.rgb32ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021932,
        "dEQP-GLES3.functional.texture",
        ".format.sized.2d.rgb32ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021933,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.2d.rgb16f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021934,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.2d.rgb16f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021935,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.2d.rgb16i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021936,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.2d.rgb16i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021937,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.2d.rgb16ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021938,
        "dEQP-GLES3.functional.texture",
        ".format.sized.2d.rgb16ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021939,
        "dEQP-GLES3.functional.texture.",
        "format.sized.2d.rgb8_snorm_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021940,
        "dEQP-GLES3.functional.texture.",
        "format.sized.2d.rgb8_snorm_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021941,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.2d.rgb8i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021942,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.2d.rgb8i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021943,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.2d.rgb8ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021944,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.2d.rgb8ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021945,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.2d.srgb8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021946,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.2d.srgb8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021947,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.2d.rgb9_e5_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021948,
        "dEQP-GLES3.functional.texture",
        ".format.sized.2d.rgb9_e5_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021949,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.2d.rg32f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021950,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.2d.rg32f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021951,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.2d.rg32i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021952,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.2d.rg32i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021953,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.2d.rg32ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021954,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.2d.rg32ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021955,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.2d.rg16f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021956,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.2d.rg16f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021957,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.2d.rg16i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021958,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.2d.rg16i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021959,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.2d.rg16ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021960,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.2d.rg16ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021961,
        "dEQP-GLES3.functional.text",
        "ure.format.sized.2d.rg8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021962,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.2d.rg8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021963,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.2d.rg8i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021964,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.2d.rg8i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021965,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.2d.rg8ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021966,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.2d.rg8ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021967,
        "dEQP-GLES3.functional.texture",
        ".format.sized.2d.rg8_snorm_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021968,
        "dEQP-GLES3.functional.texture.",
        "format.sized.2d.rg8_snorm_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021969,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.2d.r32f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021970,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.2d.r32f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021971,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.2d.r32i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021972,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.2d.r32i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021973,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.2d.r32ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021974,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.2d.r32ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021975,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.2d.r16f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021976,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.2d.r16f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021977,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.2d.r16i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021978,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.2d.r16i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021979,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.2d.r16ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021980,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.2d.r16ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021981,
        "dEQP-GLES3.functional.text",
        "ure.format.sized.2d.r8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021982,
        "dEQP-GLES3.functional.text",
        "ure.format.sized.2d.r8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021983,
        "dEQP-GLES3.functional.text",
        "ure.format.sized.2d.r8i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021984,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.2d.r8i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021985,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.2d.r8ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021986,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.2d.r8ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021987,
        "dEQP-GLES3.functional.texture",
        ".format.sized.2d.r8_snorm_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021988,
        "dEQP-GLES3.functional.texture",
        ".format.sized.2d.r8_snorm_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021989,
        "dEQP-GLES3.functional.texture.form",
        "at.sized.2d.depth_component32f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021990,
        "dEQP-GLES3.functional.texture.form",
        "at.sized.2d.depth_component32f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021991,
        "dEQP-GLES3.functional.texture.for",
        "mat.sized.2d.depth_component24_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021992,
        "dEQP-GLES3.functional.texture.form",
        "at.sized.2d.depth_component24_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021993,
        "dEQP-GLES3.functional.texture.for",
        "mat.sized.2d.depth_component16_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021994,
        "dEQP-GLES3.functional.texture.form",
        "at.sized.2d.depth_component16_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021995,
        "dEQP-GLES3.functional.texture.for",
        "mat.sized.2d.depth32f_stencil8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021996,
        "dEQP-GLES3.functional.texture.form",
        "at.sized.2d.depth32f_stencil8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021997,
        "dEQP-GLES3.functional.texture.for",
        "mat.sized.2d.depth24_stencil8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021998,
        "dEQP-GLES3.functional.texture.for",
        "mat.sized.2d.depth24_stencil8_npot");
