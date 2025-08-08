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
#include "../ActsDeqpgles30040TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039224,
        "dEQP-GLES3.functional.fragment_",
        "out.array.fixed.rgba8_lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039225,
        "dEQP-GLES3.functional.fragment_",
        "out.array.fixed.rgba8_lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039226,
        "dEQP-GLES3.functional.fragment_",
        "out.array.fixed.rgba8_lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039227,
        "dEQP-GLES3.functional.fragment_",
        "out.array.fixed.rgba8_lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039228,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.fixed.rgba8_mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039229,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.fixed.rgba8_mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039230,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.fixed.rgba8_mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039231,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.fixed.rgba8_mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039232,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.fixed.rgba8_highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039233,
        "dEQP-GLES3.functional.fragment_",
        "out.array.fixed.rgba8_highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039234,
        "dEQP-GLES3.functional.fragment_",
        "out.array.fixed.rgba8_highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039235,
        "dEQP-GLES3.functional.fragment_",
        "out.array.fixed.rgba8_highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039236,
        "dEQP-GLES3.functional.fragment_out.",
        "array.fixed.srgb8_alpha8_lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039237,
        "dEQP-GLES3.functional.fragment_out",
        ".array.fixed.srgb8_alpha8_lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039238,
        "dEQP-GLES3.functional.fragment_out",
        ".array.fixed.srgb8_alpha8_lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039239,
        "dEQP-GLES3.functional.fragment_out",
        ".array.fixed.srgb8_alpha8_lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039240,
        "dEQP-GLES3.functional.fragment_out.a",
        "rray.fixed.srgb8_alpha8_mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039241,
        "dEQP-GLES3.functional.fragment_out.a",
        "rray.fixed.srgb8_alpha8_mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039242,
        "dEQP-GLES3.functional.fragment_out.a",
        "rray.fixed.srgb8_alpha8_mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039243,
        "dEQP-GLES3.functional.fragment_out.a",
        "rray.fixed.srgb8_alpha8_mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039244,
        "dEQP-GLES3.functional.fragment_out.",
        "array.fixed.srgb8_alpha8_highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039245,
        "dEQP-GLES3.functional.fragment_out.",
        "array.fixed.srgb8_alpha8_highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039246,
        "dEQP-GLES3.functional.fragment_out.",
        "array.fixed.srgb8_alpha8_highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039247,
        "dEQP-GLES3.functional.fragment_out.",
        "array.fixed.srgb8_alpha8_highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039248,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.fixed.rgb10_a2_lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039249,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.fixed.rgb10_a2_lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039250,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.fixed.rgb10_a2_lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039251,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.fixed.rgb10_a2_lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039252,
        "dEQP-GLES3.functional.fragment_out",
        ".array.fixed.rgb10_a2_mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039253,
        "dEQP-GLES3.functional.fragment_out",
        ".array.fixed.rgb10_a2_mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039254,
        "dEQP-GLES3.functional.fragment_out",
        ".array.fixed.rgb10_a2_mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039255,
        "dEQP-GLES3.functional.fragment_out",
        ".array.fixed.rgb10_a2_mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039256,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.fixed.rgb10_a2_highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039257,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.fixed.rgb10_a2_highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039258,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.fixed.rgb10_a2_highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039259,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.fixed.rgb10_a2_highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039260,
        "dEQP-GLES3.functional.fragment_",
        "out.array.fixed.rgba4_lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039261,
        "dEQP-GLES3.functional.fragment_",
        "out.array.fixed.rgba4_lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039262,
        "dEQP-GLES3.functional.fragment_",
        "out.array.fixed.rgba4_lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039263,
        "dEQP-GLES3.functional.fragment_",
        "out.array.fixed.rgba4_lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039264,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.fixed.rgba4_mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039265,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.fixed.rgba4_mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039266,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.fixed.rgba4_mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039267,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.fixed.rgba4_mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039268,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.fixed.rgba4_highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039269,
        "dEQP-GLES3.functional.fragment_",
        "out.array.fixed.rgba4_highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039270,
        "dEQP-GLES3.functional.fragment_",
        "out.array.fixed.rgba4_highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039271,
        "dEQP-GLES3.functional.fragment_",
        "out.array.fixed.rgba4_highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039272,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.fixed.rgb5_a1_lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039273,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.fixed.rgb5_a1_lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039274,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.fixed.rgb5_a1_lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039275,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.fixed.rgb5_a1_lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039276,
        "dEQP-GLES3.functional.fragment_out",
        ".array.fixed.rgb5_a1_mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039277,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.fixed.rgb5_a1_mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039278,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.fixed.rgb5_a1_mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039279,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.fixed.rgb5_a1_mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039280,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.fixed.rgb5_a1_highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039281,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.fixed.rgb5_a1_highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039282,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.fixed.rgb5_a1_highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039283,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.fixed.rgb5_a1_highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039284,
        "dEQP-GLES3.functional.fragment_",
        "out.array.fixed.rgb8_lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039285,
        "dEQP-GLES3.functional.fragment",
        "_out.array.fixed.rgb8_lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039286,
        "dEQP-GLES3.functional.fragment",
        "_out.array.fixed.rgb8_lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039287,
        "dEQP-GLES3.functional.fragment",
        "_out.array.fixed.rgb8_lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039288,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.fixed.rgb8_mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039289,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.fixed.rgb8_mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039290,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.fixed.rgb8_mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039291,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.fixed.rgb8_mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039292,
        "dEQP-GLES3.functional.fragment_",
        "out.array.fixed.rgb8_highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039293,
        "dEQP-GLES3.functional.fragment_",
        "out.array.fixed.rgb8_highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039294,
        "dEQP-GLES3.functional.fragment_",
        "out.array.fixed.rgb8_highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039295,
        "dEQP-GLES3.functional.fragment_",
        "out.array.fixed.rgb8_highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039296,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.fixed.rgb565_lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039297,
        "dEQP-GLES3.functional.fragment_",
        "out.array.fixed.rgb565_lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039298,
        "dEQP-GLES3.functional.fragment_",
        "out.array.fixed.rgb565_lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039299,
        "dEQP-GLES3.functional.fragment_",
        "out.array.fixed.rgb565_lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039300,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.fixed.rgb565_mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039301,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.fixed.rgb565_mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039302,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.fixed.rgb565_mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039303,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.fixed.rgb565_mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039304,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.fixed.rgb565_highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039305,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.fixed.rgb565_highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039306,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.fixed.rgb565_highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039307,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.fixed.rgb565_highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039308,
        "dEQP-GLES3.functional.fragment",
        "_out.array.fixed.rg8_lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039309,
        "dEQP-GLES3.functional.fragment",
        "_out.array.fixed.rg8_lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039310,
        "dEQP-GLES3.functional.fragment",
        "_out.array.fixed.rg8_lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039311,
        "dEQP-GLES3.functional.fragment",
        "_out.array.fixed.rg8_lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039312,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.fixed.rg8_mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039313,
        "dEQP-GLES3.functional.fragment_",
        "out.array.fixed.rg8_mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039314,
        "dEQP-GLES3.functional.fragment_",
        "out.array.fixed.rg8_mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039315,
        "dEQP-GLES3.functional.fragment_",
        "out.array.fixed.rg8_mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039316,
        "dEQP-GLES3.functional.fragment_",
        "out.array.fixed.rg8_highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039317,
        "dEQP-GLES3.functional.fragment",
        "_out.array.fixed.rg8_highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039318,
        "dEQP-GLES3.functional.fragment",
        "_out.array.fixed.rg8_highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039319,
        "dEQP-GLES3.functional.fragment",
        "_out.array.fixed.rg8_highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039320,
        "dEQP-GLES3.functional.fragment",
        "_out.array.fixed.r8_lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039321,
        "dEQP-GLES3.functional.fragmen",
        "t_out.array.fixed.r8_lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039322,
        "dEQP-GLES3.functional.fragmen",
        "t_out.array.fixed.r8_lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039323,
        "dEQP-GLES3.functional.fragmen",
        "t_out.array.fixed.r8_lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039324,
        "dEQP-GLES3.functional.fragment_",
        "out.array.fixed.r8_mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039325,
        "dEQP-GLES3.functional.fragment_",
        "out.array.fixed.r8_mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039326,
        "dEQP-GLES3.functional.fragment_",
        "out.array.fixed.r8_mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039327,
        "dEQP-GLES3.functional.fragment_",
        "out.array.fixed.r8_mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039328,
        "dEQP-GLES3.functional.fragment",
        "_out.array.fixed.r8_highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039329,
        "dEQP-GLES3.functional.fragment",
        "_out.array.fixed.r8_highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039330,
        "dEQP-GLES3.functional.fragment",
        "_out.array.fixed.r8_highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039331,
        "dEQP-GLES3.functional.fragment",
        "_out.array.fixed.r8_highp_vec4");
