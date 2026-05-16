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
#include "../ActsDeqpgles30036TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035244,
        "dEQP-GLES3.functional.ubo.single_neste",
        "d_struct.per_block_buffer.shared_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035245,
        "dEQP-GLES3.functional.ubo.single_nested",
        "_struct.per_block_buffer.shared_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035246,
        "dEQP-GLES3.functional.ubo.single_nest",
        "ed_struct.per_block_buffer.shared_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035247,
        "dEQP-GLES3.functional.ubo.single_nested_struct",
        ".per_block_buffer.shared_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035248,
        "dEQP-GLES3.functional.ubo.single_nested_struct.",
        "per_block_buffer.shared_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035249,
        "dEQP-GLES3.functional.ubo.single_nested_struc",
        "t.per_block_buffer.shared_instance_array_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035250,
        "dEQP-GLES3.functional.ubo.single_neste",
        "d_struct.per_block_buffer.packed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035251,
        "dEQP-GLES3.functional.ubo.single_nested",
        "_struct.per_block_buffer.packed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035252,
        "dEQP-GLES3.functional.ubo.single_nested_struct",
        ".per_block_buffer.packed_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035253,
        "dEQP-GLES3.functional.ubo.single_nested_struct.",
        "per_block_buffer.packed_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035254,
        "dEQP-GLES3.functional.ubo.single_neste",
        "d_struct.per_block_buffer.std140_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035255,
        "dEQP-GLES3.functional.ubo.single_nested",
        "_struct.per_block_buffer.std140_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035256,
        "dEQP-GLES3.functional.ubo.single_nest",
        "ed_struct.per_block_buffer.std140_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035257,
        "dEQP-GLES3.functional.ubo.single_nested_struct",
        ".per_block_buffer.std140_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035258,
        "dEQP-GLES3.functional.ubo.single_nested_struct.",
        "per_block_buffer.std140_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035259,
        "dEQP-GLES3.functional.ubo.single_nested_struc",
        "t.per_block_buffer.std140_instance_array_both");
