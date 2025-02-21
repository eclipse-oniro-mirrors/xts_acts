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
#include "../ActsDeqpgles20001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000301,
        "dEQP-GLES2.functional.shaders.preproc",
        "essor.invalid_ops.invalid_op_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000302,
        "dEQP-GLES2.functional.shaders.preproce",
        "ssor.invalid_ops.invalid_op_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000303,
        "dEQP-GLES2.functional.shaders.preproc",
        "essor.invalid_ops.invalid_op_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000304,
        "dEQP-GLES2.functional.shaders.preproce",
        "ssor.invalid_ops.invalid_op_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000305,
        "dEQP-GLES2.functional.shaders.preprocessor.invali",
        "d_ops.invalid_defined_expected_identifier_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000306,
        "dEQP-GLES2.functional.shaders.preprocessor.invalid",
        "_ops.invalid_defined_expected_identifier_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000307,
        "dEQP-GLES2.functional.shaders.preprocessor.invali",
        "d_ops.invalid_defined_expected_identifier_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000308,
        "dEQP-GLES2.functional.shaders.preprocessor.invalid",
        "_ops.invalid_defined_expected_identifier_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000309,
        "dEQP-GLES2.functional.shaders.preprocessor.invali",
        "d_ops.invalid_defined_expected_identifier_3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000310,
        "dEQP-GLES2.functional.shaders.preprocessor.invalid",
        "_ops.invalid_defined_expected_identifier_3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000311,
        "dEQP-GLES2.functional.shaders.preprocessor.invali",
        "d_ops.invalid_defined_expected_identifier_4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000312,
        "dEQP-GLES2.functional.shaders.preprocessor.invalid",
        "_ops.invalid_defined_expected_identifier_4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000313,
        "dEQP-GLES2.functional.shaders.preprocessor.invali",
        "d_ops.invalid_defined_expected_identifier_5_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000314,
        "dEQP-GLES2.functional.shaders.preprocessor.invalid",
        "_ops.invalid_defined_expected_identifier_5_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000315,
        "dEQP-GLES2.functional.shaders.preprocessor.inv",
        "alid_ops.invalid_defined_expected_rparen_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000316,
        "dEQP-GLES2.functional.shaders.preprocessor.inva",
        "lid_ops.invalid_defined_expected_rparen_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000317,
        "dEQP-GLES2.functional.shaders.preproce",
        "ssor.invalid_ops.defined_define_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000318,
        "dEQP-GLES2.functional.shaders.preproces",
        "sor.invalid_ops.defined_define_fragment");
