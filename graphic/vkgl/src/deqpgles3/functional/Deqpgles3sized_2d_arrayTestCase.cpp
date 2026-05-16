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
#include "../ActsDeqpgles30023TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022111,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.2d_array.rgba32f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022112,
        "dEQP-GLES3.functional.texture.fo",
        "rmat.sized.2d_array.rgba32f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022113,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.2d_array.rgba32i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022114,
        "dEQP-GLES3.functional.texture.fo",
        "rmat.sized.2d_array.rgba32i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022115,
        "dEQP-GLES3.functional.texture.fo",
        "rmat.sized.2d_array.rgba32ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022116,
        "dEQP-GLES3.functional.texture.fo",
        "rmat.sized.2d_array.rgba32ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022117,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.2d_array.rgba16f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022118,
        "dEQP-GLES3.functional.texture.fo",
        "rmat.sized.2d_array.rgba16f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022119,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.2d_array.rgba16i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022120,
        "dEQP-GLES3.functional.texture.fo",
        "rmat.sized.2d_array.rgba16i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022121,
        "dEQP-GLES3.functional.texture.fo",
        "rmat.sized.2d_array.rgba16ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022122,
        "dEQP-GLES3.functional.texture.fo",
        "rmat.sized.2d_array.rgba16ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022123,
        "dEQP-GLES3.functional.texture.",
        "format.sized.2d_array.rgba8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022124,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.2d_array.rgba8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022125,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.2d_array.rgba8i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022126,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.2d_array.rgba8i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022127,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.2d_array.rgba8ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022128,
        "dEQP-GLES3.functional.texture.fo",
        "rmat.sized.2d_array.rgba8ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022129,
        "dEQP-GLES3.functional.texture.form",
        "at.sized.2d_array.srgb8_alpha8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022130,
        "dEQP-GLES3.functional.texture.form",
        "at.sized.2d_array.srgb8_alpha8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022131,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.2d_array.srgb_r8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022132,
        "dEQP-GLES3.functional.texture.fo",
        "rmat.sized.2d_array.srgb_r8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022133,
        "dEQP-GLES3.functional.texture.fo",
        "rmat.sized.2d_array.srgb_rg8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022134,
        "dEQP-GLES3.functional.texture.fo",
        "rmat.sized.2d_array.srgb_rg8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022135,
        "dEQP-GLES3.functional.texture.fo",
        "rmat.sized.2d_array.rgb10_a2_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022136,
        "dEQP-GLES3.functional.texture.fo",
        "rmat.sized.2d_array.rgb10_a2_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022137,
        "dEQP-GLES3.functional.texture.for",
        "mat.sized.2d_array.rgb10_a2ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022138,
        "dEQP-GLES3.functional.texture.for",
        "mat.sized.2d_array.rgb10_a2ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022139,
        "dEQP-GLES3.functional.texture.",
        "format.sized.2d_array.rgba4_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022140,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.2d_array.rgba4_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022141,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.2d_array.rgb5_a1_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022142,
        "dEQP-GLES3.functional.texture.fo",
        "rmat.sized.2d_array.rgb5_a1_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022143,
        "dEQP-GLES3.functional.texture.for",
        "mat.sized.2d_array.rgba8_snorm_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022144,
        "dEQP-GLES3.functional.texture.form",
        "at.sized.2d_array.rgba8_snorm_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022145,
        "dEQP-GLES3.functional.texture.",
        "format.sized.2d_array.rgb8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022146,
        "dEQP-GLES3.functional.texture.",
        "format.sized.2d_array.rgb8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022147,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.2d_array.rgb565_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022148,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.2d_array.rgb565_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022149,
        "dEQP-GLES3.functional.texture.forma",
        "t.sized.2d_array.r11f_g11f_b10f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022150,
        "dEQP-GLES3.functional.texture.forma",
        "t.sized.2d_array.r11f_g11f_b10f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022151,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.2d_array.rgb32f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022152,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.2d_array.rgb32f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022153,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.2d_array.rgb32i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022154,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.2d_array.rgb32i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022155,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.2d_array.rgb32ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022156,
        "dEQP-GLES3.functional.texture.fo",
        "rmat.sized.2d_array.rgb32ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022157,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.2d_array.rgb16f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022158,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.2d_array.rgb16f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022159,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.2d_array.rgb16i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022160,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.2d_array.rgb16i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022161,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.2d_array.rgb16ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022162,
        "dEQP-GLES3.functional.texture.fo",
        "rmat.sized.2d_array.rgb16ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022163,
        "dEQP-GLES3.functional.texture.for",
        "mat.sized.2d_array.rgb8_snorm_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022164,
        "dEQP-GLES3.functional.texture.for",
        "mat.sized.2d_array.rgb8_snorm_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022165,
        "dEQP-GLES3.functional.texture.",
        "format.sized.2d_array.rgb8i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022166,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.2d_array.rgb8i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022167,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.2d_array.rgb8ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022168,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.2d_array.rgb8ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022169,
        "dEQP-GLES3.functional.texture.",
        "format.sized.2d_array.srgb8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022170,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.2d_array.srgb8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022171,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.2d_array.rgb9_e5_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022172,
        "dEQP-GLES3.functional.texture.fo",
        "rmat.sized.2d_array.rgb9_e5_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022173,
        "dEQP-GLES3.functional.texture.",
        "format.sized.2d_array.rg32f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022174,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.2d_array.rg32f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022175,
        "dEQP-GLES3.functional.texture.",
        "format.sized.2d_array.rg32i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022176,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.2d_array.rg32i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022177,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.2d_array.rg32ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022178,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.2d_array.rg32ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022179,
        "dEQP-GLES3.functional.texture.",
        "format.sized.2d_array.rg16f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022180,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.2d_array.rg16f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022181,
        "dEQP-GLES3.functional.texture.",
        "format.sized.2d_array.rg16i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022182,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.2d_array.rg16i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022183,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.2d_array.rg16ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022184,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.2d_array.rg16ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022185,
        "dEQP-GLES3.functional.texture",
        ".format.sized.2d_array.rg8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022186,
        "dEQP-GLES3.functional.texture.",
        "format.sized.2d_array.rg8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022187,
        "dEQP-GLES3.functional.texture.",
        "format.sized.2d_array.rg8i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022188,
        "dEQP-GLES3.functional.texture.",
        "format.sized.2d_array.rg8i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022189,
        "dEQP-GLES3.functional.texture.",
        "format.sized.2d_array.rg8ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022190,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.2d_array.rg8ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022191,
        "dEQP-GLES3.functional.texture.fo",
        "rmat.sized.2d_array.rg8_snorm_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022192,
        "dEQP-GLES3.functional.texture.for",
        "mat.sized.2d_array.rg8_snorm_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022193,
        "dEQP-GLES3.functional.texture.",
        "format.sized.2d_array.r32f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022194,
        "dEQP-GLES3.functional.texture.",
        "format.sized.2d_array.r32f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022195,
        "dEQP-GLES3.functional.texture.",
        "format.sized.2d_array.r32i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022196,
        "dEQP-GLES3.functional.texture.",
        "format.sized.2d_array.r32i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022197,
        "dEQP-GLES3.functional.texture.",
        "format.sized.2d_array.r32ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022198,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.2d_array.r32ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022199,
        "dEQP-GLES3.functional.texture.",
        "format.sized.2d_array.r16f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022200,
        "dEQP-GLES3.functional.texture.",
        "format.sized.2d_array.r16f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022201,
        "dEQP-GLES3.functional.texture.",
        "format.sized.2d_array.r16i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022202,
        "dEQP-GLES3.functional.texture.",
        "format.sized.2d_array.r16i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022203,
        "dEQP-GLES3.functional.texture.",
        "format.sized.2d_array.r16ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022204,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.2d_array.r16ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022205,
        "dEQP-GLES3.functional.texture",
        ".format.sized.2d_array.r8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022206,
        "dEQP-GLES3.functional.texture",
        ".format.sized.2d_array.r8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022207,
        "dEQP-GLES3.functional.texture",
        ".format.sized.2d_array.r8i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022208,
        "dEQP-GLES3.functional.texture.",
        "format.sized.2d_array.r8i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022209,
        "dEQP-GLES3.functional.texture.",
        "format.sized.2d_array.r8ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022210,
        "dEQP-GLES3.functional.texture.",
        "format.sized.2d_array.r8ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022211,
        "dEQP-GLES3.functional.texture.fo",
        "rmat.sized.2d_array.r8_snorm_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022212,
        "dEQP-GLES3.functional.texture.fo",
        "rmat.sized.2d_array.r8_snorm_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022213,
        "dEQP-GLES3.functional.texture.format.",
        "sized.2d_array.depth_component32f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022214,
        "dEQP-GLES3.functional.texture.format.",
        "sized.2d_array.depth_component32f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022215,
        "dEQP-GLES3.functional.texture.format",
        ".sized.2d_array.depth_component24_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022216,
        "dEQP-GLES3.functional.texture.format.",
        "sized.2d_array.depth_component24_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022217,
        "dEQP-GLES3.functional.texture.format",
        ".sized.2d_array.depth_component16_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022218,
        "dEQP-GLES3.functional.texture.format.",
        "sized.2d_array.depth_component16_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022219,
        "dEQP-GLES3.functional.texture.format",
        ".sized.2d_array.depth32f_stencil8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022220,
        "dEQP-GLES3.functional.texture.format.",
        "sized.2d_array.depth32f_stencil8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022221,
        "dEQP-GLES3.functional.texture.format",
        ".sized.2d_array.depth24_stencil8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022222,
        "dEQP-GLES3.functional.texture.format",
        ".sized.2d_array.depth24_stencil8_npot");
