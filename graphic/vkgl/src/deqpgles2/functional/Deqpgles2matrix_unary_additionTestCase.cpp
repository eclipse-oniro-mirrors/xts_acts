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

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007439,
        "dEQP-GLES2.functional.shaders.matrix.u",
        "nary_addition.dynamic_lowp_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007440,
        "dEQP-GLES2.functional.shaders.matrix.un",
        "ary_addition.dynamic_lowp_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007441,
        "dEQP-GLES2.functional.shaders.matrix.un",
        "ary_addition.dynamic_mediump_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007442,
        "dEQP-GLES2.functional.shaders.matrix.una",
        "ry_addition.dynamic_mediump_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007443,
        "dEQP-GLES2.functional.shaders.matrix.u",
        "nary_addition.dynamic_highp_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007444,
        "dEQP-GLES2.functional.shaders.matrix.un",
        "ary_addition.dynamic_highp_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007445,
        "dEQP-GLES2.functional.shaders.matrix.u",
        "nary_addition.dynamic_lowp_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007446,
        "dEQP-GLES2.functional.shaders.matrix.un",
        "ary_addition.dynamic_lowp_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007447,
        "dEQP-GLES2.functional.shaders.matrix.un",
        "ary_addition.dynamic_mediump_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007448,
        "dEQP-GLES2.functional.shaders.matrix.una",
        "ry_addition.dynamic_mediump_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007449,
        "dEQP-GLES2.functional.shaders.matrix.u",
        "nary_addition.dynamic_highp_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007450,
        "dEQP-GLES2.functional.shaders.matrix.un",
        "ary_addition.dynamic_highp_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007451,
        "dEQP-GLES2.functional.shaders.matrix.u",
        "nary_addition.dynamic_lowp_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007452,
        "dEQP-GLES2.functional.shaders.matrix.un",
        "ary_addition.dynamic_lowp_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007453,
        "dEQP-GLES2.functional.shaders.matrix.un",
        "ary_addition.dynamic_mediump_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007454,
        "dEQP-GLES2.functional.shaders.matrix.una",
        "ry_addition.dynamic_mediump_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007455,
        "dEQP-GLES2.functional.shaders.matrix.u",
        "nary_addition.dynamic_highp_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007456,
        "dEQP-GLES2.functional.shaders.matrix.un",
        "ary_addition.dynamic_highp_mat4_fragment");
