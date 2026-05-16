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
#include "../ActsDeqpgles20008TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007894,
        "dEQP-GLES2.functional.shaders.constant_",
        "expressions.complex_types.struct_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007895,
        "dEQP-GLES2.functional.shaders.constant_e",
        "xpressions.complex_types.struct_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007896,
        "dEQP-GLES2.functional.shaders.constant_exp",
        "ressions.complex_types.nested_struct_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007897,
        "dEQP-GLES2.functional.shaders.constant_expr",
        "essions.complex_types.nested_struct_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007898,
        "dEQP-GLES2.functional.shaders.constant",
        "_expressions.complex_types.array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007899,
        "dEQP-GLES2.functional.shaders.constant_",
        "expressions.complex_types.array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007900,
        "dEQP-GLES2.functional.shaders.constant_express",
        "ions.complex_types.nested_builtin_funcs_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007901,
        "dEQP-GLES2.functional.shaders.constant_expressi",
        "ons.complex_types.nested_builtin_funcs_fragment");
