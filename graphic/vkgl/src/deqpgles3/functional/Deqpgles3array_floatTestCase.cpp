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

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039140,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.float.rgba32f_lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039141,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.float.rgba32f_lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039142,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.float.rgba32f_lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039143,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.float.rgba32f_lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039144,
        "dEQP-GLES3.functional.fragment_out",
        ".array.float.rgba32f_mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039145,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.float.rgba32f_mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039146,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.float.rgba32f_mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039147,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.float.rgba32f_mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039148,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.float.rgba32f_highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039149,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.float.rgba32f_highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039150,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.float.rgba32f_highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039151,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.float.rgba32f_highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039152,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.float.rgba16f_lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039153,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.float.rgba16f_lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039154,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.float.rgba16f_lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039155,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.float.rgba16f_lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039156,
        "dEQP-GLES3.functional.fragment_out",
        ".array.float.rgba16f_mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039157,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.float.rgba16f_mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039158,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.float.rgba16f_mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039159,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.float.rgba16f_mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039160,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.float.rgba16f_highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039161,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.float.rgba16f_highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039162,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.float.rgba16f_highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039163,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.float.rgba16f_highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039164,
        "dEQP-GLES3.functional.fragment_out.a",
        "rray.float.r11f_g11f_b10f_lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039165,
        "dEQP-GLES3.functional.fragment_out.",
        "array.float.r11f_g11f_b10f_lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039166,
        "dEQP-GLES3.functional.fragment_out.",
        "array.float.r11f_g11f_b10f_lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039167,
        "dEQP-GLES3.functional.fragment_out.",
        "array.float.r11f_g11f_b10f_lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039168,
        "dEQP-GLES3.functional.fragment_out.ar",
        "ray.float.r11f_g11f_b10f_mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039169,
        "dEQP-GLES3.functional.fragment_out.ar",
        "ray.float.r11f_g11f_b10f_mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039170,
        "dEQP-GLES3.functional.fragment_out.ar",
        "ray.float.r11f_g11f_b10f_mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039171,
        "dEQP-GLES3.functional.fragment_out.ar",
        "ray.float.r11f_g11f_b10f_mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039172,
        "dEQP-GLES3.functional.fragment_out.a",
        "rray.float.r11f_g11f_b10f_highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039173,
        "dEQP-GLES3.functional.fragment_out.a",
        "rray.float.r11f_g11f_b10f_highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039174,
        "dEQP-GLES3.functional.fragment_out.a",
        "rray.float.r11f_g11f_b10f_highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039175,
        "dEQP-GLES3.functional.fragment_out.a",
        "rray.float.r11f_g11f_b10f_highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039176,
        "dEQP-GLES3.functional.fragment_",
        "out.array.float.rg32f_lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039177,
        "dEQP-GLES3.functional.fragment_",
        "out.array.float.rg32f_lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039178,
        "dEQP-GLES3.functional.fragment_",
        "out.array.float.rg32f_lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039179,
        "dEQP-GLES3.functional.fragment_",
        "out.array.float.rg32f_lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039180,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.float.rg32f_mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039181,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.float.rg32f_mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039182,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.float.rg32f_mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039183,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.float.rg32f_mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039184,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.float.rg32f_highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039185,
        "dEQP-GLES3.functional.fragment_",
        "out.array.float.rg32f_highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039186,
        "dEQP-GLES3.functional.fragment_",
        "out.array.float.rg32f_highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039187,
        "dEQP-GLES3.functional.fragment_",
        "out.array.float.rg32f_highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039188,
        "dEQP-GLES3.functional.fragment_",
        "out.array.float.rg16f_lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039189,
        "dEQP-GLES3.functional.fragment_",
        "out.array.float.rg16f_lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039190,
        "dEQP-GLES3.functional.fragment_",
        "out.array.float.rg16f_lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039191,
        "dEQP-GLES3.functional.fragment_",
        "out.array.float.rg16f_lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039192,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.float.rg16f_mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039193,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.float.rg16f_mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039194,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.float.rg16f_mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039195,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.float.rg16f_mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039196,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.float.rg16f_highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039197,
        "dEQP-GLES3.functional.fragment_",
        "out.array.float.rg16f_highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039198,
        "dEQP-GLES3.functional.fragment_",
        "out.array.float.rg16f_highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039199,
        "dEQP-GLES3.functional.fragment_",
        "out.array.float.rg16f_highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039200,
        "dEQP-GLES3.functional.fragment_",
        "out.array.float.r32f_lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039201,
        "dEQP-GLES3.functional.fragment",
        "_out.array.float.r32f_lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039202,
        "dEQP-GLES3.functional.fragment",
        "_out.array.float.r32f_lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039203,
        "dEQP-GLES3.functional.fragment",
        "_out.array.float.r32f_lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039204,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.float.r32f_mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039205,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.float.r32f_mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039206,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.float.r32f_mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039207,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.float.r32f_mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039208,
        "dEQP-GLES3.functional.fragment_",
        "out.array.float.r32f_highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039209,
        "dEQP-GLES3.functional.fragment_",
        "out.array.float.r32f_highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039210,
        "dEQP-GLES3.functional.fragment_",
        "out.array.float.r32f_highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039211,
        "dEQP-GLES3.functional.fragment_",
        "out.array.float.r32f_highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039212,
        "dEQP-GLES3.functional.fragment_",
        "out.array.float.r16f_lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039213,
        "dEQP-GLES3.functional.fragment",
        "_out.array.float.r16f_lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039214,
        "dEQP-GLES3.functional.fragment",
        "_out.array.float.r16f_lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039215,
        "dEQP-GLES3.functional.fragment",
        "_out.array.float.r16f_lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039216,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.float.r16f_mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039217,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.float.r16f_mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039218,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.float.r16f_mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039219,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.float.r16f_mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039220,
        "dEQP-GLES3.functional.fragment_",
        "out.array.float.r16f_highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039221,
        "dEQP-GLES3.functional.fragment_",
        "out.array.float.r16f_highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039222,
        "dEQP-GLES3.functional.fragment_",
        "out.array.float.r16f_highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039223,
        "dEQP-GLES3.functional.fragment_",
        "out.array.float.r16f_highp_vec4");
