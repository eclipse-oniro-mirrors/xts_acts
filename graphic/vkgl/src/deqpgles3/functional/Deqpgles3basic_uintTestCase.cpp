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

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039020,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.uint.rgba32ui_lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039021,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.uint.rgba32ui_lowp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039022,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.uint.rgba32ui_lowp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039023,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.uint.rgba32ui_lowp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039024,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.uint.rgba32ui_mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039025,
        "dEQP-GLES3.functional.fragment_out",
        ".basic.uint.rgba32ui_mediump_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039026,
        "dEQP-GLES3.functional.fragment_out",
        ".basic.uint.rgba32ui_mediump_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039027,
        "dEQP-GLES3.functional.fragment_out",
        ".basic.uint.rgba32ui_mediump_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039028,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.uint.rgba32ui_highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039029,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.uint.rgba32ui_highp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039030,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.uint.rgba32ui_highp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039031,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.uint.rgba32ui_highp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039032,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.uint.rgba16ui_lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039033,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.uint.rgba16ui_lowp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039034,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.uint.rgba16ui_lowp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039035,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.uint.rgba16ui_lowp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039036,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.uint.rgba16ui_mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039037,
        "dEQP-GLES3.functional.fragment_out",
        ".basic.uint.rgba16ui_mediump_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039038,
        "dEQP-GLES3.functional.fragment_out",
        ".basic.uint.rgba16ui_mediump_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039039,
        "dEQP-GLES3.functional.fragment_out",
        ".basic.uint.rgba16ui_mediump_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039040,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.uint.rgba16ui_highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039041,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.uint.rgba16ui_highp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039042,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.uint.rgba16ui_highp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039043,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.uint.rgba16ui_highp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039044,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.uint.rgba8ui_lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039045,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.uint.rgba8ui_lowp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039046,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.uint.rgba8ui_lowp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039047,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.uint.rgba8ui_lowp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039048,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.uint.rgba8ui_mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039049,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.uint.rgba8ui_mediump_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039050,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.uint.rgba8ui_mediump_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039051,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.uint.rgba8ui_mediump_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039052,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.uint.rgba8ui_highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039053,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.uint.rgba8ui_highp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039054,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.uint.rgba8ui_highp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039055,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.uint.rgba8ui_highp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039056,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.uint.rgb10_a2ui_lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039057,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.uint.rgb10_a2ui_lowp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039058,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.uint.rgb10_a2ui_lowp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039059,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.uint.rgb10_a2ui_lowp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039060,
        "dEQP-GLES3.functional.fragment_out",
        ".basic.uint.rgb10_a2ui_mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039061,
        "dEQP-GLES3.functional.fragment_out.",
        "basic.uint.rgb10_a2ui_mediump_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039062,
        "dEQP-GLES3.functional.fragment_out.",
        "basic.uint.rgb10_a2ui_mediump_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039063,
        "dEQP-GLES3.functional.fragment_out.",
        "basic.uint.rgb10_a2ui_mediump_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039064,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.uint.rgb10_a2ui_highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039065,
        "dEQP-GLES3.functional.fragment_out",
        ".basic.uint.rgb10_a2ui_highp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039066,
        "dEQP-GLES3.functional.fragment_out",
        ".basic.uint.rgb10_a2ui_highp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039067,
        "dEQP-GLES3.functional.fragment_out",
        ".basic.uint.rgb10_a2ui_highp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039068,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.uint.rg32ui_lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039069,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.uint.rg32ui_lowp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039070,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.uint.rg32ui_lowp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039071,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.uint.rg32ui_lowp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039072,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.uint.rg32ui_mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039073,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.uint.rg32ui_mediump_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039074,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.uint.rg32ui_mediump_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039075,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.uint.rg32ui_mediump_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039076,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.uint.rg32ui_highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039077,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.uint.rg32ui_highp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039078,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.uint.rg32ui_highp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039079,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.uint.rg32ui_highp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039080,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.uint.rg16ui_lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039081,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.uint.rg16ui_lowp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039082,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.uint.rg16ui_lowp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039083,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.uint.rg16ui_lowp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039084,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.uint.rg16ui_mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039085,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.uint.rg16ui_mediump_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039086,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.uint.rg16ui_mediump_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039087,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.uint.rg16ui_mediump_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039088,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.uint.rg16ui_highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039089,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.uint.rg16ui_highp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039090,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.uint.rg16ui_highp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039091,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.uint.rg16ui_highp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039092,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.uint.rg8ui_lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039093,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.uint.rg8ui_lowp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039094,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.uint.rg8ui_lowp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039095,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.uint.rg8ui_lowp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039096,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.uint.rg8ui_mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039097,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.uint.rg8ui_mediump_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039098,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.uint.rg8ui_mediump_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039099,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.uint.rg8ui_mediump_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039100,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.uint.rg8ui_highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039101,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.uint.rg8ui_highp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039102,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.uint.rg8ui_highp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039103,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.uint.rg8ui_highp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039104,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.uint.r32ui_lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039105,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.uint.r32ui_lowp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039106,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.uint.r32ui_lowp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039107,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.uint.r32ui_lowp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039108,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.uint.r32ui_mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039109,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.uint.r32ui_mediump_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039110,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.uint.r32ui_mediump_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039111,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.uint.r32ui_mediump_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039112,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.uint.r32ui_highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039113,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.uint.r32ui_highp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039114,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.uint.r32ui_highp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039115,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.uint.r32ui_highp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039116,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.uint.r16ui_lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039117,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.uint.r16ui_lowp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039118,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.uint.r16ui_lowp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039119,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.uint.r16ui_lowp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039120,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.uint.r16ui_mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039121,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.uint.r16ui_mediump_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039122,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.uint.r16ui_mediump_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039123,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.uint.r16ui_mediump_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039124,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.uint.r16ui_highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039125,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.uint.r16ui_highp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039126,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.uint.r16ui_highp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039127,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.uint.r16ui_highp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039128,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.uint.r8ui_lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039129,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.uint.r8ui_lowp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039130,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.uint.r8ui_lowp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039131,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.uint.r8ui_lowp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039132,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.uint.r8ui_mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039133,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.uint.r8ui_mediump_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039134,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.uint.r8ui_mediump_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039135,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.uint.r8ui_mediump_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039136,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.uint.r8ui_highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039137,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.uint.r8ui_highp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039138,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.uint.r8ui_highp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039139,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.uint.r8ui_highp_uvec4");
