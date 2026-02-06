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

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000968,
        "KHR-GLES3.shaders.preprocessor.function_defi",
        "nitions.same_object_and_function_param_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000969,
        "KHR-GLES3.shaders.preprocessor.function_defin",
        "itions.same_object_and_function_param_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000970,
        "KHR-GLES3.shaders.preprocessor.func",
        "tion_definitions.complex_func_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000971,
        "KHR-GLES3.shaders.preprocessor.funct",
        "ion_definitions.complex_func_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000972,
        "KHR-GLES3.shaders.preprocessor.function_defini",
        "tions.function_definition_with_comments_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000973,
        "KHR-GLES3.shaders.preprocessor.function_definit",
        "ions.function_definition_with_comments_fragment");
