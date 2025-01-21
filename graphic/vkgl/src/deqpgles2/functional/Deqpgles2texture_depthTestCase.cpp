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

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012889,
        "dEQP-GLES2.functional.fbo.completeness.renderab",
        "le.texture.depth.depth_component_unsigned_short");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012890,
        "dEQP-GLES2.functional.fbo.completeness.rendera",
        "ble.texture.depth.depth_component_unsigned_int");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012891,
        "dEQP-GLES2.functional.fbo.completeness.r",
        "enderable.texture.depth.red_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012892,
        "dEQP-GLES2.functional.fbo.completene",
        "ss.renderable.texture.depth.red_float");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012893,
        "dEQP-GLES2.functional.fbo.completeness.re",
        "nderable.texture.depth.red_half_float_oes");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012894,
        "dEQP-GLES2.functional.fbo.completeness.r",
        "enderable.texture.depth.rgb_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012895,
        "dEQP-GLES2.functional.fbo.completene",
        "ss.renderable.texture.depth.rgb_float");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012896,
        "dEQP-GLES2.functional.fbo.completeness.rende",
        "rable.texture.depth.rgb_unsigned_short_5_6_5");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012897,
        "dEQP-GLES2.functional.fbo.completeness.renderab",
        "le.texture.depth.rgb_unsigned_int_2_10_10_10_rev");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012898,
        "dEQP-GLES2.functional.fbo.completeness.renderabl",
        "e.texture.depth.rgb_unsigned_int_10f_11f_11f_rev");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012899,
        "dEQP-GLES2.functional.fbo.completeness.re",
        "nderable.texture.depth.rgb_half_float_oes");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012900,
        "dEQP-GLES2.functional.fbo.completeness.re",
        "nderable.texture.depth.rgba_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012901,
        "dEQP-GLES2.functional.fbo.completenes",
        "s.renderable.texture.depth.rgba_float");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012902,
        "dEQP-GLES2.functional.fbo.completeness.render",
        "able.texture.depth.rgba_unsigned_short_4_4_4_4");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012903,
        "dEQP-GLES2.functional.fbo.completeness.render",
        "able.texture.depth.rgba_unsigned_short_5_5_5_1");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012904,
        "dEQP-GLES2.functional.fbo.completeness.renderabl",
        "e.texture.depth.rgba_unsigned_int_2_10_10_10_rev");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012905,
        "dEQP-GLES2.functional.fbo.completeness.re",
        "nderable.texture.depth.rgba_half_float_oes");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012906,
        "dEQP-GLES2.functional.fbo.complete",
        "ness.renderable.texture.depth.rgb8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012907,
        "dEQP-GLES2.functional.fbo.complete",
        "ness.renderable.texture.depth.rgb10");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012908,
        "dEQP-GLES2.functional.fbo.complete",
        "ness.renderable.texture.depth.rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012909,
        "dEQP-GLES2.functional.fbo.completen",
        "ess.renderable.texture.depth.rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012910,
        "dEQP-GLES2.functional.fbo.complete",
        "ness.renderable.texture.depth.rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012911,
        "dEQP-GLES2.functional.fbo.completene",
        "ss.renderable.texture.depth.rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012912,
        "dEQP-GLES2.functional.fbo.completeness.r",
        "enderable.texture.depth.depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012913,
        "dEQP-GLES2.functional.fbo.completeness.r",
        "enderable.texture.depth.depth_component24");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012914,
        "dEQP-GLES2.functional.fbo.completeness.r",
        "enderable.texture.depth.depth_component32");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012915,
        "dEQP-GLES2.functional.fbo.completeness.r",
        "enderable.texture.depth.rg_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012916,
        "dEQP-GLES2.functional.fbo.completene",
        "ss.renderable.texture.depth.rg_float");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012917,
        "dEQP-GLES2.functional.fbo.completeness.r",
        "enderable.texture.depth.rg_half_float_oes");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012918,
        "dEQP-GLES2.functional.fbo.complet",
        "eness.renderable.texture.depth.r8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012919,
        "dEQP-GLES2.functional.fbo.complet",
        "eness.renderable.texture.depth.rg8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012920,
        "dEQP-GLES2.functional.fbo.complete",
        "ness.renderable.texture.depth.r16f");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012921,
        "dEQP-GLES2.functional.fbo.complete",
        "ness.renderable.texture.depth.rg16f");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012922,
        "dEQP-GLES2.functional.fbo.completeness.renderab",
        "le.texture.depth.depth_stencil_unsigned_int_24_8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012923,
        "dEQP-GLES2.functional.fbo.completen",
        "ess.renderable.texture.depth.rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012924,
        "dEQP-GLES2.functional.fbo.completen",
        "ess.renderable.texture.depth.rgb16f");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012925,
        "dEQP-GLES2.functional.fbo.completeness.r",
        "enderable.texture.depth.depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012926,
        "dEQP-GLES2.functional.fbo.completeness.",
        "renderable.texture.depth.r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012927,
        "dEQP-GLES2.functional.fbo.completeness.re",
        "nderable.texture.depth.srgb_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012928,
        "dEQP-GLES2.functional.fbo.complete",
        "ness.renderable.texture.depth.srgb8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012929,
        "dEQP-GLES2.functional.fbo.completeness.rende",
        "rable.texture.depth.srgb_alpha_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012930,
        "dEQP-GLES2.functional.fbo.completeness",
        ".renderable.texture.depth.srgb8_alpha8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012931,
        "dEQP-GLES2.functional.fbo.completeness.",
        "renderable.texture.depth.stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012932,
        "dEQP-GLES2.functional.fbo.completen",
        "ess.renderable.texture.depth.rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012933,
        "dEQP-GLES2.functional.fbo.completen",
        "ess.renderable.texture.depth.sr8_ext");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012934,
        "dEQP-GLES2.functional.fbo.completene",
        "ss.renderable.texture.depth.srg8_ext");
