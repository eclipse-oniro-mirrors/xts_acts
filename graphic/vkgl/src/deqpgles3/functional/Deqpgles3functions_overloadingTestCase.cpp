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

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004169,
        "dEQP-GLES3.functional.shaders.functions.ov",
        "erloading.user_func_arg_type_simple_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004170,
        "dEQP-GLES3.functional.shaders.functions.ove",
        "rloading.user_func_arg_type_simple_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004171,
        "dEQP-GLES3.functional.shaders.functions.ov",
        "erloading.user_func_arg_float_types_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004172,
        "dEQP-GLES3.functional.shaders.functions.ove",
        "rloading.user_func_arg_float_types_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004173,
        "dEQP-GLES3.functional.shaders.functions.o",
        "verloading.user_func_arg_int_types_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004174,
        "dEQP-GLES3.functional.shaders.functions.ov",
        "erloading.user_func_arg_int_types_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004175,
        "dEQP-GLES3.functional.shaders.functions.o",
        "verloading.user_func_arg_bool_types_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004176,
        "dEQP-GLES3.functional.shaders.functions.ov",
        "erloading.user_func_arg_bool_types_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004177,
        "dEQP-GLES3.functional.shaders.functions.ov",
        "erloading.user_func_arg_basic_types_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004178,
        "dEQP-GLES3.functional.shaders.functions.ove",
        "rloading.user_func_arg_basic_types_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004179,
        "dEQP-GLES3.functional.shaders.functions.ove",
        "rloading.user_func_arg_complex_types_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004180,
        "dEQP-GLES3.functional.shaders.functions.over",
        "loading.user_func_arg_complex_types_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004181,
        "dEQP-GLES3.functional.shaders.functions",
        ".overloading.user_func_arguments_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004182,
        "dEQP-GLES3.functional.shaders.functions.",
        "overloading.user_func_arguments_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004183,
        "dEQP-GLES3.functional.shaders.func",
        "tions.overloading.array_size_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004184,
        "dEQP-GLES3.functional.shaders.funct",
        "ions.overloading.array_size_fragment");
