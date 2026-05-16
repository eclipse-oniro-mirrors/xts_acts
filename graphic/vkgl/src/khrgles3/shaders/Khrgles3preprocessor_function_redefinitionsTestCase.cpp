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
#include "../Khrgles3BaseFunc.h"
#include "../ActsKhrgles30001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000984,
        "KHR-GLES3.shaders.preprocessor.function_re",
        "definitions.function_redefinition_1_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000985,
        "KHR-GLES3.shaders.preprocessor.function_red",
        "efinitions.function_redefinition_1_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000986,
        "KHR-GLES3.shaders.preprocessor.function_re",
        "definitions.function_redefinition_2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000987,
        "KHR-GLES3.shaders.preprocessor.function_red",
        "efinitions.function_redefinition_2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000988,
        "KHR-GLES3.shaders.preprocessor.function_re",
        "definitions.function_redefinition_3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000989,
        "KHR-GLES3.shaders.preprocessor.function_red",
        "efinitions.function_redefinition_3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000990,
        "KHR-GLES3.shaders.preprocessor.function_redefinit",
        "ions.invalid_function_redefinition_param_1_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000991,
        "KHR-GLES3.shaders.preprocessor.function_redefiniti",
        "ons.invalid_function_redefinition_param_1_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000992,
        "KHR-GLES3.shaders.preprocessor.function_redefinit",
        "ions.invalid_function_redefinition_param_2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000993,
        "KHR-GLES3.shaders.preprocessor.function_redefiniti",
        "ons.invalid_function_redefinition_param_2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000994,
        "KHR-GLES3.shaders.preprocessor.function_redefinit",
        "ions.invalid_function_redefinition_param_3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000995,
        "KHR-GLES3.shaders.preprocessor.function_redefiniti",
        "ons.invalid_function_redefinition_param_3_fragment");
