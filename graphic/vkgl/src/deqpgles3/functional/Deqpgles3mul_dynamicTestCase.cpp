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
#include "../ActsDeqpgles30016TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015060,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.dynamic.lowp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015061,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.lowp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015062,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.dynamic.lowp_mat2_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015063,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.lowp_mat2_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015064,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.dynamic.lowp_vec2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015065,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.lowp_vec2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015066,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.dynamic.lowp_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015067,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.lowp_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015068,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.lowp_mat2_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015069,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.lowp_mat2_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015070,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.lowp_mat2_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015071,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.lowp_mat2_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015072,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.mediump_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015073,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.mediump_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015074,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.mediump_mat2_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015075,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.mediump_mat2_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015076,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.mediump_vec2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015077,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.mediump_vec2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015078,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.mediump_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015079,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.mediump_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015080,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.mediump_mat2_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015081,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.mediump_mat2_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015082,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.mediump_mat2_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015083,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.mediump_mat2_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015084,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.highp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015085,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.highp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015086,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.dynamic.highp_mat2_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015087,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.highp_mat2_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015088,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.dynamic.highp_vec2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015089,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.highp_vec2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015090,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.dynamic.highp_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015091,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.highp_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015092,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.highp_mat2_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015093,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.highp_mat2_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015094,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.highp_mat2_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015095,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.highp_mat2_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015096,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.lowp_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015097,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.lowp_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015098,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.lowp_mat2x3_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015099,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.lowp_mat2x3_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015100,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.lowp_vec3_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015101,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.lowp_vec3_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015102,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.lowp_mat2x3_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015103,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.lowp_mat2x3_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015104,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.lowp_mat2x3_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015105,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.lowp_mat2x3_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015106,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.lowp_mat2x3_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015107,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.lowp_mat2x3_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015108,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.mediump_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015109,
        "dEQP-GLES3.functional.shaders.matrix.mu",
        "l.dynamic.mediump_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015110,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.mediump_mat2x3_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015111,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.mediump_mat2x3_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015112,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.mediump_vec3_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015113,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.mediump_vec3_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015114,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.mediump_mat2x3_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015115,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.mediump_mat2x3_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015116,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.mediump_mat2x3_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015117,
        "dEQP-GLES3.functional.shaders.matrix.mu",
        "l.dynamic.mediump_mat2x3_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015118,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.mediump_mat2x3_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015119,
        "dEQP-GLES3.functional.shaders.matrix.mu",
        "l.dynamic.mediump_mat2x3_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015120,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.highp_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015121,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.highp_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015122,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.highp_mat2x3_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015123,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.highp_mat2x3_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015124,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.highp_vec3_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015125,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.highp_vec3_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015126,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.highp_mat2x3_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015127,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.highp_mat2x3_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015128,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.highp_mat2x3_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015129,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.highp_mat2x3_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015130,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.highp_mat2x3_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015131,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.highp_mat2x3_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015132,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.lowp_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015133,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.lowp_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015134,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.lowp_mat2x4_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015135,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.lowp_mat2x4_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015136,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.lowp_vec4_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015137,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.lowp_vec4_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015138,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.lowp_mat2x4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015139,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.lowp_mat2x4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015140,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.lowp_mat2x4_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015141,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.lowp_mat2x4_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015142,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.lowp_mat2x4_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015143,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.lowp_mat2x4_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015144,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.mediump_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015145,
        "dEQP-GLES3.functional.shaders.matrix.mu",
        "l.dynamic.mediump_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015146,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.mediump_mat2x4_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015147,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.mediump_mat2x4_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015148,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.mediump_vec4_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015149,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.mediump_vec4_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015150,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.mediump_mat2x4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015151,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.mediump_mat2x4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015152,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.mediump_mat2x4_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015153,
        "dEQP-GLES3.functional.shaders.matrix.mu",
        "l.dynamic.mediump_mat2x4_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015154,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.mediump_mat2x4_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015155,
        "dEQP-GLES3.functional.shaders.matrix.mu",
        "l.dynamic.mediump_mat2x4_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015156,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.highp_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015157,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.highp_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015158,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.highp_mat2x4_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015159,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.highp_mat2x4_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015160,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.highp_vec4_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015161,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.highp_vec4_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015162,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.highp_mat2x4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015163,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.highp_mat2x4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015164,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.highp_mat2x4_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015165,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.highp_mat2x4_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015166,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.highp_mat2x4_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015167,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.highp_mat2x4_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015168,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.lowp_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015169,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.lowp_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015170,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.lowp_mat3x2_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015171,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.lowp_mat3x2_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015172,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.lowp_vec2_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015173,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.lowp_vec2_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015174,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.lowp_mat3x2_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015175,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.lowp_mat3x2_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015176,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.lowp_mat3x2_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015177,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.lowp_mat3x2_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015178,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.lowp_mat3x2_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015179,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.lowp_mat3x2_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015180,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.mediump_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015181,
        "dEQP-GLES3.functional.shaders.matrix.mu",
        "l.dynamic.mediump_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015182,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.mediump_mat3x2_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015183,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.mediump_mat3x2_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015184,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.mediump_vec2_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015185,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.mediump_vec2_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015186,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.mediump_mat3x2_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015187,
        "dEQP-GLES3.functional.shaders.matrix.mu",
        "l.dynamic.mediump_mat3x2_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015188,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.mediump_mat3x2_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015189,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.mediump_mat3x2_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015190,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.mediump_mat3x2_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015191,
        "dEQP-GLES3.functional.shaders.matrix.mu",
        "l.dynamic.mediump_mat3x2_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015192,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.highp_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015193,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.highp_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015194,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.highp_mat3x2_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015195,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.highp_mat3x2_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015196,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.highp_vec2_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015197,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.highp_vec2_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015198,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.highp_mat3x2_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015199,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.highp_mat3x2_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015200,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.highp_mat3x2_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015201,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.highp_mat3x2_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015202,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.highp_mat3x2_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015203,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.highp_mat3x2_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015204,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.dynamic.lowp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015205,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.lowp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015206,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.dynamic.lowp_mat3_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015207,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.lowp_mat3_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015208,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.dynamic.lowp_vec3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015209,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.lowp_vec3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015210,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.lowp_mat3_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015211,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.lowp_mat3_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015212,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.dynamic.lowp_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015213,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.lowp_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015214,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.lowp_mat3_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015215,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.lowp_mat3_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015216,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.mediump_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015217,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.mediump_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015218,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.mediump_mat3_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015219,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.mediump_mat3_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015220,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.mediump_vec3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015221,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.mediump_vec3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015222,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.mediump_mat3_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015223,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.mediump_mat3_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015224,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.mediump_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015225,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.mediump_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015226,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.mediump_mat3_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015227,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.mediump_mat3_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015228,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.highp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015229,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.highp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015230,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.dynamic.highp_mat3_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015231,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.highp_mat3_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015232,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.dynamic.highp_vec3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015233,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.highp_vec3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015234,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.highp_mat3_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015235,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.highp_mat3_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015236,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.dynamic.highp_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015237,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.highp_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015238,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.highp_mat3_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015239,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.highp_mat3_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015240,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.lowp_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015241,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.lowp_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015242,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.lowp_mat3x4_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015243,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.lowp_mat3x4_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015244,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.lowp_vec4_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015245,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.lowp_vec4_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015246,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.lowp_mat3x4_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015247,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.lowp_mat3x4_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015248,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.lowp_mat3x4_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015249,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.lowp_mat3x4_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015250,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.lowp_mat3x4_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015251,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.lowp_mat3x4_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015252,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.mediump_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015253,
        "dEQP-GLES3.functional.shaders.matrix.mu",
        "l.dynamic.mediump_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015254,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.mediump_mat3x4_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015255,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.mediump_mat3x4_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015256,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.mediump_vec4_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015257,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.mediump_vec4_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015258,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.mediump_mat3x4_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015259,
        "dEQP-GLES3.functional.shaders.matrix.mu",
        "l.dynamic.mediump_mat3x4_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015260,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.mediump_mat3x4_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015261,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.mediump_mat3x4_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015262,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.mediump_mat3x4_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015263,
        "dEQP-GLES3.functional.shaders.matrix.mu",
        "l.dynamic.mediump_mat3x4_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015264,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.highp_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015265,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.highp_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015266,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.highp_mat3x4_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015267,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.highp_mat3x4_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015268,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.highp_vec4_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015269,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.highp_vec4_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015270,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.highp_mat3x4_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015271,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.highp_mat3x4_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015272,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.highp_mat3x4_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015273,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.highp_mat3x4_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015274,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.highp_mat3x4_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015275,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.highp_mat3x4_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015276,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.lowp_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015277,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.lowp_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015278,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.lowp_mat4x2_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015279,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.lowp_mat4x2_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015280,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.lowp_vec2_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015281,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.lowp_vec2_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015282,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.lowp_mat4x2_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015283,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.lowp_mat4x2_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015284,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.lowp_mat4x2_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015285,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.lowp_mat4x2_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015286,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.lowp_mat4x2_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015287,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.lowp_mat4x2_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015288,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.mediump_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015289,
        "dEQP-GLES3.functional.shaders.matrix.mu",
        "l.dynamic.mediump_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015290,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.mediump_mat4x2_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015291,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.mediump_mat4x2_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015292,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.mediump_vec2_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015293,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.mediump_vec2_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015294,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.mediump_mat4x2_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015295,
        "dEQP-GLES3.functional.shaders.matrix.mu",
        "l.dynamic.mediump_mat4x2_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015296,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.mediump_mat4x2_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015297,
        "dEQP-GLES3.functional.shaders.matrix.mu",
        "l.dynamic.mediump_mat4x2_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015298,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.mediump_mat4x2_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015299,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.mediump_mat4x2_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015300,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.highp_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015301,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.highp_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015302,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.highp_mat4x2_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015303,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.highp_mat4x2_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015304,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.highp_vec2_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015305,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.highp_vec2_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015306,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.highp_mat4x2_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015307,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.highp_mat4x2_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015308,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.highp_mat4x2_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015309,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.highp_mat4x2_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015310,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.highp_mat4x2_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015311,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.highp_mat4x2_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015312,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.lowp_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015313,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.lowp_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015314,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.lowp_mat4x3_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015315,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.lowp_mat4x3_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015316,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.lowp_vec3_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015317,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.lowp_vec3_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015318,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.lowp_mat4x3_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015319,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.lowp_mat4x3_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015320,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.lowp_mat4x3_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015321,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.lowp_mat4x3_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015322,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.lowp_mat4x3_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015323,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.lowp_mat4x3_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015324,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.mediump_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015325,
        "dEQP-GLES3.functional.shaders.matrix.mu",
        "l.dynamic.mediump_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015326,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.mediump_mat4x3_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015327,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.mediump_mat4x3_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015328,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.mediump_vec3_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015329,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.mediump_vec3_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015330,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.mediump_mat4x3_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015331,
        "dEQP-GLES3.functional.shaders.matrix.mu",
        "l.dynamic.mediump_mat4x3_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015332,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.mediump_mat4x3_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015333,
        "dEQP-GLES3.functional.shaders.matrix.mu",
        "l.dynamic.mediump_mat4x3_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015334,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.mediump_mat4x3_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015335,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.mediump_mat4x3_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015336,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.highp_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015337,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.highp_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015338,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.highp_mat4x3_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015339,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.highp_mat4x3_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015340,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.highp_vec3_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015341,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.highp_vec3_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015342,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.highp_mat4x3_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015343,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.highp_mat4x3_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015344,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.highp_mat4x3_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015345,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.highp_mat4x3_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015346,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.highp_mat4x3_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015347,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.highp_mat4x3_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015348,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.dynamic.lowp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015349,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.lowp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015350,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.dynamic.lowp_mat4_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015351,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.lowp_mat4_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015352,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.dynamic.lowp_vec4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015353,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.lowp_vec4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015354,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.lowp_mat4_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015355,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.lowp_mat4_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015356,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.lowp_mat4_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015357,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.lowp_mat4_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015358,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.dynamic.lowp_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015359,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.lowp_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015360,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.mediump_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015361,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.mediump_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015362,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.mediump_mat4_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015363,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.mediump_mat4_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015364,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.mediump_vec4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015365,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.mediump_vec4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015366,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.mediump_mat4_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015367,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.mediump_mat4_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015368,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.mediump_mat4_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015369,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.dynamic.mediump_mat4_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015370,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.mediump_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015371,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.mediump_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015372,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.highp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015373,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.highp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015374,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.dynamic.highp_mat4_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015375,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.highp_mat4_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015376,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.dynamic.highp_vec4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015377,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.highp_vec4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015378,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.highp_mat4_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015379,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.highp_mat4_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015380,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.highp_mat4_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015381,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.dynamic.highp_mat4_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015382,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.dynamic.highp_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015383,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.dynamic.highp_mat4_mat4_fragment");
