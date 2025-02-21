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

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000958,
        "KHR-GLES3.shaders.preprocessor.",
        "line_continuation.comment_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000959,
        "KHR-GLES3.shaders.preprocessor.l",
        "ine_continuation.comment_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000960,
        "KHR-GLES3.shaders.preprocessor.",
        "line_continuation.define_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000961,
        "KHR-GLES3.shaders.preprocessor.l",
        "ine_continuation.define_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000962,
        "KHR-GLES3.shaders.preprocessor.line_c",
        "ontinuation.preprocessing_token_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000963,
        "KHR-GLES3.shaders.preprocessor.line_co",
        "ntinuation.preprocessing_token_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000964,
        "KHR-GLES3.shaders.preprocessor",
        ".line_continuation.token_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000965,
        "KHR-GLES3.shaders.preprocessor.",
        "line_continuation.token_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000966,
        "KHR-GLES3.shaders.preprocessor.line",
        "_continuation.middle_of_line_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000967,
        "KHR-GLES3.shaders.preprocessor.line_",
        "continuation.middle_of_line_fragment");
