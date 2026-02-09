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
#include "../Deqpgles31BaseFunc.h"
#include "../ActsDeqpgles310012TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011081,
        "dEQP-GLES31.functional.ubo.2_level_stru",
        "ct_array.per_block_buffer.shared_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011082,
        "dEQP-GLES31.functional.ubo.2_level_struc",
        "t_array.per_block_buffer.shared_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011083,
        "dEQP-GLES31.functional.ubo.2_level_str",
        "uct_array.per_block_buffer.shared_both");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011084,
        "dEQP-GLES31.functional.ubo.2_level_struct_arra",
        "y.per_block_buffer.shared_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011085,
        "dEQP-GLES31.functional.ubo.2_level_struct_array",
        ".per_block_buffer.shared_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011086,
        "dEQP-GLES31.functional.ubo.2_level_struct_arr",
        "ay.per_block_buffer.shared_instance_array_both");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011087,
        "dEQP-GLES31.functional.ubo.2_level_stru",
        "ct_array.per_block_buffer.packed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011088,
        "dEQP-GLES31.functional.ubo.2_level_struc",
        "t_array.per_block_buffer.packed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011089,
        "dEQP-GLES31.functional.ubo.2_level_struct_arra",
        "y.per_block_buffer.packed_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011090,
        "dEQP-GLES31.functional.ubo.2_level_struct_array",
        ".per_block_buffer.packed_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011091,
        "dEQP-GLES31.functional.ubo.2_level_stru",
        "ct_array.per_block_buffer.std140_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011092,
        "dEQP-GLES31.functional.ubo.2_level_struc",
        "t_array.per_block_buffer.std140_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011093,
        "dEQP-GLES31.functional.ubo.2_level_str",
        "uct_array.per_block_buffer.std140_both");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011094,
        "dEQP-GLES31.functional.ubo.2_level_struct_arra",
        "y.per_block_buffer.std140_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011095,
        "dEQP-GLES31.functional.ubo.2_level_struct_array",
        ".per_block_buffer.std140_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011096,
        "dEQP-GLES31.functional.ubo.2_level_struct_arr",
        "ay.per_block_buffer.std140_instance_array_both");
