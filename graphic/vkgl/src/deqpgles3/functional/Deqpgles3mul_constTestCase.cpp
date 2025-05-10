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
#include "../ActsDeqpgles30015TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014412,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.mul.const.lowp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014413,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.lowp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014414,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.mul.const.lowp_mat2_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014415,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.lowp_mat2_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014416,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.mul.const.lowp_vec2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014417,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.lowp_vec2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014418,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.mul.const.lowp_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014419,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.lowp_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014420,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.lowp_mat2_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014421,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.lowp_mat2_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014422,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.lowp_mat2_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014423,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.lowp_mat2_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014424,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.mediump_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014425,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.mediump_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014426,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.mediump_mat2_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014427,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.mediump_mat2_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014428,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.mediump_vec2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014429,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.mediump_vec2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014430,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.mediump_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014431,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.mediump_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014432,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.mediump_mat2_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014433,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.mediump_mat2_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014434,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.mediump_mat2_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014435,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.mediump_mat2_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014436,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.highp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014437,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.highp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014438,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.mul.const.highp_mat2_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014439,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.highp_mat2_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014440,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.mul.const.highp_vec2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014441,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.highp_vec2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014442,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.mul.const.highp_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014443,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.highp_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014444,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.highp_mat2_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014445,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.highp_mat2_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014446,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.highp_mat2_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014447,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.highp_mat2_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014448,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.lowp_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014449,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.lowp_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014450,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.lowp_mat2x3_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014451,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.lowp_mat2x3_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014452,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.lowp_vec3_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014453,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.lowp_vec3_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014454,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.lowp_mat2x3_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014455,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.lowp_mat2x3_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014456,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.lowp_mat2x3_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014457,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.lowp_mat2x3_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014458,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.lowp_mat2x3_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014459,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.lowp_mat2x3_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014460,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.mediump_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014461,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.const.mediump_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014462,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.mediump_mat2x3_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014463,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.mediump_mat2x3_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014464,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.mediump_vec3_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014465,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.mediump_vec3_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014466,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.mediump_mat2x3_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014467,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.mediump_mat2x3_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014468,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.mediump_mat2x3_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014469,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.const.mediump_mat2x3_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014470,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.mediump_mat2x3_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014471,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.const.mediump_mat2x3_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014472,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.highp_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014473,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.highp_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014474,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.highp_mat2x3_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014475,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.highp_mat2x3_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014476,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.highp_vec3_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014477,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.highp_vec3_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014478,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.highp_mat2x3_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014479,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.highp_mat2x3_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014480,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.highp_mat2x3_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014481,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.highp_mat2x3_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014482,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.highp_mat2x3_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014483,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.highp_mat2x3_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014484,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.lowp_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014485,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.lowp_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014486,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.lowp_mat2x4_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014487,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.lowp_mat2x4_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014488,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.lowp_vec4_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014489,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.lowp_vec4_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014490,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.lowp_mat2x4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014491,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.lowp_mat2x4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014492,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.lowp_mat2x4_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014493,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.lowp_mat2x4_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014494,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.lowp_mat2x4_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014495,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.lowp_mat2x4_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014496,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.mediump_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014497,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.const.mediump_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014498,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.mediump_mat2x4_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014499,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.mediump_mat2x4_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014500,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.mediump_vec4_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014501,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.mediump_vec4_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014502,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.mediump_mat2x4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014503,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.mediump_mat2x4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014504,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.mediump_mat2x4_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014505,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.const.mediump_mat2x4_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014506,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.mediump_mat2x4_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014507,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.const.mediump_mat2x4_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014508,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.highp_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014509,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.highp_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014510,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.highp_mat2x4_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014511,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.highp_mat2x4_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014512,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.highp_vec4_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014513,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.highp_vec4_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014514,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.highp_mat2x4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014515,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.highp_mat2x4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014516,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.highp_mat2x4_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014517,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.highp_mat2x4_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014518,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.highp_mat2x4_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014519,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.highp_mat2x4_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014520,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.lowp_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014521,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.lowp_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014522,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.lowp_mat3x2_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014523,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.lowp_mat3x2_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014524,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.lowp_vec2_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014525,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.lowp_vec2_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014526,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.lowp_mat3x2_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014527,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.lowp_mat3x2_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014528,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.lowp_mat3x2_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014529,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.lowp_mat3x2_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014530,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.lowp_mat3x2_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014531,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.lowp_mat3x2_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014532,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.mediump_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014533,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.const.mediump_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014534,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.mediump_mat3x2_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014535,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.mediump_mat3x2_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014536,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.mediump_vec2_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014537,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.mediump_vec2_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014538,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.mediump_mat3x2_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014539,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.const.mediump_mat3x2_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014540,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.mediump_mat3x2_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014541,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.mediump_mat3x2_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014542,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.mediump_mat3x2_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014543,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.const.mediump_mat3x2_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014544,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.highp_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014545,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.highp_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014546,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.highp_mat3x2_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014547,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.highp_mat3x2_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014548,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.highp_vec2_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014549,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.highp_vec2_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014550,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.highp_mat3x2_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014551,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.highp_mat3x2_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014552,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.highp_mat3x2_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014553,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.highp_mat3x2_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014554,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.highp_mat3x2_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014555,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.highp_mat3x2_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014556,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.mul.const.lowp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014557,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.lowp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014558,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.mul.const.lowp_mat3_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014559,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.lowp_mat3_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014560,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.mul.const.lowp_vec3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014561,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.lowp_vec3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014562,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.lowp_mat3_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014563,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.lowp_mat3_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014564,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.mul.const.lowp_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014565,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.lowp_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014566,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.lowp_mat3_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014567,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.lowp_mat3_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014568,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.mediump_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014569,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.mediump_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014570,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.mediump_mat3_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014571,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.mediump_mat3_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014572,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.mediump_vec3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014573,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.mediump_vec3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014574,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.mediump_mat3_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014575,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.mediump_mat3_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014576,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.mediump_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014577,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.mediump_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014578,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.mediump_mat3_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014579,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.mediump_mat3_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014580,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.highp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014581,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.highp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014582,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.mul.const.highp_mat3_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014583,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.highp_mat3_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014584,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.mul.const.highp_vec3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014585,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.highp_vec3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014586,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.highp_mat3_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014587,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.highp_mat3_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014588,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.mul.const.highp_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014589,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.highp_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014590,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.highp_mat3_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014591,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.highp_mat3_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014592,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.lowp_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014593,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.lowp_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014594,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.lowp_mat3x4_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014595,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.lowp_mat3x4_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014596,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.lowp_vec4_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014597,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.lowp_vec4_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014598,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.lowp_mat3x4_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014599,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.lowp_mat3x4_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014600,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.lowp_mat3x4_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014601,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.lowp_mat3x4_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014602,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.lowp_mat3x4_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014603,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.lowp_mat3x4_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014604,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.mediump_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014605,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.const.mediump_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014606,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.mediump_mat3x4_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014607,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.mediump_mat3x4_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014608,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.mediump_vec4_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014609,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.mediump_vec4_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014610,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.mediump_mat3x4_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014611,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.const.mediump_mat3x4_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014612,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.mediump_mat3x4_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014613,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.mediump_mat3x4_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014614,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.mediump_mat3x4_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014615,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.const.mediump_mat3x4_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014616,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.highp_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014617,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.highp_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014618,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.highp_mat3x4_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014619,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.highp_mat3x4_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014620,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.highp_vec4_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014621,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.highp_vec4_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014622,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.highp_mat3x4_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014623,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.highp_mat3x4_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014624,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.highp_mat3x4_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014625,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.highp_mat3x4_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014626,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.highp_mat3x4_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014627,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.highp_mat3x4_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014628,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.lowp_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014629,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.lowp_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014630,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.lowp_mat4x2_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014631,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.lowp_mat4x2_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014632,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.lowp_vec2_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014633,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.lowp_vec2_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014634,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.lowp_mat4x2_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014635,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.lowp_mat4x2_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014636,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.lowp_mat4x2_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014637,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.lowp_mat4x2_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014638,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.lowp_mat4x2_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014639,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.lowp_mat4x2_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014640,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.mediump_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014641,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.const.mediump_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014642,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.mediump_mat4x2_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014643,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.mediump_mat4x2_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014644,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.mediump_vec2_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014645,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.mediump_vec2_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014646,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.mediump_mat4x2_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014647,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.const.mediump_mat4x2_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014648,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.mediump_mat4x2_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014649,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.const.mediump_mat4x2_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014650,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.mediump_mat4x2_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014651,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.mediump_mat4x2_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014652,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.highp_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014653,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.highp_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014654,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.highp_mat4x2_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014655,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.highp_mat4x2_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014656,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.highp_vec2_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014657,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.highp_vec2_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014658,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.highp_mat4x2_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014659,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.highp_mat4x2_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014660,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.highp_mat4x2_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014661,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.highp_mat4x2_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014662,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.highp_mat4x2_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014663,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.highp_mat4x2_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014664,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.lowp_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014665,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.lowp_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014666,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.lowp_mat4x3_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014667,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.lowp_mat4x3_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014668,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.lowp_vec3_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014669,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.lowp_vec3_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014670,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.lowp_mat4x3_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014671,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.lowp_mat4x3_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014672,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.lowp_mat4x3_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014673,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.lowp_mat4x3_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014674,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.lowp_mat4x3_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014675,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.lowp_mat4x3_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014676,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.mediump_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014677,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.const.mediump_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014678,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.mediump_mat4x3_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014679,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.mediump_mat4x3_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014680,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.mediump_vec3_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014681,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.mediump_vec3_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014682,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.mediump_mat4x3_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014683,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.const.mediump_mat4x3_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014684,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.mediump_mat4x3_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014685,
        "dEQP-GLES3.functional.shaders.matrix.m",
        "ul.const.mediump_mat4x3_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014686,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.mediump_mat4x3_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014687,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.mediump_mat4x3_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014688,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.highp_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014689,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.highp_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014690,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.highp_mat4x3_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014691,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.highp_mat4x3_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014692,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.highp_vec3_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014693,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.highp_vec3_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014694,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.highp_mat4x3_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014695,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.highp_mat4x3_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014696,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.highp_mat4x3_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014697,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.highp_mat4x3_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014698,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.highp_mat4x3_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014699,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.highp_mat4x3_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014700,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.mul.const.lowp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014701,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.lowp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014702,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.mul.const.lowp_mat4_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014703,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.lowp_mat4_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014704,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.mul.const.lowp_vec4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014705,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.lowp_vec4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014706,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.lowp_mat4_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014707,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.lowp_mat4_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014708,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.lowp_mat4_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014709,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.lowp_mat4_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014710,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.mul.const.lowp_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014711,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.lowp_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014712,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.mediump_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014713,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.mediump_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014714,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.mediump_mat4_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014715,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.mediump_mat4_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014716,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.mediump_vec4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014717,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.mediump_vec4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014718,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.mediump_mat4_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014719,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.mediump_mat4_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014720,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.mediump_mat4_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014721,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul.const.mediump_mat4_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014722,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.mediump_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014723,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.mediump_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014724,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.highp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014725,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.highp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014726,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.mul.const.highp_mat4_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014727,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.highp_mat4_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014728,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.mul.const.highp_vec4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014729,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.highp_vec4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014730,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.highp_mat4_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014731,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.highp_mat4_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014732,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.highp_mat4_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014733,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul.const.highp_mat4_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014734,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.mul.const.highp_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014735,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul.const.highp_mat4_mat4_fragment");
