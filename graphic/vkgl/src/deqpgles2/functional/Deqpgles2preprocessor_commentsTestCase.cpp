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

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000195,
        "dEQP-GLES2.functional.shaders.preprocesso",
        "r.comments.multiline_comment_define_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000196,
        "dEQP-GLES2.functional.shaders.preprocessor",
        ".comments.multiline_comment_define_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000197,
        "dEQP-GLES2.functional.shaders.prepro",
        "cessor.comments.nested_comment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000198,
        "dEQP-GLES2.functional.shaders.preproc",
        "essor.comments.nested_comment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000199,
        "dEQP-GLES2.functional.shaders.preproc",
        "essor.comments.comment_trick_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000200,
        "dEQP-GLES2.functional.shaders.preproce",
        "ssor.comments.comment_trick_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000201,
        "dEQP-GLES2.functional.shaders.preproc",
        "essor.comments.comment_trick_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000202,
        "dEQP-GLES2.functional.shaders.preproce",
        "ssor.comments.comment_trick_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000203,
        "dEQP-GLES2.functional.shaders.preproc",
        "essor.comments.invalid_comment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000204,
        "dEQP-GLES2.functional.shaders.preproce",
        "ssor.comments.invalid_comment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000205,
        "dEQP-GLES2.functional.shaders.preprocess",
        "or.comments.unterminated_comment_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000206,
        "dEQP-GLES2.functional.shaders.preprocesso",
        "r.comments.unterminated_comment_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000207,
        "dEQP-GLES2.functional.shaders.preprocess",
        "or.comments.unterminated_comment_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000208,
        "dEQP-GLES2.functional.shaders.preprocesso",
        "r.comments.unterminated_comment_2_fragment");
