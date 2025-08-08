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
#include "../ActsDeqpgles30015TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014088,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.sub.const.lowp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014089,
        "dEQP-GLES3.functional.shaders.matri",
        "x.sub.const.lowp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014090,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.sub.const.lowp_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014091,
        "dEQP-GLES3.functional.shaders.matri",
        "x.sub.const.lowp_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014092,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.const.mediump_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014093,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.const.mediump_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014094,
        "dEQP-GLES3.functional.shaders.matri",
        "x.sub.const.mediump_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014095,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.const.mediump_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014096,
        "dEQP-GLES3.functional.shaders.matri",
        "x.sub.const.highp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014097,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.const.highp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014098,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.sub.const.highp_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014099,
        "dEQP-GLES3.functional.shaders.matri",
        "x.sub.const.highp_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014100,
        "dEQP-GLES3.functional.shaders.matri",
        "x.sub.const.lowp_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014101,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.const.lowp_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014102,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.const.lowp_mat2x3_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014103,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.const.lowp_mat2x3_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014104,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.const.mediump_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014105,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.const.mediump_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014106,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.const.mediump_mat2x3_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014107,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.const.mediump_mat2x3_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014108,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.const.highp_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014109,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.const.highp_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014110,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.const.highp_mat2x3_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014111,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.const.highp_mat2x3_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014112,
        "dEQP-GLES3.functional.shaders.matri",
        "x.sub.const.lowp_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014113,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.const.lowp_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014114,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.const.lowp_mat2x4_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014115,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.const.lowp_mat2x4_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014116,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.const.mediump_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014117,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.const.mediump_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014118,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.const.mediump_mat2x4_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014119,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.const.mediump_mat2x4_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014120,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.const.highp_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014121,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.const.highp_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014122,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.const.highp_mat2x4_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014123,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.const.highp_mat2x4_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014124,
        "dEQP-GLES3.functional.shaders.matri",
        "x.sub.const.lowp_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014125,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.const.lowp_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014126,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.const.lowp_mat3x2_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014127,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.const.lowp_mat3x2_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014128,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.const.mediump_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014129,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.const.mediump_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014130,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.const.mediump_mat3x2_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014131,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.const.mediump_mat3x2_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014132,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.const.highp_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014133,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.const.highp_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014134,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.const.highp_mat3x2_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014135,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.const.highp_mat3x2_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014136,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.sub.const.lowp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014137,
        "dEQP-GLES3.functional.shaders.matri",
        "x.sub.const.lowp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014138,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.sub.const.lowp_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014139,
        "dEQP-GLES3.functional.shaders.matri",
        "x.sub.const.lowp_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014140,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.const.mediump_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014141,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.const.mediump_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014142,
        "dEQP-GLES3.functional.shaders.matri",
        "x.sub.const.mediump_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014143,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.const.mediump_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014144,
        "dEQP-GLES3.functional.shaders.matri",
        "x.sub.const.highp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014145,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.const.highp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014146,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.sub.const.highp_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014147,
        "dEQP-GLES3.functional.shaders.matri",
        "x.sub.const.highp_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014148,
        "dEQP-GLES3.functional.shaders.matri",
        "x.sub.const.lowp_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014149,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.const.lowp_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014150,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.const.lowp_mat3x4_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014151,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.const.lowp_mat3x4_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014152,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.const.mediump_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014153,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.const.mediump_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014154,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.const.mediump_mat3x4_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014155,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.const.mediump_mat3x4_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014156,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.const.highp_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014157,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.const.highp_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014158,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.const.highp_mat3x4_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014159,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.const.highp_mat3x4_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014160,
        "dEQP-GLES3.functional.shaders.matri",
        "x.sub.const.lowp_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014161,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.const.lowp_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014162,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.const.lowp_mat4x2_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014163,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.const.lowp_mat4x2_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014164,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.const.mediump_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014165,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.const.mediump_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014166,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.const.mediump_mat4x2_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014167,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.const.mediump_mat4x2_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014168,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.const.highp_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014169,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.const.highp_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014170,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.const.highp_mat4x2_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014171,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.const.highp_mat4x2_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014172,
        "dEQP-GLES3.functional.shaders.matri",
        "x.sub.const.lowp_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014173,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.const.lowp_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014174,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.const.lowp_mat4x3_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014175,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.const.lowp_mat4x3_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014176,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.const.mediump_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014177,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.const.mediump_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014178,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.const.mediump_mat4x3_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014179,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.const.mediump_mat4x3_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014180,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.const.highp_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014181,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.const.highp_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014182,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.const.highp_mat4x3_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014183,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.const.highp_mat4x3_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014184,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.sub.const.lowp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014185,
        "dEQP-GLES3.functional.shaders.matri",
        "x.sub.const.lowp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014186,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.sub.const.lowp_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014187,
        "dEQP-GLES3.functional.shaders.matri",
        "x.sub.const.lowp_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014188,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.const.mediump_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014189,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.const.mediump_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014190,
        "dEQP-GLES3.functional.shaders.matri",
        "x.sub.const.mediump_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014191,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.const.mediump_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014192,
        "dEQP-GLES3.functional.shaders.matri",
        "x.sub.const.highp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014193,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.const.highp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014194,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.sub.const.highp_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014195,
        "dEQP-GLES3.functional.shaders.matri",
        "x.sub.const.highp_mat4_mat4_fragment");
