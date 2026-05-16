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
#include "../ActsDeqpgles20005TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004654,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.mul.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004655,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.mul.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004656,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.mul.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004657,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.mul.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004658,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.mul.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004659,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.mul.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004660,
        "dEQP-GLES2.functional.shaders.operato",
        "r.binary_operator.mul.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004661,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.mul.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004662,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.mul.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004663,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.mul.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004664,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.mul.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004665,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.mul.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004666,
        "dEQP-GLES2.functional.shaders.operato",
        "r.binary_operator.mul.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004667,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.mul.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004668,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.mul.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004669,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.mul.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004670,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.mul.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004671,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.mul.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004672,
        "dEQP-GLES2.functional.shaders.operato",
        "r.binary_operator.mul.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004673,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.mul.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004674,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.mul.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004675,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.mul.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004676,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.mul.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004677,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.mul.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004678,
        "dEQP-GLES2.functional.shaders.operato",
        "r.binary_operator.mul.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004679,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.mul.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004680,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.mul.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004681,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.mul.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004682,
        "dEQP-GLES2.functional.shaders.operato",
        "r.binary_operator.mul.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004683,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.mul.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004684,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.mul.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004685,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.mul.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004686,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.mul.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004687,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.mul.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004688,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.mul.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004689,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.mul.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004690,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.mul.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004691,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.mul.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004692,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.mul.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004693,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.mul.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004694,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.mul.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004695,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.mul.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004696,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.mul.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004697,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.mul.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004698,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.mul.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004699,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.mul.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004700,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.mul.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004701,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.mul.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004702,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.mul.lowp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004703,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.mul.lowp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004704,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.mul.mediump_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004705,
        "dEQP-GLES2.functional.shaders.operator.bina",
        "ry_operator.mul.mediump_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004706,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.mul.highp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004707,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.mul.highp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004708,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.mul.lowp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004709,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.mul.lowp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004710,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.mul.mediump_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004711,
        "dEQP-GLES2.functional.shaders.operator.bina",
        "ry_operator.mul.mediump_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004712,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.mul.highp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004713,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.mul.highp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004714,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.mul.lowp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004715,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.mul.lowp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004716,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.mul.mediump_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004717,
        "dEQP-GLES2.functional.shaders.operator.bina",
        "ry_operator.mul.mediump_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004718,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.mul.highp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004719,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.mul.highp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004720,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.mul.lowp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004721,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.mul.lowp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004722,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.mul.mediump_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004723,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.mul.mediump_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004724,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.mul.highp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004725,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.mul.highp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004726,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.mul.lowp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004727,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.mul.lowp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004728,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.mul.mediump_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004729,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.mul.mediump_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004730,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.mul.highp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004731,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.mul.highp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004732,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.mul.lowp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004733,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.mul.lowp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004734,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.mul.mediump_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004735,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.mul.mediump_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004736,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.mul.highp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004737,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.mul.highp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004738,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.mul.lowp_float_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004739,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.mul.lowp_float_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004740,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.mul.mediump_float_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004741,
        "dEQP-GLES2.functional.shaders.operator.bina",
        "ry_operator.mul.mediump_float_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004742,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.mul.highp_float_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004743,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.mul.highp_float_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004744,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.mul.lowp_float_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004745,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.mul.lowp_float_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004746,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.mul.mediump_float_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004747,
        "dEQP-GLES2.functional.shaders.operator.bina",
        "ry_operator.mul.mediump_float_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004748,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.mul.highp_float_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004749,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.mul.highp_float_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004750,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.mul.lowp_float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004751,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.mul.lowp_float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004752,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.mul.mediump_float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004753,
        "dEQP-GLES2.functional.shaders.operator.bina",
        "ry_operator.mul.mediump_float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004754,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.mul.highp_float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004755,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.mul.highp_float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004756,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.mul.lowp_int_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004757,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.mul.lowp_int_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004758,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.mul.mediump_int_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004759,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.mul.mediump_int_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004760,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.mul.highp_int_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004761,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.mul.highp_int_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004762,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.mul.lowp_int_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004763,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.mul.lowp_int_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004764,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.mul.mediump_int_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004765,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.mul.mediump_int_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004766,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.mul.highp_int_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004767,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.mul.highp_int_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004768,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.mul.lowp_int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004769,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.mul.lowp_int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004770,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.mul.mediump_int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004771,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.mul.mediump_int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004772,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.mul.highp_int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004773,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.mul.highp_int_ivec4_fragment");
