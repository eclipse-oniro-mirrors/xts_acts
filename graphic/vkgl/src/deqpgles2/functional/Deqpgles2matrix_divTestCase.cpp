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
#include "../ActsDeqpgles20008TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007313,
        "dEQP-GLES2.functional.shaders.matr",
        "ix.div.const_lowp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007314,
        "dEQP-GLES2.functional.shaders.matri",
        "x.div.const_lowp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007315,
        "dEQP-GLES2.functional.shaders.matr",
        "ix.div.const_lowp_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007316,
        "dEQP-GLES2.functional.shaders.matri",
        "x.div.const_lowp_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007317,
        "dEQP-GLES2.functional.shaders.matrix",
        ".div.const_mediump_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007318,
        "dEQP-GLES2.functional.shaders.matrix.",
        "div.const_mediump_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007319,
        "dEQP-GLES2.functional.shaders.matri",
        "x.div.const_mediump_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007320,
        "dEQP-GLES2.functional.shaders.matrix",
        ".div.const_mediump_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007321,
        "dEQP-GLES2.functional.shaders.matri",
        "x.div.const_highp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007322,
        "dEQP-GLES2.functional.shaders.matrix",
        ".div.const_highp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007323,
        "dEQP-GLES2.functional.shaders.matr",
        "ix.div.const_highp_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007324,
        "dEQP-GLES2.functional.shaders.matri",
        "x.div.const_highp_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007325,
        "dEQP-GLES2.functional.shaders.matr",
        "ix.div.const_lowp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007326,
        "dEQP-GLES2.functional.shaders.matri",
        "x.div.const_lowp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007327,
        "dEQP-GLES2.functional.shaders.matr",
        "ix.div.const_lowp_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007328,
        "dEQP-GLES2.functional.shaders.matri",
        "x.div.const_lowp_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007329,
        "dEQP-GLES2.functional.shaders.matrix",
        ".div.const_mediump_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007330,
        "dEQP-GLES2.functional.shaders.matrix.",
        "div.const_mediump_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007331,
        "dEQP-GLES2.functional.shaders.matri",
        "x.div.const_mediump_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007332,
        "dEQP-GLES2.functional.shaders.matrix",
        ".div.const_mediump_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007333,
        "dEQP-GLES2.functional.shaders.matri",
        "x.div.const_highp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007334,
        "dEQP-GLES2.functional.shaders.matrix",
        ".div.const_highp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007335,
        "dEQP-GLES2.functional.shaders.matr",
        "ix.div.const_highp_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007336,
        "dEQP-GLES2.functional.shaders.matri",
        "x.div.const_highp_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007337,
        "dEQP-GLES2.functional.shaders.matr",
        "ix.div.const_lowp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007338,
        "dEQP-GLES2.functional.shaders.matri",
        "x.div.const_lowp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007339,
        "dEQP-GLES2.functional.shaders.matr",
        "ix.div.const_lowp_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007340,
        "dEQP-GLES2.functional.shaders.matri",
        "x.div.const_lowp_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007341,
        "dEQP-GLES2.functional.shaders.matrix",
        ".div.const_mediump_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007342,
        "dEQP-GLES2.functional.shaders.matrix.",
        "div.const_mediump_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007343,
        "dEQP-GLES2.functional.shaders.matri",
        "x.div.const_mediump_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007344,
        "dEQP-GLES2.functional.shaders.matrix",
        ".div.const_mediump_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007345,
        "dEQP-GLES2.functional.shaders.matri",
        "x.div.const_highp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007346,
        "dEQP-GLES2.functional.shaders.matrix",
        ".div.const_highp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007347,
        "dEQP-GLES2.functional.shaders.matr",
        "ix.div.const_highp_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007348,
        "dEQP-GLES2.functional.shaders.matri",
        "x.div.const_highp_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007349,
        "dEQP-GLES2.functional.shaders.matri",
        "x.div.uniform_lowp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007350,
        "dEQP-GLES2.functional.shaders.matrix",
        ".div.uniform_lowp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007351,
        "dEQP-GLES2.functional.shaders.matri",
        "x.div.uniform_lowp_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007352,
        "dEQP-GLES2.functional.shaders.matrix",
        ".div.uniform_lowp_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007353,
        "dEQP-GLES2.functional.shaders.matrix.",
        "div.uniform_mediump_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007354,
        "dEQP-GLES2.functional.shaders.matrix.d",
        "iv.uniform_mediump_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007355,
        "dEQP-GLES2.functional.shaders.matrix",
        ".div.uniform_mediump_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007356,
        "dEQP-GLES2.functional.shaders.matrix.",
        "div.uniform_mediump_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007357,
        "dEQP-GLES2.functional.shaders.matrix",
        ".div.uniform_highp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007358,
        "dEQP-GLES2.functional.shaders.matrix.",
        "div.uniform_highp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007359,
        "dEQP-GLES2.functional.shaders.matri",
        "x.div.uniform_highp_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007360,
        "dEQP-GLES2.functional.shaders.matrix",
        ".div.uniform_highp_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007361,
        "dEQP-GLES2.functional.shaders.matri",
        "x.div.uniform_lowp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007362,
        "dEQP-GLES2.functional.shaders.matrix",
        ".div.uniform_lowp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007363,
        "dEQP-GLES2.functional.shaders.matri",
        "x.div.uniform_lowp_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007364,
        "dEQP-GLES2.functional.shaders.matrix",
        ".div.uniform_lowp_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007365,
        "dEQP-GLES2.functional.shaders.matrix.",
        "div.uniform_mediump_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007366,
        "dEQP-GLES2.functional.shaders.matrix.d",
        "iv.uniform_mediump_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007367,
        "dEQP-GLES2.functional.shaders.matrix",
        ".div.uniform_mediump_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007368,
        "dEQP-GLES2.functional.shaders.matrix.",
        "div.uniform_mediump_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007369,
        "dEQP-GLES2.functional.shaders.matrix",
        ".div.uniform_highp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007370,
        "dEQP-GLES2.functional.shaders.matrix.",
        "div.uniform_highp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007371,
        "dEQP-GLES2.functional.shaders.matri",
        "x.div.uniform_highp_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007372,
        "dEQP-GLES2.functional.shaders.matrix",
        ".div.uniform_highp_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007373,
        "dEQP-GLES2.functional.shaders.matri",
        "x.div.uniform_lowp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007374,
        "dEQP-GLES2.functional.shaders.matrix",
        ".div.uniform_lowp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007375,
        "dEQP-GLES2.functional.shaders.matri",
        "x.div.uniform_lowp_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007376,
        "dEQP-GLES2.functional.shaders.matrix",
        ".div.uniform_lowp_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007377,
        "dEQP-GLES2.functional.shaders.matrix.",
        "div.uniform_mediump_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007378,
        "dEQP-GLES2.functional.shaders.matrix.d",
        "iv.uniform_mediump_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007379,
        "dEQP-GLES2.functional.shaders.matrix",
        ".div.uniform_mediump_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007380,
        "dEQP-GLES2.functional.shaders.matrix.",
        "div.uniform_mediump_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007381,
        "dEQP-GLES2.functional.shaders.matrix",
        ".div.uniform_highp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007382,
        "dEQP-GLES2.functional.shaders.matrix.",
        "div.uniform_highp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007383,
        "dEQP-GLES2.functional.shaders.matri",
        "x.div.uniform_highp_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007384,
        "dEQP-GLES2.functional.shaders.matrix",
        ".div.uniform_highp_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007385,
        "dEQP-GLES2.functional.shaders.matri",
        "x.div.dynamic_lowp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007386,
        "dEQP-GLES2.functional.shaders.matrix",
        ".div.dynamic_lowp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007387,
        "dEQP-GLES2.functional.shaders.matri",
        "x.div.dynamic_lowp_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007388,
        "dEQP-GLES2.functional.shaders.matrix",
        ".div.dynamic_lowp_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007389,
        "dEQP-GLES2.functional.shaders.matrix.",
        "div.dynamic_mediump_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007390,
        "dEQP-GLES2.functional.shaders.matrix.d",
        "iv.dynamic_mediump_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007391,
        "dEQP-GLES2.functional.shaders.matrix",
        ".div.dynamic_mediump_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007392,
        "dEQP-GLES2.functional.shaders.matrix.",
        "div.dynamic_mediump_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007393,
        "dEQP-GLES2.functional.shaders.matrix",
        ".div.dynamic_highp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007394,
        "dEQP-GLES2.functional.shaders.matrix.",
        "div.dynamic_highp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007395,
        "dEQP-GLES2.functional.shaders.matri",
        "x.div.dynamic_highp_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007396,
        "dEQP-GLES2.functional.shaders.matrix",
        ".div.dynamic_highp_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007397,
        "dEQP-GLES2.functional.shaders.matri",
        "x.div.dynamic_lowp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007398,
        "dEQP-GLES2.functional.shaders.matrix",
        ".div.dynamic_lowp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007399,
        "dEQP-GLES2.functional.shaders.matri",
        "x.div.dynamic_lowp_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007400,
        "dEQP-GLES2.functional.shaders.matrix",
        ".div.dynamic_lowp_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007401,
        "dEQP-GLES2.functional.shaders.matrix.",
        "div.dynamic_mediump_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007402,
        "dEQP-GLES2.functional.shaders.matrix.d",
        "iv.dynamic_mediump_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007403,
        "dEQP-GLES2.functional.shaders.matrix",
        ".div.dynamic_mediump_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007404,
        "dEQP-GLES2.functional.shaders.matrix.",
        "div.dynamic_mediump_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007405,
        "dEQP-GLES2.functional.shaders.matrix",
        ".div.dynamic_highp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007406,
        "dEQP-GLES2.functional.shaders.matrix.",
        "div.dynamic_highp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007407,
        "dEQP-GLES2.functional.shaders.matri",
        "x.div.dynamic_highp_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007408,
        "dEQP-GLES2.functional.shaders.matrix",
        ".div.dynamic_highp_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007409,
        "dEQP-GLES2.functional.shaders.matri",
        "x.div.dynamic_lowp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007410,
        "dEQP-GLES2.functional.shaders.matrix",
        ".div.dynamic_lowp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007411,
        "dEQP-GLES2.functional.shaders.matri",
        "x.div.dynamic_lowp_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007412,
        "dEQP-GLES2.functional.shaders.matrix",
        ".div.dynamic_lowp_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007413,
        "dEQP-GLES2.functional.shaders.matrix.",
        "div.dynamic_mediump_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007414,
        "dEQP-GLES2.functional.shaders.matrix.d",
        "iv.dynamic_mediump_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007415,
        "dEQP-GLES2.functional.shaders.matrix",
        ".div.dynamic_mediump_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007416,
        "dEQP-GLES2.functional.shaders.matrix.",
        "div.dynamic_mediump_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007417,
        "dEQP-GLES2.functional.shaders.matrix",
        ".div.dynamic_highp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007418,
        "dEQP-GLES2.functional.shaders.matrix.",
        "div.dynamic_highp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007419,
        "dEQP-GLES2.functional.shaders.matri",
        "x.div.dynamic_highp_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007420,
        "dEQP-GLES2.functional.shaders.matrix",
        ".div.dynamic_highp_mat4_mat4_fragment");
