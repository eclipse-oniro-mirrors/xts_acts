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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30020TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019656,
        "dEQP-GLES3.functional.shaders.constant_",
        "expressions.operators.math_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019657,
        "dEQP-GLES3.functional.shaders.constant_e",
        "xpressions.operators.math_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019658,
        "dEQP-GLES3.functional.shaders.constant",
        "_expressions.operators.math_vec_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019659,
        "dEQP-GLES3.functional.shaders.constant_",
        "expressions.operators.math_vec_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019660,
        "dEQP-GLES3.functional.shaders.constant",
        "_expressions.operators.math_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019661,
        "dEQP-GLES3.functional.shaders.constant_",
        "expressions.operators.math_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019662,
        "dEQP-GLES3.functional.shaders.constant",
        "_expressions.operators.math_ivec_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019663,
        "dEQP-GLES3.functional.shaders.constant_",
        "expressions.operators.math_ivec_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019664,
        "dEQP-GLES3.functional.shaders.constant",
        "_expressions.operators.math_mat_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019665,
        "dEQP-GLES3.functional.shaders.constant_",
        "expressions.operators.math_mat_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019666,
        "dEQP-GLES3.functional.shaders.constan",
        "t_expressions.operators.bitwise_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019667,
        "dEQP-GLES3.functional.shaders.constant",
        "_expressions.operators.bitwise_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019668,
        "dEQP-GLES3.functional.shaders.constan",
        "t_expressions.operators.logical_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019669,
        "dEQP-GLES3.functional.shaders.constant",
        "_expressions.operators.logical_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019670,
        "dEQP-GLES3.functional.shaders.constan",
        "t_expressions.operators.compare_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019671,
        "dEQP-GLES3.functional.shaders.constant",
        "_expressions.operators.compare_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019672,
        "dEQP-GLES3.functional.shaders.constant",
        "_expressions.operators.selection_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019673,
        "dEQP-GLES3.functional.shaders.constant_",
        "expressions.operators.selection_fragment");
