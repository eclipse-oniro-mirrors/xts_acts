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

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008564,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.div.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008565,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.div.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008566,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.div.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008567,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.div.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008568,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.div.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008569,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.div.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008570,
        "dEQP-GLES3.functional.shaders.operato",
        "r.binary_operator.div.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008571,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.div.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008572,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.div.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008573,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.div.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008574,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.div.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008575,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.div.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008576,
        "dEQP-GLES3.functional.shaders.operato",
        "r.binary_operator.div.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008577,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.div.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008578,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.div.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008579,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.div.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008580,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.div.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008581,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.div.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008582,
        "dEQP-GLES3.functional.shaders.operato",
        "r.binary_operator.div.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008583,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.div.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008584,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.div.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008585,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.div.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008586,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.div.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008587,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.div.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008588,
        "dEQP-GLES3.functional.shaders.operato",
        "r.binary_operator.div.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008589,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.div.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008590,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.div.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008591,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.div.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008592,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.div.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008593,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.div.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008594,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.div.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008595,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.div.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008596,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.div.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008597,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.div.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008598,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.div.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008599,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.div.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008600,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.div.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008601,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.div.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008602,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.div.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008603,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.div.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008604,
        "dEQP-GLES3.functional.shaders.operato",
        "r.binary_operator.div.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008605,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.div.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008606,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.div.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008607,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.div.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008608,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.div.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008609,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.div.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008610,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.div.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008611,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.div.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008612,
        "dEQP-GLES3.functional.shaders.operato",
        "r.binary_operator.div.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008613,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.div.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008614,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.div.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008615,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.div.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008616,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.div.lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008617,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.div.lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008618,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.div.mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008619,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.div.mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008620,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.div.lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008621,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.div.lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008622,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.div.mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008623,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.div.mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008624,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.div.lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008625,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.div.lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008626,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.div.mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008627,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.div.mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008628,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.div.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008629,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.div.highp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008630,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.div.highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008631,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.div.highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008632,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.div.highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008633,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.div.highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008634,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.div.highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008635,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.div.highp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008636,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.div.lowp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008637,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.div.lowp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008638,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.div.mediump_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008639,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.div.mediump_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008640,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.div.highp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008641,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.div.highp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008642,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.div.lowp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008643,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.div.lowp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008644,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.div.mediump_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008645,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.div.mediump_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008646,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.div.highp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008647,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.div.highp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008648,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.div.lowp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008649,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.div.lowp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008650,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.div.mediump_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008651,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.div.mediump_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008652,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.div.highp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008653,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.div.highp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008654,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.div.lowp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008655,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.div.lowp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008656,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.div.mediump_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008657,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.div.mediump_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008658,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.div.lowp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008659,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.div.lowp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008660,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.div.mediump_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008661,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.div.mediump_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008662,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.div.lowp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008663,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.div.lowp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008664,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.div.mediump_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008665,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.div.mediump_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008666,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.div.highp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008667,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.div.highp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008668,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.div.highp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008669,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.div.highp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008670,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.div.highp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008671,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.div.highp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008672,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.div.lowp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008673,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.div.lowp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008674,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.div.mediump_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008675,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.div.mediump_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008676,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.div.lowp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008677,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.div.lowp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008678,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.div.mediump_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008679,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.div.mediump_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008680,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.div.lowp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008681,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.div.lowp_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008682,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.div.mediump_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008683,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.div.mediump_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008684,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.div.highp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008685,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.div.highp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008686,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.div.highp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008687,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.div.highp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008688,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.div.highp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008689,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.div.highp_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008690,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.div.lowp_float_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008691,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.div.lowp_float_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008692,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.div.mediump_float_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008693,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.div.mediump_float_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008694,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.div.highp_float_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008695,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.div.highp_float_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008696,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.div.lowp_float_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008697,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.div.lowp_float_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008698,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.div.mediump_float_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008699,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.div.mediump_float_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008700,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.div.highp_float_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008701,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.div.highp_float_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008702,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.div.lowp_float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008703,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.div.lowp_float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008704,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.div.mediump_float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008705,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.div.mediump_float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008706,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.div.highp_float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008707,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.div.highp_float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008708,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.div.lowp_int_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008709,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.div.lowp_int_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008710,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.div.mediump_int_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008711,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.div.mediump_int_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008712,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.div.lowp_int_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008713,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.div.lowp_int_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008714,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.div.mediump_int_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008715,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.div.mediump_int_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008716,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.div.lowp_int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008717,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.div.lowp_int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008718,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.div.mediump_int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008719,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.div.mediump_int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008720,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.div.highp_int_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008721,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.div.highp_int_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008722,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.div.highp_int_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008723,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.div.highp_int_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008724,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.div.highp_int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008725,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.div.highp_int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008726,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.div.lowp_uint_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008727,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.div.lowp_uint_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008728,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.div.mediump_uint_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008729,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.div.mediump_uint_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008730,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.div.lowp_uint_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008731,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.div.lowp_uint_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008732,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.div.mediump_uint_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008733,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.div.mediump_uint_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008734,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.div.lowp_uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008735,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.div.lowp_uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008736,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.div.mediump_uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008737,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.div.mediump_uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008738,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.div.highp_uint_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008739,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.div.highp_uint_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008740,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.div.highp_uint_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008741,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.div.highp_uint_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008742,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.div.highp_uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008743,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.div.highp_uint_uvec4_fragment");
