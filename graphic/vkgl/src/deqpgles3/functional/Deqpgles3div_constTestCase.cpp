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

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015384,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.div.const.lowp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015385,
        "dEQP-GLES3.functional.shaders.matri",
        "x.div.const.lowp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015386,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.div.const.lowp_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015387,
        "dEQP-GLES3.functional.shaders.matri",
        "x.div.const.lowp_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015388,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.const.mediump_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015389,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.const.mediump_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015390,
        "dEQP-GLES3.functional.shaders.matri",
        "x.div.const.mediump_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015391,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.const.mediump_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015392,
        "dEQP-GLES3.functional.shaders.matri",
        "x.div.const.highp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015393,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.const.highp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015394,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.div.const.highp_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015395,
        "dEQP-GLES3.functional.shaders.matri",
        "x.div.const.highp_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015396,
        "dEQP-GLES3.functional.shaders.matri",
        "x.div.const.lowp_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015397,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.const.lowp_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015398,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.const.lowp_mat2x3_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015399,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.const.lowp_mat2x3_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015400,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.const.mediump_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015401,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.const.mediump_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015402,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.const.mediump_mat2x3_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015403,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.const.mediump_mat2x3_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015404,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.const.highp_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015405,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.const.highp_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015406,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.const.highp_mat2x3_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015407,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.const.highp_mat2x3_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015408,
        "dEQP-GLES3.functional.shaders.matri",
        "x.div.const.lowp_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015409,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.const.lowp_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015410,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.const.lowp_mat2x4_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015411,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.const.lowp_mat2x4_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015412,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.const.mediump_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015413,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.const.mediump_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015414,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.const.mediump_mat2x4_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015415,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.const.mediump_mat2x4_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015416,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.const.highp_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015417,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.const.highp_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015418,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.const.highp_mat2x4_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015419,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.const.highp_mat2x4_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015420,
        "dEQP-GLES3.functional.shaders.matri",
        "x.div.const.lowp_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015421,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.const.lowp_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015422,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.const.lowp_mat3x2_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015423,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.const.lowp_mat3x2_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015424,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.const.mediump_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015425,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.const.mediump_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015426,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.const.mediump_mat3x2_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015427,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.const.mediump_mat3x2_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015428,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.const.highp_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015429,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.const.highp_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015430,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.const.highp_mat3x2_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015431,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.const.highp_mat3x2_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015432,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.div.const.lowp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015433,
        "dEQP-GLES3.functional.shaders.matri",
        "x.div.const.lowp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015434,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.div.const.lowp_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015435,
        "dEQP-GLES3.functional.shaders.matri",
        "x.div.const.lowp_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015436,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.const.mediump_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015437,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.const.mediump_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015438,
        "dEQP-GLES3.functional.shaders.matri",
        "x.div.const.mediump_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015439,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.const.mediump_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015440,
        "dEQP-GLES3.functional.shaders.matri",
        "x.div.const.highp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015441,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.const.highp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015442,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.div.const.highp_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015443,
        "dEQP-GLES3.functional.shaders.matri",
        "x.div.const.highp_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015444,
        "dEQP-GLES3.functional.shaders.matri",
        "x.div.const.lowp_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015445,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.const.lowp_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015446,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.const.lowp_mat3x4_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015447,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.const.lowp_mat3x4_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015448,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.const.mediump_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015449,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.const.mediump_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015450,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.const.mediump_mat3x4_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015451,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.const.mediump_mat3x4_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015452,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.const.highp_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015453,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.const.highp_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015454,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.const.highp_mat3x4_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015455,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.const.highp_mat3x4_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015456,
        "dEQP-GLES3.functional.shaders.matri",
        "x.div.const.lowp_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015457,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.const.lowp_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015458,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.const.lowp_mat4x2_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015459,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.const.lowp_mat4x2_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015460,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.const.mediump_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015461,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.const.mediump_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015462,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.const.mediump_mat4x2_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015463,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.const.mediump_mat4x2_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015464,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.const.highp_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015465,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.const.highp_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015466,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.const.highp_mat4x2_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015467,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.const.highp_mat4x2_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015468,
        "dEQP-GLES3.functional.shaders.matri",
        "x.div.const.lowp_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015469,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.const.lowp_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015470,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.const.lowp_mat4x3_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015471,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.const.lowp_mat4x3_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015472,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.const.mediump_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015473,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.const.mediump_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015474,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.const.mediump_mat4x3_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015475,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.const.mediump_mat4x3_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015476,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.const.highp_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015477,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.const.highp_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015478,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.const.highp_mat4x3_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015479,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.const.highp_mat4x3_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015480,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.div.const.lowp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015481,
        "dEQP-GLES3.functional.shaders.matri",
        "x.div.const.lowp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015482,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.div.const.lowp_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015483,
        "dEQP-GLES3.functional.shaders.matri",
        "x.div.const.lowp_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015484,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.const.mediump_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015485,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.const.mediump_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015486,
        "dEQP-GLES3.functional.shaders.matri",
        "x.div.const.mediump_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015487,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.const.mediump_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015488,
        "dEQP-GLES3.functional.shaders.matri",
        "x.div.const.highp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015489,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.const.highp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015490,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.div.const.highp_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015491,
        "dEQP-GLES3.functional.shaders.matri",
        "x.div.const.highp_mat4_mat4_fragment");
