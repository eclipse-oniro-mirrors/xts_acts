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

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014304,
        "dEQP-GLES3.functional.shaders.matri",
        "x.sub.dynamic.lowp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014305,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.dynamic.lowp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014306,
        "dEQP-GLES3.functional.shaders.matri",
        "x.sub.dynamic.lowp_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014307,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.dynamic.lowp_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014308,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.dynamic.mediump_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014309,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.dynamic.mediump_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014310,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.dynamic.mediump_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014311,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.dynamic.mediump_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014312,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.dynamic.highp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014313,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.dynamic.highp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014314,
        "dEQP-GLES3.functional.shaders.matri",
        "x.sub.dynamic.highp_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014315,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.dynamic.highp_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014316,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.dynamic.lowp_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014317,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.dynamic.lowp_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014318,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.dynamic.lowp_mat2x3_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014319,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.dynamic.lowp_mat2x3_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014320,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.dynamic.mediump_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014321,
        "dEQP-GLES3.functional.shaders.matrix.su",
        "b.dynamic.mediump_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014322,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.dynamic.mediump_mat2x3_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014323,
        "dEQP-GLES3.functional.shaders.matrix.su",
        "b.dynamic.mediump_mat2x3_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014324,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.dynamic.highp_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014325,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.dynamic.highp_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014326,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.dynamic.highp_mat2x3_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014327,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.dynamic.highp_mat2x3_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014328,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.dynamic.lowp_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014329,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.dynamic.lowp_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014330,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.dynamic.lowp_mat2x4_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014331,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.dynamic.lowp_mat2x4_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014332,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.dynamic.mediump_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014333,
        "dEQP-GLES3.functional.shaders.matrix.su",
        "b.dynamic.mediump_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014334,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.dynamic.mediump_mat2x4_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014335,
        "dEQP-GLES3.functional.shaders.matrix.su",
        "b.dynamic.mediump_mat2x4_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014336,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.dynamic.highp_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014337,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.dynamic.highp_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014338,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.dynamic.highp_mat2x4_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014339,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.dynamic.highp_mat2x4_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014340,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.dynamic.lowp_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014341,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.dynamic.lowp_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014342,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.dynamic.lowp_mat3x2_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014343,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.dynamic.lowp_mat3x2_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014344,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.dynamic.mediump_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014345,
        "dEQP-GLES3.functional.shaders.matrix.su",
        "b.dynamic.mediump_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014346,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.dynamic.mediump_mat3x2_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014347,
        "dEQP-GLES3.functional.shaders.matrix.su",
        "b.dynamic.mediump_mat3x2_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014348,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.dynamic.highp_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014349,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.dynamic.highp_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014350,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.dynamic.highp_mat3x2_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014351,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.dynamic.highp_mat3x2_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014352,
        "dEQP-GLES3.functional.shaders.matri",
        "x.sub.dynamic.lowp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014353,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.dynamic.lowp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014354,
        "dEQP-GLES3.functional.shaders.matri",
        "x.sub.dynamic.lowp_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014355,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.dynamic.lowp_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014356,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.dynamic.mediump_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014357,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.dynamic.mediump_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014358,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.dynamic.mediump_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014359,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.dynamic.mediump_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014360,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.dynamic.highp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014361,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.dynamic.highp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014362,
        "dEQP-GLES3.functional.shaders.matri",
        "x.sub.dynamic.highp_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014363,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.dynamic.highp_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014364,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.dynamic.lowp_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014365,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.dynamic.lowp_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014366,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.dynamic.lowp_mat3x4_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014367,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.dynamic.lowp_mat3x4_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014368,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.dynamic.mediump_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014369,
        "dEQP-GLES3.functional.shaders.matrix.su",
        "b.dynamic.mediump_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014370,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.dynamic.mediump_mat3x4_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014371,
        "dEQP-GLES3.functional.shaders.matrix.su",
        "b.dynamic.mediump_mat3x4_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014372,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.dynamic.highp_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014373,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.dynamic.highp_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014374,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.dynamic.highp_mat3x4_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014375,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.dynamic.highp_mat3x4_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014376,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.dynamic.lowp_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014377,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.dynamic.lowp_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014378,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.dynamic.lowp_mat4x2_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014379,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.dynamic.lowp_mat4x2_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014380,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.dynamic.mediump_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014381,
        "dEQP-GLES3.functional.shaders.matrix.su",
        "b.dynamic.mediump_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014382,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.dynamic.mediump_mat4x2_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014383,
        "dEQP-GLES3.functional.shaders.matrix.su",
        "b.dynamic.mediump_mat4x2_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014384,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.dynamic.highp_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014385,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.dynamic.highp_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014386,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.dynamic.highp_mat4x2_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014387,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.dynamic.highp_mat4x2_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014388,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.dynamic.lowp_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014389,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.dynamic.lowp_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014390,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.dynamic.lowp_mat4x3_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014391,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.dynamic.lowp_mat4x3_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014392,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.dynamic.mediump_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014393,
        "dEQP-GLES3.functional.shaders.matrix.su",
        "b.dynamic.mediump_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014394,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.dynamic.mediump_mat4x3_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014395,
        "dEQP-GLES3.functional.shaders.matrix.su",
        "b.dynamic.mediump_mat4x3_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014396,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.dynamic.highp_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014397,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.dynamic.highp_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014398,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.dynamic.highp_mat4x3_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014399,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.dynamic.highp_mat4x3_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014400,
        "dEQP-GLES3.functional.shaders.matri",
        "x.sub.dynamic.lowp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014401,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.dynamic.lowp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014402,
        "dEQP-GLES3.functional.shaders.matri",
        "x.sub.dynamic.lowp_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014403,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.dynamic.lowp_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014404,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.dynamic.mediump_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014405,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub.dynamic.mediump_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014406,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.dynamic.mediump_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014407,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.dynamic.mediump_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014408,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.dynamic.highp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014409,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub.dynamic.highp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014410,
        "dEQP-GLES3.functional.shaders.matri",
        "x.sub.dynamic.highp_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30015TestSuite, TestCase_014411,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub.dynamic.highp_mat4_mat4_fragment");
