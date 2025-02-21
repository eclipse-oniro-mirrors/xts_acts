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

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007878,
        "dEQP-GLES2.functional.shaders.constant_",
        "expressions.operators.math_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007879,
        "dEQP-GLES2.functional.shaders.constant_e",
        "xpressions.operators.math_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007880,
        "dEQP-GLES2.functional.shaders.constant",
        "_expressions.operators.math_vec_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007881,
        "dEQP-GLES2.functional.shaders.constant_",
        "expressions.operators.math_vec_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007882,
        "dEQP-GLES2.functional.shaders.constant",
        "_expressions.operators.math_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007883,
        "dEQP-GLES2.functional.shaders.constant_",
        "expressions.operators.math_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007884,
        "dEQP-GLES2.functional.shaders.constant",
        "_expressions.operators.math_ivec_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007885,
        "dEQP-GLES2.functional.shaders.constant_",
        "expressions.operators.math_ivec_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007886,
        "dEQP-GLES2.functional.shaders.constant",
        "_expressions.operators.math_mat_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007887,
        "dEQP-GLES2.functional.shaders.constant_",
        "expressions.operators.math_mat_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007888,
        "dEQP-GLES2.functional.shaders.constan",
        "t_expressions.operators.logical_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007889,
        "dEQP-GLES2.functional.shaders.constant",
        "_expressions.operators.logical_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007890,
        "dEQP-GLES2.functional.shaders.constan",
        "t_expressions.operators.compare_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007891,
        "dEQP-GLES2.functional.shaders.constant",
        "_expressions.operators.compare_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007892,
        "dEQP-GLES2.functional.shaders.constant",
        "_expressions.operators.selection_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007893,
        "dEQP-GLES2.functional.shaders.constant_",
        "expressions.operators.selection_fragment");
