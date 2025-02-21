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

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035220,
        "dEQP-GLES3.functional.ubo.single_struc",
        "t_array.per_block_buffer.shared_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035221,
        "dEQP-GLES3.functional.ubo.single_struct",
        "_array.per_block_buffer.shared_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035222,
        "dEQP-GLES3.functional.ubo.single_stru",
        "ct_array.per_block_buffer.shared_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035223,
        "dEQP-GLES3.functional.ubo.single_struct_array",
        ".per_block_buffer.shared_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035224,
        "dEQP-GLES3.functional.ubo.single_struct_array.",
        "per_block_buffer.shared_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035225,
        "dEQP-GLES3.functional.ubo.single_struct_arra",
        "y.per_block_buffer.shared_instance_array_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035226,
        "dEQP-GLES3.functional.ubo.single_struc",
        "t_array.per_block_buffer.packed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035227,
        "dEQP-GLES3.functional.ubo.single_struct",
        "_array.per_block_buffer.packed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035228,
        "dEQP-GLES3.functional.ubo.single_struct_array",
        ".per_block_buffer.packed_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035229,
        "dEQP-GLES3.functional.ubo.single_struct_array.",
        "per_block_buffer.packed_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035230,
        "dEQP-GLES3.functional.ubo.single_struc",
        "t_array.per_block_buffer.std140_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035231,
        "dEQP-GLES3.functional.ubo.single_struct",
        "_array.per_block_buffer.std140_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035232,
        "dEQP-GLES3.functional.ubo.single_stru",
        "ct_array.per_block_buffer.std140_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035233,
        "dEQP-GLES3.functional.ubo.single_struct_array",
        ".per_block_buffer.std140_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035234,
        "dEQP-GLES3.functional.ubo.single_struct_array.",
        "per_block_buffer.std140_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035235,
        "dEQP-GLES3.functional.ubo.single_struct_arra",
        "y.per_block_buffer.std140_instance_array_both");
