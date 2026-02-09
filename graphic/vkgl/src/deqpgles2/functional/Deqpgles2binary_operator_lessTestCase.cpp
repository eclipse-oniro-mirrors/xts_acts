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

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005566,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.less.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005567,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.less.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005568,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.less.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005569,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.less.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005570,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.less.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005571,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.less.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005572,
        "dEQP-GLES2.functional.shaders.operato",
        "r.binary_operator.less.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005573,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.less.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005574,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.less.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005575,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.less.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005576,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.less.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005577,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.less.highp_int_fragment");
