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

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000347,
        "dEQP-GLES2.functional.shaders.preproces",
        "sor.invalid_conditionals.empty_if_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000348,
        "dEQP-GLES2.functional.shaders.preprocess",
        "or.invalid_conditionals.empty_if_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000349,
        "dEQP-GLES2.functional.shaders.preprocesso",
        "r.invalid_conditionals.empty_ifdef_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000350,
        "dEQP-GLES2.functional.shaders.preprocessor",
        ".invalid_conditionals.empty_ifdef_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000351,
        "dEQP-GLES2.functional.shaders.preprocesso",
        "r.invalid_conditionals.empty_ifndef_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000352,
        "dEQP-GLES2.functional.shaders.preprocessor",
        ".invalid_conditionals.empty_ifndef_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000353,
        "dEQP-GLES2.functional.shaders.preprocessor.",
        "invalid_conditionals.empty_if_defined_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000354,
        "dEQP-GLES2.functional.shaders.preprocessor.i",
        "nvalid_conditionals.empty_if_defined_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000355,
        "dEQP-GLES2.functional.shaders.preprocessor.i",
        "nvalid_conditionals.unterminated_if_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000356,
        "dEQP-GLES2.functional.shaders.preprocessor.in",
        "valid_conditionals.unterminated_if_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000357,
        "dEQP-GLES2.functional.shaders.preprocessor.i",
        "nvalid_conditionals.unterminated_if_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000358,
        "dEQP-GLES2.functional.shaders.preprocessor.in",
        "valid_conditionals.unterminated_if_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000359,
        "dEQP-GLES2.functional.shaders.preprocessor.i",
        "nvalid_conditionals.unterminated_ifdef_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000360,
        "dEQP-GLES2.functional.shaders.preprocessor.in",
        "valid_conditionals.unterminated_ifdef_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000361,
        "dEQP-GLES2.functional.shaders.preprocessor.in",
        "valid_conditionals.unterminated_ifndef_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000362,
        "dEQP-GLES2.functional.shaders.preprocessor.inv",
        "alid_conditionals.unterminated_ifndef_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000363,
        "dEQP-GLES2.functional.shaders.preprocessor.in",
        "valid_conditionals.unterminated_else_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000364,
        "dEQP-GLES2.functional.shaders.preprocessor.inv",
        "alid_conditionals.unterminated_else_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000365,
        "dEQP-GLES2.functional.shaders.preprocessor.in",
        "valid_conditionals.unterminated_else_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000366,
        "dEQP-GLES2.functional.shaders.preprocessor.inv",
        "alid_conditionals.unterminated_else_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000367,
        "dEQP-GLES2.functional.shaders.preprocessor.in",
        "valid_conditionals.unterminated_elif_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000368,
        "dEQP-GLES2.functional.shaders.preprocessor.inv",
        "alid_conditionals.unterminated_elif_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000369,
        "dEQP-GLES2.functional.shaders.preprocessor.in",
        "valid_conditionals.unterminated_elif_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000370,
        "dEQP-GLES2.functional.shaders.preprocessor.inv",
        "alid_conditionals.unterminated_elif_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000371,
        "dEQP-GLES2.functional.shaders.preprocessor.in",
        "valid_conditionals.unterminated_elif_3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000372,
        "dEQP-GLES2.functional.shaders.preprocessor.inv",
        "alid_conditionals.unterminated_elif_3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000373,
        "dEQP-GLES2.functional.shaders.preprocessor.",
        "invalid_conditionals.elif_after_else_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000374,
        "dEQP-GLES2.functional.shaders.preprocessor.i",
        "nvalid_conditionals.elif_after_else_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000375,
        "dEQP-GLES2.functional.shaders.preprocessor.",
        "invalid_conditionals.else_without_if_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000376,
        "dEQP-GLES2.functional.shaders.preprocessor.i",
        "nvalid_conditionals.else_without_if_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000377,
        "dEQP-GLES2.functional.shaders.preprocessor.",
        "invalid_conditionals.elif_without_if_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000378,
        "dEQP-GLES2.functional.shaders.preprocessor.i",
        "nvalid_conditionals.elif_without_if_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000379,
        "dEQP-GLES2.functional.shaders.preprocessor.",
        "invalid_conditionals.endif_without_if_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000380,
        "dEQP-GLES2.functional.shaders.preprocessor.i",
        "nvalid_conditionals.endif_without_if_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000381,
        "dEQP-GLES2.functional.shaders.preprocessor.",
        "invalid_conditionals.else_after_else_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000382,
        "dEQP-GLES2.functional.shaders.preprocessor.i",
        "nvalid_conditionals.else_after_else_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000383,
        "dEQP-GLES2.functional.shaders.preprocessor.inv",
        "alid_conditionals.nested_elif_without_if_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000384,
        "dEQP-GLES2.functional.shaders.preprocessor.inva",
        "lid_conditionals.nested_elif_without_if_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000385,
        "dEQP-GLES2.functional.shaders.preproces",
        "sor.invalid_conditionals.if_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000386,
        "dEQP-GLES2.functional.shaders.preprocess",
        "or.invalid_conditionals.if_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000387,
        "dEQP-GLES2.functional.shaders.preprocessor.",
        "invalid_conditionals.tokens_after_if_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000388,
        "dEQP-GLES2.functional.shaders.preprocessor.i",
        "nvalid_conditionals.tokens_after_if_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000389,
        "dEQP-GLES2.functional.shaders.preprocessor.i",
        "nvalid_conditionals.tokens_after_elif_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000390,
        "dEQP-GLES2.functional.shaders.preprocessor.in",
        "valid_conditionals.tokens_after_elif_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000391,
        "dEQP-GLES2.functional.shaders.preprocessor.i",
        "nvalid_conditionals.tokens_after_else_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000392,
        "dEQP-GLES2.functional.shaders.preprocessor.in",
        "valid_conditionals.tokens_after_else_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000393,
        "dEQP-GLES2.functional.shaders.preprocessor.i",
        "nvalid_conditionals.tokens_after_endif_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000394,
        "dEQP-GLES2.functional.shaders.preprocessor.in",
        "valid_conditionals.tokens_after_endif_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000395,
        "dEQP-GLES2.functional.shaders.preprocessor.i",
        "nvalid_conditionals.tokens_after_ifdef_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000396,
        "dEQP-GLES2.functional.shaders.preprocessor.in",
        "valid_conditionals.tokens_after_ifdef_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000397,
        "dEQP-GLES2.functional.shaders.preprocessor.in",
        "valid_conditionals.tokens_after_ifndef_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000398,
        "dEQP-GLES2.functional.shaders.preprocessor.inv",
        "alid_conditionals.tokens_after_ifndef_fragment");
