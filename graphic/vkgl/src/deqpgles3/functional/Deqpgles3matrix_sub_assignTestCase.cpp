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

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016284,
        "dEQP-GLES3.functional.shaders.matri",
        "x.sub_assign.lowp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016285,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub_assign.lowp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016286,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub_assign.mediump_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016287,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub_assign.mediump_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016288,
        "dEQP-GLES3.functional.shaders.matri",
        "x.sub_assign.highp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016289,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub_assign.highp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016290,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub_assign.lowp_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016291,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub_assign.lowp_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016292,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub_assign.mediump_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016293,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub_assign.mediump_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016294,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub_assign.highp_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016295,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub_assign.highp_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016296,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub_assign.lowp_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016297,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub_assign.lowp_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016298,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub_assign.mediump_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016299,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub_assign.mediump_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016300,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub_assign.highp_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016301,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub_assign.highp_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016302,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub_assign.lowp_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016303,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub_assign.lowp_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016304,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub_assign.mediump_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016305,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub_assign.mediump_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016306,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub_assign.highp_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016307,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub_assign.highp_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016308,
        "dEQP-GLES3.functional.shaders.matri",
        "x.sub_assign.lowp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016309,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub_assign.lowp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016310,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub_assign.mediump_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016311,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub_assign.mediump_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016312,
        "dEQP-GLES3.functional.shaders.matri",
        "x.sub_assign.highp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016313,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub_assign.highp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016314,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub_assign.lowp_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016315,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub_assign.lowp_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016316,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub_assign.mediump_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016317,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub_assign.mediump_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016318,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub_assign.highp_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016319,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub_assign.highp_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016320,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub_assign.lowp_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016321,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub_assign.lowp_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016322,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub_assign.mediump_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016323,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub_assign.mediump_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016324,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub_assign.highp_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016325,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub_assign.highp_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016326,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub_assign.lowp_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016327,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub_assign.lowp_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016328,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub_assign.mediump_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016329,
        "dEQP-GLES3.functional.shaders.matrix.s",
        "ub_assign.mediump_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016330,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub_assign.highp_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016331,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub_assign.highp_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016332,
        "dEQP-GLES3.functional.shaders.matri",
        "x.sub_assign.lowp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016333,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub_assign.lowp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016334,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub_assign.mediump_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016335,
        "dEQP-GLES3.functional.shaders.matrix.",
        "sub_assign.mediump_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016336,
        "dEQP-GLES3.functional.shaders.matri",
        "x.sub_assign.highp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016337,
        "dEQP-GLES3.functional.shaders.matrix",
        ".sub_assign.highp_mat4_float_fragment");
