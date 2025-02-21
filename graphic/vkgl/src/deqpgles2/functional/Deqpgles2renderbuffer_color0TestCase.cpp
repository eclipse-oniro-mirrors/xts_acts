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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20013TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012661,
        "dEQP-GLES2.functional.fbo.completeness.renderable.",
        "renderbuffer.color0.depth_component_unsigned_short");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012662,
        "dEQP-GLES2.functional.fbo.completeness.renderable",
        ".renderbuffer.color0.depth_component_unsigned_int");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012663,
        "dEQP-GLES2.functional.fbo.completeness.rend",
        "erable.renderbuffer.color0.red_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012664,
        "dEQP-GLES2.functional.fbo.completeness.",
        "renderable.renderbuffer.color0.red_float");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012665,
        "dEQP-GLES2.functional.fbo.completeness.rende",
        "rable.renderbuffer.color0.red_half_float_oes");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012666,
        "dEQP-GLES2.functional.fbo.completeness.rend",
        "erable.renderbuffer.color0.rgb_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012667,
        "dEQP-GLES2.functional.fbo.completeness.",
        "renderable.renderbuffer.color0.rgb_float");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012668,
        "dEQP-GLES2.functional.fbo.completeness.renderab",
        "le.renderbuffer.color0.rgb_unsigned_short_5_6_5");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012669,
        "dEQP-GLES2.functional.fbo.completeness.renderable.",
        "renderbuffer.color0.rgb_unsigned_int_2_10_10_10_rev");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012670,
        "dEQP-GLES2.functional.fbo.completeness.renderable.r",
        "enderbuffer.color0.rgb_unsigned_int_10f_11f_11f_rev");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012671,
        "dEQP-GLES2.functional.fbo.completeness.rende",
        "rable.renderbuffer.color0.rgb_half_float_oes");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012672,
        "dEQP-GLES2.functional.fbo.completeness.rende",
        "rable.renderbuffer.color0.rgba_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012673,
        "dEQP-GLES2.functional.fbo.completeness.r",
        "enderable.renderbuffer.color0.rgba_float");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012674,
        "dEQP-GLES2.functional.fbo.completeness.renderabl",
        "e.renderbuffer.color0.rgba_unsigned_short_4_4_4_4");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012675,
        "dEQP-GLES2.functional.fbo.completeness.renderabl",
        "e.renderbuffer.color0.rgba_unsigned_short_5_5_5_1");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012676,
        "dEQP-GLES2.functional.fbo.completeness.renderable.r",
        "enderbuffer.color0.rgba_unsigned_int_2_10_10_10_rev");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012677,
        "dEQP-GLES2.functional.fbo.completeness.rende",
        "rable.renderbuffer.color0.rgba_half_float_oes");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012678,
        "dEQP-GLES2.functional.fbo.completenes",
        "s.renderable.renderbuffer.color0.rgb8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012679,
        "dEQP-GLES2.functional.fbo.completenes",
        "s.renderable.renderbuffer.color0.rgb10");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012680,
        "dEQP-GLES2.functional.fbo.completenes",
        "s.renderable.renderbuffer.color0.rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012681,
        "dEQP-GLES2.functional.fbo.completeness",
        ".renderable.renderbuffer.color0.rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012682,
        "dEQP-GLES2.functional.fbo.completenes",
        "s.renderable.renderbuffer.color0.rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012683,
        "dEQP-GLES2.functional.fbo.completeness.",
        "renderable.renderbuffer.color0.rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012684,
        "dEQP-GLES2.functional.fbo.completeness.rend",
        "erable.renderbuffer.color0.depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012685,
        "dEQP-GLES2.functional.fbo.completeness.rend",
        "erable.renderbuffer.color0.depth_component24");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012686,
        "dEQP-GLES2.functional.fbo.completeness.rend",
        "erable.renderbuffer.color0.depth_component32");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012687,
        "dEQP-GLES2.functional.fbo.completeness.rend",
        "erable.renderbuffer.color0.rg_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012688,
        "dEQP-GLES2.functional.fbo.completeness.",
        "renderable.renderbuffer.color0.rg_float");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012689,
        "dEQP-GLES2.functional.fbo.completeness.rend",
        "erable.renderbuffer.color0.rg_half_float_oes");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012690,
        "dEQP-GLES2.functional.fbo.completene",
        "ss.renderable.renderbuffer.color0.r8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012691,
        "dEQP-GLES2.functional.fbo.completene",
        "ss.renderable.renderbuffer.color0.rg8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012692,
        "dEQP-GLES2.functional.fbo.completenes",
        "s.renderable.renderbuffer.color0.r16f");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012693,
        "dEQP-GLES2.functional.fbo.completenes",
        "s.renderable.renderbuffer.color0.rg16f");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012694,
        "dEQP-GLES2.functional.fbo.completeness.renderable.",
        "renderbuffer.color0.depth_stencil_unsigned_int_24_8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012695,
        "dEQP-GLES2.functional.fbo.completeness",
        ".renderable.renderbuffer.color0.rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012696,
        "dEQP-GLES2.functional.fbo.completeness.rend",
        "erable.renderbuffer.color0.depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012697,
        "dEQP-GLES2.functional.fbo.completeness.ren",
        "derable.renderbuffer.color0.r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012698,
        "dEQP-GLES2.functional.fbo.completeness.rende",
        "rable.renderbuffer.color0.srgb_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012699,
        "dEQP-GLES2.functional.fbo.completenes",
        "s.renderable.renderbuffer.color0.srgb8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012700,
        "dEQP-GLES2.functional.fbo.completeness.renderab",
        "le.renderbuffer.color0.srgb_alpha_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012701,
        "dEQP-GLES2.functional.fbo.completeness.re",
        "nderable.renderbuffer.color0.srgb8_alpha8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012702,
        "dEQP-GLES2.functional.fbo.completeness.ren",
        "derable.renderbuffer.color0.stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012703,
        "dEQP-GLES2.functional.fbo.completeness",
        ".renderable.renderbuffer.color0.rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012704,
        "dEQP-GLES2.functional.fbo.completeness",
        ".renderable.renderbuffer.color0.sr8_ext");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012705,
        "dEQP-GLES2.functional.fbo.completeness.",
        "renderable.renderbuffer.color0.srg8_ext");
