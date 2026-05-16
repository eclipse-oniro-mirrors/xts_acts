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
#include "../ActsDeqpgles20001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000225,
        "dEQP-GLES2.functional.shaders.preprocessor.funct",
        "ion_redefinitions.function_redefinition_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000226,
        "dEQP-GLES2.functional.shaders.preprocessor.functi",
        "on_redefinitions.function_redefinition_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000227,
        "dEQP-GLES2.functional.shaders.preprocessor.funct",
        "ion_redefinitions.function_redefinition_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000228,
        "dEQP-GLES2.functional.shaders.preprocessor.functi",
        "on_redefinitions.function_redefinition_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000229,
        "dEQP-GLES2.functional.shaders.preprocessor.funct",
        "ion_redefinitions.function_redefinition_3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000230,
        "dEQP-GLES2.functional.shaders.preprocessor.functi",
        "on_redefinitions.function_redefinition_3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000231,
        "dEQP-GLES2.functional.shaders.preprocessor.function_red",
        "efinitions.invalid_function_redefinition_param_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000232,
        "dEQP-GLES2.functional.shaders.preprocessor.function_rede",
        "finitions.invalid_function_redefinition_param_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000233,
        "dEQP-GLES2.functional.shaders.preprocessor.function_red",
        "efinitions.invalid_function_redefinition_param_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000234,
        "dEQP-GLES2.functional.shaders.preprocessor.function_rede",
        "finitions.invalid_function_redefinition_param_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000235,
        "dEQP-GLES2.functional.shaders.preprocessor.function_red",
        "efinitions.invalid_function_redefinition_param_3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000236,
        "dEQP-GLES2.functional.shaders.preprocessor.function_rede",
        "finitions.invalid_function_redefinition_param_3_fragment");
