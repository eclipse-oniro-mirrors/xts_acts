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

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007511,
        "dEQP-GLES2.functional.shaders.matrix.p",
        "ost_increment.dynamic_lowp_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007512,
        "dEQP-GLES2.functional.shaders.matrix.po",
        "st_increment.dynamic_lowp_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007513,
        "dEQP-GLES2.functional.shaders.matrix.po",
        "st_increment.dynamic_mediump_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007514,
        "dEQP-GLES2.functional.shaders.matrix.pos",
        "t_increment.dynamic_mediump_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007515,
        "dEQP-GLES2.functional.shaders.matrix.p",
        "ost_increment.dynamic_highp_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007516,
        "dEQP-GLES2.functional.shaders.matrix.po",
        "st_increment.dynamic_highp_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007517,
        "dEQP-GLES2.functional.shaders.matrix.p",
        "ost_increment.dynamic_lowp_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007518,
        "dEQP-GLES2.functional.shaders.matrix.po",
        "st_increment.dynamic_lowp_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007519,
        "dEQP-GLES2.functional.shaders.matrix.po",
        "st_increment.dynamic_mediump_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007520,
        "dEQP-GLES2.functional.shaders.matrix.pos",
        "t_increment.dynamic_mediump_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007521,
        "dEQP-GLES2.functional.shaders.matrix.p",
        "ost_increment.dynamic_highp_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007522,
        "dEQP-GLES2.functional.shaders.matrix.po",
        "st_increment.dynamic_highp_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007523,
        "dEQP-GLES2.functional.shaders.matrix.p",
        "ost_increment.dynamic_lowp_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007524,
        "dEQP-GLES2.functional.shaders.matrix.po",
        "st_increment.dynamic_lowp_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007525,
        "dEQP-GLES2.functional.shaders.matrix.po",
        "st_increment.dynamic_mediump_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007526,
        "dEQP-GLES2.functional.shaders.matrix.pos",
        "t_increment.dynamic_mediump_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007527,
        "dEQP-GLES2.functional.shaders.matrix.p",
        "ost_increment.dynamic_highp_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007528,
        "dEQP-GLES2.functional.shaders.matrix.po",
        "st_increment.dynamic_highp_mat4_fragment");
