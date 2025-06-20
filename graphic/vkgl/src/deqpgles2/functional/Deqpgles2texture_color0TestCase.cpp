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

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012798,
        "dEQP-GLES2.functional.fbo.completeness.renderab",
        "le.texture.color0.depth_component_unsigned_short");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012799,
        "dEQP-GLES2.functional.fbo.completeness.rendera",
        "ble.texture.color0.depth_component_unsigned_int");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012800,
        "dEQP-GLES2.functional.fbo.completeness.re",
        "nderable.texture.color0.red_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012801,
        "dEQP-GLES2.functional.fbo.completenes",
        "s.renderable.texture.color0.red_float");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012802,
        "dEQP-GLES2.functional.fbo.completeness.re",
        "nderable.texture.color0.red_half_float_oes");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012803,
        "dEQP-GLES2.functional.fbo.completeness.re",
        "nderable.texture.color0.rgb_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012804,
        "dEQP-GLES2.functional.fbo.completenes",
        "s.renderable.texture.color0.rgb_float");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012805,
        "dEQP-GLES2.functional.fbo.completeness.rende",
        "rable.texture.color0.rgb_unsigned_short_5_6_5");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012806,
        "dEQP-GLES2.functional.fbo.completeness.renderabl",
        "e.texture.color0.rgb_unsigned_int_2_10_10_10_rev");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012807,
        "dEQP-GLES2.functional.fbo.completeness.renderabl",
        "e.texture.color0.rgb_unsigned_int_10f_11f_11f_rev");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012808,
        "dEQP-GLES2.functional.fbo.completeness.re",
        "nderable.texture.color0.rgb_half_float_oes");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012809,
        "dEQP-GLES2.functional.fbo.completeness.re",
        "nderable.texture.color0.rgba_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012810,
        "dEQP-GLES2.functional.fbo.completenes",
        "s.renderable.texture.color0.rgba_float");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012811,
        "dEQP-GLES2.functional.fbo.completeness.rendera",
        "ble.texture.color0.rgba_unsigned_short_4_4_4_4");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012812,
        "dEQP-GLES2.functional.fbo.completeness.rendera",
        "ble.texture.color0.rgba_unsigned_short_5_5_5_1");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012813,
        "dEQP-GLES2.functional.fbo.completeness.renderabl",
        "e.texture.color0.rgba_unsigned_int_2_10_10_10_rev");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012814,
        "dEQP-GLES2.functional.fbo.completeness.ren",
        "derable.texture.color0.rgba_half_float_oes");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012815,
        "dEQP-GLES2.functional.fbo.complete",
        "ness.renderable.texture.color0.rgb8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012816,
        "dEQP-GLES2.functional.fbo.completen",
        "ess.renderable.texture.color0.rgb10");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012817,
        "dEQP-GLES2.functional.fbo.completen",
        "ess.renderable.texture.color0.rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012818,
        "dEQP-GLES2.functional.fbo.completene",
        "ss.renderable.texture.color0.rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012819,
        "dEQP-GLES2.functional.fbo.completen",
        "ess.renderable.texture.color0.rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012820,
        "dEQP-GLES2.functional.fbo.completene",
        "ss.renderable.texture.color0.rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012821,
        "dEQP-GLES2.functional.fbo.completeness.re",
        "nderable.texture.color0.depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012822,
        "dEQP-GLES2.functional.fbo.completeness.re",
        "nderable.texture.color0.depth_component24");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012823,
        "dEQP-GLES2.functional.fbo.completeness.re",
        "nderable.texture.color0.depth_component32");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012824,
        "dEQP-GLES2.functional.fbo.completeness.r",
        "enderable.texture.color0.rg_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012825,
        "dEQP-GLES2.functional.fbo.completene",
        "ss.renderable.texture.color0.rg_float");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012826,
        "dEQP-GLES2.functional.fbo.completeness.re",
        "nderable.texture.color0.rg_half_float_oes");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012827,
        "dEQP-GLES2.functional.fbo.complet",
        "eness.renderable.texture.color0.r8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012828,
        "dEQP-GLES2.functional.fbo.complete",
        "ness.renderable.texture.color0.rg8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012829,
        "dEQP-GLES2.functional.fbo.complete",
        "ness.renderable.texture.color0.r16f");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012830,
        "dEQP-GLES2.functional.fbo.completen",
        "ess.renderable.texture.color0.rg16f");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012831,
        "dEQP-GLES2.functional.fbo.completeness.renderabl",
        "e.texture.color0.depth_stencil_unsigned_int_24_8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012832,
        "dEQP-GLES2.functional.fbo.completene",
        "ss.renderable.texture.color0.rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012833,
        "dEQP-GLES2.functional.fbo.completeness.r",
        "enderable.texture.color0.depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012834,
        "dEQP-GLES2.functional.fbo.completeness.",
        "renderable.texture.color0.r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012835,
        "dEQP-GLES2.functional.fbo.completeness.re",
        "nderable.texture.color0.srgb_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012836,
        "dEQP-GLES2.functional.fbo.completen",
        "ess.renderable.texture.color0.srgb8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012837,
        "dEQP-GLES2.functional.fbo.completeness.rende",
        "rable.texture.color0.srgb_alpha_unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012838,
        "dEQP-GLES2.functional.fbo.completeness",
        ".renderable.texture.color0.srgb8_alpha8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012839,
        "dEQP-GLES2.functional.fbo.completeness.",
        "renderable.texture.color0.stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012840,
        "dEQP-GLES2.functional.fbo.completen",
        "ess.renderable.texture.color0.rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012841,
        "dEQP-GLES2.functional.fbo.completene",
        "ss.renderable.texture.color0.sr8_ext");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012842,
        "dEQP-GLES2.functional.fbo.completene",
        "ss.renderable.texture.color0.srg8_ext");
