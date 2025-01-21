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

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038720,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.float.rgba32f_lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038721,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.float.rgba32f_lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038722,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.float.rgba32f_lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038723,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.float.rgba32f_lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038724,
        "dEQP-GLES3.functional.fragment_out",
        ".basic.float.rgba32f_mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038725,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.float.rgba32f_mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038726,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.float.rgba32f_mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038727,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.float.rgba32f_mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038728,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.float.rgba32f_highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038729,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.float.rgba32f_highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038730,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.float.rgba32f_highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038731,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.float.rgba32f_highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038732,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.float.rgba16f_lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038733,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.float.rgba16f_lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038734,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.float.rgba16f_lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038735,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.float.rgba16f_lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038736,
        "dEQP-GLES3.functional.fragment_out",
        ".basic.float.rgba16f_mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038737,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.float.rgba16f_mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038738,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.float.rgba16f_mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038739,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.float.rgba16f_mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038740,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.float.rgba16f_highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038741,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.float.rgba16f_highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038742,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.float.rgba16f_highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038743,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.float.rgba16f_highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038744,
        "dEQP-GLES3.functional.fragment_out.b",
        "asic.float.r11f_g11f_b10f_lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038745,
        "dEQP-GLES3.functional.fragment_out.",
        "basic.float.r11f_g11f_b10f_lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038746,
        "dEQP-GLES3.functional.fragment_out.",
        "basic.float.r11f_g11f_b10f_lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038747,
        "dEQP-GLES3.functional.fragment_out.",
        "basic.float.r11f_g11f_b10f_lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038748,
        "dEQP-GLES3.functional.fragment_out.ba",
        "sic.float.r11f_g11f_b10f_mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038749,
        "dEQP-GLES3.functional.fragment_out.ba",
        "sic.float.r11f_g11f_b10f_mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038750,
        "dEQP-GLES3.functional.fragment_out.ba",
        "sic.float.r11f_g11f_b10f_mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038751,
        "dEQP-GLES3.functional.fragment_out.ba",
        "sic.float.r11f_g11f_b10f_mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038752,
        "dEQP-GLES3.functional.fragment_out.b",
        "asic.float.r11f_g11f_b10f_highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038753,
        "dEQP-GLES3.functional.fragment_out.b",
        "asic.float.r11f_g11f_b10f_highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038754,
        "dEQP-GLES3.functional.fragment_out.b",
        "asic.float.r11f_g11f_b10f_highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038755,
        "dEQP-GLES3.functional.fragment_out.b",
        "asic.float.r11f_g11f_b10f_highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038756,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.float.rg32f_lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038757,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.float.rg32f_lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038758,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.float.rg32f_lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038759,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.float.rg32f_lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038760,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.float.rg32f_mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038761,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.float.rg32f_mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038762,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.float.rg32f_mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038763,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.float.rg32f_mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038764,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.float.rg32f_highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038765,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.float.rg32f_highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038766,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.float.rg32f_highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038767,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.float.rg32f_highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038768,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.float.rg16f_lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038769,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.float.rg16f_lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038770,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.float.rg16f_lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038771,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.float.rg16f_lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038772,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.float.rg16f_mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038773,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.float.rg16f_mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038774,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.float.rg16f_mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038775,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.float.rg16f_mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038776,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.float.rg16f_highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038777,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.float.rg16f_highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038778,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.float.rg16f_highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038779,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.float.rg16f_highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038780,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.float.r32f_lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038781,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.float.r32f_lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038782,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.float.r32f_lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038783,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.float.r32f_lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038784,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.float.r32f_mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038785,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.float.r32f_mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038786,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.float.r32f_mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038787,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.float.r32f_mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038788,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.float.r32f_highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038789,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.float.r32f_highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038790,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.float.r32f_highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038791,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.float.r32f_highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038792,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.float.r16f_lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038793,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.float.r16f_lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038794,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.float.r16f_lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038795,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.float.r16f_lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038796,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.float.r16f_mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038797,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.float.r16f_mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038798,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.float.r16f_mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038799,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.float.r16f_mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038800,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.float.r16f_highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038801,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.float.r16f_highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038802,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.float.r16f_highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038803,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.float.r16f_highp_vec4");
