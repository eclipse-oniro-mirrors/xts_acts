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

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030938,
        "dEQP-GLES3.functional.fbo.completeness.renderable.",
        "renderbuffer.stencil.depth_component_unsigned_short");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030939,
        "dEQP-GLES3.functional.fbo.completeness.renderable",
        ".renderbuffer.stencil.depth_component_unsigned_int");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030940,
        "dEQP-GLES3.functional.fbo.completeness.rende",
        "rable.renderbuffer.stencil.red_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030941,
        "dEQP-GLES3.functional.fbo.completeness.r",
        "enderable.renderbuffer.stencil.red_float");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030942,
        "dEQP-GLES3.functional.fbo.completeness.rende",
        "rable.renderbuffer.stencil.red_half_float_oes");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030943,
        "dEQP-GLES3.functional.fbo.completeness.rende",
        "rable.renderbuffer.stencil.rgb_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030944,
        "dEQP-GLES3.functional.fbo.completeness.renderab",
        "le.renderbuffer.stencil.rgb_unsigned_short_5_6_5");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030945,
        "dEQP-GLES3.functional.fbo.completeness.renderable.r",
        "enderbuffer.stencil.rgb_unsigned_int_2_10_10_10_rev");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030946,
        "dEQP-GLES3.functional.fbo.completeness.renderable.r",
        "enderbuffer.stencil.rgb_unsigned_int_10f_11f_11f_rev");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030947,
        "dEQP-GLES3.functional.fbo.completeness.rende",
        "rable.renderbuffer.stencil.rgba_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030948,
        "dEQP-GLES3.functional.fbo.completeness.renderable",
        ".renderbuffer.stencil.rgba_unsigned_short_4_4_4_4");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030949,
        "dEQP-GLES3.functional.fbo.completeness.renderable",
        ".renderbuffer.stencil.rgba_unsigned_short_5_5_5_1");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030950,
        "dEQP-GLES3.functional.fbo.completeness.renderable.r",
        "enderbuffer.stencil.rgba_unsigned_int_2_10_10_10_rev");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030951,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.renderbuffer.stencil.rgb8");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030952,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.stencil.rgb10");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030953,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.stencil.rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030954,
        "dEQP-GLES3.functional.fbo.completeness.",
        "renderable.renderbuffer.stencil.rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030955,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.stencil.rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030956,
        "dEQP-GLES3.functional.fbo.completeness.",
        "renderable.renderbuffer.stencil.rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030957,
        "dEQP-GLES3.functional.fbo.completeness.rende",
        "rable.renderbuffer.stencil.depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030958,
        "dEQP-GLES3.functional.fbo.completeness.rende",
        "rable.renderbuffer.stencil.depth_component24");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030959,
        "dEQP-GLES3.functional.fbo.completeness.rende",
        "rable.renderbuffer.stencil.depth_component32");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030960,
        "dEQP-GLES3.functional.fbo.completeness.rend",
        "erable.renderbuffer.stencil.rg_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030961,
        "dEQP-GLES3.functional.fbo.completeness.",
        "renderable.renderbuffer.stencil.rg_float");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030962,
        "dEQP-GLES3.functional.fbo.completeness.rende",
        "rable.renderbuffer.stencil.rg_half_float_oes");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030963,
        "dEQP-GLES3.functional.fbo.completene",
        "ss.renderable.renderbuffer.stencil.r8");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030964,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.renderbuffer.stencil.rg8");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030965,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.renderbuffer.stencil.r16f");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030966,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.renderbuffer.stencil.r32f");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030967,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.stencil.rg16f");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030968,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.stencil.rg32f");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030969,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.renderbuffer.stencil.r8i");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030970,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.renderbuffer.stencil.r8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030971,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.renderbuffer.stencil.r16i");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030972,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.stencil.r16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030973,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.renderbuffer.stencil.r32i");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030974,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.stencil.r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030975,
        "dEQP-GLES3.functional.fbo.completenes",
        "s.renderable.renderbuffer.stencil.rg8i");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030976,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.stencil.rg8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030977,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.stencil.rg16i");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030978,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.stencil.rg16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030979,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.stencil.rg32i");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030980,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.stencil.rg32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030981,
        "dEQP-GLES3.functional.fbo.completeness.renderable.r",
        "enderbuffer.stencil.depth_stencil_unsigned_int_24_8");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030982,
        "dEQP-GLES3.functional.fbo.completeness.",
        "renderable.renderbuffer.stencil.rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030983,
        "dEQP-GLES3.functional.fbo.completeness.",
        "renderable.renderbuffer.stencil.rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030984,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.stencil.rgb16f");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030985,
        "dEQP-GLES3.functional.fbo.completeness.rend",
        "erable.renderbuffer.stencil.depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030986,
        "dEQP-GLES3.functional.fbo.completeness.ren",
        "derable.renderbuffer.stencil.r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030987,
        "dEQP-GLES3.functional.fbo.completeness.",
        "renderable.renderbuffer.stencil.rgb9_e5");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030988,
        "dEQP-GLES3.functional.fbo.completeness.rende",
        "rable.renderbuffer.stencil.srgb_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030989,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.stencil.srgb8");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030990,
        "dEQP-GLES3.functional.fbo.completeness.renderab",
        "le.renderbuffer.stencil.srgb_alpha_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030991,
        "dEQP-GLES3.functional.fbo.completeness.re",
        "nderable.renderbuffer.stencil.srgb8_alpha8");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030992,
        "dEQP-GLES3.functional.fbo.completeness.rende",
        "rable.renderbuffer.stencil.depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030993,
        "dEQP-GLES3.functional.fbo.completeness.rende",
        "rable.renderbuffer.stencil.depth32f_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030994,
        "dEQP-GLES3.functional.fbo.completeness.ren",
        "derable.renderbuffer.stencil.stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030995,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.stencil.rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030996,
        "dEQP-GLES3.functional.fbo.completeness.",
        "renderable.renderbuffer.stencil.rgba32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030997,
        "dEQP-GLES3.functional.fbo.completeness.",
        "renderable.renderbuffer.stencil.rgb32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030998,
        "dEQP-GLES3.functional.fbo.completeness.",
        "renderable.renderbuffer.stencil.rgba16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030999,
        "dEQP-GLES3.functional.fbo.completeness.",
        "renderable.renderbuffer.stencil.rgb16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_031000,
        "dEQP-GLES3.functional.fbo.completeness.",
        "renderable.renderbuffer.stencil.rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_031001,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.stencil.rgb8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_031002,
        "dEQP-GLES3.functional.fbo.completeness.",
        "renderable.renderbuffer.stencil.rgba32i");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_031003,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.stencil.rgb32i");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_031004,
        "dEQP-GLES3.functional.fbo.completeness.",
        "renderable.renderbuffer.stencil.rgba16i");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_031005,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.stencil.rgb16i");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_031006,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.stencil.rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_031007,
        "dEQP-GLES3.functional.fbo.completeness",
        ".renderable.renderbuffer.stencil.rgb8i");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_031008,
        "dEQP-GLES3.functional.fbo.completeness.",
        "renderable.renderbuffer.stencil.r8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_031009,
        "dEQP-GLES3.functional.fbo.completeness.r",
        "enderable.renderbuffer.stencil.rg8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_031010,
        "dEQP-GLES3.functional.fbo.completeness.r",
        "enderable.renderbuffer.stencil.rgb8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_031011,
        "dEQP-GLES3.functional.fbo.completeness.re",
        "nderable.renderbuffer.stencil.rgba8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_031012,
        "dEQP-GLES3.functional.fbo.completeness.",
        "renderable.renderbuffer.stencil.sr8_ext");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_031013,
        "dEQP-GLES3.functional.fbo.completeness.",
        "renderable.renderbuffer.stencil.srg8_ext");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_031014,
        "dEQP-GLES3.functional.fbo.completeness.r",
        "enderable.renderbuffer.stencil.rgb10_a2ui");
