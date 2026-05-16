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

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035872,
        "dEQP-GLES3.functional.ubo.multi_nested",
        "_struct.per_block_buffer.shared_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035873,
        "dEQP-GLES3.functional.ubo.multi_nested_",
        "struct.per_block_buffer.shared_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035874,
        "dEQP-GLES3.functional.ubo.multi_neste",
        "d_struct.per_block_buffer.shared_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035875,
        "dEQP-GLES3.functional.ubo.multi_neste",
        "d_struct.per_block_buffer.shared_mixed");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035876,
        "dEQP-GLES3.functional.ubo.multi_nested_struct",
        ".per_block_buffer.shared_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035877,
        "dEQP-GLES3.functional.ubo.multi_nested_struct.",
        "per_block_buffer.shared_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035878,
        "dEQP-GLES3.functional.ubo.multi_nested_struc",
        "t.per_block_buffer.shared_instance_array_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035879,
        "dEQP-GLES3.functional.ubo.multi_nested_struct",
        ".per_block_buffer.shared_instance_array_mixed");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035880,
        "dEQP-GLES3.functional.ubo.multi_nested",
        "_struct.per_block_buffer.packed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035881,
        "dEQP-GLES3.functional.ubo.multi_nested_",
        "struct.per_block_buffer.packed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035882,
        "dEQP-GLES3.functional.ubo.multi_neste",
        "d_struct.per_block_buffer.packed_mixed");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035883,
        "dEQP-GLES3.functional.ubo.multi_nested_struct",
        ".per_block_buffer.packed_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035884,
        "dEQP-GLES3.functional.ubo.multi_nested_struct.",
        "per_block_buffer.packed_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035885,
        "dEQP-GLES3.functional.ubo.multi_nested_struct",
        ".per_block_buffer.packed_instance_array_mixed");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035886,
        "dEQP-GLES3.functional.ubo.multi_nested",
        "_struct.per_block_buffer.std140_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035887,
        "dEQP-GLES3.functional.ubo.multi_nested_",
        "struct.per_block_buffer.std140_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035888,
        "dEQP-GLES3.functional.ubo.multi_neste",
        "d_struct.per_block_buffer.std140_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035889,
        "dEQP-GLES3.functional.ubo.multi_neste",
        "d_struct.per_block_buffer.std140_mixed");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035890,
        "dEQP-GLES3.functional.ubo.multi_nested_struct",
        ".per_block_buffer.std140_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035891,
        "dEQP-GLES3.functional.ubo.multi_nested_struct.",
        "per_block_buffer.std140_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035892,
        "dEQP-GLES3.functional.ubo.multi_nested_struc",
        "t.per_block_buffer.std140_instance_array_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035893,
        "dEQP-GLES3.functional.ubo.multi_nested_struct",
        ".per_block_buffer.std140_instance_array_mixed");
