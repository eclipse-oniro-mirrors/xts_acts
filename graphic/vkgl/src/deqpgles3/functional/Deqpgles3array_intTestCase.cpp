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

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039332,
        "dEQP-GLES3.functional.fragment",
        "_out.array.int.rgba32i_lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039333,
        "dEQP-GLES3.functional.fragment_",
        "out.array.int.rgba32i_lowp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039334,
        "dEQP-GLES3.functional.fragment_",
        "out.array.int.rgba32i_lowp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039335,
        "dEQP-GLES3.functional.fragment_",
        "out.array.int.rgba32i_lowp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039336,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.int.rgba32i_mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039337,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.int.rgba32i_mediump_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039338,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.int.rgba32i_mediump_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039339,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.int.rgba32i_mediump_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039340,
        "dEQP-GLES3.functional.fragment_",
        "out.array.int.rgba32i_highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039341,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.int.rgba32i_highp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039342,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.int.rgba32i_highp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039343,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.int.rgba32i_highp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039344,
        "dEQP-GLES3.functional.fragment",
        "_out.array.int.rgba16i_lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039345,
        "dEQP-GLES3.functional.fragment_",
        "out.array.int.rgba16i_lowp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039346,
        "dEQP-GLES3.functional.fragment_",
        "out.array.int.rgba16i_lowp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039347,
        "dEQP-GLES3.functional.fragment_",
        "out.array.int.rgba16i_lowp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039348,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.int.rgba16i_mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039349,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.int.rgba16i_mediump_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039350,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.int.rgba16i_mediump_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039351,
        "dEQP-GLES3.functional.fragment_ou",
        "t.array.int.rgba16i_mediump_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039352,
        "dEQP-GLES3.functional.fragment_",
        "out.array.int.rgba16i_highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039353,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.int.rgba16i_highp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039354,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.int.rgba16i_highp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039355,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.int.rgba16i_highp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039356,
        "dEQP-GLES3.functional.fragment",
        "_out.array.int.rgba8i_lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039357,
        "dEQP-GLES3.functional.fragment_",
        "out.array.int.rgba8i_lowp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039358,
        "dEQP-GLES3.functional.fragment_",
        "out.array.int.rgba8i_lowp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039359,
        "dEQP-GLES3.functional.fragment_",
        "out.array.int.rgba8i_lowp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039360,
        "dEQP-GLES3.functional.fragment_",
        "out.array.int.rgba8i_mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039361,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.int.rgba8i_mediump_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039362,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.int.rgba8i_mediump_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039363,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.int.rgba8i_mediump_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039364,
        "dEQP-GLES3.functional.fragment",
        "_out.array.int.rgba8i_highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039365,
        "dEQP-GLES3.functional.fragment_",
        "out.array.int.rgba8i_highp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039366,
        "dEQP-GLES3.functional.fragment_",
        "out.array.int.rgba8i_highp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039367,
        "dEQP-GLES3.functional.fragment_",
        "out.array.int.rgba8i_highp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039368,
        "dEQP-GLES3.functional.fragmen",
        "t_out.array.int.rg32i_lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039369,
        "dEQP-GLES3.functional.fragment",
        "_out.array.int.rg32i_lowp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039370,
        "dEQP-GLES3.functional.fragment",
        "_out.array.int.rg32i_lowp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039371,
        "dEQP-GLES3.functional.fragment",
        "_out.array.int.rg32i_lowp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039372,
        "dEQP-GLES3.functional.fragment_",
        "out.array.int.rg32i_mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039373,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.int.rg32i_mediump_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039374,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.int.rg32i_mediump_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039375,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.int.rg32i_mediump_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039376,
        "dEQP-GLES3.functional.fragment",
        "_out.array.int.rg32i_highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039377,
        "dEQP-GLES3.functional.fragment_",
        "out.array.int.rg32i_highp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039378,
        "dEQP-GLES3.functional.fragment_",
        "out.array.int.rg32i_highp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039379,
        "dEQP-GLES3.functional.fragment_",
        "out.array.int.rg32i_highp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039380,
        "dEQP-GLES3.functional.fragmen",
        "t_out.array.int.rg16i_lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039381,
        "dEQP-GLES3.functional.fragment",
        "_out.array.int.rg16i_lowp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039382,
        "dEQP-GLES3.functional.fragment",
        "_out.array.int.rg16i_lowp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039383,
        "dEQP-GLES3.functional.fragment",
        "_out.array.int.rg16i_lowp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039384,
        "dEQP-GLES3.functional.fragment_",
        "out.array.int.rg16i_mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039385,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.int.rg16i_mediump_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039386,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.int.rg16i_mediump_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039387,
        "dEQP-GLES3.functional.fragment_o",
        "ut.array.int.rg16i_mediump_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039388,
        "dEQP-GLES3.functional.fragment",
        "_out.array.int.rg16i_highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039389,
        "dEQP-GLES3.functional.fragment_",
        "out.array.int.rg16i_highp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039390,
        "dEQP-GLES3.functional.fragment_",
        "out.array.int.rg16i_highp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039391,
        "dEQP-GLES3.functional.fragment_",
        "out.array.int.rg16i_highp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039392,
        "dEQP-GLES3.functional.fragmen",
        "t_out.array.int.rg8i_lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039393,
        "dEQP-GLES3.functional.fragment",
        "_out.array.int.rg8i_lowp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039394,
        "dEQP-GLES3.functional.fragment",
        "_out.array.int.rg8i_lowp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039395,
        "dEQP-GLES3.functional.fragment",
        "_out.array.int.rg8i_lowp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039396,
        "dEQP-GLES3.functional.fragment",
        "_out.array.int.rg8i_mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039397,
        "dEQP-GLES3.functional.fragment_",
        "out.array.int.rg8i_mediump_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039398,
        "dEQP-GLES3.functional.fragment_",
        "out.array.int.rg8i_mediump_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039399,
        "dEQP-GLES3.functional.fragment_",
        "out.array.int.rg8i_mediump_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039400,
        "dEQP-GLES3.functional.fragmen",
        "t_out.array.int.rg8i_highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039401,
        "dEQP-GLES3.functional.fragment",
        "_out.array.int.rg8i_highp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039402,
        "dEQP-GLES3.functional.fragment",
        "_out.array.int.rg8i_highp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039403,
        "dEQP-GLES3.functional.fragment",
        "_out.array.int.rg8i_highp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039404,
        "dEQP-GLES3.functional.fragmen",
        "t_out.array.int.r32i_lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039405,
        "dEQP-GLES3.functional.fragment",
        "_out.array.int.r32i_lowp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039406,
        "dEQP-GLES3.functional.fragment",
        "_out.array.int.r32i_lowp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039407,
        "dEQP-GLES3.functional.fragment",
        "_out.array.int.r32i_lowp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039408,
        "dEQP-GLES3.functional.fragment",
        "_out.array.int.r32i_mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039409,
        "dEQP-GLES3.functional.fragment_",
        "out.array.int.r32i_mediump_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039410,
        "dEQP-GLES3.functional.fragment_",
        "out.array.int.r32i_mediump_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039411,
        "dEQP-GLES3.functional.fragment_",
        "out.array.int.r32i_mediump_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039412,
        "dEQP-GLES3.functional.fragmen",
        "t_out.array.int.r32i_highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039413,
        "dEQP-GLES3.functional.fragment",
        "_out.array.int.r32i_highp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039414,
        "dEQP-GLES3.functional.fragment",
        "_out.array.int.r32i_highp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039415,
        "dEQP-GLES3.functional.fragment",
        "_out.array.int.r32i_highp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039416,
        "dEQP-GLES3.functional.fragmen",
        "t_out.array.int.r16i_lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039417,
        "dEQP-GLES3.functional.fragment",
        "_out.array.int.r16i_lowp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039418,
        "dEQP-GLES3.functional.fragment",
        "_out.array.int.r16i_lowp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039419,
        "dEQP-GLES3.functional.fragment",
        "_out.array.int.r16i_lowp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039420,
        "dEQP-GLES3.functional.fragment",
        "_out.array.int.r16i_mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039421,
        "dEQP-GLES3.functional.fragment_",
        "out.array.int.r16i_mediump_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039422,
        "dEQP-GLES3.functional.fragment_",
        "out.array.int.r16i_mediump_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039423,
        "dEQP-GLES3.functional.fragment_",
        "out.array.int.r16i_mediump_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039424,
        "dEQP-GLES3.functional.fragmen",
        "t_out.array.int.r16i_highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039425,
        "dEQP-GLES3.functional.fragment",
        "_out.array.int.r16i_highp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039426,
        "dEQP-GLES3.functional.fragment",
        "_out.array.int.r16i_highp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039427,
        "dEQP-GLES3.functional.fragment",
        "_out.array.int.r16i_highp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039428,
        "dEQP-GLES3.functional.fragme",
        "nt_out.array.int.r8i_lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039429,
        "dEQP-GLES3.functional.fragmen",
        "t_out.array.int.r8i_lowp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039430,
        "dEQP-GLES3.functional.fragmen",
        "t_out.array.int.r8i_lowp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039431,
        "dEQP-GLES3.functional.fragmen",
        "t_out.array.int.r8i_lowp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039432,
        "dEQP-GLES3.functional.fragment",
        "_out.array.int.r8i_mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039433,
        "dEQP-GLES3.functional.fragment_",
        "out.array.int.r8i_mediump_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039434,
        "dEQP-GLES3.functional.fragment_",
        "out.array.int.r8i_mediump_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039435,
        "dEQP-GLES3.functional.fragment_",
        "out.array.int.r8i_mediump_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039436,
        "dEQP-GLES3.functional.fragmen",
        "t_out.array.int.r8i_highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039437,
        "dEQP-GLES3.functional.fragment",
        "_out.array.int.r8i_highp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039438,
        "dEQP-GLES3.functional.fragment",
        "_out.array.int.r8i_highp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039439,
        "dEQP-GLES3.functional.fragment",
        "_out.array.int.r8i_highp_ivec4");
