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

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001083,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.matrix_to_matrix.mat4_to_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001084,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.matrix_to_matrix.mat4_to_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001085,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.matrix_to_matrix.mat4_to_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001086,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.matrix_to_matrix.mat4_to_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001087,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.matrix_to_matrix.mat4_to_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001088,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.matrix_to_matrix.mat4_to_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001089,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.matrix_to_matrix.mat3_to_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001090,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.matrix_to_matrix.mat3_to_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001091,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.matrix_to_matrix.mat3_to_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001092,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.matrix_to_matrix.mat3_to_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001093,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.matrix_to_matrix.mat3_to_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001094,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.matrix_to_matrix.mat3_to_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001095,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.matrix_to_matrix.mat2_to_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001096,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.matrix_to_matrix.mat2_to_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001097,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.matrix_to_matrix.mat2_to_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001098,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.matrix_to_matrix.mat2_to_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001099,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.matrix_to_matrix.mat2_to_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001100,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.matrix_to_matrix.mat2_to_mat2_fragment");
