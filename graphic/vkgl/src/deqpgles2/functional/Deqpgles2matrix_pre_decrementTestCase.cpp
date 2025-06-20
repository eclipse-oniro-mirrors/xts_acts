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

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007493,
        "dEQP-GLES2.functional.shaders.matrix.",
        "pre_decrement.dynamic_lowp_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007494,
        "dEQP-GLES2.functional.shaders.matrix.p",
        "re_decrement.dynamic_lowp_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007495,
        "dEQP-GLES2.functional.shaders.matrix.pr",
        "e_decrement.dynamic_mediump_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007496,
        "dEQP-GLES2.functional.shaders.matrix.pre",
        "_decrement.dynamic_mediump_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007497,
        "dEQP-GLES2.functional.shaders.matrix.p",
        "re_decrement.dynamic_highp_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007498,
        "dEQP-GLES2.functional.shaders.matrix.pr",
        "e_decrement.dynamic_highp_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007499,
        "dEQP-GLES2.functional.shaders.matrix.",
        "pre_decrement.dynamic_lowp_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007500,
        "dEQP-GLES2.functional.shaders.matrix.p",
        "re_decrement.dynamic_lowp_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007501,
        "dEQP-GLES2.functional.shaders.matrix.pr",
        "e_decrement.dynamic_mediump_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007502,
        "dEQP-GLES2.functional.shaders.matrix.pre",
        "_decrement.dynamic_mediump_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007503,
        "dEQP-GLES2.functional.shaders.matrix.p",
        "re_decrement.dynamic_highp_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007504,
        "dEQP-GLES2.functional.shaders.matrix.pr",
        "e_decrement.dynamic_highp_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007505,
        "dEQP-GLES2.functional.shaders.matrix.",
        "pre_decrement.dynamic_lowp_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007506,
        "dEQP-GLES2.functional.shaders.matrix.p",
        "re_decrement.dynamic_lowp_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007507,
        "dEQP-GLES2.functional.shaders.matrix.pr",
        "e_decrement.dynamic_mediump_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007508,
        "dEQP-GLES2.functional.shaders.matrix.pre",
        "_decrement.dynamic_mediump_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007509,
        "dEQP-GLES2.functional.shaders.matrix.p",
        "re_decrement.dynamic_highp_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007510,
        "dEQP-GLES2.functional.shaders.matrix.pr",
        "e_decrement.dynamic_highp_mat4_fragment");
