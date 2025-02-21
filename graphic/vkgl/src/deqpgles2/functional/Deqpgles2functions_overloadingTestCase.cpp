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

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002095,
        "dEQP-GLES2.functional.shaders.functions.ov",
        "erloading.user_func_arg_type_simple_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002096,
        "dEQP-GLES2.functional.shaders.functions.ove",
        "rloading.user_func_arg_type_simple_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002097,
        "dEQP-GLES2.functional.shaders.functions.ov",
        "erloading.user_func_arg_float_types_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002098,
        "dEQP-GLES2.functional.shaders.functions.ove",
        "rloading.user_func_arg_float_types_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002099,
        "dEQP-GLES2.functional.shaders.functions.o",
        "verloading.user_func_arg_int_types_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002100,
        "dEQP-GLES2.functional.shaders.functions.ov",
        "erloading.user_func_arg_int_types_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002101,
        "dEQP-GLES2.functional.shaders.functions.o",
        "verloading.user_func_arg_bool_types_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002102,
        "dEQP-GLES2.functional.shaders.functions.ov",
        "erloading.user_func_arg_bool_types_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002103,
        "dEQP-GLES2.functional.shaders.functions.ov",
        "erloading.user_func_arg_basic_types_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002104,
        "dEQP-GLES2.functional.shaders.functions.ove",
        "rloading.user_func_arg_basic_types_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002105,
        "dEQP-GLES2.functional.shaders.functions.ove",
        "rloading.user_func_arg_complex_types_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002106,
        "dEQP-GLES2.functional.shaders.functions.over",
        "loading.user_func_arg_complex_types_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002107,
        "dEQP-GLES2.functional.shaders.functions",
        ".overloading.user_func_arguments_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002108,
        "dEQP-GLES2.functional.shaders.functions.",
        "overloading.user_func_arguments_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002109,
        "dEQP-GLES2.functional.shaders.funct",
        "ions.overloading.builtin_sin_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002110,
        "dEQP-GLES2.functional.shaders.functi",
        "ons.overloading.builtin_sin_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002111,
        "dEQP-GLES2.functional.shaders.funct",
        "ions.overloading.builtin_step_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002112,
        "dEQP-GLES2.functional.shaders.functi",
        "ons.overloading.builtin_step_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002113,
        "dEQP-GLES2.functional.shaders.func",
        "tions.overloading.array_size_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002114,
        "dEQP-GLES2.functional.shaders.funct",
        "ions.overloading.array_size_fragment");
