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
#include "../ActsDeqpgles30001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000898,
        "dEQP-GLES3.functional.shaders.preprocessor.funct",
        "ion_redefinitions.function_redefinition_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000899,
        "dEQP-GLES3.functional.shaders.preprocessor.functi",
        "on_redefinitions.function_redefinition_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000900,
        "dEQP-GLES3.functional.shaders.preprocessor.funct",
        "ion_redefinitions.function_redefinition_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000901,
        "dEQP-GLES3.functional.shaders.preprocessor.functi",
        "on_redefinitions.function_redefinition_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000902,
        "dEQP-GLES3.functional.shaders.preprocessor.funct",
        "ion_redefinitions.function_redefinition_3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000903,
        "dEQP-GLES3.functional.shaders.preprocessor.functi",
        "on_redefinitions.function_redefinition_3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000904,
        "dEQP-GLES3.functional.shaders.preprocessor.function_red",
        "efinitions.invalid_function_redefinition_param_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000905,
        "dEQP-GLES3.functional.shaders.preprocessor.function_rede",
        "finitions.invalid_function_redefinition_param_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000906,
        "dEQP-GLES3.functional.shaders.preprocessor.function_red",
        "efinitions.invalid_function_redefinition_param_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000907,
        "dEQP-GLES3.functional.shaders.preprocessor.function_rede",
        "finitions.invalid_function_redefinition_param_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000908,
        "dEQP-GLES3.functional.shaders.preprocessor.function_red",
        "efinitions.invalid_function_redefinition_param_3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000909,
        "dEQP-GLES3.functional.shaders.preprocessor.function_rede",
        "finitions.invalid_function_redefinition_param_3_fragment");
