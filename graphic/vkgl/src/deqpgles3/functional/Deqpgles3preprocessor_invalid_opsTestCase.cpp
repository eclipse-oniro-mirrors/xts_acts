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
#include "../ActsDeqpgles30001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000978,
        "dEQP-GLES3.functional.shaders.preproc",
        "essor.invalid_ops.invalid_op_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000979,
        "dEQP-GLES3.functional.shaders.preproce",
        "ssor.invalid_ops.invalid_op_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000980,
        "dEQP-GLES3.functional.shaders.preproc",
        "essor.invalid_ops.invalid_op_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000981,
        "dEQP-GLES3.functional.shaders.preproce",
        "ssor.invalid_ops.invalid_op_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000982,
        "dEQP-GLES3.functional.shaders.preprocessor.invali",
        "d_ops.invalid_defined_expected_identifier_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000983,
        "dEQP-GLES3.functional.shaders.preprocessor.invalid",
        "_ops.invalid_defined_expected_identifier_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000984,
        "dEQP-GLES3.functional.shaders.preprocessor.invali",
        "d_ops.invalid_defined_expected_identifier_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000985,
        "dEQP-GLES3.functional.shaders.preprocessor.invalid",
        "_ops.invalid_defined_expected_identifier_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000986,
        "dEQP-GLES3.functional.shaders.preprocessor.invali",
        "d_ops.invalid_defined_expected_identifier_3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000987,
        "dEQP-GLES3.functional.shaders.preprocessor.invalid",
        "_ops.invalid_defined_expected_identifier_3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000988,
        "dEQP-GLES3.functional.shaders.preprocessor.invali",
        "d_ops.invalid_defined_expected_identifier_4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000989,
        "dEQP-GLES3.functional.shaders.preprocessor.invalid",
        "_ops.invalid_defined_expected_identifier_4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000990,
        "dEQP-GLES3.functional.shaders.preprocessor.invali",
        "d_ops.invalid_defined_expected_identifier_5_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000991,
        "dEQP-GLES3.functional.shaders.preprocessor.invalid",
        "_ops.invalid_defined_expected_identifier_5_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000992,
        "dEQP-GLES3.functional.shaders.preprocessor.inv",
        "alid_ops.invalid_defined_expected_rparen_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000993,
        "dEQP-GLES3.functional.shaders.preprocessor.inva",
        "lid_ops.invalid_defined_expected_rparen_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000994,
        "dEQP-GLES3.functional.shaders.preproce",
        "ssor.invalid_ops.defined_define_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000995,
        "dEQP-GLES3.functional.shaders.preproces",
        "sor.invalid_ops.defined_define_fragment");
