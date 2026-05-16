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
#include "../ActsDeqpgles20006TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005602,
        "dEQP-GLES2.functional.shaders.operator.binar",
        "y_operator.greater_or_equal.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005603,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.greater_or_equal.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005604,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.greater_or_equal.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005605,
        "dEQP-GLES2.functional.shaders.operator.binary_o",
        "perator.greater_or_equal.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005606,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.greater_or_equal.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005607,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.greater_or_equal.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005608,
        "dEQP-GLES2.functional.shaders.operator.bina",
        "ry_operator.greater_or_equal.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005609,
        "dEQP-GLES2.functional.shaders.operator.binar",
        "y_operator.greater_or_equal.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005610,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.greater_or_equal.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005611,
        "dEQP-GLES2.functional.shaders.operator.binary_",
        "operator.greater_or_equal.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005612,
        "dEQP-GLES2.functional.shaders.operator.binar",
        "y_operator.greater_or_equal.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005613,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.greater_or_equal.highp_int_fragment");
