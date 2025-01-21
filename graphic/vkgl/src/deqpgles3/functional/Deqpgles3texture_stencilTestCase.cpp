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
#include "../ActsDeqpgles30032TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031168,
        "dEQP-GLES3.functional.fbo.completeness.renderabl",
        "e.texture.stencil.depth_component_unsigned_short");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031169,
        "dEQP-GLES3.functional.fbo.completeness.renderab",
        "le.texture.stencil.depth_component_unsigned_int");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031170,
        "dEQP-GLES3.functional.fbo.completeness.re",
        "nderable.texture.stencil.red_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031171,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.texture.stencil.red_float");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031172,
        "dEQP-GLES3.functional.fbo.completeness.ren",
        "derable.texture.stencil.red_half_float_oes");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031173,
        "dEQP-GLES3.functional.fbo.completeness.re",
        "nderable.texture.stencil.rgb_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031174,
        "dEQP-GLES3.functional.fbo.completeness.render",
        "able.texture.stencil.rgb_unsigned_short_5_6_5");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031175,
        "dEQP-GLES3.functional.fbo.completeness.renderabl",
        "e.texture.stencil.rgb_unsigned_int_2_10_10_10_rev");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031176,
        "dEQP-GLES3.functional.fbo.completeness.renderable",
        ".texture.stencil.rgb_unsigned_int_10f_11f_11f_rev");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031177,
        "dEQP-GLES3.functional.fbo.completeness.ren",
        "derable.texture.stencil.rgba_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031178,
        "dEQP-GLES3.functional.fbo.completeness.rendera",
        "ble.texture.stencil.rgba_unsigned_short_4_4_4_4");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031179,
        "dEQP-GLES3.functional.fbo.completeness.rendera",
        "ble.texture.stencil.rgba_unsigned_short_5_5_5_1");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031180,
        "dEQP-GLES3.functional.fbo.completeness.renderable",
        ".texture.stencil.rgba_unsigned_int_2_10_10_10_rev");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031181,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.stencil.rgb8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031182,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.stencil.rgb10");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031183,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.stencil.rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031184,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.texture.stencil.rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031185,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.stencil.rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031186,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.texture.stencil.rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031187,
        "dEQP-GLES3.functional.fbo.completeness.re",
        "nderable.texture.stencil.depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031188,
        "dEQP-GLES3.functional.fbo.completeness.re",
        "nderable.texture.stencil.depth_component24");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031189,
        "dEQP-GLES3.functional.fbo.completeness.re",
        "nderable.texture.stencil.depth_component32");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031190,
        "dEQP-GLES3.functional.fbo.completeness.re",
        "nderable.texture.stencil.rg_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031191,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.texture.stencil.rg_float");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031192,
        "dEQP-GLES3.functional.fbo.completeness.re",
        "nderable.texture.stencil.rg_half_float_oes");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031193,
        "dEQP-GLES3.functional.fbo.complete",
        "ness.renderable.texture.stencil.r8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031194,
        "dEQP-GLES3.functional.fbo.complete",
        "ness.renderable.texture.stencil.rg8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031195,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.stencil.r16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031196,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.stencil.r32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031197,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.stencil.rg16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031198,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.stencil.rg32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031199,
        "dEQP-GLES3.functional.fbo.complete",
        "ness.renderable.texture.stencil.r8i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031200,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.stencil.r8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031201,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.stencil.r16i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031202,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.stencil.r16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031203,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.stencil.r32i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031204,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.stencil.r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031205,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.stencil.rg8i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031206,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.stencil.rg8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031207,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.stencil.rg16i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031208,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.texture.stencil.rg16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031209,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.stencil.rg32i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031210,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.texture.stencil.rg32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031211,
        "dEQP-GLES3.functional.fbo.completeness.renderabl",
        "e.texture.stencil.depth_stencil_unsigned_int_24_8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031212,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.texture.stencil.rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031213,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.texture.stencil.rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031214,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.texture.stencil.rgb16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031215,
        "dEQP-GLES3.functional.fbo.completeness.re",
        "nderable.texture.stencil.depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031216,
        "dEQP-GLES3.functional.fbo.completeness.r",
        "enderable.texture.stencil.r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031217,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.texture.stencil.rgb9_e5");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031218,
        "dEQP-GLES3.functional.fbo.completeness.ren",
        "derable.texture.stencil.srgb_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031219,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.stencil.srgb8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031220,
        "dEQP-GLES3.functional.fbo.completeness.render",
        "able.texture.stencil.srgb_alpha_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031221,
        "dEQP-GLES3.functional.fbo.completeness.",
        "renderable.texture.stencil.srgb8_alpha8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031222,
        "dEQP-GLES3.functional.fbo.completeness.ren",
        "derable.texture.stencil.depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031223,
        "dEQP-GLES3.functional.fbo.completeness.re",
        "nderable.texture.stencil.depth32f_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031224,
        "dEQP-GLES3.functional.fbo.completeness.r",
        "enderable.texture.stencil.stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031225,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.texture.stencil.rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031226,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.texture.stencil.rgba32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031227,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.texture.stencil.rgb32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031228,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.texture.stencil.rgba16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031229,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.texture.stencil.rgb16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031230,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.texture.stencil.rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031231,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.texture.stencil.rgb8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031232,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.texture.stencil.rgba32i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031233,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.texture.stencil.rgb32i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031234,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.texture.stencil.rgba16i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031235,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.texture.stencil.rgb16i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031236,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.texture.stencil.rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031237,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.stencil.rgb8i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031238,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.texture.stencil.r8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031239,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.texture.stencil.rg8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031240,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.texture.stencil.rgb8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031241,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.texture.stencil.rgba8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031242,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.texture.stencil.sr8_ext");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031243,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.texture.stencil.srg8_ext");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031244,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.texture.stencil.rgb10_a2ui");
