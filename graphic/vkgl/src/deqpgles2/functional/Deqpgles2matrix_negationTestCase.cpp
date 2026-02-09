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

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007457,
        "dEQP-GLES2.functional.shaders.matri",
        "x.negation.dynamic_lowp_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007458,
        "dEQP-GLES2.functional.shaders.matrix",
        ".negation.dynamic_lowp_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007459,
        "dEQP-GLES2.functional.shaders.matrix",
        ".negation.dynamic_mediump_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007460,
        "dEQP-GLES2.functional.shaders.matrix.",
        "negation.dynamic_mediump_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007461,
        "dEQP-GLES2.functional.shaders.matri",
        "x.negation.dynamic_highp_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007462,
        "dEQP-GLES2.functional.shaders.matrix",
        ".negation.dynamic_highp_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007463,
        "dEQP-GLES2.functional.shaders.matri",
        "x.negation.dynamic_lowp_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007464,
        "dEQP-GLES2.functional.shaders.matrix",
        ".negation.dynamic_lowp_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007465,
        "dEQP-GLES2.functional.shaders.matrix",
        ".negation.dynamic_mediump_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007466,
        "dEQP-GLES2.functional.shaders.matrix.",
        "negation.dynamic_mediump_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007467,
        "dEQP-GLES2.functional.shaders.matri",
        "x.negation.dynamic_highp_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007468,
        "dEQP-GLES2.functional.shaders.matrix",
        ".negation.dynamic_highp_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007469,
        "dEQP-GLES2.functional.shaders.matri",
        "x.negation.dynamic_lowp_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007470,
        "dEQP-GLES2.functional.shaders.matrix",
        ".negation.dynamic_lowp_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007471,
        "dEQP-GLES2.functional.shaders.matrix",
        ".negation.dynamic_mediump_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007472,
        "dEQP-GLES2.functional.shaders.matrix.",
        "negation.dynamic_mediump_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007473,
        "dEQP-GLES2.functional.shaders.matri",
        "x.negation.dynamic_highp_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007474,
        "dEQP-GLES2.functional.shaders.matrix",
        ".negation.dynamic_highp_mat4_fragment");
