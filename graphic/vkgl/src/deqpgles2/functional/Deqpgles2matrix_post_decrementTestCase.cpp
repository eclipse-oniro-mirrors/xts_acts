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

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007529,
        "dEQP-GLES2.functional.shaders.matrix.p",
        "ost_decrement.dynamic_lowp_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007530,
        "dEQP-GLES2.functional.shaders.matrix.po",
        "st_decrement.dynamic_lowp_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007531,
        "dEQP-GLES2.functional.shaders.matrix.po",
        "st_decrement.dynamic_mediump_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007532,
        "dEQP-GLES2.functional.shaders.matrix.pos",
        "t_decrement.dynamic_mediump_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007533,
        "dEQP-GLES2.functional.shaders.matrix.p",
        "ost_decrement.dynamic_highp_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007534,
        "dEQP-GLES2.functional.shaders.matrix.po",
        "st_decrement.dynamic_highp_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007535,
        "dEQP-GLES2.functional.shaders.matrix.p",
        "ost_decrement.dynamic_lowp_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007536,
        "dEQP-GLES2.functional.shaders.matrix.po",
        "st_decrement.dynamic_lowp_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007537,
        "dEQP-GLES2.functional.shaders.matrix.po",
        "st_decrement.dynamic_mediump_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007538,
        "dEQP-GLES2.functional.shaders.matrix.pos",
        "t_decrement.dynamic_mediump_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007539,
        "dEQP-GLES2.functional.shaders.matrix.p",
        "ost_decrement.dynamic_highp_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007540,
        "dEQP-GLES2.functional.shaders.matrix.po",
        "st_decrement.dynamic_highp_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007541,
        "dEQP-GLES2.functional.shaders.matrix.p",
        "ost_decrement.dynamic_lowp_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007542,
        "dEQP-GLES2.functional.shaders.matrix.po",
        "st_decrement.dynamic_lowp_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007543,
        "dEQP-GLES2.functional.shaders.matrix.po",
        "st_decrement.dynamic_mediump_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007544,
        "dEQP-GLES2.functional.shaders.matrix.pos",
        "t_decrement.dynamic_mediump_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007545,
        "dEQP-GLES2.functional.shaders.matrix.p",
        "ost_decrement.dynamic_highp_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007546,
        "dEQP-GLES2.functional.shaders.matrix.po",
        "st_decrement.dynamic_highp_mat4_fragment");
