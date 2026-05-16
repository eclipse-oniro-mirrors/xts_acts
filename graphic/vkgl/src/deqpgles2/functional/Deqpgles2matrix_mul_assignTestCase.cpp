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

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007583,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul_assign.dynamic_lowp_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007584,
        "dEQP-GLES2.functional.shaders.matrix.",
        "mul_assign.dynamic_lowp_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007585,
        "dEQP-GLES2.functional.shaders.matrix.",
        "mul_assign.dynamic_mediump_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007586,
        "dEQP-GLES2.functional.shaders.matrix.m",
        "ul_assign.dynamic_mediump_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007587,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul_assign.dynamic_highp_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007588,
        "dEQP-GLES2.functional.shaders.matrix.",
        "mul_assign.dynamic_highp_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007589,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul_assign.dynamic_lowp_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007590,
        "dEQP-GLES2.functional.shaders.matrix.",
        "mul_assign.dynamic_lowp_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007591,
        "dEQP-GLES2.functional.shaders.matrix.",
        "mul_assign.dynamic_mediump_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007592,
        "dEQP-GLES2.functional.shaders.matrix.m",
        "ul_assign.dynamic_mediump_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007593,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul_assign.dynamic_highp_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007594,
        "dEQP-GLES2.functional.shaders.matrix.",
        "mul_assign.dynamic_highp_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007595,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul_assign.dynamic_lowp_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007596,
        "dEQP-GLES2.functional.shaders.matrix.",
        "mul_assign.dynamic_lowp_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007597,
        "dEQP-GLES2.functional.shaders.matrix.",
        "mul_assign.dynamic_mediump_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007598,
        "dEQP-GLES2.functional.shaders.matrix.m",
        "ul_assign.dynamic_mediump_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007599,
        "dEQP-GLES2.functional.shaders.matrix",
        ".mul_assign.dynamic_highp_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007600,
        "dEQP-GLES2.functional.shaders.matrix.",
        "mul_assign.dynamic_highp_mat4_fragment");
