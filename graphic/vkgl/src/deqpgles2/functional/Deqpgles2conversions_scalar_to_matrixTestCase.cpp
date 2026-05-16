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
#include "../ActsDeqpgles20002TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001065,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.scalar_to_matrix.float_to_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001066,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.scalar_to_matrix.float_to_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001067,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.scalar_to_matrix.float_to_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001068,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.scalar_to_matrix.float_to_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001069,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.scalar_to_matrix.float_to_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001070,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.scalar_to_matrix.float_to_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001071,
        "dEQP-GLES2.functional.shaders.conversi",
        "ons.scalar_to_matrix.int_to_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001072,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.scalar_to_matrix.int_to_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001073,
        "dEQP-GLES2.functional.shaders.conversi",
        "ons.scalar_to_matrix.int_to_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001074,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.scalar_to_matrix.int_to_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001075,
        "dEQP-GLES2.functional.shaders.conversi",
        "ons.scalar_to_matrix.int_to_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001076,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.scalar_to_matrix.int_to_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001077,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.scalar_to_matrix.bool_to_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001078,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.scalar_to_matrix.bool_to_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001079,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.scalar_to_matrix.bool_to_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001080,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.scalar_to_matrix.bool_to_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001081,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.scalar_to_matrix.bool_to_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001082,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.scalar_to_matrix.bool_to_mat2_fragment");
