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

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012706,
        "dEQP-GLES2.functional.fbo.completeness.renderable.",
        "renderbuffer.stencil.depth_component_unsigned_short");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012707,
        "dEQP-GLES2.functional.fbo.completeness.renderable",
        ".renderbuffer.stencil.depth_component_unsigned_int");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012708,
        "dEQP-GLES2.functional.fbo.completeness.rende",
        "rable.renderbuffer.stencil.red_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012709,
        "dEQP-GLES2.functional.fbo.completeness.r",
        "enderable.renderbuffer.stencil.red_float");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012710,
        "dEQP-GLES2.functional.fbo.completeness.rende",
        "rable.renderbuffer.stencil.red_half_float_oes");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012711,
        "dEQP-GLES2.functional.fbo.completeness.rende",
        "rable.renderbuffer.stencil.rgb_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012712,
        "dEQP-GLES2.functional.fbo.completeness.r",
        "enderable.renderbuffer.stencil.rgb_float");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012713,
        "dEQP-GLES2.functional.fbo.completeness.renderab",
        "le.renderbuffer.stencil.rgb_unsigned_short_5_6_5");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012714,
        "dEQP-GLES2.functional.fbo.completeness.renderable.r",
        "enderbuffer.stencil.rgb_unsigned_int_2_10_10_10_rev");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012715,
        "dEQP-GLES2.functional.fbo.completeness.renderable.r",
        "enderbuffer.stencil.rgb_unsigned_int_10f_11f_11f_rev");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012716,
        "dEQP-GLES2.functional.fbo.completeness.rende",
        "rable.renderbuffer.stencil.rgb_half_float_oes");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012717,
        "dEQP-GLES2.functional.fbo.completeness.rende",
        "rable.renderbuffer.stencil.rgba_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012718,
        "dEQP-GLES2.functional.fbo.completeness.r",
        "enderable.renderbuffer.stencil.rgba_float");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012719,
        "dEQP-GLES2.functional.fbo.completeness.renderable",
        ".renderbuffer.stencil.rgba_unsigned_short_4_4_4_4");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012720,
        "dEQP-GLES2.functional.fbo.completeness.renderable",
        ".renderbuffer.stencil.rgba_unsigned_short_5_5_5_1");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012721,
        "dEQP-GLES2.functional.fbo.completeness.renderable.r",
        "enderbuffer.stencil.rgba_unsigned_int_2_10_10_10_rev");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012722,
        "dEQP-GLES2.functional.fbo.completeness.render",
        "able.renderbuffer.stencil.rgba_half_float_oes");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012723,
        "dEQP-GLES2.functional.fbo.completenes",
        "s.renderable.renderbuffer.stencil.rgb8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012724,
        "dEQP-GLES2.functional.fbo.completeness",
        ".renderable.renderbuffer.stencil.rgb10");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012725,
        "dEQP-GLES2.functional.fbo.completeness",
        ".renderable.renderbuffer.stencil.rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012726,
        "dEQP-GLES2.functional.fbo.completeness.",
        "renderable.renderbuffer.stencil.rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012727,
        "dEQP-GLES2.functional.fbo.completeness",
        ".renderable.renderbuffer.stencil.rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012728,
        "dEQP-GLES2.functional.fbo.completeness.",
        "renderable.renderbuffer.stencil.rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012729,
        "dEQP-GLES2.functional.fbo.completeness.rende",
        "rable.renderbuffer.stencil.depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012730,
        "dEQP-GLES2.functional.fbo.completeness.rende",
        "rable.renderbuffer.stencil.depth_component24");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012731,
        "dEQP-GLES2.functional.fbo.completeness.rende",
        "rable.renderbuffer.stencil.depth_component32");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012732,
        "dEQP-GLES2.functional.fbo.completeness.rend",
        "erable.renderbuffer.stencil.rg_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012733,
        "dEQP-GLES2.functional.fbo.completeness.",
        "renderable.renderbuffer.stencil.rg_float");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012734,
        "dEQP-GLES2.functional.fbo.completeness.rende",
        "rable.renderbuffer.stencil.rg_half_float_oes");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012735,
        "dEQP-GLES2.functional.fbo.completene",
        "ss.renderable.renderbuffer.stencil.r8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012736,
        "dEQP-GLES2.functional.fbo.completenes",
        "s.renderable.renderbuffer.stencil.rg8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012737,
        "dEQP-GLES2.functional.fbo.completenes",
        "s.renderable.renderbuffer.stencil.r16f");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012738,
        "dEQP-GLES2.functional.fbo.completeness",
        ".renderable.renderbuffer.stencil.rg16f");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012739,
        "dEQP-GLES2.functional.fbo.completeness.renderable.r",
        "enderbuffer.stencil.depth_stencil_unsigned_int_24_8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012740,
        "dEQP-GLES2.functional.fbo.completeness.",
        "renderable.renderbuffer.stencil.rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012741,
        "dEQP-GLES2.functional.fbo.completeness",
        ".renderable.renderbuffer.stencil.rgb16f");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012742,
        "dEQP-GLES2.functional.fbo.completeness.rend",
        "erable.renderbuffer.stencil.depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012743,
        "dEQP-GLES2.functional.fbo.completeness.ren",
        "derable.renderbuffer.stencil.r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012744,
        "dEQP-GLES2.functional.fbo.completeness.rende",
        "rable.renderbuffer.stencil.srgb_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012745,
        "dEQP-GLES2.functional.fbo.completeness",
        ".renderable.renderbuffer.stencil.srgb8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012746,
        "dEQP-GLES2.functional.fbo.completeness.renderab",
        "le.renderbuffer.stencil.srgb_alpha_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012747,
        "dEQP-GLES2.functional.fbo.completeness.re",
        "nderable.renderbuffer.stencil.srgb8_alpha8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012748,
        "dEQP-GLES2.functional.fbo.completeness.ren",
        "derable.renderbuffer.stencil.stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012749,
        "dEQP-GLES2.functional.fbo.completeness",
        ".renderable.renderbuffer.stencil.rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012750,
        "dEQP-GLES2.functional.fbo.completeness.",
        "renderable.renderbuffer.stencil.sr8_ext");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012751,
        "dEQP-GLES2.functional.fbo.completeness.",
        "renderable.renderbuffer.stencil.srg8_ext");
