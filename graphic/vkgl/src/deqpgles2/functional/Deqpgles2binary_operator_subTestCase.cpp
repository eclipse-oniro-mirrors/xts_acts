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

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004534,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.sub.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004535,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.sub.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004536,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.sub.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004537,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.sub.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004538,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.sub.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004539,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.sub.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004540,
        "dEQP-GLES2.functional.shaders.operato",
        "r.binary_operator.sub.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004541,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.sub.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004542,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.sub.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004543,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.sub.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004544,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.sub.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004545,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.sub.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004546,
        "dEQP-GLES2.functional.shaders.operato",
        "r.binary_operator.sub.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004547,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.sub.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004548,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.sub.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004549,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.sub.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004550,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.sub.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004551,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.sub.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004552,
        "dEQP-GLES2.functional.shaders.operato",
        "r.binary_operator.sub.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004553,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.sub.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004554,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.sub.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004555,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.sub.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004556,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.sub.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004557,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.sub.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004558,
        "dEQP-GLES2.functional.shaders.operato",
        "r.binary_operator.sub.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004559,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.sub.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004560,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.sub.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004561,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.sub.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004562,
        "dEQP-GLES2.functional.shaders.operato",
        "r.binary_operator.sub.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004563,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.sub.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004564,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.sub.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004565,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.sub.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004566,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.sub.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004567,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.sub.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004568,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.sub.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004569,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.sub.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004570,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.sub.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004571,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.sub.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004572,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.sub.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004573,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.sub.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004574,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.sub.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004575,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.sub.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004576,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.sub.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004577,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.sub.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004578,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.sub.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004579,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.sub.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004580,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.sub.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004581,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.sub.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004582,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.sub.lowp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004583,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.sub.lowp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004584,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.sub.mediump_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004585,
        "dEQP-GLES2.functional.shaders.operator.bina",
        "ry_operator.sub.mediump_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004586,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.sub.highp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004587,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.sub.highp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004588,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.sub.lowp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004589,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.sub.lowp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004590,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.sub.mediump_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004591,
        "dEQP-GLES2.functional.shaders.operator.bina",
        "ry_operator.sub.mediump_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004592,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.sub.highp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004593,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.sub.highp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004594,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.sub.lowp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004595,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.sub.lowp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004596,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.sub.mediump_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004597,
        "dEQP-GLES2.functional.shaders.operator.bina",
        "ry_operator.sub.mediump_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004598,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.sub.highp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004599,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.sub.highp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004600,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.sub.lowp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004601,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.sub.lowp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004602,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.sub.mediump_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004603,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.sub.mediump_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004604,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.sub.highp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004605,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.sub.highp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004606,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.sub.lowp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004607,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.sub.lowp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004608,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.sub.mediump_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004609,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.sub.mediump_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004610,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.sub.highp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004611,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.sub.highp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004612,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.sub.lowp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004613,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.sub.lowp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004614,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.sub.mediump_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004615,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.sub.mediump_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004616,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.sub.highp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004617,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.sub.highp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004618,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.sub.lowp_float_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004619,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.sub.lowp_float_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004620,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.sub.mediump_float_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004621,
        "dEQP-GLES2.functional.shaders.operator.bina",
        "ry_operator.sub.mediump_float_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004622,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.sub.highp_float_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004623,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.sub.highp_float_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004624,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.sub.lowp_float_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004625,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.sub.lowp_float_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004626,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.sub.mediump_float_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004627,
        "dEQP-GLES2.functional.shaders.operator.bina",
        "ry_operator.sub.mediump_float_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004628,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.sub.highp_float_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004629,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.sub.highp_float_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004630,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.sub.lowp_float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004631,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.sub.lowp_float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004632,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.sub.mediump_float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004633,
        "dEQP-GLES2.functional.shaders.operator.bina",
        "ry_operator.sub.mediump_float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004634,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.sub.highp_float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004635,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.sub.highp_float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004636,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.sub.lowp_int_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004637,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.sub.lowp_int_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004638,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.sub.mediump_int_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004639,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.sub.mediump_int_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004640,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.sub.highp_int_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004641,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.sub.highp_int_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004642,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.sub.lowp_int_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004643,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.sub.lowp_int_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004644,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.sub.mediump_int_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004645,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.sub.mediump_int_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004646,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.sub.highp_int_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004647,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.sub.highp_int_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004648,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.sub.lowp_int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004649,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.sub.lowp_int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004650,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.sub.mediump_int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004651,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.sub.mediump_int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004652,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.sub.highp_int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004653,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.sub.highp_int_ivec4_fragment");
