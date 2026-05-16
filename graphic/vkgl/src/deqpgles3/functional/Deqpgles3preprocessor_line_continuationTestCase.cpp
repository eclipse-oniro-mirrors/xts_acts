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

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000872,
        "dEQP-GLES3.functional.shaders.preproc",
        "essor.line_continuation.comment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000873,
        "dEQP-GLES3.functional.shaders.preproce",
        "ssor.line_continuation.comment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000874,
        "dEQP-GLES3.functional.shaders.preproc",
        "essor.line_continuation.define_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000875,
        "dEQP-GLES3.functional.shaders.preproce",
        "ssor.line_continuation.define_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000876,
        "dEQP-GLES3.functional.shaders.preprocessor.",
        "line_continuation.preprocessing_token_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000877,
        "dEQP-GLES3.functional.shaders.preprocessor.l",
        "ine_continuation.preprocessing_token_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000878,
        "dEQP-GLES3.functional.shaders.prepro",
        "cessor.line_continuation.token_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000879,
        "dEQP-GLES3.functional.shaders.preproc",
        "essor.line_continuation.token_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000880,
        "dEQP-GLES3.functional.shaders.preprocesso",
        "r.line_continuation.middle_of_line_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000881,
        "dEQP-GLES3.functional.shaders.preprocessor",
        ".line_continuation.middle_of_line_fragment");
