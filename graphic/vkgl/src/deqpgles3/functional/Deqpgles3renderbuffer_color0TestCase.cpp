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
#include "../ActsDeqpgles30031TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030862,
        "dEQP-GLES3.functional.fbo.completeness.renderable.",
        "renderbuffer.color0.depth_component_unsigned_short");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030863,
        "dEQP-GLES3.functional.fbo.completeness.renderable",
        ".renderbuffer.color0.depth_component_unsigned_int");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030864,
        "dEQP-GLES3.functional.fbo.completeness.rend",
        "erable.renderbuffer.color0.red_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030865,
        "dEQP-GLES3.functional.fbo.completeness.",
        "renderable.renderbuffer.color0.red_float");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030866,
        "dEQP-GLES3.functional.fbo.completeness.rende",
        "rable.renderbuffer.color0.red_half_float_oes");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030867,
        "dEQP-GLES3.functional.fbo.completeness.rend",
        "erable.renderbuffer.color0.rgb_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030868,
        "dEQP-GLES3.functional.fbo.completeness.renderab",
        "le.renderbuffer.color0.rgb_unsigned_short_5_6_5");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030869,
        "dEQP-GLES3.functional.fbo.completeness.renderable.",
        "renderbuffer.color0.rgb_unsigned_int_2_10_10_10_rev");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030870,
        "dEQP-GLES3.functional.fbo.completeness.renderable.r",
        "enderbuffer.color0.rgb_unsigned_int_10f_11f_11f_rev");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030871,
        "dEQP-GLES3.functional.fbo.completeness.rende",
        "rable.renderbuffer.color0.rgba_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030872,
        "dEQP-GLES3.functional.fbo.completeness.renderabl",
        "e.renderbuffer.color0.rgba_unsigned_short_4_4_4_4");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030873,
        "dEQP-GLES3.functional.fbo.completeness.renderabl",
        "e.renderbuffer.color0.rgba_unsigned_short_5_5_5_1");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030874,
        "dEQP-GLES3.functional.fbo.completeness.renderable.r",
        "enderbuffer.color0.rgba_unsigned_int_2_10_10_10_rev");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030875,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.renderbuffer.color0.rgb8");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030876,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.renderbuffer.color0.rgb10");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030877,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.renderbuffer.color0.rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030878,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.color0.rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030879,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.renderbuffer.color0.rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030880,
        "dEQP-GLES3.functional.fbo.completeness.",
        "renderable.renderbuffer.color0.rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030881,
        "dEQP-GLES3.functional.fbo.completeness.rend",
        "erable.renderbuffer.color0.depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030882,
        "dEQP-GLES3.functional.fbo.completeness.rend",
        "erable.renderbuffer.color0.depth_component24");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030883,
        "dEQP-GLES3.functional.fbo.completeness.rend",
        "erable.renderbuffer.color0.depth_component32");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030884,
        "dEQP-GLES3.functional.fbo.completeness.rend",
        "erable.renderbuffer.color0.rg_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030885,
        "dEQP-GLES3.functional.fbo.completeness.",
        "renderable.renderbuffer.color0.rg_float");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030886,
        "dEQP-GLES3.functional.fbo.completeness.rend",
        "erable.renderbuffer.color0.rg_half_float_oes");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030887,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.renderbuffer.color0.r8");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030888,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.renderbuffer.color0.rg8");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030889,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.renderbuffer.color0.r16f");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030890,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.renderbuffer.color0.r32f");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030891,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.renderbuffer.color0.rg16f");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030892,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.renderbuffer.color0.rg32f");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030893,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.renderbuffer.color0.r8i");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030894,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.renderbuffer.color0.r8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030895,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.renderbuffer.color0.r16i");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030896,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.renderbuffer.color0.r16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030897,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.renderbuffer.color0.r32i");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030898,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.renderbuffer.color0.r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030899,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.renderbuffer.color0.rg8i");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030900,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.renderbuffer.color0.rg8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030901,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.renderbuffer.color0.rg16i");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030902,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.color0.rg16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030903,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.renderbuffer.color0.rg32i");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030904,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.color0.rg32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030905,
        "dEQP-GLES3.functional.fbo.completeness.renderable.",
        "renderbuffer.color0.depth_stencil_unsigned_int_24_8");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030906,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.color0.rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030907,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.color0.rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030908,
        "dEQP-GLES3.functional.fbo.completeness.rend",
        "erable.renderbuffer.color0.depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030909,
        "dEQP-GLES3.functional.fbo.completeness.ren",
        "derable.renderbuffer.color0.r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030910,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.color0.rgb9_e5");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030911,
        "dEQP-GLES3.functional.fbo.completeness.rende",
        "rable.renderbuffer.color0.srgb_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030912,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.renderbuffer.color0.srgb8");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030913,
        "dEQP-GLES3.functional.fbo.completeness.renderab",
        "le.renderbuffer.color0.srgb_alpha_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030914,
        "dEQP-GLES3.functional.fbo.completeness.re",
        "nderable.renderbuffer.color0.srgb8_alpha8");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030915,
        "dEQP-GLES3.functional.fbo.completeness.rende",
        "rable.renderbuffer.color0.depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030916,
        "dEQP-GLES3.functional.fbo.completeness.rend",
        "erable.renderbuffer.color0.depth32f_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030917,
        "dEQP-GLES3.functional.fbo.completeness.ren",
        "derable.renderbuffer.color0.stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030918,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.color0.rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030919,
        "dEQP-GLES3.functional.fbo.completeness.",
        "renderable.renderbuffer.color0.rgba32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030920,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.color0.rgb32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030921,
        "dEQP-GLES3.functional.fbo.completeness.",
        "renderable.renderbuffer.color0.rgba16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030922,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.color0.rgb16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030923,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.color0.rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030924,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.color0.rgb8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030925,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.color0.rgba32i");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030926,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.color0.rgb32i");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030927,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.color0.rgba16i");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030928,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.color0.rgb16i");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030929,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.color0.rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030930,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.renderbuffer.color0.rgb8i");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030931,
        "dEQP-GLES3.functional.fbo.completeness.",
        "renderable.renderbuffer.color0.r8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030932,
        "dEQP-GLES3.functional.fbo.completeness.",
        "renderable.renderbuffer.color0.rg8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030933,
        "dEQP-GLES3.functional.fbo.completeness.r",
        "enderable.renderbuffer.color0.rgb8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030934,
        "dEQP-GLES3.functional.fbo.completeness.r",
        "enderable.renderbuffer.color0.rgba8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030935,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.color0.sr8_ext");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030936,
        "dEQP-GLES3.functional.fbo.completeness.",
        "renderable.renderbuffer.color0.srg8_ext");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030937,
        "dEQP-GLES3.functional.fbo.completeness.r",
        "enderable.renderbuffer.color0.rgb10_a2ui");
