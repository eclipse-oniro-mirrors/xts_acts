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

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007421,
        "dEQP-GLES2.functional.shaders.matrix.mat",
        "rixcompmult.dynamic_lowp_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007422,
        "dEQP-GLES2.functional.shaders.matrix.matr",
        "ixcompmult.dynamic_lowp_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007423,
        "dEQP-GLES2.functional.shaders.matrix.matri",
        "xcompmult.dynamic_mediump_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007424,
        "dEQP-GLES2.functional.shaders.matrix.matrix",
        "compmult.dynamic_mediump_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007425,
        "dEQP-GLES2.functional.shaders.matrix.matr",
        "ixcompmult.dynamic_highp_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007426,
        "dEQP-GLES2.functional.shaders.matrix.matri",
        "xcompmult.dynamic_highp_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007427,
        "dEQP-GLES2.functional.shaders.matrix.mat",
        "rixcompmult.dynamic_lowp_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007428,
        "dEQP-GLES2.functional.shaders.matrix.matr",
        "ixcompmult.dynamic_lowp_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007429,
        "dEQP-GLES2.functional.shaders.matrix.matri",
        "xcompmult.dynamic_mediump_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007430,
        "dEQP-GLES2.functional.shaders.matrix.matrix",
        "compmult.dynamic_mediump_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007431,
        "dEQP-GLES2.functional.shaders.matrix.matr",
        "ixcompmult.dynamic_highp_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007432,
        "dEQP-GLES2.functional.shaders.matrix.matri",
        "xcompmult.dynamic_highp_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007433,
        "dEQP-GLES2.functional.shaders.matrix.mat",
        "rixcompmult.dynamic_lowp_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007434,
        "dEQP-GLES2.functional.shaders.matrix.matr",
        "ixcompmult.dynamic_lowp_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007435,
        "dEQP-GLES2.functional.shaders.matrix.matri",
        "xcompmult.dynamic_mediump_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007436,
        "dEQP-GLES2.functional.shaders.matrix.matrix",
        "compmult.dynamic_mediump_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007437,
        "dEQP-GLES2.functional.shaders.matrix.matr",
        "ixcompmult.dynamic_highp_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007438,
        "dEQP-GLES2.functional.shaders.matrix.matri",
        "xcompmult.dynamic_highp_mat4_mat4_fragment");
