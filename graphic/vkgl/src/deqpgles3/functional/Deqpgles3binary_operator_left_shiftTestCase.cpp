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
#include "../ActsDeqpgles30010TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009224,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.left_shift.lowp_int_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009225,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.left_shift.lowp_int_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009226,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.left_shift.mediump_int_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009227,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.left_shift.mediump_int_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009228,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.left_shift.lowp_ivec2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009229,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.left_shift.lowp_ivec2_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009230,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.left_shift.mediump_ivec2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009231,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.left_shift.mediump_ivec2_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009232,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.left_shift.lowp_ivec3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009233,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.left_shift.lowp_ivec3_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009234,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.left_shift.mediump_ivec3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009235,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.left_shift.mediump_ivec3_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009236,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.left_shift.lowp_ivec4_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009237,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.left_shift.lowp_ivec4_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009238,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.left_shift.mediump_ivec4_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009239,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.left_shift.mediump_ivec4_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009240,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.left_shift.highp_int_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009241,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.left_shift.highp_int_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009242,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.left_shift.highp_ivec2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009243,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.left_shift.highp_ivec2_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009244,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.left_shift.highp_ivec3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009245,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.left_shift.highp_ivec3_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009246,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.left_shift.highp_ivec4_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009247,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.left_shift.highp_ivec4_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009248,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.left_shift.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009249,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.left_shift.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009250,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.left_shift.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009251,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.left_shift.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009252,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.left_shift.lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009253,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.left_shift.lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009254,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.left_shift.mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009255,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.left_shift.mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009256,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.left_shift.lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009257,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.left_shift.lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009258,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.left_shift.mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009259,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.left_shift.mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009260,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.left_shift.lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009261,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.left_shift.lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009262,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.left_shift.mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009263,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.left_shift.mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009264,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.left_shift.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009265,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.left_shift.highp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009266,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.left_shift.highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009267,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.left_shift.highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009268,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.left_shift.highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009269,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.left_shift.highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009270,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.left_shift.highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009271,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.left_shift.highp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009272,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.left_shift.lowp_ivec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009273,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.left_shift.lowp_ivec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009274,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.left_shift.mediump_ivec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009275,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.left_shift.mediump_ivec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009276,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.left_shift.lowp_ivec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009277,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.left_shift.lowp_ivec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009278,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.left_shift.mediump_ivec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009279,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.left_shift.mediump_ivec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009280,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.left_shift.lowp_ivec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009281,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.left_shift.lowp_ivec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009282,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.left_shift.mediump_ivec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009283,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.left_shift.mediump_ivec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009284,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.left_shift.highp_ivec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009285,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.left_shift.highp_ivec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009286,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.left_shift.highp_ivec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009287,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.left_shift.highp_ivec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009288,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.left_shift.highp_ivec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009289,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.left_shift.highp_ivec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009290,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.left_shift.lowp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009291,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.left_shift.lowp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009292,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.left_shift.mediump_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009293,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.left_shift.mediump_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009294,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.left_shift.lowp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009295,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.left_shift.lowp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009296,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.left_shift.mediump_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009297,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.left_shift.mediump_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009298,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.left_shift.lowp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009299,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.left_shift.lowp_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009300,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.left_shift.mediump_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009301,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.left_shift.mediump_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009302,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.left_shift.highp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009303,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.left_shift.highp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009304,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.left_shift.highp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009305,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.left_shift.highp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009306,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.left_shift.highp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009307,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.left_shift.highp_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009308,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.left_shift.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009309,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.left_shift.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009310,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.left_shift.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009311,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.left_shift.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009312,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.left_shift.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009313,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.left_shift.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009314,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.left_shift.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009315,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.left_shift.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009316,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.left_shift.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009317,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.left_shift.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009318,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.left_shift.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009319,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.left_shift.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009320,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.left_shift.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009321,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.left_shift.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009322,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.left_shift.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009323,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.left_shift.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009324,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.left_shift.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009325,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.left_shift.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009326,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.left_shift.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009327,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.left_shift.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009328,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.left_shift.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009329,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.left_shift.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009330,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.left_shift.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009331,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.left_shift.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009332,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.left_shift.lowp_uint_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009333,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.left_shift.lowp_uint_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009334,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.left_shift.mediump_uint_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009335,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.left_shift.mediump_uint_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009336,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.left_shift.lowp_uvec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009337,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.left_shift.lowp_uvec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009338,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.left_shift.mediump_uvec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009339,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.left_shift.mediump_uvec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009340,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.left_shift.lowp_uvec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009341,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.left_shift.lowp_uvec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009342,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.left_shift.mediump_uvec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009343,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.left_shift.mediump_uvec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009344,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.left_shift.lowp_uvec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009345,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.left_shift.lowp_uvec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009346,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.left_shift.mediump_uvec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009347,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.left_shift.mediump_uvec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009348,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.left_shift.highp_uint_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009349,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.left_shift.highp_uint_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009350,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.left_shift.highp_uvec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009351,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.left_shift.highp_uvec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009352,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.left_shift.highp_uvec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009353,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.left_shift.highp_uvec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009354,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.left_shift.highp_uvec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009355,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.left_shift.highp_uvec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009356,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.left_shift.lowp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009357,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.left_shift.lowp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009358,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.left_shift.mediump_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009359,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.left_shift.mediump_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009360,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.left_shift.lowp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009361,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.left_shift.lowp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009362,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.left_shift.mediump_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009363,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.left_shift.mediump_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009364,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.left_shift.lowp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009365,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.left_shift.lowp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009366,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.left_shift.mediump_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009367,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.left_shift.mediump_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009368,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.left_shift.highp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009369,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.left_shift.highp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009370,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.left_shift.highp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009371,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.left_shift.highp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009372,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.left_shift.highp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009373,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.left_shift.highp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009374,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.left_shift.lowp_uvec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009375,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.left_shift.lowp_uvec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009376,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.left_shift.mediump_uvec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009377,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.left_shift.mediump_uvec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009378,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.left_shift.lowp_uvec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009379,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.left_shift.lowp_uvec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009380,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.left_shift.mediump_uvec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009381,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.left_shift.mediump_uvec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009382,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.left_shift.lowp_uvec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009383,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.left_shift.lowp_uvec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009384,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.left_shift.mediump_uvec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009385,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.left_shift.mediump_uvec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009386,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.left_shift.highp_uvec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009387,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.left_shift.highp_uvec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009388,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.left_shift.highp_uvec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009389,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.left_shift.highp_uvec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009390,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.left_shift.highp_uvec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009391,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.left_shift.highp_uvec4_int_fragment");
