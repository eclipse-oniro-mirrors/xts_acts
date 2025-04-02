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

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031092,
        "dEQP-GLES3.functional.fbo.completeness.renderab",
        "le.texture.color0.depth_component_unsigned_short");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031093,
        "dEQP-GLES3.functional.fbo.completeness.rendera",
        "ble.texture.color0.depth_component_unsigned_int");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031094,
        "dEQP-GLES3.functional.fbo.completeness.re",
        "nderable.texture.color0.red_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031095,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.texture.color0.red_float");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031096,
        "dEQP-GLES3.functional.fbo.completeness.re",
        "nderable.texture.color0.red_half_float_oes");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031097,
        "dEQP-GLES3.functional.fbo.completeness.re",
        "nderable.texture.color0.rgb_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031098,
        "dEQP-GLES3.functional.fbo.completeness.rende",
        "rable.texture.color0.rgb_unsigned_short_5_6_5");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031099,
        "dEQP-GLES3.functional.fbo.completeness.renderabl",
        "e.texture.color0.rgb_unsigned_int_2_10_10_10_rev");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031100,
        "dEQP-GLES3.functional.fbo.completeness.renderabl",
        "e.texture.color0.rgb_unsigned_int_10f_11f_11f_rev");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031101,
        "dEQP-GLES3.functional.fbo.completeness.re",
        "nderable.texture.color0.rgba_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031102,
        "dEQP-GLES3.functional.fbo.completeness.rendera",
        "ble.texture.color0.rgba_unsigned_short_4_4_4_4");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031103,
        "dEQP-GLES3.functional.fbo.completeness.rendera",
        "ble.texture.color0.rgba_unsigned_short_5_5_5_1");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031104,
        "dEQP-GLES3.functional.fbo.completeness.renderabl",
        "e.texture.color0.rgba_unsigned_int_2_10_10_10_rev");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031105,
        "dEQP-GLES3.functional.fbo.complete",
        "ness.renderable.texture.color0.rgb8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031106,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.color0.rgb10");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031107,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.color0.rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031108,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.texture.color0.rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031109,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.color0.rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031110,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.texture.color0.rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031111,
        "dEQP-GLES3.functional.fbo.completeness.re",
        "nderable.texture.color0.depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031112,
        "dEQP-GLES3.functional.fbo.completeness.re",
        "nderable.texture.color0.depth_component24");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031113,
        "dEQP-GLES3.functional.fbo.completeness.re",
        "nderable.texture.color0.depth_component32");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031114,
        "dEQP-GLES3.functional.fbo.completeness.r",
        "enderable.texture.color0.rg_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031115,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.texture.color0.rg_float");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031116,
        "dEQP-GLES3.functional.fbo.completeness.re",
        "nderable.texture.color0.rg_half_float_oes");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031117,
        "dEQP-GLES3.functional.fbo.complet",
        "eness.renderable.texture.color0.r8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031118,
        "dEQP-GLES3.functional.fbo.complete",
        "ness.renderable.texture.color0.rg8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031119,
        "dEQP-GLES3.functional.fbo.complete",
        "ness.renderable.texture.color0.r16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031120,
        "dEQP-GLES3.functional.fbo.complete",
        "ness.renderable.texture.color0.r32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031121,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.color0.rg16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031122,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.color0.rg32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031123,
        "dEQP-GLES3.functional.fbo.complete",
        "ness.renderable.texture.color0.r8i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031124,
        "dEQP-GLES3.functional.fbo.complete",
        "ness.renderable.texture.color0.r8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031125,
        "dEQP-GLES3.functional.fbo.complete",
        "ness.renderable.texture.color0.r16i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031126,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.color0.r16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031127,
        "dEQP-GLES3.functional.fbo.complete",
        "ness.renderable.texture.color0.r32i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031128,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.color0.r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031129,
        "dEQP-GLES3.functional.fbo.complete",
        "ness.renderable.texture.color0.rg8i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031130,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.color0.rg8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031131,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.color0.rg16i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031132,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.color0.rg16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031133,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.color0.rg32i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031134,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.color0.rg32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031135,
        "dEQP-GLES3.functional.fbo.completeness.renderabl",
        "e.texture.color0.depth_stencil_unsigned_int_24_8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031136,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.texture.color0.rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031137,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.texture.color0.rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031138,
        "dEQP-GLES3.functional.fbo.completeness.r",
        "enderable.texture.color0.depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031139,
        "dEQP-GLES3.functional.fbo.completeness.",
        "renderable.texture.color0.r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031140,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.texture.color0.rgb9_e5");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031141,
        "dEQP-GLES3.functional.fbo.completeness.re",
        "nderable.texture.color0.srgb_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031142,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.color0.srgb8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031143,
        "dEQP-GLES3.functional.fbo.completeness.rende",
        "rable.texture.color0.srgb_alpha_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031144,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.texture.color0.srgb8_alpha8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031145,
        "dEQP-GLES3.functional.fbo.completeness.re",
        "nderable.texture.color0.depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031146,
        "dEQP-GLES3.functional.fbo.completeness.re",
        "nderable.texture.color0.depth32f_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031147,
        "dEQP-GLES3.functional.fbo.completeness.",
        "renderable.texture.color0.stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031148,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.color0.rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031149,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.texture.color0.rgba32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031150,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.texture.color0.rgb32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031151,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.texture.color0.rgba16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031152,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.texture.color0.rgb16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031153,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.texture.color0.rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031154,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.color0.rgb8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031155,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.texture.color0.rgba32i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031156,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.color0.rgb32i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031157,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.texture.color0.rgba16i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031158,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.color0.rgb16i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031159,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.color0.rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031160,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.color0.rgb8i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031161,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.texture.color0.r8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031162,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.texture.color0.rg8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031163,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.texture.color0.rgb8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031164,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.texture.color0.rgba8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031165,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.texture.color0.sr8_ext");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031166,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.texture.color0.srg8_ext");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031167,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.texture.color0.rgb10_a2ui");
