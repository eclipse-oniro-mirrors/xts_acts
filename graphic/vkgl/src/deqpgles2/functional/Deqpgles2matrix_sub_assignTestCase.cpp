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

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007565,
        "dEQP-GLES2.functional.shaders.matrix",
        ".sub_assign.dynamic_lowp_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007566,
        "dEQP-GLES2.functional.shaders.matrix.",
        "sub_assign.dynamic_lowp_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007567,
        "dEQP-GLES2.functional.shaders.matrix.",
        "sub_assign.dynamic_mediump_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007568,
        "dEQP-GLES2.functional.shaders.matrix.s",
        "ub_assign.dynamic_mediump_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007569,
        "dEQP-GLES2.functional.shaders.matrix",
        ".sub_assign.dynamic_highp_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007570,
        "dEQP-GLES2.functional.shaders.matrix.",
        "sub_assign.dynamic_highp_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007571,
        "dEQP-GLES2.functional.shaders.matrix",
        ".sub_assign.dynamic_lowp_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007572,
        "dEQP-GLES2.functional.shaders.matrix.",
        "sub_assign.dynamic_lowp_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007573,
        "dEQP-GLES2.functional.shaders.matrix.",
        "sub_assign.dynamic_mediump_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007574,
        "dEQP-GLES2.functional.shaders.matrix.s",
        "ub_assign.dynamic_mediump_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007575,
        "dEQP-GLES2.functional.shaders.matrix",
        ".sub_assign.dynamic_highp_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007576,
        "dEQP-GLES2.functional.shaders.matrix.",
        "sub_assign.dynamic_highp_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007577,
        "dEQP-GLES2.functional.shaders.matrix",
        ".sub_assign.dynamic_lowp_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007578,
        "dEQP-GLES2.functional.shaders.matrix.",
        "sub_assign.dynamic_lowp_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007579,
        "dEQP-GLES2.functional.shaders.matrix.",
        "sub_assign.dynamic_mediump_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007580,
        "dEQP-GLES2.functional.shaders.matrix.s",
        "ub_assign.dynamic_mediump_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007581,
        "dEQP-GLES2.functional.shaders.matrix",
        ".sub_assign.dynamic_highp_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007582,
        "dEQP-GLES2.functional.shaders.matrix.",
        "sub_assign.dynamic_highp_mat4_fragment");
