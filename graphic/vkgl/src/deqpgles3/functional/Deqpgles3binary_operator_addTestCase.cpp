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
#include "../ActsDeqpgles30009TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008024,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.add.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008025,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.add.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008026,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.add.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008027,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.add.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008028,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.add.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008029,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.add.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008030,
        "dEQP-GLES3.functional.shaders.operato",
        "r.binary_operator.add.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008031,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.add.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008032,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.add.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008033,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.add.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008034,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.add.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008035,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.add.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008036,
        "dEQP-GLES3.functional.shaders.operato",
        "r.binary_operator.add.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008037,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.add.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008038,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.add.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008039,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.add.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008040,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.add.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008041,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.add.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008042,
        "dEQP-GLES3.functional.shaders.operato",
        "r.binary_operator.add.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008043,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.add.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008044,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.add.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008045,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.add.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008046,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.add.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008047,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.add.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008048,
        "dEQP-GLES3.functional.shaders.operato",
        "r.binary_operator.add.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008049,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.add.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008050,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.add.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008051,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.add.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008052,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.add.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008053,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.add.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008054,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.add.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008055,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.add.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008056,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.add.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008057,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.add.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008058,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.add.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008059,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.add.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008060,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.add.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008061,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.add.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008062,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.add.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008063,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.add.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008064,
        "dEQP-GLES3.functional.shaders.operato",
        "r.binary_operator.add.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008065,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.add.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008066,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.add.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008067,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.add.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008068,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.add.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008069,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.add.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008070,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.add.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008071,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.add.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008072,
        "dEQP-GLES3.functional.shaders.operato",
        "r.binary_operator.add.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008073,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.add.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008074,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.add.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008075,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.add.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008076,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.add.lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008077,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.add.lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008078,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.add.mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008079,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.add.mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008080,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.add.lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008081,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.add.lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008082,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.add.mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008083,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.add.mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008084,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.add.lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008085,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.add.lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008086,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.add.mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008087,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.add.mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008088,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.add.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008089,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.add.highp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008090,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.add.highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008091,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.add.highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008092,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.add.highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008093,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.add.highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008094,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.add.highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008095,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.add.highp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008096,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.add.lowp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008097,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.add.lowp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008098,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.add.mediump_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008099,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.add.mediump_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008100,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.add.highp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008101,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.add.highp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008102,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.add.lowp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008103,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.add.lowp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008104,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.add.mediump_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008105,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.add.mediump_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008106,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.add.highp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008107,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.add.highp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008108,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.add.lowp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008109,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.add.lowp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008110,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.add.mediump_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008111,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.add.mediump_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008112,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.add.highp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008113,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.add.highp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008114,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.add.lowp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008115,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.add.lowp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008116,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.add.mediump_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008117,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.add.mediump_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008118,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.add.lowp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008119,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.add.lowp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008120,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.add.mediump_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008121,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.add.mediump_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008122,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.add.lowp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008123,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.add.lowp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008124,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.add.mediump_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008125,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.add.mediump_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008126,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.add.highp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008127,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.add.highp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008128,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.add.highp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008129,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.add.highp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008130,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.add.highp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008131,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.add.highp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008132,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.add.lowp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008133,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.add.lowp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008134,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.add.mediump_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008135,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.add.mediump_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008136,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.add.lowp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008137,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.add.lowp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008138,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.add.mediump_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008139,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.add.mediump_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008140,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.add.lowp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008141,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.add.lowp_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008142,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.add.mediump_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008143,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.add.mediump_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008144,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.add.highp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008145,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.add.highp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008146,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.add.highp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008147,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.add.highp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008148,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.add.highp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008149,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.add.highp_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008150,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.add.lowp_float_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008151,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.add.lowp_float_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008152,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.add.mediump_float_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008153,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.add.mediump_float_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008154,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.add.highp_float_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008155,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.add.highp_float_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008156,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.add.lowp_float_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008157,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.add.lowp_float_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008158,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.add.mediump_float_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008159,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.add.mediump_float_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008160,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.add.highp_float_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008161,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.add.highp_float_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008162,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.add.lowp_float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008163,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.add.lowp_float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008164,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.add.mediump_float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008165,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.add.mediump_float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008166,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.add.highp_float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008167,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.add.highp_float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008168,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.add.lowp_int_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008169,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.add.lowp_int_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008170,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.add.mediump_int_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008171,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.add.mediump_int_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008172,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.add.lowp_int_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008173,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.add.lowp_int_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008174,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.add.mediump_int_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008175,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.add.mediump_int_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008176,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.add.lowp_int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008177,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.add.lowp_int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008178,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.add.mediump_int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008179,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.add.mediump_int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008180,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.add.highp_int_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008181,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.add.highp_int_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008182,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.add.highp_int_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008183,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.add.highp_int_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008184,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.add.highp_int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008185,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.add.highp_int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008186,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.add.lowp_uint_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008187,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.add.lowp_uint_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008188,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.add.mediump_uint_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008189,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.add.mediump_uint_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008190,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.add.lowp_uint_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008191,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.add.lowp_uint_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008192,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.add.mediump_uint_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008193,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.add.mediump_uint_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008194,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.add.lowp_uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008195,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.add.lowp_uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008196,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.add.mediump_uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008197,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.add.mediump_uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008198,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.add.highp_uint_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008199,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.add.highp_uint_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008200,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.add.highp_uint_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008201,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.add.highp_uint_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008202,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.add.highp_uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008203,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.add.highp_uint_uvec4_fragment");
