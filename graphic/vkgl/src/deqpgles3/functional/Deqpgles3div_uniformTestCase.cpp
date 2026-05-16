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

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015492,
        "dEQP-GLES3.functional.shaders.matri",
        "x.div.uniform.lowp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015493,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.uniform.lowp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015494,
        "dEQP-GLES3.functional.shaders.matri",
        "x.div.uniform.lowp_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015495,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.uniform.lowp_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015496,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.uniform.mediump_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015497,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.uniform.mediump_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015498,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.uniform.mediump_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015499,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.uniform.mediump_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015500,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.uniform.highp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015501,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.uniform.highp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015502,
        "dEQP-GLES3.functional.shaders.matri",
        "x.div.uniform.highp_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015503,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.uniform.highp_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015504,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.uniform.lowp_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015505,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.uniform.lowp_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015506,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.uniform.lowp_mat2x3_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015507,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.uniform.lowp_mat2x3_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015508,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.uniform.mediump_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015509,
        "dEQP-GLES3.functional.shaders.matrix.di",
        "v.uniform.mediump_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015510,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.uniform.mediump_mat2x3_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015511,
        "dEQP-GLES3.functional.shaders.matrix.di",
        "v.uniform.mediump_mat2x3_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015512,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.uniform.highp_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015513,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.uniform.highp_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015514,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.uniform.highp_mat2x3_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015515,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.uniform.highp_mat2x3_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015516,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.uniform.lowp_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015517,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.uniform.lowp_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015518,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.uniform.lowp_mat2x4_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015519,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.uniform.lowp_mat2x4_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015520,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.uniform.mediump_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015521,
        "dEQP-GLES3.functional.shaders.matrix.di",
        "v.uniform.mediump_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015522,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.uniform.mediump_mat2x4_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015523,
        "dEQP-GLES3.functional.shaders.matrix.di",
        "v.uniform.mediump_mat2x4_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015524,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.uniform.highp_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015525,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.uniform.highp_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015526,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.uniform.highp_mat2x4_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015527,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.uniform.highp_mat2x4_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015528,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.uniform.lowp_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015529,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.uniform.lowp_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015530,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.uniform.lowp_mat3x2_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015531,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.uniform.lowp_mat3x2_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015532,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.uniform.mediump_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015533,
        "dEQP-GLES3.functional.shaders.matrix.di",
        "v.uniform.mediump_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015534,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.uniform.mediump_mat3x2_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015535,
        "dEQP-GLES3.functional.shaders.matrix.di",
        "v.uniform.mediump_mat3x2_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015536,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.uniform.highp_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015537,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.uniform.highp_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015538,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.uniform.highp_mat3x2_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015539,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.uniform.highp_mat3x2_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015540,
        "dEQP-GLES3.functional.shaders.matri",
        "x.div.uniform.lowp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015541,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.uniform.lowp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015542,
        "dEQP-GLES3.functional.shaders.matri",
        "x.div.uniform.lowp_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015543,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.uniform.lowp_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015544,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.uniform.mediump_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015545,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.uniform.mediump_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015546,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.uniform.mediump_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015547,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.uniform.mediump_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015548,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.uniform.highp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015549,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.uniform.highp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015550,
        "dEQP-GLES3.functional.shaders.matri",
        "x.div.uniform.highp_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015551,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.uniform.highp_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015552,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.uniform.lowp_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015553,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.uniform.lowp_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015554,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.uniform.lowp_mat3x4_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015555,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.uniform.lowp_mat3x4_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015556,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.uniform.mediump_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015557,
        "dEQP-GLES3.functional.shaders.matrix.di",
        "v.uniform.mediump_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015558,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.uniform.mediump_mat3x4_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015559,
        "dEQP-GLES3.functional.shaders.matrix.di",
        "v.uniform.mediump_mat3x4_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015560,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.uniform.highp_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015561,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.uniform.highp_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015562,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.uniform.highp_mat3x4_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015563,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.uniform.highp_mat3x4_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015564,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.uniform.lowp_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015565,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.uniform.lowp_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015566,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.uniform.lowp_mat4x2_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015567,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.uniform.lowp_mat4x2_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015568,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.uniform.mediump_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015569,
        "dEQP-GLES3.functional.shaders.matrix.di",
        "v.uniform.mediump_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015570,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.uniform.mediump_mat4x2_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015571,
        "dEQP-GLES3.functional.shaders.matrix.di",
        "v.uniform.mediump_mat4x2_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015572,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.uniform.highp_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015573,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.uniform.highp_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015574,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.uniform.highp_mat4x2_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015575,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.uniform.highp_mat4x2_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015576,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.uniform.lowp_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015577,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.uniform.lowp_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015578,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.uniform.lowp_mat4x3_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015579,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.uniform.lowp_mat4x3_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015580,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.uniform.mediump_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015581,
        "dEQP-GLES3.functional.shaders.matrix.di",
        "v.uniform.mediump_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015582,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.uniform.mediump_mat4x3_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015583,
        "dEQP-GLES3.functional.shaders.matrix.di",
        "v.uniform.mediump_mat4x3_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015584,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.uniform.highp_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015585,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.uniform.highp_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015586,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.uniform.highp_mat4x3_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015587,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.uniform.highp_mat4x3_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015588,
        "dEQP-GLES3.functional.shaders.matri",
        "x.div.uniform.lowp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015589,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.uniform.lowp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015590,
        "dEQP-GLES3.functional.shaders.matri",
        "x.div.uniform.lowp_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015591,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.uniform.lowp_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015592,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.uniform.mediump_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015593,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.uniform.mediump_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015594,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.uniform.mediump_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015595,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.uniform.mediump_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015596,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.uniform.highp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015597,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.uniform.highp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015598,
        "dEQP-GLES3.functional.shaders.matri",
        "x.div.uniform.highp_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015599,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.uniform.highp_mat4_mat4_fragment");
