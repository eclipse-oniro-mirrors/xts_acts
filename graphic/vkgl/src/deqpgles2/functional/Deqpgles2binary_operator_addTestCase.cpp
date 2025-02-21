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

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004414,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.add.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004415,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.add.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004416,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.add.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004417,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.add.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004418,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.add.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004419,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.add.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004420,
        "dEQP-GLES2.functional.shaders.operato",
        "r.binary_operator.add.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004421,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.add.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004422,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.add.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004423,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.add.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004424,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.add.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004425,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.add.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004426,
        "dEQP-GLES2.functional.shaders.operato",
        "r.binary_operator.add.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004427,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.add.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004428,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.add.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004429,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.add.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004430,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.add.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004431,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.add.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004432,
        "dEQP-GLES2.functional.shaders.operato",
        "r.binary_operator.add.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004433,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.add.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004434,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.add.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004435,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.add.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004436,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.add.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004437,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.add.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004438,
        "dEQP-GLES2.functional.shaders.operato",
        "r.binary_operator.add.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004439,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.add.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004440,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.add.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004441,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.add.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004442,
        "dEQP-GLES2.functional.shaders.operato",
        "r.binary_operator.add.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004443,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.add.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004444,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.add.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004445,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.add.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004446,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.add.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004447,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.add.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004448,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.add.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004449,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.add.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004450,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.add.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004451,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.add.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004452,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.add.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004453,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.add.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004454,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.add.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004455,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.add.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004456,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.add.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004457,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.add.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004458,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.add.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004459,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.add.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004460,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.add.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004461,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.add.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004462,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.add.lowp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004463,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.add.lowp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004464,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.add.mediump_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004465,
        "dEQP-GLES2.functional.shaders.operator.bina",
        "ry_operator.add.mediump_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004466,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.add.highp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004467,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.add.highp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004468,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.add.lowp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004469,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.add.lowp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004470,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.add.mediump_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004471,
        "dEQP-GLES2.functional.shaders.operator.bina",
        "ry_operator.add.mediump_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004472,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.add.highp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004473,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.add.highp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004474,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.add.lowp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004475,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.add.lowp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004476,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.add.mediump_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004477,
        "dEQP-GLES2.functional.shaders.operator.bina",
        "ry_operator.add.mediump_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004478,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.add.highp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004479,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.add.highp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004480,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.add.lowp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004481,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.add.lowp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004482,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.add.mediump_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004483,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.add.mediump_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004484,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.add.highp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004485,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.add.highp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004486,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.add.lowp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004487,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.add.lowp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004488,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.add.mediump_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004489,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.add.mediump_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004490,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.add.highp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004491,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.add.highp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004492,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.add.lowp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004493,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.add.lowp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004494,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.add.mediump_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004495,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.add.mediump_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004496,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.add.highp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004497,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.add.highp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004498,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.add.lowp_float_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004499,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.add.lowp_float_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004500,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.add.mediump_float_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004501,
        "dEQP-GLES2.functional.shaders.operator.bina",
        "ry_operator.add.mediump_float_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004502,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.add.highp_float_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004503,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.add.highp_float_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004504,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.add.lowp_float_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004505,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.add.lowp_float_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004506,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.add.mediump_float_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004507,
        "dEQP-GLES2.functional.shaders.operator.bina",
        "ry_operator.add.mediump_float_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004508,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.add.highp_float_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004509,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.add.highp_float_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004510,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.add.lowp_float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004511,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.add.lowp_float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004512,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.add.mediump_float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004513,
        "dEQP-GLES2.functional.shaders.operator.bina",
        "ry_operator.add.mediump_float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004514,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.add.highp_float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004515,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.add.highp_float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004516,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.add.lowp_int_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004517,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.add.lowp_int_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004518,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.add.mediump_int_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004519,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.add.mediump_int_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004520,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.add.highp_int_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004521,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.add.highp_int_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004522,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.add.lowp_int_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004523,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.add.lowp_int_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004524,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.add.mediump_int_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004525,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.add.mediump_int_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004526,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.add.highp_int_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004527,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.add.highp_int_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004528,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.add.lowp_int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004529,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.add.lowp_int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004530,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.add.mediump_int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004531,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.add.mediump_int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004532,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.add.highp_int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004533,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.add.highp_int_ivec4_fragment");
