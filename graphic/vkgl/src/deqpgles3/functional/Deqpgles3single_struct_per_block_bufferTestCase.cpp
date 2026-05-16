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

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035196,
        "dEQP-GLES3.functional.ubo.single_st",
        "ruct.per_block_buffer.shared_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035197,
        "dEQP-GLES3.functional.ubo.single_str",
        "uct.per_block_buffer.shared_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035198,
        "dEQP-GLES3.functional.ubo.single_s",
        "truct.per_block_buffer.shared_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035199,
        "dEQP-GLES3.functional.ubo.single_struct.pe",
        "r_block_buffer.shared_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035200,
        "dEQP-GLES3.functional.ubo.single_struct.per",
        "_block_buffer.shared_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035201,
        "dEQP-GLES3.functional.ubo.single_struct.p",
        "er_block_buffer.shared_instance_array_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035202,
        "dEQP-GLES3.functional.ubo.single_st",
        "ruct.per_block_buffer.packed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035203,
        "dEQP-GLES3.functional.ubo.single_str",
        "uct.per_block_buffer.packed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035204,
        "dEQP-GLES3.functional.ubo.single_struct.pe",
        "r_block_buffer.packed_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035205,
        "dEQP-GLES3.functional.ubo.single_struct.per",
        "_block_buffer.packed_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035206,
        "dEQP-GLES3.functional.ubo.single_st",
        "ruct.per_block_buffer.std140_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035207,
        "dEQP-GLES3.functional.ubo.single_str",
        "uct.per_block_buffer.std140_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035208,
        "dEQP-GLES3.functional.ubo.single_s",
        "truct.per_block_buffer.std140_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035209,
        "dEQP-GLES3.functional.ubo.single_struct.pe",
        "r_block_buffer.std140_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035210,
        "dEQP-GLES3.functional.ubo.single_struct.per",
        "_block_buffer.std140_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035211,
        "dEQP-GLES3.functional.ubo.single_struct.p",
        "er_block_buffer.std140_instance_array_both");
