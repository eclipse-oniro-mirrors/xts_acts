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

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005590,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.greater.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005591,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.greater.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005592,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.greater.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005593,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.greater.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005594,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.greater.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005595,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.greater.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005596,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.greater.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005597,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.greater.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005598,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.greater.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005599,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.greater.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005600,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.greater.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005601,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.greater.highp_int_fragment");
