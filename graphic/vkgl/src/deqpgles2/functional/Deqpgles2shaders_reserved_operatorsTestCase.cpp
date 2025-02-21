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
#include "../ActsDeqpgles20003TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002347,
        "dEQP-GLES2.functional.shaders.reser",
        "ved_operators.operator_modulo_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002348,
        "dEQP-GLES2.functional.shaders.reserv",
        "ed_operators.operator_modulo_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002349,
        "dEQP-GLES2.functional.shaders.reserved_op",
        "erators.operator_bitwise_shift_left_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002350,
        "dEQP-GLES2.functional.shaders.reserved_ope",
        "rators.operator_bitwise_shift_left_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002351,
        "dEQP-GLES2.functional.shaders.reserved_ope",
        "rators.operator_bitwise_shift_right_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002352,
        "dEQP-GLES2.functional.shaders.reserved_oper",
        "ators.operator_bitwise_shift_right_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002353,
        "dEQP-GLES2.functional.shaders.reserved",
        "_operators.operator_bitwise_and_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002354,
        "dEQP-GLES2.functional.shaders.reserved_",
        "operators.operator_bitwise_and_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002355,
        "dEQP-GLES2.functional.shaders.reserved",
        "_operators.operator_bitwise_xor_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002356,
        "dEQP-GLES2.functional.shaders.reserved_",
        "operators.operator_bitwise_xor_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002357,
        "dEQP-GLES2.functional.shaders.reserve",
        "d_operators.operator_bitwise_or_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002358,
        "dEQP-GLES2.functional.shaders.reserved",
        "_operators.operator_bitwise_or_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002359,
        "dEQP-GLES2.functional.shaders.reserved_",
        "operators.operator_assign_modulo_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002360,
        "dEQP-GLES2.functional.shaders.reserved_o",
        "perators.operator_assign_modulo_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002361,
        "dEQP-GLES2.functional.shaders.reserved_op",
        "erators.operator_assign_shift_left_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002362,
        "dEQP-GLES2.functional.shaders.reserved_ope",
        "rators.operator_assign_shift_left_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002363,
        "dEQP-GLES2.functional.shaders.reserved_op",
        "erators.operator_assign_shift_right_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002364,
        "dEQP-GLES2.functional.shaders.reserved_ope",
        "rators.operator_assign_shift_right_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002365,
        "dEQP-GLES2.functional.shaders.reserve",
        "d_operators.operator_assign_and_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002366,
        "dEQP-GLES2.functional.shaders.reserved",
        "_operators.operator_assign_and_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002367,
        "dEQP-GLES2.functional.shaders.reserve",
        "d_operators.operator_assign_xor_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002368,
        "dEQP-GLES2.functional.shaders.reserved",
        "_operators.operator_assign_xor_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002369,
        "dEQP-GLES2.functional.shaders.reserve",
        "d_operators.operator_assign_or_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002370,
        "dEQP-GLES2.functional.shaders.reserved",
        "_operators.operator_assign_or_fragment");
