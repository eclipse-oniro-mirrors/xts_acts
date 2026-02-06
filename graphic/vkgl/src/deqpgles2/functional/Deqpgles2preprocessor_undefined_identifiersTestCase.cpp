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

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000319,
        "dEQP-GLES2.functional.shaders.preprocessor.undefin",
        "ed_identifiers.valid_undefined_identifier_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000320,
        "dEQP-GLES2.functional.shaders.preprocessor.undefine",
        "d_identifiers.valid_undefined_identifier_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000321,
        "dEQP-GLES2.functional.shaders.preprocessor.undefin",
        "ed_identifiers.valid_undefined_identifier_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000322,
        "dEQP-GLES2.functional.shaders.preprocessor.undefine",
        "d_identifiers.valid_undefined_identifier_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000323,
        "dEQP-GLES2.functional.shaders.preprocessor.unde",
        "fined_identifiers.undefined_identifier_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000324,
        "dEQP-GLES2.functional.shaders.preprocessor.undef",
        "ined_identifiers.undefined_identifier_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000325,
        "dEQP-GLES2.functional.shaders.preprocessor.unde",
        "fined_identifiers.undefined_identifier_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000326,
        "dEQP-GLES2.functional.shaders.preprocessor.undef",
        "ined_identifiers.undefined_identifier_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000327,
        "dEQP-GLES2.functional.shaders.preprocessor.unde",
        "fined_identifiers.undefined_identifier_3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000328,
        "dEQP-GLES2.functional.shaders.preprocessor.undef",
        "ined_identifiers.undefined_identifier_3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000329,
        "dEQP-GLES2.functional.shaders.preprocessor.unde",
        "fined_identifiers.undefined_identifier_4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000330,
        "dEQP-GLES2.functional.shaders.preprocessor.undef",
        "ined_identifiers.undefined_identifier_4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000331,
        "dEQP-GLES2.functional.shaders.preprocessor.unde",
        "fined_identifiers.undefined_identifier_5_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000332,
        "dEQP-GLES2.functional.shaders.preprocessor.undef",
        "ined_identifiers.undefined_identifier_5_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000333,
        "dEQP-GLES2.functional.shaders.preprocessor.unde",
        "fined_identifiers.undefined_identifier_6_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000334,
        "dEQP-GLES2.functional.shaders.preprocessor.undef",
        "ined_identifiers.undefined_identifier_6_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000335,
        "dEQP-GLES2.functional.shaders.preprocessor.unde",
        "fined_identifiers.undefined_identifier_7_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000336,
        "dEQP-GLES2.functional.shaders.preprocessor.undef",
        "ined_identifiers.undefined_identifier_7_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000337,
        "dEQP-GLES2.functional.shaders.preprocessor.unde",
        "fined_identifiers.undefined_identifier_8_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000338,
        "dEQP-GLES2.functional.shaders.preprocessor.undef",
        "ined_identifiers.undefined_identifier_8_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000339,
        "dEQP-GLES2.functional.shaders.preprocessor.unde",
        "fined_identifiers.undefined_identifier_9_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000340,
        "dEQP-GLES2.functional.shaders.preprocessor.undef",
        "ined_identifiers.undefined_identifier_9_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000341,
        "dEQP-GLES2.functional.shaders.preprocessor.unde",
        "fined_identifiers.undefined_identifier_10_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000342,
        "dEQP-GLES2.functional.shaders.preprocessor.undef",
        "ined_identifiers.undefined_identifier_10_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000343,
        "dEQP-GLES2.functional.shaders.preprocessor.unde",
        "fined_identifiers.undefined_identifier_11_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000344,
        "dEQP-GLES2.functional.shaders.preprocessor.undef",
        "ined_identifiers.undefined_identifier_11_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000345,
        "dEQP-GLES2.functional.shaders.preprocessor.unde",
        "fined_identifiers.undefined_identifier_12_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000346,
        "dEQP-GLES2.functional.shaders.preprocessor.undef",
        "ined_identifiers.undefined_identifier_12_fragment");
