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

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002159,
        "dEQP-GLES2.functional.shaders.fun",
        "ctions.misc.multi_arg_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002160,
        "dEQP-GLES2.functional.shaders.func",
        "tions.misc.multi_arg_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002161,
        "dEQP-GLES2.functional.shaders.fu",
        "nctions.misc.multi_arg_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002162,
        "dEQP-GLES2.functional.shaders.fun",
        "ctions.misc.multi_arg_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002163,
        "dEQP-GLES2.functional.shaders.functi",
        "ons.misc.argument_eval_order_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002164,
        "dEQP-GLES2.functional.shaders.functio",
        "ns.misc.argument_eval_order_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002165,
        "dEQP-GLES2.functional.shaders.functi",
        "ons.misc.argument_eval_order_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002166,
        "dEQP-GLES2.functional.shaders.functio",
        "ns.misc.argument_eval_order_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002167,
        "dEQP-GLES2.functional.shaders.fun",
        "ctions.misc.missing_returns_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002168,
        "dEQP-GLES2.functional.shaders.func",
        "tions.misc.missing_returns_fragment");
