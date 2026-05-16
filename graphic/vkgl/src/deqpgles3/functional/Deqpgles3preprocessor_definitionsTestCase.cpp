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

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000802,
        "dEQP-GLES3.functional.shaders.preprocessor.",
        "definitions.define_value_and_function_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000803,
        "dEQP-GLES3.functional.shaders.preprocessor.d",
        "efinitions.define_value_and_function_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000804,
        "dEQP-GLES3.functional.shaders.preprocessor.def",
        "initions.undefine_object_invalid_syntax_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000805,
        "dEQP-GLES3.functional.shaders.preprocessor.defi",
        "nitions.undefine_object_invalid_syntax_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000806,
        "dEQP-GLES3.functional.shaders.preprocessor.",
        "definitions.undefine_invalid_object_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000807,
        "dEQP-GLES3.functional.shaders.preprocessor.d",
        "efinitions.undefine_invalid_object_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000808,
        "dEQP-GLES3.functional.shaders.preprocessor.",
        "definitions.undefine_invalid_object_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000809,
        "dEQP-GLES3.functional.shaders.preprocessor.d",
        "efinitions.undefine_invalid_object_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000810,
        "dEQP-GLES3.functional.shaders.preprocessor.",
        "definitions.undefine_invalid_object_3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000811,
        "dEQP-GLES3.functional.shaders.preprocessor.d",
        "efinitions.undefine_invalid_object_3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000812,
        "dEQP-GLES3.functional.shaders.preprocessor.",
        "definitions.undefine_invalid_object_4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000813,
        "dEQP-GLES3.functional.shaders.preprocessor.d",
        "efinitions.undefine_invalid_object_4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000814,
        "dEQP-GLES3.functional.shaders.preproces",
        "sor.definitions.undefine_function_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000815,
        "dEQP-GLES3.functional.shaders.preprocess",
        "or.definitions.undefine_function_fragment");
