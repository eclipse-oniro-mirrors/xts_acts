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

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012752,
        "dEQP-GLES2.functional.fbo.completeness.renderable",
        ".renderbuffer.depth.depth_component_unsigned_short");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012753,
        "dEQP-GLES2.functional.fbo.completeness.renderabl",
        "e.renderbuffer.depth.depth_component_unsigned_int");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012754,
        "dEQP-GLES2.functional.fbo.completeness.rend",
        "erable.renderbuffer.depth.red_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012755,
        "dEQP-GLES2.functional.fbo.completeness.",
        "renderable.renderbuffer.depth.red_float");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012756,
        "dEQP-GLES2.functional.fbo.completeness.rend",
        "erable.renderbuffer.depth.red_half_float_oes");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012757,
        "dEQP-GLES2.functional.fbo.completeness.rend",
        "erable.renderbuffer.depth.rgb_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012758,
        "dEQP-GLES2.functional.fbo.completeness.",
        "renderable.renderbuffer.depth.rgb_float");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012759,
        "dEQP-GLES2.functional.fbo.completeness.rendera",
        "ble.renderbuffer.depth.rgb_unsigned_short_5_6_5");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012760,
        "dEQP-GLES2.functional.fbo.completeness.renderable.",
        "renderbuffer.depth.rgb_unsigned_int_2_10_10_10_rev");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012761,
        "dEQP-GLES2.functional.fbo.completeness.renderable.",
        "renderbuffer.depth.rgb_unsigned_int_10f_11f_11f_rev");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012762,
        "dEQP-GLES2.functional.fbo.completeness.rend",
        "erable.renderbuffer.depth.rgb_half_float_oes");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012763,
        "dEQP-GLES2.functional.fbo.completeness.rend",
        "erable.renderbuffer.depth.rgba_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012764,
        "dEQP-GLES2.functional.fbo.completeness.",
        "renderable.renderbuffer.depth.rgba_float");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012765,
        "dEQP-GLES2.functional.fbo.completeness.renderabl",
        "e.renderbuffer.depth.rgba_unsigned_short_4_4_4_4");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012766,
        "dEQP-GLES2.functional.fbo.completeness.renderabl",
        "e.renderbuffer.depth.rgba_unsigned_short_5_5_5_1");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012767,
        "dEQP-GLES2.functional.fbo.completeness.renderable.",
        "renderbuffer.depth.rgba_unsigned_int_2_10_10_10_rev");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012768,
        "dEQP-GLES2.functional.fbo.completeness.rende",
        "rable.renderbuffer.depth.rgba_half_float_oes");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012769,
        "dEQP-GLES2.functional.fbo.completene",
        "ss.renderable.renderbuffer.depth.rgb8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012770,
        "dEQP-GLES2.functional.fbo.completenes",
        "s.renderable.renderbuffer.depth.rgb10");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012771,
        "dEQP-GLES2.functional.fbo.completenes",
        "s.renderable.renderbuffer.depth.rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012772,
        "dEQP-GLES2.functional.fbo.completeness",
        ".renderable.renderbuffer.depth.rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012773,
        "dEQP-GLES2.functional.fbo.completenes",
        "s.renderable.renderbuffer.depth.rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012774,
        "dEQP-GLES2.functional.fbo.completeness",
        ".renderable.renderbuffer.depth.rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012775,
        "dEQP-GLES2.functional.fbo.completeness.rend",
        "erable.renderbuffer.depth.depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012776,
        "dEQP-GLES2.functional.fbo.completeness.rend",
        "erable.renderbuffer.depth.depth_component24");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012777,
        "dEQP-GLES2.functional.fbo.completeness.rend",
        "erable.renderbuffer.depth.depth_component32");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012778,
        "dEQP-GLES2.functional.fbo.completeness.ren",
        "derable.renderbuffer.depth.rg_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012779,
        "dEQP-GLES2.functional.fbo.completeness",
        ".renderable.renderbuffer.depth.rg_float");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012780,
        "dEQP-GLES2.functional.fbo.completeness.rend",
        "erable.renderbuffer.depth.rg_half_float_oes");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012781,
        "dEQP-GLES2.functional.fbo.completen",
        "ess.renderable.renderbuffer.depth.r8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012782,
        "dEQP-GLES2.functional.fbo.completene",
        "ss.renderable.renderbuffer.depth.rg8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012783,
        "dEQP-GLES2.functional.fbo.completene",
        "ss.renderable.renderbuffer.depth.r16f");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012784,
        "dEQP-GLES2.functional.fbo.completenes",
        "s.renderable.renderbuffer.depth.rg16f");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012785,
        "dEQP-GLES2.functional.fbo.completeness.renderable.",
        "renderbuffer.depth.depth_stencil_unsigned_int_24_8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012786,
        "dEQP-GLES2.functional.fbo.completeness",
        ".renderable.renderbuffer.depth.rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012787,
        "dEQP-GLES2.functional.fbo.completenes",
        "s.renderable.renderbuffer.depth.rgb16f");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012788,
        "dEQP-GLES2.functional.fbo.completeness.ren",
        "derable.renderbuffer.depth.depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012789,
        "dEQP-GLES2.functional.fbo.completeness.re",
        "nderable.renderbuffer.depth.r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012790,
        "dEQP-GLES2.functional.fbo.completeness.rend",
        "erable.renderbuffer.depth.srgb_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012791,
        "dEQP-GLES2.functional.fbo.completenes",
        "s.renderable.renderbuffer.depth.srgb8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012792,
        "dEQP-GLES2.functional.fbo.completeness.rendera",
        "ble.renderbuffer.depth.srgb_alpha_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012793,
        "dEQP-GLES2.functional.fbo.completeness.r",
        "enderable.renderbuffer.depth.srgb8_alpha8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012794,
        "dEQP-GLES2.functional.fbo.completeness.re",
        "nderable.renderbuffer.depth.stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012795,
        "dEQP-GLES2.functional.fbo.completenes",
        "s.renderable.renderbuffer.depth.rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012796,
        "dEQP-GLES2.functional.fbo.completeness",
        ".renderable.renderbuffer.depth.sr8_ext");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012797,
        "dEQP-GLES2.functional.fbo.completeness",
        ".renderable.renderbuffer.depth.srg8_ext");
