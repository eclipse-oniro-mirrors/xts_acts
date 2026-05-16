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

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031015,
        "dEQP-GLES3.functional.fbo.completeness.renderable",
        ".renderbuffer.depth.depth_component_unsigned_short");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031016,
        "dEQP-GLES3.functional.fbo.completeness.renderabl",
        "e.renderbuffer.depth.depth_component_unsigned_int");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031017,
        "dEQP-GLES3.functional.fbo.completeness.rend",
        "erable.renderbuffer.depth.red_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031018,
        "dEQP-GLES3.functional.fbo.completeness.",
        "renderable.renderbuffer.depth.red_float");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031019,
        "dEQP-GLES3.functional.fbo.completeness.rend",
        "erable.renderbuffer.depth.red_half_float_oes");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031020,
        "dEQP-GLES3.functional.fbo.completeness.rend",
        "erable.renderbuffer.depth.rgb_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031021,
        "dEQP-GLES3.functional.fbo.completeness.rendera",
        "ble.renderbuffer.depth.rgb_unsigned_short_5_6_5");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031022,
        "dEQP-GLES3.functional.fbo.completeness.renderable.",
        "renderbuffer.depth.rgb_unsigned_int_2_10_10_10_rev");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031023,
        "dEQP-GLES3.functional.fbo.completeness.renderable.",
        "renderbuffer.depth.rgb_unsigned_int_10f_11f_11f_rev");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031024,
        "dEQP-GLES3.functional.fbo.completeness.rend",
        "erable.renderbuffer.depth.rgba_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031025,
        "dEQP-GLES3.functional.fbo.completeness.renderabl",
        "e.renderbuffer.depth.rgba_unsigned_short_4_4_4_4");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031026,
        "dEQP-GLES3.functional.fbo.completeness.renderabl",
        "e.renderbuffer.depth.rgba_unsigned_short_5_5_5_1");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031027,
        "dEQP-GLES3.functional.fbo.completeness.renderable.",
        "renderbuffer.depth.rgba_unsigned_int_2_10_10_10_rev");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031028,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.renderbuffer.depth.rgb8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031029,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.renderbuffer.depth.rgb10");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031030,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.renderbuffer.depth.rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031031,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.depth.rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031032,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.renderbuffer.depth.rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031033,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.depth.rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031034,
        "dEQP-GLES3.functional.fbo.completeness.rend",
        "erable.renderbuffer.depth.depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031035,
        "dEQP-GLES3.functional.fbo.completeness.rend",
        "erable.renderbuffer.depth.depth_component24");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031036,
        "dEQP-GLES3.functional.fbo.completeness.rend",
        "erable.renderbuffer.depth.depth_component32");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031037,
        "dEQP-GLES3.functional.fbo.completeness.ren",
        "derable.renderbuffer.depth.rg_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031038,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.depth.rg_float");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031039,
        "dEQP-GLES3.functional.fbo.completeness.rend",
        "erable.renderbuffer.depth.rg_half_float_oes");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031040,
        "dEQP-GLES3.functional.fbo.completen",
        "ess.renderable.renderbuffer.depth.r8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031041,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.renderbuffer.depth.rg8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031042,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.renderbuffer.depth.r16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031043,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.renderbuffer.depth.r32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031044,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.renderbuffer.depth.rg16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031045,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.renderbuffer.depth.rg32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031046,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.renderbuffer.depth.r8i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031047,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.renderbuffer.depth.r8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031048,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.renderbuffer.depth.r16i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031049,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.renderbuffer.depth.r16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031050,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.renderbuffer.depth.r32i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031051,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.renderbuffer.depth.r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031052,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.renderbuffer.depth.rg8i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031053,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.renderbuffer.depth.rg8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031054,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.renderbuffer.depth.rg16i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031055,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.renderbuffer.depth.rg16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031056,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.renderbuffer.depth.rg32i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031057,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.renderbuffer.depth.rg32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031058,
        "dEQP-GLES3.functional.fbo.completeness.renderable.",
        "renderbuffer.depth.depth_stencil_unsigned_int_24_8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031059,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.depth.rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031060,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.depth.rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031061,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.renderbuffer.depth.rgb16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031062,
        "dEQP-GLES3.functional.fbo.completeness.ren",
        "derable.renderbuffer.depth.depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031063,
        "dEQP-GLES3.functional.fbo.completeness.re",
        "nderable.renderbuffer.depth.r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031064,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.depth.rgb9_e5");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031065,
        "dEQP-GLES3.functional.fbo.completeness.rend",
        "erable.renderbuffer.depth.srgb_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031066,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.renderbuffer.depth.srgb8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031067,
        "dEQP-GLES3.functional.fbo.completeness.rendera",
        "ble.renderbuffer.depth.srgb_alpha_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031068,
        "dEQP-GLES3.functional.fbo.completeness.r",
        "enderable.renderbuffer.depth.srgb8_alpha8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031069,
        "dEQP-GLES3.functional.fbo.completeness.rend",
        "erable.renderbuffer.depth.depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031070,
        "dEQP-GLES3.functional.fbo.completeness.rend",
        "erable.renderbuffer.depth.depth32f_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031071,
        "dEQP-GLES3.functional.fbo.completeness.re",
        "nderable.renderbuffer.depth.stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031072,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.renderbuffer.depth.rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031073,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.depth.rgba32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031074,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.depth.rgb32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031075,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.depth.rgba16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031076,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.depth.rgb16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031077,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.depth.rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031078,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.renderbuffer.depth.rgb8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031079,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.depth.rgba32i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031080,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.renderbuffer.depth.rgb32i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031081,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.depth.rgba16i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031082,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.renderbuffer.depth.rgb16i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031083,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.renderbuffer.depth.rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031084,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.renderbuffer.depth.rgb8i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031085,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.depth.r8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031086,
        "dEQP-GLES3.functional.fbo.completeness.",
        "renderable.renderbuffer.depth.rg8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031087,
        "dEQP-GLES3.functional.fbo.completeness.",
        "renderable.renderbuffer.depth.rgb8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031088,
        "dEQP-GLES3.functional.fbo.completeness.r",
        "enderable.renderbuffer.depth.rgba8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031089,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.depth.sr8_ext");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031090,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.depth.srg8_ext");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031091,
        "dEQP-GLES3.functional.fbo.completeness.",
        "renderable.renderbuffer.depth.rgb10_a2ui");
