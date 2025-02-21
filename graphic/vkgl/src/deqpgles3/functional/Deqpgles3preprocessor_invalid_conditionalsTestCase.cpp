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
#include "../ActsDeqpgles30002TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001024,
        "dEQP-GLES3.functional.shaders.preproces",
        "sor.invalid_conditionals.empty_if_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001025,
        "dEQP-GLES3.functional.shaders.preprocess",
        "or.invalid_conditionals.empty_if_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001026,
        "dEQP-GLES3.functional.shaders.preprocesso",
        "r.invalid_conditionals.empty_ifdef_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001027,
        "dEQP-GLES3.functional.shaders.preprocessor",
        ".invalid_conditionals.empty_ifdef_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001028,
        "dEQP-GLES3.functional.shaders.preprocesso",
        "r.invalid_conditionals.empty_ifndef_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001029,
        "dEQP-GLES3.functional.shaders.preprocessor",
        ".invalid_conditionals.empty_ifndef_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001030,
        "dEQP-GLES3.functional.shaders.preprocessor",
        ".invalid_conditionals.invalid_ifdef_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001031,
        "dEQP-GLES3.functional.shaders.preprocessor.",
        "invalid_conditionals.invalid_ifdef_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001032,
        "dEQP-GLES3.functional.shaders.preprocessor",
        ".invalid_conditionals.invalid_ifndef_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001033,
        "dEQP-GLES3.functional.shaders.preprocessor.",
        "invalid_conditionals.invalid_ifndef_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001034,
        "dEQP-GLES3.functional.shaders.preprocessor.",
        "invalid_conditionals.empty_if_defined_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001035,
        "dEQP-GLES3.functional.shaders.preprocessor.i",
        "nvalid_conditionals.empty_if_defined_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001036,
        "dEQP-GLES3.functional.shaders.preprocessor.i",
        "nvalid_conditionals.unterminated_if_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001037,
        "dEQP-GLES3.functional.shaders.preprocessor.in",
        "valid_conditionals.unterminated_if_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001038,
        "dEQP-GLES3.functional.shaders.preprocessor.i",
        "nvalid_conditionals.unterminated_if_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001039,
        "dEQP-GLES3.functional.shaders.preprocessor.in",
        "valid_conditionals.unterminated_if_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001040,
        "dEQP-GLES3.functional.shaders.preprocessor.i",
        "nvalid_conditionals.unterminated_ifdef_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001041,
        "dEQP-GLES3.functional.shaders.preprocessor.in",
        "valid_conditionals.unterminated_ifdef_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001042,
        "dEQP-GLES3.functional.shaders.preprocessor.in",
        "valid_conditionals.unterminated_ifndef_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001043,
        "dEQP-GLES3.functional.shaders.preprocessor.inv",
        "alid_conditionals.unterminated_ifndef_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001044,
        "dEQP-GLES3.functional.shaders.preprocessor.in",
        "valid_conditionals.unterminated_else_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001045,
        "dEQP-GLES3.functional.shaders.preprocessor.inv",
        "alid_conditionals.unterminated_else_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001046,
        "dEQP-GLES3.functional.shaders.preprocessor.in",
        "valid_conditionals.unterminated_else_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001047,
        "dEQP-GLES3.functional.shaders.preprocessor.inv",
        "alid_conditionals.unterminated_else_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001048,
        "dEQP-GLES3.functional.shaders.preprocessor.in",
        "valid_conditionals.unterminated_elif_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001049,
        "dEQP-GLES3.functional.shaders.preprocessor.inv",
        "alid_conditionals.unterminated_elif_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001050,
        "dEQP-GLES3.functional.shaders.preprocessor.in",
        "valid_conditionals.unterminated_elif_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001051,
        "dEQP-GLES3.functional.shaders.preprocessor.inv",
        "alid_conditionals.unterminated_elif_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001052,
        "dEQP-GLES3.functional.shaders.preprocessor.in",
        "valid_conditionals.unterminated_elif_3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001053,
        "dEQP-GLES3.functional.shaders.preprocessor.inv",
        "alid_conditionals.unterminated_elif_3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001054,
        "dEQP-GLES3.functional.shaders.preprocessor.",
        "invalid_conditionals.elif_after_else_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001055,
        "dEQP-GLES3.functional.shaders.preprocessor.i",
        "nvalid_conditionals.elif_after_else_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001056,
        "dEQP-GLES3.functional.shaders.preprocessor.",
        "invalid_conditionals.else_without_if_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001057,
        "dEQP-GLES3.functional.shaders.preprocessor.i",
        "nvalid_conditionals.else_without_if_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001058,
        "dEQP-GLES3.functional.shaders.preprocessor.",
        "invalid_conditionals.elif_without_if_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001059,
        "dEQP-GLES3.functional.shaders.preprocessor.i",
        "nvalid_conditionals.elif_without_if_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001060,
        "dEQP-GLES3.functional.shaders.preprocessor.",
        "invalid_conditionals.endif_without_if_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001061,
        "dEQP-GLES3.functional.shaders.preprocessor.i",
        "nvalid_conditionals.endif_without_if_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001062,
        "dEQP-GLES3.functional.shaders.preprocessor.",
        "invalid_conditionals.else_after_else_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001063,
        "dEQP-GLES3.functional.shaders.preprocessor.i",
        "nvalid_conditionals.else_after_else_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001064,
        "dEQP-GLES3.functional.shaders.preprocessor.inv",
        "alid_conditionals.nested_elif_without_if_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001065,
        "dEQP-GLES3.functional.shaders.preprocessor.inva",
        "lid_conditionals.nested_elif_without_if_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001066,
        "dEQP-GLES3.functional.shaders.preproces",
        "sor.invalid_conditionals.if_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001067,
        "dEQP-GLES3.functional.shaders.preprocess",
        "or.invalid_conditionals.if_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001068,
        "dEQP-GLES3.functional.shaders.preprocessor.",
        "invalid_conditionals.tokens_after_if_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001069,
        "dEQP-GLES3.functional.shaders.preprocessor.i",
        "nvalid_conditionals.tokens_after_if_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001070,
        "dEQP-GLES3.functional.shaders.preprocessor.i",
        "nvalid_conditionals.tokens_after_elif_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001071,
        "dEQP-GLES3.functional.shaders.preprocessor.in",
        "valid_conditionals.tokens_after_elif_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001072,
        "dEQP-GLES3.functional.shaders.preprocessor.i",
        "nvalid_conditionals.tokens_after_else_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001073,
        "dEQP-GLES3.functional.shaders.preprocessor.in",
        "valid_conditionals.tokens_after_else_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001074,
        "dEQP-GLES3.functional.shaders.preprocessor.i",
        "nvalid_conditionals.tokens_after_endif_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001075,
        "dEQP-GLES3.functional.shaders.preprocessor.in",
        "valid_conditionals.tokens_after_endif_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001076,
        "dEQP-GLES3.functional.shaders.preprocessor.i",
        "nvalid_conditionals.tokens_after_ifdef_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001077,
        "dEQP-GLES3.functional.shaders.preprocessor.in",
        "valid_conditionals.tokens_after_ifdef_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001078,
        "dEQP-GLES3.functional.shaders.preprocessor.in",
        "valid_conditionals.tokens_after_ifndef_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001079,
        "dEQP-GLES3.functional.shaders.preprocessor.inv",
        "alid_conditionals.tokens_after_ifndef_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001080,
        "dEQP-GLES3.functional.shaders.preprocessor.inval",
        "id_conditionals.unterminated_nested_blocks_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001081,
        "dEQP-GLES3.functional.shaders.preprocessor.invali",
        "d_conditionals.unterminated_nested_blocks_fragment");
