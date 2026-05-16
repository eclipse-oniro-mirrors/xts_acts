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

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021999,
        "dEQP-GLES3.functional.texture",
        ".format.sized.cube.rgba32f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022000,
        "dEQP-GLES3.functional.texture.",
        "format.sized.cube.rgba32f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022001,
        "dEQP-GLES3.functional.texture",
        ".format.sized.cube.rgba32i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022002,
        "dEQP-GLES3.functional.texture.",
        "format.sized.cube.rgba32i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022003,
        "dEQP-GLES3.functional.texture.",
        "format.sized.cube.rgba32ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022004,
        "dEQP-GLES3.functional.texture.",
        "format.sized.cube.rgba32ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022005,
        "dEQP-GLES3.functional.texture",
        ".format.sized.cube.rgba16f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022006,
        "dEQP-GLES3.functional.texture.",
        "format.sized.cube.rgba16f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022007,
        "dEQP-GLES3.functional.texture",
        ".format.sized.cube.rgba16i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022008,
        "dEQP-GLES3.functional.texture.",
        "format.sized.cube.rgba16i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022009,
        "dEQP-GLES3.functional.texture.",
        "format.sized.cube.rgba16ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022010,
        "dEQP-GLES3.functional.texture.",
        "format.sized.cube.rgba16ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022011,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.cube.rgba8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022012,
        "dEQP-GLES3.functional.texture",
        ".format.sized.cube.rgba8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022013,
        "dEQP-GLES3.functional.texture",
        ".format.sized.cube.rgba8i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022014,
        "dEQP-GLES3.functional.texture",
        ".format.sized.cube.rgba8i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022015,
        "dEQP-GLES3.functional.texture",
        ".format.sized.cube.rgba8ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022016,
        "dEQP-GLES3.functional.texture.",
        "format.sized.cube.rgba8ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022017,
        "dEQP-GLES3.functional.texture.fo",
        "rmat.sized.cube.srgb8_alpha8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022018,
        "dEQP-GLES3.functional.texture.fo",
        "rmat.sized.cube.srgb8_alpha8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022019,
        "dEQP-GLES3.functional.texture",
        ".format.sized.cube.srgb_r8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022020,
        "dEQP-GLES3.functional.texture.",
        "format.sized.cube.srgb_r8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022021,
        "dEQP-GLES3.functional.texture.",
        "format.sized.cube.srgb_rg8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022022,
        "dEQP-GLES3.functional.texture.",
        "format.sized.cube.srgb_rg8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022023,
        "dEQP-GLES3.functional.texture.",
        "format.sized.cube.rgb10_a2_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022024,
        "dEQP-GLES3.functional.texture.",
        "format.sized.cube.rgb10_a2_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022025,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.cube.rgb10_a2ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022026,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.cube.rgb10_a2ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022027,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.cube.rgba4_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022028,
        "dEQP-GLES3.functional.texture",
        ".format.sized.cube.rgba4_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022029,
        "dEQP-GLES3.functional.texture",
        ".format.sized.cube.rgb5_a1_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022030,
        "dEQP-GLES3.functional.texture.",
        "format.sized.cube.rgb5_a1_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022031,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.cube.rgba8_snorm_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022032,
        "dEQP-GLES3.functional.texture.fo",
        "rmat.sized.cube.rgba8_snorm_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022033,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.cube.rgb8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022034,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.cube.rgb8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022035,
        "dEQP-GLES3.functional.texture",
        ".format.sized.cube.rgb565_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022036,
        "dEQP-GLES3.functional.texture",
        ".format.sized.cube.rgb565_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022037,
        "dEQP-GLES3.functional.texture.for",
        "mat.sized.cube.r11f_g11f_b10f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022038,
        "dEQP-GLES3.functional.texture.for",
        "mat.sized.cube.r11f_g11f_b10f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022039,
        "dEQP-GLES3.functional.texture",
        ".format.sized.cube.rgb32f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022040,
        "dEQP-GLES3.functional.texture",
        ".format.sized.cube.rgb32f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022041,
        "dEQP-GLES3.functional.texture",
        ".format.sized.cube.rgb32i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022042,
        "dEQP-GLES3.functional.texture",
        ".format.sized.cube.rgb32i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022043,
        "dEQP-GLES3.functional.texture",
        ".format.sized.cube.rgb32ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022044,
        "dEQP-GLES3.functional.texture.",
        "format.sized.cube.rgb32ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022045,
        "dEQP-GLES3.functional.texture",
        ".format.sized.cube.rgb16f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022046,
        "dEQP-GLES3.functional.texture",
        ".format.sized.cube.rgb16f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022047,
        "dEQP-GLES3.functional.texture",
        ".format.sized.cube.rgb16i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022048,
        "dEQP-GLES3.functional.texture",
        ".format.sized.cube.rgb16i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022049,
        "dEQP-GLES3.functional.texture",
        ".format.sized.cube.rgb16ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022050,
        "dEQP-GLES3.functional.texture.",
        "format.sized.cube.rgb16ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022051,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.cube.rgb8_snorm_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022052,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.cube.rgb8_snorm_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022053,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.cube.rgb8i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022054,
        "dEQP-GLES3.functional.texture",
        ".format.sized.cube.rgb8i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022055,
        "dEQP-GLES3.functional.texture",
        ".format.sized.cube.rgb8ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022056,
        "dEQP-GLES3.functional.texture",
        ".format.sized.cube.rgb8ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022057,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.cube.srgb8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022058,
        "dEQP-GLES3.functional.texture",
        ".format.sized.cube.srgb8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022059,
        "dEQP-GLES3.functional.texture",
        ".format.sized.cube.rgb9_e5_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022060,
        "dEQP-GLES3.functional.texture.",
        "format.sized.cube.rgb9_e5_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022061,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.cube.rg32f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022062,
        "dEQP-GLES3.functional.texture",
        ".format.sized.cube.rg32f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022063,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.cube.rg32i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022064,
        "dEQP-GLES3.functional.texture",
        ".format.sized.cube.rg32i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022065,
        "dEQP-GLES3.functional.texture",
        ".format.sized.cube.rg32ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022066,
        "dEQP-GLES3.functional.texture",
        ".format.sized.cube.rg32ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022067,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.cube.rg16f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022068,
        "dEQP-GLES3.functional.texture",
        ".format.sized.cube.rg16f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022069,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.cube.rg16i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022070,
        "dEQP-GLES3.functional.texture",
        ".format.sized.cube.rg16i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022071,
        "dEQP-GLES3.functional.texture",
        ".format.sized.cube.rg16ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022072,
        "dEQP-GLES3.functional.texture",
        ".format.sized.cube.rg16ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022073,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.cube.rg8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022074,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.cube.rg8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022075,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.cube.rg8i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022076,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.cube.rg8i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022077,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.cube.rg8ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022078,
        "dEQP-GLES3.functional.texture",
        ".format.sized.cube.rg8ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022079,
        "dEQP-GLES3.functional.texture.",
        "format.sized.cube.rg8_snorm_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022080,
        "dEQP-GLES3.functional.texture.f",
        "ormat.sized.cube.rg8_snorm_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022081,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.cube.r32f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022082,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.cube.r32f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022083,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.cube.r32i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022084,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.cube.r32i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022085,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.cube.r32ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022086,
        "dEQP-GLES3.functional.texture",
        ".format.sized.cube.r32ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022087,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.cube.r16f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022088,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.cube.r16f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022089,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.cube.r16i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022090,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.cube.r16i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022091,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.cube.r16ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022092,
        "dEQP-GLES3.functional.texture",
        ".format.sized.cube.r16ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022093,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.cube.r8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022094,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.cube.r8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022095,
        "dEQP-GLES3.functional.textu",
        "re.format.sized.cube.r8i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022096,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.cube.r8i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022097,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.cube.r8ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022098,
        "dEQP-GLES3.functional.textur",
        "e.format.sized.cube.r8ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022099,
        "dEQP-GLES3.functional.texture.",
        "format.sized.cube.r8_snorm_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022100,
        "dEQP-GLES3.functional.texture.",
        "format.sized.cube.r8_snorm_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022101,
        "dEQP-GLES3.functional.texture.forma",
        "t.sized.cube.depth_component32f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022102,
        "dEQP-GLES3.functional.texture.forma",
        "t.sized.cube.depth_component32f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022103,
        "dEQP-GLES3.functional.texture.form",
        "at.sized.cube.depth_component24_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022104,
        "dEQP-GLES3.functional.texture.forma",
        "t.sized.cube.depth_component24_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022105,
        "dEQP-GLES3.functional.texture.form",
        "at.sized.cube.depth_component16_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022106,
        "dEQP-GLES3.functional.texture.forma",
        "t.sized.cube.depth_component16_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022107,
        "dEQP-GLES3.functional.texture.form",
        "at.sized.cube.depth32f_stencil8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022108,
        "dEQP-GLES3.functional.texture.forma",
        "t.sized.cube.depth32f_stencil8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022109,
        "dEQP-GLES3.functional.texture.form",
        "at.sized.cube.depth24_stencil8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_022110,
        "dEQP-GLES3.functional.texture.form",
        "at.sized.cube.depth24_stencil8_npot");
