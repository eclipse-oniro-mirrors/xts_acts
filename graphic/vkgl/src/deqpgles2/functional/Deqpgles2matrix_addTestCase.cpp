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
#include "../ActsDeqpgles20007TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006881,
        "dEQP-GLES2.functional.shaders.matr",
        "ix.add.const_lowp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006882,
        "dEQP-GLES2.functional.shaders.matri",
        "x.add.const_lowp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006883,
        "dEQP-GLES2.functional.shaders.matr",
        "ix.add.const_lowp_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006884,
        "dEQP-GLES2.functional.shaders.matri",
        "x.add.const_lowp_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006885,
        "dEQP-GLES2.functional.shaders.matrix",
        ".add.const_mediump_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006886,
        "dEQP-GLES2.functional.shaders.matrix.",
        "add.const_mediump_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006887,
        "dEQP-GLES2.functional.shaders.matri",
        "x.add.const_mediump_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006888,
        "dEQP-GLES2.functional.shaders.matrix",
        ".add.const_mediump_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006889,
        "dEQP-GLES2.functional.shaders.matri",
        "x.add.const_highp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006890,
        "dEQP-GLES2.functional.shaders.matrix",
        ".add.const_highp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006891,
        "dEQP-GLES2.functional.shaders.matr",
        "ix.add.const_highp_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006892,
        "dEQP-GLES2.functional.shaders.matri",
        "x.add.const_highp_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006893,
        "dEQP-GLES2.functional.shaders.matr",
        "ix.add.const_lowp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006894,
        "dEQP-GLES2.functional.shaders.matri",
        "x.add.const_lowp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006895,
        "dEQP-GLES2.functional.shaders.matr",
        "ix.add.const_lowp_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006896,
        "dEQP-GLES2.functional.shaders.matri",
        "x.add.const_lowp_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006897,
        "dEQP-GLES2.functional.shaders.matrix",
        ".add.const_mediump_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006898,
        "dEQP-GLES2.functional.shaders.matrix.",
        "add.const_mediump_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006899,
        "dEQP-GLES2.functional.shaders.matri",
        "x.add.const_mediump_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006900,
        "dEQP-GLES2.functional.shaders.matrix",
        ".add.const_mediump_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006901,
        "dEQP-GLES2.functional.shaders.matri",
        "x.add.const_highp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006902,
        "dEQP-GLES2.functional.shaders.matrix",
        ".add.const_highp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006903,
        "dEQP-GLES2.functional.shaders.matr",
        "ix.add.const_highp_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006904,
        "dEQP-GLES2.functional.shaders.matri",
        "x.add.const_highp_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006905,
        "dEQP-GLES2.functional.shaders.matr",
        "ix.add.const_lowp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006906,
        "dEQP-GLES2.functional.shaders.matri",
        "x.add.const_lowp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006907,
        "dEQP-GLES2.functional.shaders.matr",
        "ix.add.const_lowp_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006908,
        "dEQP-GLES2.functional.shaders.matri",
        "x.add.const_lowp_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006909,
        "dEQP-GLES2.functional.shaders.matrix",
        ".add.const_mediump_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006910,
        "dEQP-GLES2.functional.shaders.matrix.",
        "add.const_mediump_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006911,
        "dEQP-GLES2.functional.shaders.matri",
        "x.add.const_mediump_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006912,
        "dEQP-GLES2.functional.shaders.matrix",
        ".add.const_mediump_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006913,
        "dEQP-GLES2.functional.shaders.matri",
        "x.add.const_highp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006914,
        "dEQP-GLES2.functional.shaders.matrix",
        ".add.const_highp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006915,
        "dEQP-GLES2.functional.shaders.matr",
        "ix.add.const_highp_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006916,
        "dEQP-GLES2.functional.shaders.matri",
        "x.add.const_highp_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006917,
        "dEQP-GLES2.functional.shaders.matri",
        "x.add.uniform_lowp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006918,
        "dEQP-GLES2.functional.shaders.matrix",
        ".add.uniform_lowp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006919,
        "dEQP-GLES2.functional.shaders.matri",
        "x.add.uniform_lowp_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006920,
        "dEQP-GLES2.functional.shaders.matrix",
        ".add.uniform_lowp_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006921,
        "dEQP-GLES2.functional.shaders.matrix.",
        "add.uniform_mediump_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006922,
        "dEQP-GLES2.functional.shaders.matrix.a",
        "dd.uniform_mediump_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006923,
        "dEQP-GLES2.functional.shaders.matrix",
        ".add.uniform_mediump_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006924,
        "dEQP-GLES2.functional.shaders.matrix.",
        "add.uniform_mediump_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006925,
        "dEQP-GLES2.functional.shaders.matrix",
        ".add.uniform_highp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006926,
        "dEQP-GLES2.functional.shaders.matrix.",
        "add.uniform_highp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006927,
        "dEQP-GLES2.functional.shaders.matri",
        "x.add.uniform_highp_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006928,
        "dEQP-GLES2.functional.shaders.matrix",
        ".add.uniform_highp_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006929,
        "dEQP-GLES2.functional.shaders.matri",
        "x.add.uniform_lowp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006930,
        "dEQP-GLES2.functional.shaders.matrix",
        ".add.uniform_lowp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006931,
        "dEQP-GLES2.functional.shaders.matri",
        "x.add.uniform_lowp_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006932,
        "dEQP-GLES2.functional.shaders.matrix",
        ".add.uniform_lowp_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006933,
        "dEQP-GLES2.functional.shaders.matrix.",
        "add.uniform_mediump_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006934,
        "dEQP-GLES2.functional.shaders.matrix.a",
        "dd.uniform_mediump_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006935,
        "dEQP-GLES2.functional.shaders.matrix",
        ".add.uniform_mediump_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006936,
        "dEQP-GLES2.functional.shaders.matrix.",
        "add.uniform_mediump_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006937,
        "dEQP-GLES2.functional.shaders.matrix",
        ".add.uniform_highp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006938,
        "dEQP-GLES2.functional.shaders.matrix.",
        "add.uniform_highp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006939,
        "dEQP-GLES2.functional.shaders.matri",
        "x.add.uniform_highp_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006940,
        "dEQP-GLES2.functional.shaders.matrix",
        ".add.uniform_highp_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006941,
        "dEQP-GLES2.functional.shaders.matri",
        "x.add.uniform_lowp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006942,
        "dEQP-GLES2.functional.shaders.matrix",
        ".add.uniform_lowp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006943,
        "dEQP-GLES2.functional.shaders.matri",
        "x.add.uniform_lowp_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006944,
        "dEQP-GLES2.functional.shaders.matrix",
        ".add.uniform_lowp_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006945,
        "dEQP-GLES2.functional.shaders.matrix.",
        "add.uniform_mediump_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006946,
        "dEQP-GLES2.functional.shaders.matrix.a",
        "dd.uniform_mediump_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006947,
        "dEQP-GLES2.functional.shaders.matrix",
        ".add.uniform_mediump_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006948,
        "dEQP-GLES2.functional.shaders.matrix.",
        "add.uniform_mediump_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006949,
        "dEQP-GLES2.functional.shaders.matrix",
        ".add.uniform_highp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006950,
        "dEQP-GLES2.functional.shaders.matrix.",
        "add.uniform_highp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006951,
        "dEQP-GLES2.functional.shaders.matri",
        "x.add.uniform_highp_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006952,
        "dEQP-GLES2.functional.shaders.matrix",
        ".add.uniform_highp_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006953,
        "dEQP-GLES2.functional.shaders.matri",
        "x.add.dynamic_lowp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006954,
        "dEQP-GLES2.functional.shaders.matrix",
        ".add.dynamic_lowp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006955,
        "dEQP-GLES2.functional.shaders.matri",
        "x.add.dynamic_lowp_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006956,
        "dEQP-GLES2.functional.shaders.matrix",
        ".add.dynamic_lowp_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006957,
        "dEQP-GLES2.functional.shaders.matrix.",
        "add.dynamic_mediump_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006958,
        "dEQP-GLES2.functional.shaders.matrix.a",
        "dd.dynamic_mediump_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006959,
        "dEQP-GLES2.functional.shaders.matrix",
        ".add.dynamic_mediump_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006960,
        "dEQP-GLES2.functional.shaders.matrix.",
        "add.dynamic_mediump_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006961,
        "dEQP-GLES2.functional.shaders.matrix",
        ".add.dynamic_highp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006962,
        "dEQP-GLES2.functional.shaders.matrix.",
        "add.dynamic_highp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006963,
        "dEQP-GLES2.functional.shaders.matri",
        "x.add.dynamic_highp_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006964,
        "dEQP-GLES2.functional.shaders.matrix",
        ".add.dynamic_highp_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006965,
        "dEQP-GLES2.functional.shaders.matri",
        "x.add.dynamic_lowp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006966,
        "dEQP-GLES2.functional.shaders.matrix",
        ".add.dynamic_lowp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006967,
        "dEQP-GLES2.functional.shaders.matri",
        "x.add.dynamic_lowp_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006968,
        "dEQP-GLES2.functional.shaders.matrix",
        ".add.dynamic_lowp_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006969,
        "dEQP-GLES2.functional.shaders.matrix.",
        "add.dynamic_mediump_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006970,
        "dEQP-GLES2.functional.shaders.matrix.a",
        "dd.dynamic_mediump_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006971,
        "dEQP-GLES2.functional.shaders.matrix",
        ".add.dynamic_mediump_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006972,
        "dEQP-GLES2.functional.shaders.matrix.",
        "add.dynamic_mediump_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006973,
        "dEQP-GLES2.functional.shaders.matrix",
        ".add.dynamic_highp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006974,
        "dEQP-GLES2.functional.shaders.matrix.",
        "add.dynamic_highp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006975,
        "dEQP-GLES2.functional.shaders.matri",
        "x.add.dynamic_highp_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006976,
        "dEQP-GLES2.functional.shaders.matrix",
        ".add.dynamic_highp_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006977,
        "dEQP-GLES2.functional.shaders.matri",
        "x.add.dynamic_lowp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006978,
        "dEQP-GLES2.functional.shaders.matrix",
        ".add.dynamic_lowp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006979,
        "dEQP-GLES2.functional.shaders.matri",
        "x.add.dynamic_lowp_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006980,
        "dEQP-GLES2.functional.shaders.matrix",
        ".add.dynamic_lowp_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006981,
        "dEQP-GLES2.functional.shaders.matrix.",
        "add.dynamic_mediump_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006982,
        "dEQP-GLES2.functional.shaders.matrix.a",
        "dd.dynamic_mediump_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006983,
        "dEQP-GLES2.functional.shaders.matrix",
        ".add.dynamic_mediump_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006984,
        "dEQP-GLES2.functional.shaders.matrix.",
        "add.dynamic_mediump_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006985,
        "dEQP-GLES2.functional.shaders.matrix",
        ".add.dynamic_highp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006986,
        "dEQP-GLES2.functional.shaders.matrix.",
        "add.dynamic_highp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006987,
        "dEQP-GLES2.functional.shaders.matri",
        "x.add.dynamic_highp_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006988,
        "dEQP-GLES2.functional.shaders.matrix",
        ".add.dynamic_highp_mat4_mat4_fragment");
