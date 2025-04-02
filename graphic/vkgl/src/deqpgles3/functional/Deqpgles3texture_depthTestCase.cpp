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

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031245,
        "dEQP-GLES3.functional.fbo.completeness.renderab",
        "le.texture.depth.depth_component_unsigned_short");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031246,
        "dEQP-GLES3.functional.fbo.completeness.rendera",
        "ble.texture.depth.depth_component_unsigned_int");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031247,
        "dEQP-GLES3.functional.fbo.completeness.r",
        "enderable.texture.depth.red_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031248,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.texture.depth.red_float");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031249,
        "dEQP-GLES3.functional.fbo.completeness.re",
        "nderable.texture.depth.red_half_float_oes");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031250,
        "dEQP-GLES3.functional.fbo.completeness.r",
        "enderable.texture.depth.rgb_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031251,
        "dEQP-GLES3.functional.fbo.completeness.rende",
        "rable.texture.depth.rgb_unsigned_short_5_6_5");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031252,
        "dEQP-GLES3.functional.fbo.completeness.renderab",
        "le.texture.depth.rgb_unsigned_int_2_10_10_10_rev");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031253,
        "dEQP-GLES3.functional.fbo.completeness.renderabl",
        "e.texture.depth.rgb_unsigned_int_10f_11f_11f_rev");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031254,
        "dEQP-GLES3.functional.fbo.completeness.re",
        "nderable.texture.depth.rgba_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031255,
        "dEQP-GLES3.functional.fbo.completeness.render",
        "able.texture.depth.rgba_unsigned_short_4_4_4_4");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031256,
        "dEQP-GLES3.functional.fbo.completeness.render",
        "able.texture.depth.rgba_unsigned_short_5_5_5_1");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031257,
        "dEQP-GLES3.functional.fbo.completeness.renderabl",
        "e.texture.depth.rgba_unsigned_int_2_10_10_10_rev");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031258,
        "dEQP-GLES3.functional.fbo.complete",
        "ness.renderable.texture.depth.rgb8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031259,
        "dEQP-GLES3.functional.fbo.complete",
        "ness.renderable.texture.depth.rgb10");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031260,
        "dEQP-GLES3.functional.fbo.complete",
        "ness.renderable.texture.depth.rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031261,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.depth.rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031262,
        "dEQP-GLES3.functional.fbo.complete",
        "ness.renderable.texture.depth.rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031263,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.texture.depth.rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031264,
        "dEQP-GLES3.functional.fbo.completeness.r",
        "enderable.texture.depth.depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031265,
        "dEQP-GLES3.functional.fbo.completeness.r",
        "enderable.texture.depth.depth_component24");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031266,
        "dEQP-GLES3.functional.fbo.completeness.r",
        "enderable.texture.depth.depth_component32");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031267,
        "dEQP-GLES3.functional.fbo.completeness.r",
        "enderable.texture.depth.rg_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031268,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.texture.depth.rg_float");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031269,
        "dEQP-GLES3.functional.fbo.completeness.r",
        "enderable.texture.depth.rg_half_float_oes");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031270,
        "dEQP-GLES3.functional.fbo.complet",
        "eness.renderable.texture.depth.r8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031271,
        "dEQP-GLES3.functional.fbo.complet",
        "eness.renderable.texture.depth.rg8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031272,
        "dEQP-GLES3.functional.fbo.complete",
        "ness.renderable.texture.depth.r16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031273,
        "dEQP-GLES3.functional.fbo.complete",
        "ness.renderable.texture.depth.r32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031274,
        "dEQP-GLES3.functional.fbo.complete",
        "ness.renderable.texture.depth.rg16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031275,
        "dEQP-GLES3.functional.fbo.complete",
        "ness.renderable.texture.depth.rg32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031276,
        "dEQP-GLES3.functional.fbo.complet",
        "eness.renderable.texture.depth.r8i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031277,
        "dEQP-GLES3.functional.fbo.complete",
        "ness.renderable.texture.depth.r8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031278,
        "dEQP-GLES3.functional.fbo.complete",
        "ness.renderable.texture.depth.r16i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031279,
        "dEQP-GLES3.functional.fbo.complete",
        "ness.renderable.texture.depth.r16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031280,
        "dEQP-GLES3.functional.fbo.complete",
        "ness.renderable.texture.depth.r32i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031281,
        "dEQP-GLES3.functional.fbo.complete",
        "ness.renderable.texture.depth.r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031282,
        "dEQP-GLES3.functional.fbo.complete",
        "ness.renderable.texture.depth.rg8i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031283,
        "dEQP-GLES3.functional.fbo.complete",
        "ness.renderable.texture.depth.rg8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031284,
        "dEQP-GLES3.functional.fbo.complete",
        "ness.renderable.texture.depth.rg16i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031285,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.depth.rg16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031286,
        "dEQP-GLES3.functional.fbo.complete",
        "ness.renderable.texture.depth.rg32i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031287,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.depth.rg32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031288,
        "dEQP-GLES3.functional.fbo.completeness.renderab",
        "le.texture.depth.depth_stencil_unsigned_int_24_8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031289,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.depth.rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031290,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.depth.rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031291,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.depth.rgb16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031292,
        "dEQP-GLES3.functional.fbo.completeness.r",
        "enderable.texture.depth.depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031293,
        "dEQP-GLES3.functional.fbo.completeness.",
        "renderable.texture.depth.r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031294,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.depth.rgb9_e5");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031295,
        "dEQP-GLES3.functional.fbo.completeness.re",
        "nderable.texture.depth.srgb_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031296,
        "dEQP-GLES3.functional.fbo.complete",
        "ness.renderable.texture.depth.srgb8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031297,
        "dEQP-GLES3.functional.fbo.completeness.rende",
        "rable.texture.depth.srgb_alpha_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031298,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.texture.depth.srgb8_alpha8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031299,
        "dEQP-GLES3.functional.fbo.completeness.re",
        "nderable.texture.depth.depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031300,
        "dEQP-GLES3.functional.fbo.completeness.r",
        "enderable.texture.depth.depth32f_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031301,
        "dEQP-GLES3.functional.fbo.completeness.",
        "renderable.texture.depth.stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031302,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.depth.rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031303,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.texture.depth.rgba32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031304,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.depth.rgb32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031305,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.texture.depth.rgba16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031306,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.depth.rgb16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031307,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.depth.rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031308,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.depth.rgb8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031309,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.depth.rgba32i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031310,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.depth.rgb32i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031311,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.depth.rgba16i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031312,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.depth.rgb16i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031313,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.depth.rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031314,
        "dEQP-GLES3.functional.fbo.complete",
        "ness.renderable.texture.depth.rgb8i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031315,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.texture.depth.r8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031316,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.texture.depth.rg8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031317,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.texture.depth.rgb8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031318,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.texture.depth.rgba8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031319,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.texture.depth.sr8_ext");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031320,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.texture.depth.srg8_ext");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031321,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.texture.depth.rgb10_a2ui");
