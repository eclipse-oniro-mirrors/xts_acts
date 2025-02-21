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

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012843,
        "dEQP-GLES2.functional.fbo.completeness.renderabl",
        "e.texture.stencil.depth_component_unsigned_short");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012844,
        "dEQP-GLES2.functional.fbo.completeness.renderab",
        "le.texture.stencil.depth_component_unsigned_int");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012845,
        "dEQP-GLES2.functional.fbo.completeness.re",
        "nderable.texture.stencil.red_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012846,
        "dEQP-GLES2.functional.fbo.completenes",
        "s.renderable.texture.stencil.red_float");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012847,
        "dEQP-GLES2.functional.fbo.completeness.ren",
        "derable.texture.stencil.red_half_float_oes");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012848,
        "dEQP-GLES2.functional.fbo.completeness.re",
        "nderable.texture.stencil.rgb_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012849,
        "dEQP-GLES2.functional.fbo.completenes",
        "s.renderable.texture.stencil.rgb_float");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012850,
        "dEQP-GLES2.functional.fbo.completeness.render",
        "able.texture.stencil.rgb_unsigned_short_5_6_5");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012851,
        "dEQP-GLES2.functional.fbo.completeness.renderabl",
        "e.texture.stencil.rgb_unsigned_int_2_10_10_10_rev");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012852,
        "dEQP-GLES2.functional.fbo.completeness.renderable",
        ".texture.stencil.rgb_unsigned_int_10f_11f_11f_rev");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012853,
        "dEQP-GLES2.functional.fbo.completeness.ren",
        "derable.texture.stencil.rgb_half_float_oes");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012854,
        "dEQP-GLES2.functional.fbo.completeness.ren",
        "derable.texture.stencil.rgba_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012855,
        "dEQP-GLES2.functional.fbo.completeness",
        ".renderable.texture.stencil.rgba_float");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012856,
        "dEQP-GLES2.functional.fbo.completeness.rendera",
        "ble.texture.stencil.rgba_unsigned_short_4_4_4_4");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012857,
        "dEQP-GLES2.functional.fbo.completeness.rendera",
        "ble.texture.stencil.rgba_unsigned_short_5_5_5_1");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012858,
        "dEQP-GLES2.functional.fbo.completeness.renderable",
        ".texture.stencil.rgba_unsigned_int_2_10_10_10_rev");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012859,
        "dEQP-GLES2.functional.fbo.completeness.ren",
        "derable.texture.stencil.rgba_half_float_oes");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012860,
        "dEQP-GLES2.functional.fbo.completen",
        "ess.renderable.texture.stencil.rgb8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012861,
        "dEQP-GLES2.functional.fbo.completen",
        "ess.renderable.texture.stencil.rgb10");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012862,
        "dEQP-GLES2.functional.fbo.completen",
        "ess.renderable.texture.stencil.rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012863,
        "dEQP-GLES2.functional.fbo.completene",
        "ss.renderable.texture.stencil.rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012864,
        "dEQP-GLES2.functional.fbo.completen",
        "ess.renderable.texture.stencil.rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012865,
        "dEQP-GLES2.functional.fbo.completenes",
        "s.renderable.texture.stencil.rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012866,
        "dEQP-GLES2.functional.fbo.completeness.re",
        "nderable.texture.stencil.depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012867,
        "dEQP-GLES2.functional.fbo.completeness.re",
        "nderable.texture.stencil.depth_component24");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012868,
        "dEQP-GLES2.functional.fbo.completeness.re",
        "nderable.texture.stencil.depth_component32");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012869,
        "dEQP-GLES2.functional.fbo.completeness.re",
        "nderable.texture.stencil.rg_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012870,
        "dEQP-GLES2.functional.fbo.completenes",
        "s.renderable.texture.stencil.rg_float");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012871,
        "dEQP-GLES2.functional.fbo.completeness.re",
        "nderable.texture.stencil.rg_half_float_oes");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012872,
        "dEQP-GLES2.functional.fbo.complete",
        "ness.renderable.texture.stencil.r8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012873,
        "dEQP-GLES2.functional.fbo.complete",
        "ness.renderable.texture.stencil.rg8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012874,
        "dEQP-GLES2.functional.fbo.completen",
        "ess.renderable.texture.stencil.r16f");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012875,
        "dEQP-GLES2.functional.fbo.completen",
        "ess.renderable.texture.stencil.rg16f");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012876,
        "dEQP-GLES2.functional.fbo.completeness.renderabl",
        "e.texture.stencil.depth_stencil_unsigned_int_24_8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012877,
        "dEQP-GLES2.functional.fbo.completene",
        "ss.renderable.texture.stencil.rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012878,
        "dEQP-GLES2.functional.fbo.completene",
        "ss.renderable.texture.stencil.rgb16f");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012879,
        "dEQP-GLES2.functional.fbo.completeness.re",
        "nderable.texture.stencil.depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012880,
        "dEQP-GLES2.functional.fbo.completeness.r",
        "enderable.texture.stencil.r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012881,
        "dEQP-GLES2.functional.fbo.completeness.ren",
        "derable.texture.stencil.srgb_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012882,
        "dEQP-GLES2.functional.fbo.completen",
        "ess.renderable.texture.stencil.srgb8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012883,
        "dEQP-GLES2.functional.fbo.completeness.render",
        "able.texture.stencil.srgb_alpha_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012884,
        "dEQP-GLES2.functional.fbo.completeness.",
        "renderable.texture.stencil.srgb8_alpha8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012885,
        "dEQP-GLES2.functional.fbo.completeness.r",
        "enderable.texture.stencil.stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012886,
        "dEQP-GLES2.functional.fbo.completene",
        "ss.renderable.texture.stencil.rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012887,
        "dEQP-GLES2.functional.fbo.completene",
        "ss.renderable.texture.stencil.sr8_ext");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012888,
        "dEQP-GLES2.functional.fbo.completenes",
        "s.renderable.texture.stencil.srg8_ext");
