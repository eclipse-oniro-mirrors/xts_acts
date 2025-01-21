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

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002115,
        "dEQP-GLES2.functional.shaders.function",
        "s.array_arguments.local_in_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002116,
        "dEQP-GLES2.functional.shaders.functions",
        ".array_arguments.local_in_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002117,
        "dEQP-GLES2.functional.shaders.functions",
        ".array_arguments.global_in_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002118,
        "dEQP-GLES2.functional.shaders.functions.",
        "array_arguments.global_in_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002119,
        "dEQP-GLES2.functional.shaders.functio",
        "ns.array_arguments.local_in_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002120,
        "dEQP-GLES2.functional.shaders.function",
        "s.array_arguments.local_in_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002121,
        "dEQP-GLES2.functional.shaders.function",
        "s.array_arguments.global_in_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002122,
        "dEQP-GLES2.functional.shaders.functions",
        ".array_arguments.global_in_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002123,
        "dEQP-GLES2.functional.shaders.function",
        "s.array_arguments.local_in_bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002124,
        "dEQP-GLES2.functional.shaders.functions",
        ".array_arguments.local_in_bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002125,
        "dEQP-GLES2.functional.shaders.function",
        "s.array_arguments.global_in_bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002126,
        "dEQP-GLES2.functional.shaders.functions",
        ".array_arguments.global_in_bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002127,
        "dEQP-GLES2.functional.shaders.functio",
        "ns.array_arguments.test_helpers_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002128,
        "dEQP-GLES2.functional.shaders.function",
        "s.array_arguments.test_helpers_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002129,
        "dEQP-GLES2.functional.shaders.functions.ar",
        "ray_arguments.copy_local_in_on_call_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002130,
        "dEQP-GLES2.functional.shaders.functions.arr",
        "ay_arguments.copy_local_in_on_call_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002131,
        "dEQP-GLES2.functional.shaders.functions.ar",
        "ray_arguments.copy_global_in_on_call_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002132,
        "dEQP-GLES2.functional.shaders.functions.arr",
        "ay_arguments.copy_global_in_on_call_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002133,
        "dEQP-GLES2.functional.shaders.functions.arr",
        "ay_arguments.copy_local_inout_on_call_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002134,
        "dEQP-GLES2.functional.shaders.functions.arra",
        "y_arguments.copy_local_inout_on_call_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002135,
        "dEQP-GLES2.functional.shaders.functions.arra",
        "y_arguments.copy_global_inout_on_call_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002136,
        "dEQP-GLES2.functional.shaders.functions.array",
        "_arguments.copy_global_inout_on_call_fragment");
