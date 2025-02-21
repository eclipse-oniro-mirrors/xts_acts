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

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016230,
        "dEQP-GLES3.functional.shaders.matri",
        "x.add_assign.lowp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016231,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add_assign.lowp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016232,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add_assign.mediump_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016233,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add_assign.mediump_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016234,
        "dEQP-GLES3.functional.shaders.matri",
        "x.add_assign.highp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016235,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add_assign.highp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016236,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add_assign.lowp_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016237,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add_assign.lowp_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016238,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add_assign.mediump_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016239,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd_assign.mediump_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016240,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add_assign.highp_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016241,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add_assign.highp_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016242,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add_assign.lowp_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016243,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add_assign.lowp_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016244,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add_assign.mediump_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016245,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd_assign.mediump_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016246,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add_assign.highp_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016247,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add_assign.highp_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016248,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add_assign.lowp_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016249,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add_assign.lowp_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016250,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add_assign.mediump_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016251,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd_assign.mediump_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016252,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add_assign.highp_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016253,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add_assign.highp_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016254,
        "dEQP-GLES3.functional.shaders.matri",
        "x.add_assign.lowp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016255,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add_assign.lowp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016256,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add_assign.mediump_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016257,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add_assign.mediump_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016258,
        "dEQP-GLES3.functional.shaders.matri",
        "x.add_assign.highp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016259,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add_assign.highp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016260,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add_assign.lowp_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016261,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add_assign.lowp_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016262,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add_assign.mediump_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016263,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd_assign.mediump_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016264,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add_assign.highp_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016265,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add_assign.highp_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016266,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add_assign.lowp_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016267,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add_assign.lowp_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016268,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add_assign.mediump_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016269,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd_assign.mediump_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016270,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add_assign.highp_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016271,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add_assign.highp_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016272,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add_assign.lowp_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016273,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add_assign.lowp_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016274,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add_assign.mediump_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016275,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd_assign.mediump_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016276,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add_assign.highp_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016277,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add_assign.highp_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016278,
        "dEQP-GLES3.functional.shaders.matri",
        "x.add_assign.lowp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016279,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add_assign.lowp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016280,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add_assign.mediump_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016281,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add_assign.mediump_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016282,
        "dEQP-GLES3.functional.shaders.matri",
        "x.add_assign.highp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016283,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add_assign.highp_mat4_float_fragment");
