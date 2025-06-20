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

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000854,
        "dEQP-GLES3.functional.shaders.preprocesso",
        "r.comments.multiline_comment_define_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000855,
        "dEQP-GLES3.functional.shaders.preprocessor",
        ".comments.multiline_comment_define_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000856,
        "dEQP-GLES3.functional.shaders.prepro",
        "cessor.comments.nested_comment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000857,
        "dEQP-GLES3.functional.shaders.preproc",
        "essor.comments.nested_comment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000858,
        "dEQP-GLES3.functional.shaders.preproc",
        "essor.comments.comment_trick_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000859,
        "dEQP-GLES3.functional.shaders.preproce",
        "ssor.comments.comment_trick_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000860,
        "dEQP-GLES3.functional.shaders.preproc",
        "essor.comments.comment_trick_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000861,
        "dEQP-GLES3.functional.shaders.preproce",
        "ssor.comments.comment_trick_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000862,
        "dEQP-GLES3.functional.shaders.preproc",
        "essor.comments.invalid_comment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000863,
        "dEQP-GLES3.functional.shaders.preproce",
        "ssor.comments.invalid_comment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000864,
        "dEQP-GLES3.functional.shaders.preprocess",
        "or.comments.unterminated_comment_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000865,
        "dEQP-GLES3.functional.shaders.preprocesso",
        "r.comments.unterminated_comment_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000866,
        "dEQP-GLES3.functional.shaders.preprocess",
        "or.comments.unterminated_comment_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000867,
        "dEQP-GLES3.functional.shaders.preprocesso",
        "r.comments.unterminated_comment_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000868,
        "dEQP-GLES3.functional.shaders.preprocesso",
        "r.comments.backslash_in_a_comment_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000869,
        "dEQP-GLES3.functional.shaders.preprocessor",
        ".comments.backslash_in_a_comment_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000870,
        "dEQP-GLES3.functional.shaders.preprocesso",
        "r.comments.backslash_in_a_comment_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000871,
        "dEQP-GLES3.functional.shaders.preprocessor",
        ".comments.backslash_in_a_comment_2_fragment");
