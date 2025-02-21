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

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005578,
        "dEQP-GLES2.functional.shaders.operator.bina",
        "ry_operator.less_or_equal.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005579,
        "dEQP-GLES2.functional.shaders.operator.binar",
        "y_operator.less_or_equal.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005580,
        "dEQP-GLES2.functional.shaders.operator.binar",
        "y_operator.less_or_equal.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005581,
        "dEQP-GLES2.functional.shaders.operator.binary",
        "_operator.less_or_equal.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005582,
        "dEQP-GLES2.functional.shaders.operator.bina",
        "ry_operator.less_or_equal.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005583,
        "dEQP-GLES2.functional.shaders.operator.binar",
        "y_operator.less_or_equal.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005584,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.less_or_equal.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005585,
        "dEQP-GLES2.functional.shaders.operator.bina",
        "ry_operator.less_or_equal.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005586,
        "dEQP-GLES2.functional.shaders.operator.bina",
        "ry_operator.less_or_equal.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005587,
        "dEQP-GLES2.functional.shaders.operator.binar",
        "y_operator.less_or_equal.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005588,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.less_or_equal.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005589,
        "dEQP-GLES2.functional.shaders.operator.bina",
        "ry_operator.less_or_equal.highp_int_fragment");
