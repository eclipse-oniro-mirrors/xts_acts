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

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000996,
        "dEQP-GLES3.functional.shaders.preprocessor.undefin",
        "ed_identifiers.valid_undefined_identifier_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000997,
        "dEQP-GLES3.functional.shaders.preprocessor.undefine",
        "d_identifiers.valid_undefined_identifier_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000998,
        "dEQP-GLES3.functional.shaders.preprocessor.undefin",
        "ed_identifiers.valid_undefined_identifier_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000999,
        "dEQP-GLES3.functional.shaders.preprocessor.undefine",
        "d_identifiers.valid_undefined_identifier_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_001000,
        "dEQP-GLES3.functional.shaders.preprocessor.unde",
        "fined_identifiers.undefined_identifier_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_001001,
        "dEQP-GLES3.functional.shaders.preprocessor.undef",
        "ined_identifiers.undefined_identifier_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_001002,
        "dEQP-GLES3.functional.shaders.preprocessor.unde",
        "fined_identifiers.undefined_identifier_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_001003,
        "dEQP-GLES3.functional.shaders.preprocessor.undef",
        "ined_identifiers.undefined_identifier_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_001004,
        "dEQP-GLES3.functional.shaders.preprocessor.unde",
        "fined_identifiers.undefined_identifier_3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_001005,
        "dEQP-GLES3.functional.shaders.preprocessor.undef",
        "ined_identifiers.undefined_identifier_3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_001006,
        "dEQP-GLES3.functional.shaders.preprocessor.unde",
        "fined_identifiers.undefined_identifier_4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_001007,
        "dEQP-GLES3.functional.shaders.preprocessor.undef",
        "ined_identifiers.undefined_identifier_4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_001008,
        "dEQP-GLES3.functional.shaders.preprocessor.unde",
        "fined_identifiers.undefined_identifier_5_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_001009,
        "dEQP-GLES3.functional.shaders.preprocessor.undef",
        "ined_identifiers.undefined_identifier_5_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_001010,
        "dEQP-GLES3.functional.shaders.preprocessor.unde",
        "fined_identifiers.undefined_identifier_6_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_001011,
        "dEQP-GLES3.functional.shaders.preprocessor.undef",
        "ined_identifiers.undefined_identifier_6_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_001012,
        "dEQP-GLES3.functional.shaders.preprocessor.unde",
        "fined_identifiers.undefined_identifier_7_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_001013,
        "dEQP-GLES3.functional.shaders.preprocessor.undef",
        "ined_identifiers.undefined_identifier_7_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_001014,
        "dEQP-GLES3.functional.shaders.preprocessor.unde",
        "fined_identifiers.undefined_identifier_8_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_001015,
        "dEQP-GLES3.functional.shaders.preprocessor.undef",
        "ined_identifiers.undefined_identifier_8_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_001016,
        "dEQP-GLES3.functional.shaders.preprocessor.unde",
        "fined_identifiers.undefined_identifier_9_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_001017,
        "dEQP-GLES3.functional.shaders.preprocessor.undef",
        "ined_identifiers.undefined_identifier_9_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_001018,
        "dEQP-GLES3.functional.shaders.preprocessor.unde",
        "fined_identifiers.undefined_identifier_10_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_001019,
        "dEQP-GLES3.functional.shaders.preprocessor.undef",
        "ined_identifiers.undefined_identifier_10_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_001020,
        "dEQP-GLES3.functional.shaders.preprocessor.unde",
        "fined_identifiers.undefined_identifier_11_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_001021,
        "dEQP-GLES3.functional.shaders.preprocessor.undef",
        "ined_identifiers.undefined_identifier_11_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_001022,
        "dEQP-GLES3.functional.shaders.preprocessor.unde",
        "fined_identifiers.undefined_identifier_12_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_001023,
        "dEQP-GLES3.functional.shaders.preprocessor.undef",
        "ined_identifiers.undefined_identifier_12_fragment");
