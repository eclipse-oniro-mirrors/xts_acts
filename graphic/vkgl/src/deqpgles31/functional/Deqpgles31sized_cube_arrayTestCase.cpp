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
#include "../Deqpgles31BaseFunc.h"
#include "../ActsDeqpgles310013TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012507,
        "dEQP-GLES31.functional.texture.fo",
        "rmat.sized.cube_array.rgba32f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012508,
        "dEQP-GLES31.functional.texture.fo",
        "rmat.sized.cube_array.rgba32f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012509,
        "dEQP-GLES31.functional.texture.fo",
        "rmat.sized.cube_array.rgba32i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012510,
        "dEQP-GLES31.functional.texture.fo",
        "rmat.sized.cube_array.rgba32i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012511,
        "dEQP-GLES31.functional.texture.fo",
        "rmat.sized.cube_array.rgba32ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012512,
        "dEQP-GLES31.functional.texture.for",
        "mat.sized.cube_array.rgba32ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012513,
        "dEQP-GLES31.functional.texture.fo",
        "rmat.sized.cube_array.rgba16f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012514,
        "dEQP-GLES31.functional.texture.fo",
        "rmat.sized.cube_array.rgba16f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012515,
        "dEQP-GLES31.functional.texture.fo",
        "rmat.sized.cube_array.rgba16i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012516,
        "dEQP-GLES31.functional.texture.fo",
        "rmat.sized.cube_array.rgba16i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012517,
        "dEQP-GLES31.functional.texture.fo",
        "rmat.sized.cube_array.rgba16ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012518,
        "dEQP-GLES31.functional.texture.for",
        "mat.sized.cube_array.rgba16ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012519,
        "dEQP-GLES31.functional.texture.f",
        "ormat.sized.cube_array.rgba8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012520,
        "dEQP-GLES31.functional.texture.f",
        "ormat.sized.cube_array.rgba8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012521,
        "dEQP-GLES31.functional.texture.f",
        "ormat.sized.cube_array.rgba8i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012522,
        "dEQP-GLES31.functional.texture.fo",
        "rmat.sized.cube_array.rgba8i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012523,
        "dEQP-GLES31.functional.texture.fo",
        "rmat.sized.cube_array.rgba8ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012524,
        "dEQP-GLES31.functional.texture.fo",
        "rmat.sized.cube_array.rgba8ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012525,
        "dEQP-GLES31.functional.texture.fo",
        "rmat.sized.cube_array.srgb_r8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012526,
        "dEQP-GLES31.functional.texture.fo",
        "rmat.sized.cube_array.srgb_r8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012527,
        "dEQP-GLES31.functional.texture.fo",
        "rmat.sized.cube_array.srgb_rg8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012528,
        "dEQP-GLES31.functional.texture.for",
        "mat.sized.cube_array.srgb_rg8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012529,
        "dEQP-GLES31.functional.texture.form",
        "at.sized.cube_array.srgb8_alpha8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012530,
        "dEQP-GLES31.functional.texture.forma",
        "t.sized.cube_array.srgb8_alpha8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012531,
        "dEQP-GLES31.functional.texture.fo",
        "rmat.sized.cube_array.rgb10_a2_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012532,
        "dEQP-GLES31.functional.texture.for",
        "mat.sized.cube_array.rgb10_a2_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012533,
        "dEQP-GLES31.functional.texture.for",
        "mat.sized.cube_array.rgb10_a2ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012534,
        "dEQP-GLES31.functional.texture.form",
        "at.sized.cube_array.rgb10_a2ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012535,
        "dEQP-GLES31.functional.texture.f",
        "ormat.sized.cube_array.rgba4_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012536,
        "dEQP-GLES31.functional.texture.f",
        "ormat.sized.cube_array.rgba4_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012537,
        "dEQP-GLES31.functional.texture.fo",
        "rmat.sized.cube_array.rgb5_a1_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012538,
        "dEQP-GLES31.functional.texture.fo",
        "rmat.sized.cube_array.rgb5_a1_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012539,
        "dEQP-GLES31.functional.texture.form",
        "at.sized.cube_array.rgba8_snorm_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012540,
        "dEQP-GLES31.functional.texture.form",
        "at.sized.cube_array.rgba8_snorm_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012541,
        "dEQP-GLES31.functional.texture.",
        "format.sized.cube_array.rgb8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012542,
        "dEQP-GLES31.functional.texture.f",
        "ormat.sized.cube_array.rgb8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012543,
        "dEQP-GLES31.functional.texture.f",
        "ormat.sized.cube_array.rgb565_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012544,
        "dEQP-GLES31.functional.texture.fo",
        "rmat.sized.cube_array.rgb565_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012545,
        "dEQP-GLES31.functional.texture.forma",
        "t.sized.cube_array.r11f_g11f_b10f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012546,
        "dEQP-GLES31.functional.texture.format",
        ".sized.cube_array.r11f_g11f_b10f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012547,
        "dEQP-GLES31.functional.texture.f",
        "ormat.sized.cube_array.rgb32f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012548,
        "dEQP-GLES31.functional.texture.fo",
        "rmat.sized.cube_array.rgb32f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012549,
        "dEQP-GLES31.functional.texture.f",
        "ormat.sized.cube_array.rgb32i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012550,
        "dEQP-GLES31.functional.texture.fo",
        "rmat.sized.cube_array.rgb32i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012551,
        "dEQP-GLES31.functional.texture.fo",
        "rmat.sized.cube_array.rgb32ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012552,
        "dEQP-GLES31.functional.texture.fo",
        "rmat.sized.cube_array.rgb32ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012553,
        "dEQP-GLES31.functional.texture.f",
        "ormat.sized.cube_array.rgb16f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012554,
        "dEQP-GLES31.functional.texture.fo",
        "rmat.sized.cube_array.rgb16f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012555,
        "dEQP-GLES31.functional.texture.f",
        "ormat.sized.cube_array.rgb16i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012556,
        "dEQP-GLES31.functional.texture.fo",
        "rmat.sized.cube_array.rgb16i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012557,
        "dEQP-GLES31.functional.texture.fo",
        "rmat.sized.cube_array.rgb16ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012558,
        "dEQP-GLES31.functional.texture.fo",
        "rmat.sized.cube_array.rgb16ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012559,
        "dEQP-GLES31.functional.texture.for",
        "mat.sized.cube_array.rgb8_snorm_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012560,
        "dEQP-GLES31.functional.texture.form",
        "at.sized.cube_array.rgb8_snorm_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012561,
        "dEQP-GLES31.functional.texture.f",
        "ormat.sized.cube_array.rgb8i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012562,
        "dEQP-GLES31.functional.texture.f",
        "ormat.sized.cube_array.rgb8i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012563,
        "dEQP-GLES31.functional.texture.f",
        "ormat.sized.cube_array.rgb8ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012564,
        "dEQP-GLES31.functional.texture.fo",
        "rmat.sized.cube_array.rgb8ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012565,
        "dEQP-GLES31.functional.texture.f",
        "ormat.sized.cube_array.srgb8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012566,
        "dEQP-GLES31.functional.texture.f",
        "ormat.sized.cube_array.srgb8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012567,
        "dEQP-GLES31.functional.texture.fo",
        "rmat.sized.cube_array.rgb9_e5_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012568,
        "dEQP-GLES31.functional.texture.fo",
        "rmat.sized.cube_array.rgb9_e5_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012569,
        "dEQP-GLES31.functional.texture.f",
        "ormat.sized.cube_array.rg32f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012570,
        "dEQP-GLES31.functional.texture.f",
        "ormat.sized.cube_array.rg32f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012571,
        "dEQP-GLES31.functional.texture.f",
        "ormat.sized.cube_array.rg32i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012572,
        "dEQP-GLES31.functional.texture.f",
        "ormat.sized.cube_array.rg32i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012573,
        "dEQP-GLES31.functional.texture.f",
        "ormat.sized.cube_array.rg32ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012574,
        "dEQP-GLES31.functional.texture.fo",
        "rmat.sized.cube_array.rg32ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012575,
        "dEQP-GLES31.functional.texture.f",
        "ormat.sized.cube_array.rg16f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012576,
        "dEQP-GLES31.functional.texture.f",
        "ormat.sized.cube_array.rg16f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012577,
        "dEQP-GLES31.functional.texture.f",
        "ormat.sized.cube_array.rg16i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012578,
        "dEQP-GLES31.functional.texture.f",
        "ormat.sized.cube_array.rg16i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012579,
        "dEQP-GLES31.functional.texture.f",
        "ormat.sized.cube_array.rg16ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012580,
        "dEQP-GLES31.functional.texture.fo",
        "rmat.sized.cube_array.rg16ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012581,
        "dEQP-GLES31.functional.texture.",
        "format.sized.cube_array.rg8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012582,
        "dEQP-GLES31.functional.texture.",
        "format.sized.cube_array.rg8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012583,
        "dEQP-GLES31.functional.texture.",
        "format.sized.cube_array.rg8i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012584,
        "dEQP-GLES31.functional.texture.f",
        "ormat.sized.cube_array.rg8i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012585,
        "dEQP-GLES31.functional.texture.f",
        "ormat.sized.cube_array.rg8ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012586,
        "dEQP-GLES31.functional.texture.f",
        "ormat.sized.cube_array.rg8ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012587,
        "dEQP-GLES31.functional.texture.for",
        "mat.sized.cube_array.rg8_snorm_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012588,
        "dEQP-GLES31.functional.texture.for",
        "mat.sized.cube_array.rg8_snorm_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012589,
        "dEQP-GLES31.functional.texture.",
        "format.sized.cube_array.r32f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012590,
        "dEQP-GLES31.functional.texture.f",
        "ormat.sized.cube_array.r32f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012591,
        "dEQP-GLES31.functional.texture.",
        "format.sized.cube_array.r32i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012592,
        "dEQP-GLES31.functional.texture.f",
        "ormat.sized.cube_array.r32i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012593,
        "dEQP-GLES31.functional.texture.f",
        "ormat.sized.cube_array.r32ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012594,
        "dEQP-GLES31.functional.texture.f",
        "ormat.sized.cube_array.r32ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012595,
        "dEQP-GLES31.functional.texture.",
        "format.sized.cube_array.r16f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012596,
        "dEQP-GLES31.functional.texture.f",
        "ormat.sized.cube_array.r16f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012597,
        "dEQP-GLES31.functional.texture.",
        "format.sized.cube_array.r16i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012598,
        "dEQP-GLES31.functional.texture.f",
        "ormat.sized.cube_array.r16i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012599,
        "dEQP-GLES31.functional.texture.f",
        "ormat.sized.cube_array.r16ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012600,
        "dEQP-GLES31.functional.texture.f",
        "ormat.sized.cube_array.r16ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012601,
        "dEQP-GLES31.functional.texture",
        ".format.sized.cube_array.r8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012602,
        "dEQP-GLES31.functional.texture.",
        "format.sized.cube_array.r8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012603,
        "dEQP-GLES31.functional.texture.",
        "format.sized.cube_array.r8i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012604,
        "dEQP-GLES31.functional.texture.",
        "format.sized.cube_array.r8i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012605,
        "dEQP-GLES31.functional.texture.",
        "format.sized.cube_array.r8ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012606,
        "dEQP-GLES31.functional.texture.f",
        "ormat.sized.cube_array.r8ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012607,
        "dEQP-GLES31.functional.texture.fo",
        "rmat.sized.cube_array.r8_snorm_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012608,
        "dEQP-GLES31.functional.texture.for",
        "mat.sized.cube_array.r8_snorm_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012609,
        "dEQP-GLES31.functional.texture.format.",
        "sized.cube_array.depth_component32f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012610,
        "dEQP-GLES31.functional.texture.format.s",
        "ized.cube_array.depth_component32f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012611,
        "dEQP-GLES31.functional.texture.format.",
        "sized.cube_array.depth_component24_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012612,
        "dEQP-GLES31.functional.texture.format.",
        "sized.cube_array.depth_component24_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012613,
        "dEQP-GLES31.functional.texture.format.",
        "sized.cube_array.depth_component16_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012614,
        "dEQP-GLES31.functional.texture.format.",
        "sized.cube_array.depth_component16_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012615,
        "dEQP-GLES31.functional.texture.format.",
        "sized.cube_array.depth32f_stencil8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012616,
        "dEQP-GLES31.functional.texture.format.",
        "sized.cube_array.depth32f_stencil8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012617,
        "dEQP-GLES31.functional.texture.format",
        ".sized.cube_array.depth24_stencil8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012618,
        "dEQP-GLES31.functional.texture.format.",
        "sized.cube_array.depth24_stencil8_npot");
