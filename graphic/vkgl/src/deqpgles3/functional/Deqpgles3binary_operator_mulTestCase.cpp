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

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008384,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.mul.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008385,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mul.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008386,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mul.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008387,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mul.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008388,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.mul.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008389,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mul.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008390,
        "dEQP-GLES3.functional.shaders.operato",
        "r.binary_operator.mul.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008391,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.mul.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008392,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mul.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008393,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mul.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008394,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.mul.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008395,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mul.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008396,
        "dEQP-GLES3.functional.shaders.operato",
        "r.binary_operator.mul.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008397,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.mul.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008398,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mul.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008399,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mul.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008400,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.mul.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008401,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mul.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008402,
        "dEQP-GLES3.functional.shaders.operato",
        "r.binary_operator.mul.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008403,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.mul.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008404,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mul.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008405,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mul.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008406,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.mul.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008407,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mul.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008408,
        "dEQP-GLES3.functional.shaders.operato",
        "r.binary_operator.mul.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008409,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.mul.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008410,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.mul.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008411,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mul.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008412,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.mul.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008413,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mul.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008414,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mul.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008415,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mul.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008416,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.mul.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008417,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mul.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008418,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mul.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008419,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mul.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008420,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.mul.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008421,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mul.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008422,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mul.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008423,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mul.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008424,
        "dEQP-GLES3.functional.shaders.operato",
        "r.binary_operator.mul.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008425,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.mul.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008426,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.mul.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008427,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mul.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008428,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.mul.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008429,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mul.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008430,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.mul.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008431,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mul.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008432,
        "dEQP-GLES3.functional.shaders.operato",
        "r.binary_operator.mul.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008433,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.mul.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008434,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mul.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008435,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mul.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008436,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.mul.lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008437,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mul.lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008438,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mul.mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008439,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mul.mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008440,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.mul.lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008441,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mul.lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008442,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mul.mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008443,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mul.mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008444,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.mul.lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008445,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mul.lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008446,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mul.mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008447,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mul.mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008448,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.mul.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008449,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mul.highp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008450,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.mul.highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008451,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mul.highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008452,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.mul.highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008453,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mul.highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008454,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.mul.highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008455,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mul.highp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008456,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mul.lowp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008457,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mul.lowp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008458,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.mul.mediump_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008459,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.mul.mediump_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008460,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mul.highp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008461,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.mul.highp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008462,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mul.lowp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008463,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mul.lowp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008464,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.mul.mediump_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008465,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.mul.mediump_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008466,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mul.highp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008467,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.mul.highp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008468,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mul.lowp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008469,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mul.lowp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008470,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.mul.mediump_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008471,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.mul.mediump_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008472,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mul.highp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008473,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.mul.highp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008474,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mul.lowp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008475,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mul.lowp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008476,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mul.mediump_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008477,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.mul.mediump_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008478,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mul.lowp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008479,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mul.lowp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008480,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mul.mediump_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008481,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.mul.mediump_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008482,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mul.lowp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008483,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mul.lowp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008484,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mul.mediump_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008485,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.mul.mediump_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008486,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mul.highp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008487,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mul.highp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008488,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mul.highp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008489,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mul.highp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008490,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mul.highp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008491,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mul.highp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008492,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mul.lowp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008493,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mul.lowp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008494,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.mul.mediump_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008495,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.mul.mediump_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008496,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mul.lowp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008497,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mul.lowp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008498,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.mul.mediump_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008499,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.mul.mediump_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008500,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mul.lowp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008501,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mul.lowp_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008502,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.mul.mediump_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008503,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.mul.mediump_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008504,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mul.highp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008505,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.mul.highp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008506,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mul.highp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008507,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.mul.highp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008508,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mul.highp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008509,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.mul.highp_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008510,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mul.lowp_float_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008511,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mul.lowp_float_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008512,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.mul.mediump_float_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008513,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.mul.mediump_float_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008514,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mul.highp_float_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008515,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.mul.highp_float_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008516,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mul.lowp_float_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008517,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mul.lowp_float_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008518,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.mul.mediump_float_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008519,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.mul.mediump_float_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008520,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mul.highp_float_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008521,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.mul.highp_float_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008522,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mul.lowp_float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008523,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mul.lowp_float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008524,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.mul.mediump_float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008525,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.mul.mediump_float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008526,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mul.highp_float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008527,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.mul.highp_float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008528,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mul.lowp_int_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008529,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mul.lowp_int_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008530,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mul.mediump_int_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008531,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.mul.mediump_int_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008532,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mul.lowp_int_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008533,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mul.lowp_int_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008534,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mul.mediump_int_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008535,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.mul.mediump_int_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008536,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mul.lowp_int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008537,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mul.lowp_int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008538,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mul.mediump_int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008539,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.mul.mediump_int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008540,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mul.highp_int_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008541,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mul.highp_int_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008542,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mul.highp_int_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008543,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mul.highp_int_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008544,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mul.highp_int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008545,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mul.highp_int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008546,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mul.lowp_uint_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008547,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mul.lowp_uint_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008548,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.mul.mediump_uint_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008549,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.mul.mediump_uint_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008550,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mul.lowp_uint_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008551,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mul.lowp_uint_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008552,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.mul.mediump_uint_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008553,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.mul.mediump_uint_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008554,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mul.lowp_uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008555,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mul.lowp_uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008556,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.mul.mediump_uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008557,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.mul.mediump_uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008558,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mul.highp_uint_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008559,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.mul.highp_uint_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008560,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mul.highp_uint_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008561,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.mul.highp_uint_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008562,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mul.highp_uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008563,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.mul.highp_uint_uvec4_fragment");
