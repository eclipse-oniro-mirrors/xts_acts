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

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038912,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.int.rgba32i_lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038913,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.int.rgba32i_lowp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038914,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.int.rgba32i_lowp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038915,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.int.rgba32i_lowp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038916,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.int.rgba32i_mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038917,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.int.rgba32i_mediump_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038918,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.int.rgba32i_mediump_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038919,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.int.rgba32i_mediump_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038920,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.int.rgba32i_highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038921,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.int.rgba32i_highp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038922,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.int.rgba32i_highp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038923,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.int.rgba32i_highp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038924,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.int.rgba16i_lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038925,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.int.rgba16i_lowp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038926,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.int.rgba16i_lowp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038927,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.int.rgba16i_lowp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038928,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.int.rgba16i_mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038929,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.int.rgba16i_mediump_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038930,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.int.rgba16i_mediump_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038931,
        "dEQP-GLES3.functional.fragment_ou",
        "t.basic.int.rgba16i_mediump_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038932,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.int.rgba16i_highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038933,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.int.rgba16i_highp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038934,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.int.rgba16i_highp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038935,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.int.rgba16i_highp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038936,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.int.rgba8i_lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038937,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.int.rgba8i_lowp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038938,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.int.rgba8i_lowp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038939,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.int.rgba8i_lowp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038940,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.int.rgba8i_mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038941,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.int.rgba8i_mediump_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038942,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.int.rgba8i_mediump_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038943,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.int.rgba8i_mediump_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038944,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.int.rgba8i_highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038945,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.int.rgba8i_highp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038946,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.int.rgba8i_highp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038947,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.int.rgba8i_highp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038948,
        "dEQP-GLES3.functional.fragmen",
        "t_out.basic.int.rg32i_lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038949,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.int.rg32i_lowp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038950,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.int.rg32i_lowp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038951,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.int.rg32i_lowp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038952,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.int.rg32i_mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038953,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.int.rg32i_mediump_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038954,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.int.rg32i_mediump_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038955,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.int.rg32i_mediump_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038956,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.int.rg32i_highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038957,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.int.rg32i_highp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038958,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.int.rg32i_highp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038959,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.int.rg32i_highp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038960,
        "dEQP-GLES3.functional.fragmen",
        "t_out.basic.int.rg16i_lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038961,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.int.rg16i_lowp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038962,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.int.rg16i_lowp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038963,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.int.rg16i_lowp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038964,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.int.rg16i_mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038965,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.int.rg16i_mediump_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038966,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.int.rg16i_mediump_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038967,
        "dEQP-GLES3.functional.fragment_o",
        "ut.basic.int.rg16i_mediump_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038968,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.int.rg16i_highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038969,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.int.rg16i_highp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038970,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.int.rg16i_highp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038971,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.int.rg16i_highp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038972,
        "dEQP-GLES3.functional.fragmen",
        "t_out.basic.int.rg8i_lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038973,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.int.rg8i_lowp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038974,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.int.rg8i_lowp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038975,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.int.rg8i_lowp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038976,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.int.rg8i_mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038977,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.int.rg8i_mediump_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038978,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.int.rg8i_mediump_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038979,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.int.rg8i_mediump_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038980,
        "dEQP-GLES3.functional.fragmen",
        "t_out.basic.int.rg8i_highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038981,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.int.rg8i_highp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038982,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.int.rg8i_highp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038983,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.int.rg8i_highp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038984,
        "dEQP-GLES3.functional.fragmen",
        "t_out.basic.int.r32i_lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038985,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.int.r32i_lowp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038986,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.int.r32i_lowp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038987,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.int.r32i_lowp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038988,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.int.r32i_mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038989,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.int.r32i_mediump_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038990,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.int.r32i_mediump_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038991,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.int.r32i_mediump_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038992,
        "dEQP-GLES3.functional.fragmen",
        "t_out.basic.int.r32i_highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038993,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.int.r32i_highp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038994,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.int.r32i_highp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038995,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.int.r32i_highp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038996,
        "dEQP-GLES3.functional.fragmen",
        "t_out.basic.int.r16i_lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038997,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.int.r16i_lowp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038998,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.int.r16i_lowp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038999,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.int.r16i_lowp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_039000,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.int.r16i_mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_039001,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.int.r16i_mediump_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_039002,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.int.r16i_mediump_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_039003,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.int.r16i_mediump_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_039004,
        "dEQP-GLES3.functional.fragmen",
        "t_out.basic.int.r16i_highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_039005,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.int.r16i_highp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_039006,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.int.r16i_highp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_039007,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.int.r16i_highp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_039008,
        "dEQP-GLES3.functional.fragme",
        "nt_out.basic.int.r8i_lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_039009,
        "dEQP-GLES3.functional.fragmen",
        "t_out.basic.int.r8i_lowp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_039010,
        "dEQP-GLES3.functional.fragmen",
        "t_out.basic.int.r8i_lowp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_039011,
        "dEQP-GLES3.functional.fragmen",
        "t_out.basic.int.r8i_lowp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_039012,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.int.r8i_mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_039013,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.int.r8i_mediump_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_039014,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.int.r8i_mediump_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_039015,
        "dEQP-GLES3.functional.fragment_",
        "out.basic.int.r8i_mediump_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_039016,
        "dEQP-GLES3.functional.fragmen",
        "t_out.basic.int.r8i_highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_039017,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.int.r8i_highp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_039018,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.int.r8i_highp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_039019,
        "dEQP-GLES3.functional.fragment",
        "_out.basic.int.r8i_highp_ivec4");
