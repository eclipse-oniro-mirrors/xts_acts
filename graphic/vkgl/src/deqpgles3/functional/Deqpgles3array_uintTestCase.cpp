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

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039440,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.uint.rgba32ui_lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039441,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.uint.rgba32ui_lowp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039442,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.uint.rgba32ui_lowp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039443,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.uint.rgba32ui_lowp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039444,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.uint.rgba32ui_mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039445,
        "dEQP-GLES3.functional.fragment_out",
        ".array.uint.rgba32ui_mediump_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039446,
        "dEQP-GLES3.functional.fragment_out",
        ".array.uint.rgba32ui_mediump_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039447,
        "dEQP-GLES3.functional.fragment_out",
        ".array.uint.rgba32ui_mediump_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039448,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.uint.rgba32ui_highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039449,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.uint.rgba32ui_highp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039450,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.uint.rgba32ui_highp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039451,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.uint.rgba32ui_highp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039452,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.uint.rgba16ui_lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039453,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.uint.rgba16ui_lowp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039454,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.uint.rgba16ui_lowp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039455,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.uint.rgba16ui_lowp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039456,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.uint.rgba16ui_mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039457,
        "dEQP-GLES3.functional.fragment_out",
        ".array.uint.rgba16ui_mediump_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039458,
        "dEQP-GLES3.functional.fragment_out",
        ".array.uint.rgba16ui_mediump_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039459,
        "dEQP-GLES3.functional.fragment_out",
        ".array.uint.rgba16ui_mediump_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039460,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.uint.rgba16ui_highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039461,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.uint.rgba16ui_highp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039462,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.uint.rgba16ui_highp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039463,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.uint.rgba16ui_highp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039464,
        "dEQP-GLES3.functional.fragment_",
        "out.array.uint.rgba8ui_lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039465,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.uint.rgba8ui_lowp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039466,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.uint.rgba8ui_lowp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039467,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.uint.rgba8ui_lowp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039468,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.uint.rgba8ui_mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039469,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.uint.rgba8ui_mediump_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039470,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.uint.rgba8ui_mediump_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039471,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.uint.rgba8ui_mediump_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039472,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.uint.rgba8ui_highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039473,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.uint.rgba8ui_highp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039474,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.uint.rgba8ui_highp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039475,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.uint.rgba8ui_highp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039476,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.uint.rgb10_a2ui_lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039477,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.uint.rgb10_a2ui_lowp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039478,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.uint.rgb10_a2ui_lowp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039479,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.uint.rgb10_a2ui_lowp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039480,
        "dEQP-GLES3.functional.fragment_out",
        ".array.uint.rgb10_a2ui_mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039481,
        "dEQP-GLES3.functional.fragment_out.",
        "array.uint.rgb10_a2ui_mediump_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039482,
        "dEQP-GLES3.functional.fragment_out.",
        "array.uint.rgb10_a2ui_mediump_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039483,
        "dEQP-GLES3.functional.fragment_out.",
        "array.uint.rgb10_a2ui_mediump_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039484,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.uint.rgb10_a2ui_highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039485,
        "dEQP-GLES3.functional.fragment_out",
        ".array.uint.rgb10_a2ui_highp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039486,
        "dEQP-GLES3.functional.fragment_out",
        ".array.uint.rgb10_a2ui_highp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039487,
        "dEQP-GLES3.functional.fragment_out",
        ".array.uint.rgb10_a2ui_highp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039488,
        "dEQP-GLES3.functional.fragment_",
        "out.array.uint.rg32ui_lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039489,
        "dEQP-GLES3.functional.fragment_",
        "out.array.uint.rg32ui_lowp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039490,
        "dEQP-GLES3.functional.fragment_",
        "out.array.uint.rg32ui_lowp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039491,
        "dEQP-GLES3.functional.fragment_",
        "out.array.uint.rg32ui_lowp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039492,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.uint.rg32ui_mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039493,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.uint.rg32ui_mediump_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039494,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.uint.rg32ui_mediump_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039495,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.uint.rg32ui_mediump_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039496,
        "dEQP-GLES3.functional.fragment_",
        "out.array.uint.rg32ui_highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039497,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.uint.rg32ui_highp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039498,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.uint.rg32ui_highp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039499,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.uint.rg32ui_highp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039500,
        "dEQP-GLES3.functional.fragment_",
        "out.array.uint.rg16ui_lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039501,
        "dEQP-GLES3.functional.fragment_",
        "out.array.uint.rg16ui_lowp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039502,
        "dEQP-GLES3.functional.fragment_",
        "out.array.uint.rg16ui_lowp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039503,
        "dEQP-GLES3.functional.fragment_",
        "out.array.uint.rg16ui_lowp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039504,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.uint.rg16ui_mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039505,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.uint.rg16ui_mediump_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039506,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.uint.rg16ui_mediump_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039507,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.uint.rg16ui_mediump_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039508,
        "dEQP-GLES3.functional.fragment_",
        "out.array.uint.rg16ui_highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039509,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.uint.rg16ui_highp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039510,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.uint.rg16ui_highp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039511,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.uint.rg16ui_highp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039512,
        "dEQP-GLES3.functional.fragment",
        "_out.array.uint.rg8ui_lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039513,
        "dEQP-GLES3.functional.fragment_",
        "out.array.uint.rg8ui_lowp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039514,
        "dEQP-GLES3.functional.fragment_",
        "out.array.uint.rg8ui_lowp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039515,
        "dEQP-GLES3.functional.fragment_",
        "out.array.uint.rg8ui_lowp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039516,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.uint.rg8ui_mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039517,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.uint.rg8ui_mediump_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039518,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.uint.rg8ui_mediump_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039519,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.uint.rg8ui_mediump_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039520,
        "dEQP-GLES3.functional.fragment_",
        "out.array.uint.rg8ui_highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039521,
        "dEQP-GLES3.functional.fragment_",
        "out.array.uint.rg8ui_highp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039522,
        "dEQP-GLES3.functional.fragment_",
        "out.array.uint.rg8ui_highp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039523,
        "dEQP-GLES3.functional.fragment_",
        "out.array.uint.rg8ui_highp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039524,
        "dEQP-GLES3.functional.fragment",
        "_out.array.uint.r32ui_lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039525,
        "dEQP-GLES3.functional.fragment_",
        "out.array.uint.r32ui_lowp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039526,
        "dEQP-GLES3.functional.fragment_",
        "out.array.uint.r32ui_lowp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039527,
        "dEQP-GLES3.functional.fragment_",
        "out.array.uint.r32ui_lowp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039528,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.uint.r32ui_mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039529,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.uint.r32ui_mediump_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039530,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.uint.r32ui_mediump_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039531,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.uint.r32ui_mediump_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039532,
        "dEQP-GLES3.functional.fragment_",
        "out.array.uint.r32ui_highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039533,
        "dEQP-GLES3.functional.fragment_",
        "out.array.uint.r32ui_highp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039534,
        "dEQP-GLES3.functional.fragment_",
        "out.array.uint.r32ui_highp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039535,
        "dEQP-GLES3.functional.fragment_",
        "out.array.uint.r32ui_highp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039536,
        "dEQP-GLES3.functional.fragment",
        "_out.array.uint.r16ui_lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039537,
        "dEQP-GLES3.functional.fragment_",
        "out.array.uint.r16ui_lowp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039538,
        "dEQP-GLES3.functional.fragment_",
        "out.array.uint.r16ui_lowp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039539,
        "dEQP-GLES3.functional.fragment_",
        "out.array.uint.r16ui_lowp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039540,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.uint.r16ui_mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039541,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.uint.r16ui_mediump_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039542,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.uint.r16ui_mediump_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039543,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.uint.r16ui_mediump_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039544,
        "dEQP-GLES3.functional.fragment_",
        "out.array.uint.r16ui_highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039545,
        "dEQP-GLES3.functional.fragment_",
        "out.array.uint.r16ui_highp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039546,
        "dEQP-GLES3.functional.fragment_",
        "out.array.uint.r16ui_highp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039547,
        "dEQP-GLES3.functional.fragment_",
        "out.array.uint.r16ui_highp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039548,
        "dEQP-GLES3.functional.fragment",
        "_out.array.uint.r8ui_lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039549,
        "dEQP-GLES3.functional.fragment",
        "_out.array.uint.r8ui_lowp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039550,
        "dEQP-GLES3.functional.fragment",
        "_out.array.uint.r8ui_lowp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039551,
        "dEQP-GLES3.functional.fragment",
        "_out.array.uint.r8ui_lowp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039552,
        "dEQP-GLES3.functional.fragment_",
        "out.array.uint.r8ui_mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039553,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.uint.r8ui_mediump_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039554,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.uint.r8ui_mediump_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039555,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.uint.r8ui_mediump_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039556,
        "dEQP-GLES3.functional.fragment",
        "_out.array.uint.r8ui_highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039557,
        "dEQP-GLES3.functional.fragment_",
        "out.array.uint.r8ui_highp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039558,
        "dEQP-GLES3.functional.fragment_",
        "out.array.uint.r8ui_highp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039559,
        "dEQP-GLES3.functional.fragment_",
        "out.array.uint.r8ui_highp_uvec4");
