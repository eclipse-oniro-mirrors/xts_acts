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

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004185,
        "dEQP-GLES3.functional.shaders.function",
        "s.array_arguments.local_in_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004186,
        "dEQP-GLES3.functional.shaders.functions",
        ".array_arguments.local_in_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004187,
        "dEQP-GLES3.functional.shaders.functions",
        ".array_arguments.global_in_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004188,
        "dEQP-GLES3.functional.shaders.functions.",
        "array_arguments.global_in_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004189,
        "dEQP-GLES3.functional.shaders.functio",
        "ns.array_arguments.local_in_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004190,
        "dEQP-GLES3.functional.shaders.function",
        "s.array_arguments.local_in_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004191,
        "dEQP-GLES3.functional.shaders.function",
        "s.array_arguments.global_in_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004192,
        "dEQP-GLES3.functional.shaders.functions",
        ".array_arguments.global_in_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004193,
        "dEQP-GLES3.functional.shaders.function",
        "s.array_arguments.local_in_bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004194,
        "dEQP-GLES3.functional.shaders.functions",
        ".array_arguments.local_in_bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004195,
        "dEQP-GLES3.functional.shaders.function",
        "s.array_arguments.global_in_bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004196,
        "dEQP-GLES3.functional.shaders.functions",
        ".array_arguments.global_in_bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004197,
        "dEQP-GLES3.functional.shaders.functio",
        "ns.array_arguments.test_helpers_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004198,
        "dEQP-GLES3.functional.shaders.function",
        "s.array_arguments.test_helpers_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004199,
        "dEQP-GLES3.functional.shaders.functions.ar",
        "ray_arguments.copy_local_in_on_call_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004200,
        "dEQP-GLES3.functional.shaders.functions.arr",
        "ay_arguments.copy_local_in_on_call_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004201,
        "dEQP-GLES3.functional.shaders.functions.ar",
        "ray_arguments.copy_global_in_on_call_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004202,
        "dEQP-GLES3.functional.shaders.functions.arr",
        "ay_arguments.copy_global_in_on_call_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004203,
        "dEQP-GLES3.functional.shaders.functions.arr",
        "ay_arguments.copy_local_inout_on_call_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004204,
        "dEQP-GLES3.functional.shaders.functions.arra",
        "y_arguments.copy_local_inout_on_call_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004205,
        "dEQP-GLES3.functional.shaders.functions.arra",
        "y_arguments.copy_global_inout_on_call_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004206,
        "dEQP-GLES3.functional.shaders.functions.array",
        "_arguments.copy_global_inout_on_call_fragment");
