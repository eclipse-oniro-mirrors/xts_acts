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
#include "../ActsDeqpgles30042TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041872,
        "dEQP-GLES3.functional.shader_api.s",
        "hader_source.replace_source_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041873,
        "dEQP-GLES3.functional.shader_api.sh",
        "ader_source.replace_source_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041874,
        "dEQP-GLES3.functional.shader_api.shader_so",
        "urce.split_source_2_null_terminated_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041875,
        "dEQP-GLES3.functional.shader_api.shader_sou",
        "rce.split_source_2_null_terminated_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041876,
        "dEQP-GLES3.functional.shader_api.shader_so",
        "urce.split_source_4_null_terminated_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041877,
        "dEQP-GLES3.functional.shader_api.shader_sou",
        "rce.split_source_4_null_terminated_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041878,
        "dEQP-GLES3.functional.shader_api.shader_so",
        "urce.split_source_8_null_terminated_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041879,
        "dEQP-GLES3.functional.shader_api.shader_sou",
        "rce.split_source_8_null_terminated_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041880,
        "dEQP-GLES3.functional.shader_api.shader_so",
        "urce.split_source_2_specify_lengths_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041881,
        "dEQP-GLES3.functional.shader_api.shader_sou",
        "rce.split_source_2_specify_lengths_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041882,
        "dEQP-GLES3.functional.shader_api.shader_so",
        "urce.split_source_4_specify_lengths_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041883,
        "dEQP-GLES3.functional.shader_api.shader_sou",
        "rce.split_source_4_specify_lengths_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041884,
        "dEQP-GLES3.functional.shader_api.shader_so",
        "urce.split_source_8_specify_lengths_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041885,
        "dEQP-GLES3.functional.shader_api.shader_sou",
        "rce.split_source_8_specify_lengths_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041886,
        "dEQP-GLES3.functional.shader_api.shader_sourc",
        "e.split_source_2_random_negative_length_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041887,
        "dEQP-GLES3.functional.shader_api.shader_source",
        ".split_source_2_random_negative_length_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041888,
        "dEQP-GLES3.functional.shader_api.shader_sourc",
        "e.split_source_4_random_negative_length_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041889,
        "dEQP-GLES3.functional.shader_api.shader_source",
        ".split_source_4_random_negative_length_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041890,
        "dEQP-GLES3.functional.shader_api.shader_sourc",
        "e.split_source_8_random_negative_length_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041891,
        "dEQP-GLES3.functional.shader_api.shader_source",
        ".split_source_8_random_negative_length_fragment");
