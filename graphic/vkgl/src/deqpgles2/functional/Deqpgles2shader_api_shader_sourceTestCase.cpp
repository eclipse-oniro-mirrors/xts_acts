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
#include "../ActsDeqpgles20014TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013596,
        "dEQP-GLES2.functional.shader_api.s",
        "hader_source.replace_source_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013597,
        "dEQP-GLES2.functional.shader_api.sh",
        "ader_source.replace_source_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013598,
        "dEQP-GLES2.functional.shader_api.shader_so",
        "urce.split_source_2_null_terminated_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013599,
        "dEQP-GLES2.functional.shader_api.shader_sou",
        "rce.split_source_2_null_terminated_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013600,
        "dEQP-GLES2.functional.shader_api.shader_so",
        "urce.split_source_4_null_terminated_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013601,
        "dEQP-GLES2.functional.shader_api.shader_sou",
        "rce.split_source_4_null_terminated_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013602,
        "dEQP-GLES2.functional.shader_api.shader_so",
        "urce.split_source_8_null_terminated_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013603,
        "dEQP-GLES2.functional.shader_api.shader_sou",
        "rce.split_source_8_null_terminated_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013604,
        "dEQP-GLES2.functional.shader_api.shader_so",
        "urce.split_source_2_specify_lengths_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013605,
        "dEQP-GLES2.functional.shader_api.shader_sou",
        "rce.split_source_2_specify_lengths_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013606,
        "dEQP-GLES2.functional.shader_api.shader_so",
        "urce.split_source_4_specify_lengths_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013607,
        "dEQP-GLES2.functional.shader_api.shader_sou",
        "rce.split_source_4_specify_lengths_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013608,
        "dEQP-GLES2.functional.shader_api.shader_so",
        "urce.split_source_8_specify_lengths_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013609,
        "dEQP-GLES2.functional.shader_api.shader_sou",
        "rce.split_source_8_specify_lengths_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013610,
        "dEQP-GLES2.functional.shader_api.shader_sourc",
        "e.split_source_2_random_negative_length_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013611,
        "dEQP-GLES2.functional.shader_api.shader_source",
        ".split_source_2_random_negative_length_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013612,
        "dEQP-GLES2.functional.shader_api.shader_sourc",
        "e.split_source_4_random_negative_length_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013613,
        "dEQP-GLES2.functional.shader_api.shader_source",
        ".split_source_4_random_negative_length_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013614,
        "dEQP-GLES2.functional.shader_api.shader_sourc",
        "e.split_source_8_random_negative_length_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013615,
        "dEQP-GLES2.functional.shader_api.shader_source",
        ".split_source_8_random_negative_length_fragment");
