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
#include "../ActsDeqpgles30039TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038804,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.fixed.rgba8_lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038805,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.fixed.rgba8_lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038806,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.fixed.rgba8_lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038807,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.fixed.rgba8_lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038808,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.fixed.rgba8_mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038809,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.fixed.rgba8_mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038810,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.fixed.rgba8_mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038811,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.fixed.rgba8_mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038812,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.fixed.rgba8_highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038813,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.fixed.rgba8_highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038814,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.fixed.rgba8_highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038815,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.fixed.rgba8_highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038816,
        "dEQP-GLES3.functional.fragment_out.",
        "basic.fixed.srgb8_alpha8_lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038817,
        "dEQP-GLES3.functional.fragment_out",
        ".basic.fixed.srgb8_alpha8_lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038818,
        "dEQP-GLES3.functional.fragment_out",
        ".basic.fixed.srgb8_alpha8_lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038819,
        "dEQP-GLES3.functional.fragment_out",
        ".basic.fixed.srgb8_alpha8_lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038820,
        "dEQP-GLES3.functional.fragment_out.b",
        "asic.fixed.srgb8_alpha8_mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038821,
        "dEQP-GLES3.functional.fragment_out.b",
        "asic.fixed.srgb8_alpha8_mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038822,
        "dEQP-GLES3.functional.fragment_out.b",
        "asic.fixed.srgb8_alpha8_mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038823,
        "dEQP-GLES3.functional.fragment_out.b",
        "asic.fixed.srgb8_alpha8_mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038824,
        "dEQP-GLES3.functional.fragment_out.",
        "basic.fixed.srgb8_alpha8_highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038825,
        "dEQP-GLES3.functional.fragment_out.",
        "basic.fixed.srgb8_alpha8_highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038826,
        "dEQP-GLES3.functional.fragment_out.",
        "basic.fixed.srgb8_alpha8_highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038827,
        "dEQP-GLES3.functional.fragment_out.",
        "basic.fixed.srgb8_alpha8_highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038828,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.fixed.rgb10_a2_lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038829,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.fixed.rgb10_a2_lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038830,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.fixed.rgb10_a2_lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038831,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.fixed.rgb10_a2_lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038832,
        "dEQP-GLES3.functional.fragment_out",
        ".basic.fixed.rgb10_a2_mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038833,
        "dEQP-GLES3.functional.fragment_out",
        ".basic.fixed.rgb10_a2_mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038834,
        "dEQP-GLES3.functional.fragment_out",
        ".basic.fixed.rgb10_a2_mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038835,
        "dEQP-GLES3.functional.fragment_out",
        ".basic.fixed.rgb10_a2_mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038836,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.fixed.rgb10_a2_highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038837,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.fixed.rgb10_a2_highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038838,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.fixed.rgb10_a2_highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038839,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.fixed.rgb10_a2_highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038840,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.fixed.rgba4_lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038841,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.fixed.rgba4_lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038842,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.fixed.rgba4_lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038843,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.fixed.rgba4_lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038844,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.fixed.rgba4_mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038845,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.fixed.rgba4_mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038846,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.fixed.rgba4_mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038847,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.fixed.rgba4_mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038848,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.fixed.rgba4_highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038849,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.fixed.rgba4_highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038850,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.fixed.rgba4_highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038851,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.fixed.rgba4_highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038852,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.fixed.rgb5_a1_lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038853,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.fixed.rgb5_a1_lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038854,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.fixed.rgb5_a1_lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038855,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.fixed.rgb5_a1_lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038856,
        "dEQP-GLES3.functional.fragment_out",
        ".basic.fixed.rgb5_a1_mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038857,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.fixed.rgb5_a1_mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038858,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.fixed.rgb5_a1_mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038859,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.fixed.rgb5_a1_mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038860,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.fixed.rgb5_a1_highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038861,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.fixed.rgb5_a1_highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038862,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.fixed.rgb5_a1_highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038863,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.fixed.rgb5_a1_highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038864,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.fixed.rgb8_lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038865,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.fixed.rgb8_lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038866,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.fixed.rgb8_lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038867,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.fixed.rgb8_lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038868,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.fixed.rgb8_mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038869,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.fixed.rgb8_mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038870,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.fixed.rgb8_mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038871,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.fixed.rgb8_mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038872,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.fixed.rgb8_highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038873,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.fixed.rgb8_highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038874,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.fixed.rgb8_highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038875,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.fixed.rgb8_highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038876,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.fixed.rgb565_lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038877,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.fixed.rgb565_lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038878,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.fixed.rgb565_lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038879,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.fixed.rgb565_lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038880,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.fixed.rgb565_mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038881,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.fixed.rgb565_mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038882,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.fixed.rgb565_mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038883,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.fixed.rgb565_mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038884,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.fixed.rgb565_highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038885,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.fixed.rgb565_highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038886,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.fixed.rgb565_highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038887,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.fixed.rgb565_highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038888,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.fixed.rg8_lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038889,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.fixed.rg8_lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038890,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.fixed.rg8_lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038891,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.fixed.rg8_lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038892,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.fixed.rg8_mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038893,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.fixed.rg8_mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038894,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.fixed.rg8_mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038895,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.fixed.rg8_mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038896,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.fixed.rg8_highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038897,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.fixed.rg8_highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038898,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.fixed.rg8_highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038899,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.fixed.rg8_highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038900,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.fixed.r8_lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038901,
        "dEQP-GLES3.functional.fragmen",
        "t_out.basic.fixed.r8_lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038902,
        "dEQP-GLES3.functional.fragmen",
        "t_out.basic.fixed.r8_lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038903,
        "dEQP-GLES3.functional.fragmen",
        "t_out.basic.fixed.r8_lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038904,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.fixed.r8_mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038905,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.fixed.r8_mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038906,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.fixed.r8_mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038907,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.fixed.r8_mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038908,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.fixed.r8_highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038909,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.fixed.r8_highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038910,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.fixed.r8_highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038911,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.fixed.r8_highp_vec4");
