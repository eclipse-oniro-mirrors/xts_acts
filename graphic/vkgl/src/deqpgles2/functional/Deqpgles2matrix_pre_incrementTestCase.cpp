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

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007475,
        "dEQP-GLES2.functional.shaders.matrix.",
        "pre_increment.dynamic_lowp_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007476,
        "dEQP-GLES2.functional.shaders.matrix.p",
        "re_increment.dynamic_lowp_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007477,
        "dEQP-GLES2.functional.shaders.matrix.pr",
        "e_increment.dynamic_mediump_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007478,
        "dEQP-GLES2.functional.shaders.matrix.pre",
        "_increment.dynamic_mediump_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007479,
        "dEQP-GLES2.functional.shaders.matrix.p",
        "re_increment.dynamic_highp_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007480,
        "dEQP-GLES2.functional.shaders.matrix.pr",
        "e_increment.dynamic_highp_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007481,
        "dEQP-GLES2.functional.shaders.matrix.",
        "pre_increment.dynamic_lowp_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007482,
        "dEQP-GLES2.functional.shaders.matrix.p",
        "re_increment.dynamic_lowp_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007483,
        "dEQP-GLES2.functional.shaders.matrix.pr",
        "e_increment.dynamic_mediump_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007484,
        "dEQP-GLES2.functional.shaders.matrix.pre",
        "_increment.dynamic_mediump_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007485,
        "dEQP-GLES2.functional.shaders.matrix.p",
        "re_increment.dynamic_highp_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007486,
        "dEQP-GLES2.functional.shaders.matrix.pr",
        "e_increment.dynamic_highp_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007487,
        "dEQP-GLES2.functional.shaders.matrix.",
        "pre_increment.dynamic_lowp_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007488,
        "dEQP-GLES2.functional.shaders.matrix.p",
        "re_increment.dynamic_lowp_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007489,
        "dEQP-GLES2.functional.shaders.matrix.pr",
        "e_increment.dynamic_mediump_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007490,
        "dEQP-GLES2.functional.shaders.matrix.pre",
        "_increment.dynamic_mediump_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007491,
        "dEQP-GLES2.functional.shaders.matrix.p",
        "re_increment.dynamic_highp_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007492,
        "dEQP-GLES2.functional.shaders.matrix.pr",
        "e_increment.dynamic_highp_mat4_fragment");
