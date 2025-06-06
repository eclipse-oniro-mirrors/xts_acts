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

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000948,
        "KHR-GLES3.shaders.preprocessor.comm",
        "ents.multiline_comment_define_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000949,
        "KHR-GLES3.shaders.preprocessor.comme",
        "nts.multiline_comment_define_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000950,
        "KHR-GLES3.shaders.preprocessor",
        ".comments.nested_comment_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000951,
        "KHR-GLES3.shaders.preprocessor.",
        "comments.nested_comment_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000952,
        "KHR-GLES3.shaders.preprocessor.",
        "comments.invalid_comment_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000953,
        "KHR-GLES3.shaders.preprocessor.c",
        "omments.invalid_comment_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000954,
        "KHR-GLES3.shaders.preprocessor.com",
        "ments.unterminated_comment_1_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000955,
        "KHR-GLES3.shaders.preprocessor.comm",
        "ents.unterminated_comment_1_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000956,
        "KHR-GLES3.shaders.preprocessor.com",
        "ments.unterminated_comment_2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000957,
        "KHR-GLES3.shaders.preprocessor.comm",
        "ents.unterminated_comment_2_fragment");
