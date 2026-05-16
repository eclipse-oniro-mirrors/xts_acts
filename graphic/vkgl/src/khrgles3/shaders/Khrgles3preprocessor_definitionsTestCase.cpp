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

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000894,
        "KHR-GLES3.shaders.preprocessor.defini",
        "tions.define_value_and_function_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000895,
        "KHR-GLES3.shaders.preprocessor.definit",
        "ions.define_value_and_function_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000896,
        "KHR-GLES3.shaders.preprocessor.definitio",
        "ns.undefine_object_invalid_syntax_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000897,
        "KHR-GLES3.shaders.preprocessor.definition",
        "s.undefine_object_invalid_syntax_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000898,
        "KHR-GLES3.shaders.preprocessor.defini",
        "tions.undefine_invalid_object_1_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000899,
        "KHR-GLES3.shaders.preprocessor.definit",
        "ions.undefine_invalid_object_1_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000900,
        "KHR-GLES3.shaders.preprocessor.defini",
        "tions.undefine_invalid_object_2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000901,
        "KHR-GLES3.shaders.preprocessor.definit",
        "ions.undefine_invalid_object_2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000902,
        "KHR-GLES3.shaders.preprocessor.defini",
        "tions.undefine_invalid_object_3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000903,
        "KHR-GLES3.shaders.preprocessor.definit",
        "ions.undefine_invalid_object_3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000904,
        "KHR-GLES3.shaders.preprocessor.defini",
        "tions.undefine_invalid_object_4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000905,
        "KHR-GLES3.shaders.preprocessor.definit",
        "ions.undefine_invalid_object_4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000906,
        "KHR-GLES3.shaders.preprocessor.de",
        "finitions.undefine_function_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000907,
        "KHR-GLES3.shaders.preprocessor.def",
        "initions.undefine_function_fragment");
