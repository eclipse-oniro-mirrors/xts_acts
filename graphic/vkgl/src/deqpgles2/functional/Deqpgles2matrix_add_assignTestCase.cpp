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

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007547,
        "dEQP-GLES2.functional.shaders.matrix",
        ".add_assign.dynamic_lowp_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007548,
        "dEQP-GLES2.functional.shaders.matrix.",
        "add_assign.dynamic_lowp_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007549,
        "dEQP-GLES2.functional.shaders.matrix.",
        "add_assign.dynamic_mediump_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007550,
        "dEQP-GLES2.functional.shaders.matrix.a",
        "dd_assign.dynamic_mediump_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007551,
        "dEQP-GLES2.functional.shaders.matrix",
        ".add_assign.dynamic_highp_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007552,
        "dEQP-GLES2.functional.shaders.matrix.",
        "add_assign.dynamic_highp_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007553,
        "dEQP-GLES2.functional.shaders.matrix",
        ".add_assign.dynamic_lowp_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007554,
        "dEQP-GLES2.functional.shaders.matrix.",
        "add_assign.dynamic_lowp_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007555,
        "dEQP-GLES2.functional.shaders.matrix.",
        "add_assign.dynamic_mediump_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007556,
        "dEQP-GLES2.functional.shaders.matrix.a",
        "dd_assign.dynamic_mediump_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007557,
        "dEQP-GLES2.functional.shaders.matrix",
        ".add_assign.dynamic_highp_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007558,
        "dEQP-GLES2.functional.shaders.matrix.",
        "add_assign.dynamic_highp_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007559,
        "dEQP-GLES2.functional.shaders.matrix",
        ".add_assign.dynamic_lowp_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007560,
        "dEQP-GLES2.functional.shaders.matrix.",
        "add_assign.dynamic_lowp_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007561,
        "dEQP-GLES2.functional.shaders.matrix.",
        "add_assign.dynamic_mediump_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007562,
        "dEQP-GLES2.functional.shaders.matrix.a",
        "dd_assign.dynamic_mediump_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007563,
        "dEQP-GLES2.functional.shaders.matrix",
        ".add_assign.dynamic_highp_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007564,
        "dEQP-GLES2.functional.shaders.matrix.",
        "add_assign.dynamic_highp_mat4_fragment");
