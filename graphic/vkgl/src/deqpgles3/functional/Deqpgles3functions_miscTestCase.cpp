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
#include "../ActsDeqpgles30005TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004229,
        "dEQP-GLES3.functional.shaders.fun",
        "ctions.misc.multi_arg_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004230,
        "dEQP-GLES3.functional.shaders.func",
        "tions.misc.multi_arg_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004231,
        "dEQP-GLES3.functional.shaders.fu",
        "nctions.misc.multi_arg_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004232,
        "dEQP-GLES3.functional.shaders.fun",
        "ctions.misc.multi_arg_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004233,
        "dEQP-GLES3.functional.shaders.functi",
        "ons.misc.argument_eval_order_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004234,
        "dEQP-GLES3.functional.shaders.functio",
        "ns.misc.argument_eval_order_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004235,
        "dEQP-GLES3.functional.shaders.functi",
        "ons.misc.argument_eval_order_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004236,
        "dEQP-GLES3.functional.shaders.functio",
        "ns.misc.argument_eval_order_2_fragment");
