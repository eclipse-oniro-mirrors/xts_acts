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

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014196,
        "dEQP-GLES3.functional.shaders.matri",
        "x.sub.uniform.lowp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014197,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.uniform.lowp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014198,
        "dEQP-GLES3.functional.shaders.matri",
        "x.sub.uniform.lowp_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014199,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.uniform.lowp_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014200,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.uniform.mediump_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014201,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.uniform.mediump_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014202,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.uniform.mediump_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014203,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.uniform.mediump_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014204,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.uniform.highp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014205,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.uniform.highp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014206,
        "dEQP-GLES3.functional.shaders.matri",
        "x.sub.uniform.highp_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014207,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.uniform.highp_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014208,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.uniform.lowp_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014209,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.uniform.lowp_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014210,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.uniform.lowp_mat2x3_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014211,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.uniform.lowp_mat2x3_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014212,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.uniform.mediump_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014213,
        "dEQP-GLES3.functional.shaders.matrix.su",
        "b.uniform.mediump_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014214,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.uniform.mediump_mat2x3_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014215,
        "dEQP-GLES3.functional.shaders.matrix.su",
        "b.uniform.mediump_mat2x3_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014216,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.uniform.highp_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014217,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.uniform.highp_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014218,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.uniform.highp_mat2x3_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014219,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.uniform.highp_mat2x3_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014220,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.uniform.lowp_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014221,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.uniform.lowp_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014222,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.uniform.lowp_mat2x4_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014223,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.uniform.lowp_mat2x4_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014224,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.uniform.mediump_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014225,
        "dEQP-GLES3.functional.shaders.matrix.su",
        "b.uniform.mediump_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014226,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.uniform.mediump_mat2x4_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014227,
        "dEQP-GLES3.functional.shaders.matrix.su",
        "b.uniform.mediump_mat2x4_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014228,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.uniform.highp_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014229,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.uniform.highp_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014230,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.uniform.highp_mat2x4_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014231,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.uniform.highp_mat2x4_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014232,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.uniform.lowp_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014233,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.uniform.lowp_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014234,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.uniform.lowp_mat3x2_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014235,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.uniform.lowp_mat3x2_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014236,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.uniform.mediump_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014237,
        "dEQP-GLES3.functional.shaders.matrix.su",
        "b.uniform.mediump_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014238,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.uniform.mediump_mat3x2_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014239,
        "dEQP-GLES3.functional.shaders.matrix.su",
        "b.uniform.mediump_mat3x2_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014240,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.uniform.highp_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014241,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.uniform.highp_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014242,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.uniform.highp_mat3x2_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014243,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.uniform.highp_mat3x2_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014244,
        "dEQP-GLES3.functional.shaders.matri",
        "x.sub.uniform.lowp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014245,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.uniform.lowp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014246,
        "dEQP-GLES3.functional.shaders.matri",
        "x.sub.uniform.lowp_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014247,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.uniform.lowp_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014248,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.uniform.mediump_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014249,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.uniform.mediump_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014250,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.uniform.mediump_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014251,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.uniform.mediump_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014252,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.uniform.highp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014253,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.uniform.highp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014254,
        "dEQP-GLES3.functional.shaders.matri",
        "x.sub.uniform.highp_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014255,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.uniform.highp_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014256,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.uniform.lowp_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014257,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.uniform.lowp_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014258,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.uniform.lowp_mat3x4_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014259,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.uniform.lowp_mat3x4_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014260,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.uniform.mediump_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014261,
        "dEQP-GLES3.functional.shaders.matrix.su",
        "b.uniform.mediump_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014262,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.uniform.mediump_mat3x4_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014263,
        "dEQP-GLES3.functional.shaders.matrix.su",
        "b.uniform.mediump_mat3x4_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014264,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.uniform.highp_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014265,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.uniform.highp_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014266,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.uniform.highp_mat3x4_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014267,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.uniform.highp_mat3x4_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014268,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.uniform.lowp_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014269,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.uniform.lowp_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014270,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.uniform.lowp_mat4x2_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014271,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.uniform.lowp_mat4x2_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014272,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.uniform.mediump_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014273,
        "dEQP-GLES3.functional.shaders.matrix.su",
        "b.uniform.mediump_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014274,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.uniform.mediump_mat4x2_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014275,
        "dEQP-GLES3.functional.shaders.matrix.su",
        "b.uniform.mediump_mat4x2_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014276,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.uniform.highp_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014277,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.uniform.highp_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014278,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.uniform.highp_mat4x2_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014279,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.uniform.highp_mat4x2_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014280,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.uniform.lowp_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014281,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.uniform.lowp_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014282,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.uniform.lowp_mat4x3_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014283,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.uniform.lowp_mat4x3_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014284,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.uniform.mediump_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014285,
        "dEQP-GLES3.functional.shaders.matrix.su",
        "b.uniform.mediump_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014286,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.uniform.mediump_mat4x3_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014287,
        "dEQP-GLES3.functional.shaders.matrix.su",
        "b.uniform.mediump_mat4x3_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014288,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.uniform.highp_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014289,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.uniform.highp_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014290,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.uniform.highp_mat4x3_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014291,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.uniform.highp_mat4x3_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014292,
        "dEQP-GLES3.functional.shaders.matri",
        "x.sub.uniform.lowp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014293,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.uniform.lowp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014294,
        "dEQP-GLES3.functional.shaders.matri",
        "x.sub.uniform.lowp_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014295,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.uniform.lowp_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014296,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.uniform.mediump_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014297,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.uniform.mediump_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014298,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.uniform.mediump_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014299,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.uniform.mediump_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014300,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.uniform.highp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014301,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.uniform.highp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014302,
        "dEQP-GLES3.functional.shaders.matri",
        "x.sub.uniform.highp_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014303,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.uniform.highp_mat4_mat4_fragment");
