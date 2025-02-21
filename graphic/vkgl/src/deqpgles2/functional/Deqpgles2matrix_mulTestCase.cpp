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
#include "../ActsDeqpgles20008TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007097,
        "dEQP-GLES2.functional.shaders.matr",
        "ix.mul.const_lowp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007098,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.const_lowp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007099,
        "dEQP-GLES2.functional.shaders.matr",
        "ix.mul.const_lowp_mat2_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007100,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.const_lowp_mat2_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007101,
        "dEQP-GLES2.functional.shaders.matr",
        "ix.mul.const_lowp_vec2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007102,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.const_lowp_vec2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007103,
        "dEQP-GLES2.functional.shaders.matr",
        "ix.mul.const_lowp_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007104,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.const_lowp_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007105,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.const_mediump_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007106,
        "dEQP-GLES2.functional.shaders.matrix.",
        "mul.const_mediump_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007107,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.const_mediump_mat2_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007108,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.const_mediump_mat2_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007109,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.const_mediump_vec2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007110,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.const_mediump_vec2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007111,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.const_mediump_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007112,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.const_mediump_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007113,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.const_highp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007114,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.const_highp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007115,
        "dEQP-GLES2.functional.shaders.matr",
        "ix.mul.const_highp_mat2_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007116,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.const_highp_mat2_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007117,
        "dEQP-GLES2.functional.shaders.matr",
        "ix.mul.const_highp_vec2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007118,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.const_highp_vec2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007119,
        "dEQP-GLES2.functional.shaders.matr",
        "ix.mul.const_highp_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007120,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.const_highp_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007121,
        "dEQP-GLES2.functional.shaders.matr",
        "ix.mul.const_lowp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007122,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.const_lowp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007123,
        "dEQP-GLES2.functional.shaders.matr",
        "ix.mul.const_lowp_mat3_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007124,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.const_lowp_mat3_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007125,
        "dEQP-GLES2.functional.shaders.matr",
        "ix.mul.const_lowp_vec3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007126,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.const_lowp_vec3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007127,
        "dEQP-GLES2.functional.shaders.matr",
        "ix.mul.const_lowp_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007128,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.const_lowp_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007129,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.const_mediump_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007130,
        "dEQP-GLES2.functional.shaders.matrix.",
        "mul.const_mediump_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007131,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.const_mediump_mat3_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007132,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.const_mediump_mat3_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007133,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.const_mediump_vec3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007134,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.const_mediump_vec3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007135,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.const_mediump_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007136,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.const_mediump_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007137,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.const_highp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007138,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.const_highp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007139,
        "dEQP-GLES2.functional.shaders.matr",
        "ix.mul.const_highp_mat3_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007140,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.const_highp_mat3_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007141,
        "dEQP-GLES2.functional.shaders.matr",
        "ix.mul.const_highp_vec3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007142,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.const_highp_vec3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007143,
        "dEQP-GLES2.functional.shaders.matr",
        "ix.mul.const_highp_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007144,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.const_highp_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007145,
        "dEQP-GLES2.functional.shaders.matr",
        "ix.mul.const_lowp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007146,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.const_lowp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007147,
        "dEQP-GLES2.functional.shaders.matr",
        "ix.mul.const_lowp_mat4_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007148,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.const_lowp_mat4_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007149,
        "dEQP-GLES2.functional.shaders.matr",
        "ix.mul.const_lowp_vec4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007150,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.const_lowp_vec4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007151,
        "dEQP-GLES2.functional.shaders.matr",
        "ix.mul.const_lowp_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007152,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.const_lowp_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007153,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.const_mediump_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007154,
        "dEQP-GLES2.functional.shaders.matrix.",
        "mul.const_mediump_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007155,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.const_mediump_mat4_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007156,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.const_mediump_mat4_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007157,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.const_mediump_vec4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007158,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.const_mediump_vec4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007159,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.const_mediump_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007160,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.const_mediump_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007161,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.const_highp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007162,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.const_highp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007163,
        "dEQP-GLES2.functional.shaders.matr",
        "ix.mul.const_highp_mat4_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007164,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.const_highp_mat4_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007165,
        "dEQP-GLES2.functional.shaders.matr",
        "ix.mul.const_highp_vec4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007166,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.const_highp_vec4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007167,
        "dEQP-GLES2.functional.shaders.matr",
        "ix.mul.const_highp_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007168,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.const_highp_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007169,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.uniform_lowp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007170,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.uniform_lowp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007171,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.uniform_lowp_mat2_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007172,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.uniform_lowp_mat2_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007173,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.uniform_lowp_vec2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007174,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.uniform_lowp_vec2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007175,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.uniform_lowp_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007176,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.uniform_lowp_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007177,
        "dEQP-GLES2.functional.shaders.matrix.",
        "mul.uniform_mediump_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007178,
        "dEQP-GLES2.functional.shaders.matrix.m",
        "ul.uniform_mediump_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007179,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.uniform_mediump_mat2_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007180,
        "dEQP-GLES2.functional.shaders.matrix.",
        "mul.uniform_mediump_mat2_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007181,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.uniform_mediump_vec2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007182,
        "dEQP-GLES2.functional.shaders.matrix.",
        "mul.uniform_mediump_vec2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007183,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.uniform_mediump_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007184,
        "dEQP-GLES2.functional.shaders.matrix.",
        "mul.uniform_mediump_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007185,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.uniform_highp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007186,
        "dEQP-GLES2.functional.shaders.matrix.",
        "mul.uniform_highp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007187,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.uniform_highp_mat2_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007188,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.uniform_highp_mat2_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007189,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.uniform_highp_vec2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007190,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.uniform_highp_vec2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007191,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.uniform_highp_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007192,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.uniform_highp_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007193,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.uniform_lowp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007194,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.uniform_lowp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007195,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.uniform_lowp_mat3_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007196,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.uniform_lowp_mat3_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007197,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.uniform_lowp_vec3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007198,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.uniform_lowp_vec3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007199,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.uniform_lowp_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007200,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.uniform_lowp_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007201,
        "dEQP-GLES2.functional.shaders.matrix.",
        "mul.uniform_mediump_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007202,
        "dEQP-GLES2.functional.shaders.matrix.m",
        "ul.uniform_mediump_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007203,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.uniform_mediump_mat3_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007204,
        "dEQP-GLES2.functional.shaders.matrix.",
        "mul.uniform_mediump_mat3_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007205,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.uniform_mediump_vec3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007206,
        "dEQP-GLES2.functional.shaders.matrix.",
        "mul.uniform_mediump_vec3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007207,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.uniform_mediump_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007208,
        "dEQP-GLES2.functional.shaders.matrix.",
        "mul.uniform_mediump_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007209,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.uniform_highp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007210,
        "dEQP-GLES2.functional.shaders.matrix.",
        "mul.uniform_highp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007211,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.uniform_highp_mat3_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007212,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.uniform_highp_mat3_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007213,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.uniform_highp_vec3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007214,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.uniform_highp_vec3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007215,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.uniform_highp_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007216,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.uniform_highp_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007217,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.uniform_lowp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007218,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.uniform_lowp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007219,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.uniform_lowp_mat4_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007220,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.uniform_lowp_mat4_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007221,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.uniform_lowp_vec4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007222,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.uniform_lowp_vec4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007223,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.uniform_lowp_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007224,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.uniform_lowp_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007225,
        "dEQP-GLES2.functional.shaders.matrix.",
        "mul.uniform_mediump_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007226,
        "dEQP-GLES2.functional.shaders.matrix.m",
        "ul.uniform_mediump_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007227,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.uniform_mediump_mat4_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007228,
        "dEQP-GLES2.functional.shaders.matrix.",
        "mul.uniform_mediump_mat4_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007229,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.uniform_mediump_vec4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007230,
        "dEQP-GLES2.functional.shaders.matrix.",
        "mul.uniform_mediump_vec4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007231,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.uniform_mediump_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007232,
        "dEQP-GLES2.functional.shaders.matrix.",
        "mul.uniform_mediump_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007233,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.uniform_highp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007234,
        "dEQP-GLES2.functional.shaders.matrix.",
        "mul.uniform_highp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007235,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.uniform_highp_mat4_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007236,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.uniform_highp_mat4_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007237,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.uniform_highp_vec4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007238,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.uniform_highp_vec4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007239,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.uniform_highp_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007240,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.uniform_highp_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007241,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.dynamic_lowp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007242,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.dynamic_lowp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007243,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.dynamic_lowp_mat2_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007244,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.dynamic_lowp_mat2_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007245,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.dynamic_lowp_vec2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007246,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.dynamic_lowp_vec2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007247,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.dynamic_lowp_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007248,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.dynamic_lowp_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007249,
        "dEQP-GLES2.functional.shaders.matrix.",
        "mul.dynamic_mediump_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007250,
        "dEQP-GLES2.functional.shaders.matrix.m",
        "ul.dynamic_mediump_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007251,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.dynamic_mediump_mat2_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007252,
        "dEQP-GLES2.functional.shaders.matrix.",
        "mul.dynamic_mediump_mat2_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007253,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.dynamic_mediump_vec2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007254,
        "dEQP-GLES2.functional.shaders.matrix.",
        "mul.dynamic_mediump_vec2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007255,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.dynamic_mediump_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007256,
        "dEQP-GLES2.functional.shaders.matrix.",
        "mul.dynamic_mediump_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007257,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.dynamic_highp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007258,
        "dEQP-GLES2.functional.shaders.matrix.",
        "mul.dynamic_highp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007259,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.dynamic_highp_mat2_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007260,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.dynamic_highp_mat2_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007261,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.dynamic_highp_vec2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007262,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.dynamic_highp_vec2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007263,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.dynamic_highp_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007264,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.dynamic_highp_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007265,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.dynamic_lowp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007266,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.dynamic_lowp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007267,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.dynamic_lowp_mat3_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007268,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.dynamic_lowp_mat3_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007269,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.dynamic_lowp_vec3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007270,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.dynamic_lowp_vec3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007271,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.dynamic_lowp_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007272,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.dynamic_lowp_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007273,
        "dEQP-GLES2.functional.shaders.matrix.",
        "mul.dynamic_mediump_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007274,
        "dEQP-GLES2.functional.shaders.matrix.m",
        "ul.dynamic_mediump_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007275,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.dynamic_mediump_mat3_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007276,
        "dEQP-GLES2.functional.shaders.matrix.",
        "mul.dynamic_mediump_mat3_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007277,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.dynamic_mediump_vec3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007278,
        "dEQP-GLES2.functional.shaders.matrix.",
        "mul.dynamic_mediump_vec3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007279,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.dynamic_mediump_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007280,
        "dEQP-GLES2.functional.shaders.matrix.",
        "mul.dynamic_mediump_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007281,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.dynamic_highp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007282,
        "dEQP-GLES2.functional.shaders.matrix.",
        "mul.dynamic_highp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007283,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.dynamic_highp_mat3_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007284,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.dynamic_highp_mat3_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007285,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.dynamic_highp_vec3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007286,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.dynamic_highp_vec3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007287,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.dynamic_highp_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007288,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.dynamic_highp_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007289,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.dynamic_lowp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007290,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.dynamic_lowp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007291,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.dynamic_lowp_mat4_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007292,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.dynamic_lowp_mat4_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007293,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.dynamic_lowp_vec4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007294,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.dynamic_lowp_vec4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007295,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.dynamic_lowp_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007296,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.dynamic_lowp_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007297,
        "dEQP-GLES2.functional.shaders.matrix.",
        "mul.dynamic_mediump_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007298,
        "dEQP-GLES2.functional.shaders.matrix.m",
        "ul.dynamic_mediump_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007299,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.dynamic_mediump_mat4_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007300,
        "dEQP-GLES2.functional.shaders.matrix.",
        "mul.dynamic_mediump_mat4_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007301,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.dynamic_mediump_vec4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007302,
        "dEQP-GLES2.functional.shaders.matrix.",
        "mul.dynamic_mediump_vec4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007303,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.dynamic_mediump_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007304,
        "dEQP-GLES2.functional.shaders.matrix.",
        "mul.dynamic_mediump_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007305,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.dynamic_highp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007306,
        "dEQP-GLES2.functional.shaders.matrix.",
        "mul.dynamic_highp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007307,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.dynamic_highp_mat4_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007308,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.dynamic_highp_mat4_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007309,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.dynamic_highp_vec4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007310,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.dynamic_highp_vec4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007311,
        "dEQP-GLES2.functional.shaders.matri",
        "x.mul.dynamic_highp_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007312,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul.dynamic_highp_mat4_mat4_fragment");
