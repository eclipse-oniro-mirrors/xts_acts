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

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007601,
        "dEQP-GLES2.functional.shaders.matrix",
        ".div_assign.dynamic_lowp_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007602,
        "dEQP-GLES2.functional.shaders.matrix.",
        "div_assign.dynamic_lowp_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007603,
        "dEQP-GLES2.functional.shaders.matrix.",
        "div_assign.dynamic_mediump_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007604,
        "dEQP-GLES2.functional.shaders.matrix.d",
        "iv_assign.dynamic_mediump_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007605,
        "dEQP-GLES2.functional.shaders.matrix",
        ".div_assign.dynamic_highp_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007606,
        "dEQP-GLES2.functional.shaders.matrix.",
        "div_assign.dynamic_highp_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007607,
        "dEQP-GLES2.functional.shaders.matrix",
        ".div_assign.dynamic_lowp_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007608,
        "dEQP-GLES2.functional.shaders.matrix.",
        "div_assign.dynamic_lowp_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007609,
        "dEQP-GLES2.functional.shaders.matrix.",
        "div_assign.dynamic_mediump_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007610,
        "dEQP-GLES2.functional.shaders.matrix.d",
        "iv_assign.dynamic_mediump_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007611,
        "dEQP-GLES2.functional.shaders.matrix",
        ".div_assign.dynamic_highp_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007612,
        "dEQP-GLES2.functional.shaders.matrix.",
        "div_assign.dynamic_highp_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007613,
        "dEQP-GLES2.functional.shaders.matrix",
        ".div_assign.dynamic_lowp_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007614,
        "dEQP-GLES2.functional.shaders.matrix.",
        "div_assign.dynamic_lowp_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007615,
        "dEQP-GLES2.functional.shaders.matrix.",
        "div_assign.dynamic_mediump_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007616,
        "dEQP-GLES2.functional.shaders.matrix.d",
        "iv_assign.dynamic_mediump_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007617,
        "dEQP-GLES2.functional.shaders.matrix",
        ".div_assign.dynamic_highp_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007618,
        "dEQP-GLES2.functional.shaders.matrix.",
        "div_assign.dynamic_highp_mat4_fragment");
