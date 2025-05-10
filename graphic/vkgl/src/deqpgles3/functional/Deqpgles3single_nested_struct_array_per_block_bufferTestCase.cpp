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

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035460,
        "dEQP-GLES3.functional.ubo.single_nested_s",
        "truct_array.per_block_buffer.shared_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035461,
        "dEQP-GLES3.functional.ubo.single_nested_st",
        "ruct_array.per_block_buffer.shared_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035462,
        "dEQP-GLES3.functional.ubo.single_nested_",
        "struct_array.per_block_buffer.shared_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035463,
        "dEQP-GLES3.functional.ubo.single_nested_struct_ar",
        "ray.per_block_buffer.shared_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035464,
        "dEQP-GLES3.functional.ubo.single_nested_struct_arr",
        "ay.per_block_buffer.shared_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035465,
        "dEQP-GLES3.functional.ubo.single_nested_struct_a",
        "rray.per_block_buffer.shared_instance_array_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035466,
        "dEQP-GLES3.functional.ubo.single_nested_s",
        "truct_array.per_block_buffer.packed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035467,
        "dEQP-GLES3.functional.ubo.single_nested_st",
        "ruct_array.per_block_buffer.packed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035468,
        "dEQP-GLES3.functional.ubo.single_nested_struct_ar",
        "ray.per_block_buffer.packed_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035469,
        "dEQP-GLES3.functional.ubo.single_nested_struct_arr",
        "ay.per_block_buffer.packed_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035470,
        "dEQP-GLES3.functional.ubo.single_nested_s",
        "truct_array.per_block_buffer.std140_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035471,
        "dEQP-GLES3.functional.ubo.single_nested_st",
        "ruct_array.per_block_buffer.std140_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035472,
        "dEQP-GLES3.functional.ubo.single_nested_",
        "struct_array.per_block_buffer.std140_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035473,
        "dEQP-GLES3.functional.ubo.single_nested_struct_ar",
        "ray.per_block_buffer.std140_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035474,
        "dEQP-GLES3.functional.ubo.single_nested_struct_arr",
        "ay.per_block_buffer.std140_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035475,
        "dEQP-GLES3.functional.ubo.single_nested_struct_a",
        "rray.per_block_buffer.std140_instance_array_both");
