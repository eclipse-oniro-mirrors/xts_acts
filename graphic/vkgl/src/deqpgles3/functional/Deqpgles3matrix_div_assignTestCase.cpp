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
#include "../ActsDeqpgles30017TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016356,
        "dEQP-GLES3.functional.shaders.matri",
        "x.div_assign.lowp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016357,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div_assign.lowp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016358,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div_assign.mediump_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016359,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div_assign.mediump_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016360,
        "dEQP-GLES3.functional.shaders.matri",
        "x.div_assign.highp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016361,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div_assign.highp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016362,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div_assign.lowp_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016363,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div_assign.lowp_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016364,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div_assign.mediump_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016365,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv_assign.mediump_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016366,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div_assign.highp_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016367,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div_assign.highp_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016368,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div_assign.lowp_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016369,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div_assign.lowp_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016370,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div_assign.mediump_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016371,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv_assign.mediump_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016372,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div_assign.highp_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016373,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div_assign.highp_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016374,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div_assign.lowp_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016375,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div_assign.lowp_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016376,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div_assign.mediump_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016377,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv_assign.mediump_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016378,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div_assign.highp_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016379,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div_assign.highp_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016380,
        "dEQP-GLES3.functional.shaders.matri",
        "x.div_assign.lowp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016381,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div_assign.lowp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016382,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div_assign.mediump_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016383,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div_assign.mediump_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016384,
        "dEQP-GLES3.functional.shaders.matri",
        "x.div_assign.highp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016385,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div_assign.highp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016386,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div_assign.lowp_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016387,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div_assign.lowp_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016388,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div_assign.mediump_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016389,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv_assign.mediump_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016390,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div_assign.highp_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016391,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div_assign.highp_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016392,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div_assign.lowp_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016393,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div_assign.lowp_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016394,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div_assign.mediump_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016395,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv_assign.mediump_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016396,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div_assign.highp_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016397,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div_assign.highp_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016398,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div_assign.lowp_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016399,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div_assign.lowp_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016400,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div_assign.mediump_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016401,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv_assign.mediump_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016402,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div_assign.highp_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016403,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div_assign.highp_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016404,
        "dEQP-GLES3.functional.shaders.matri",
        "x.div_assign.lowp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016405,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div_assign.lowp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016406,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div_assign.mediump_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016407,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div_assign.mediump_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016408,
        "dEQP-GLES3.functional.shaders.matri",
        "x.div_assign.highp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016409,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div_assign.highp_mat4_float_fragment");
