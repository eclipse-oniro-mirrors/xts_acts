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
#include "../Khrgles3BaseFunc.h"
#include "../ActsKhrgles30002TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001995,
        "KHR-GLES3.shaders.uniform_block.single_ne",
        "sted_struct_array.per_block_buffer_shared");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001996,
        "KHR-GLES3.shaders.uniform_block.single_nested_st",
        "ruct_array.per_block_buffer_shared_instance_array");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001997,
        "KHR-GLES3.shaders.uniform_block.single_ne",
        "sted_struct_array.per_block_buffer_packed");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001998,
        "KHR-GLES3.shaders.uniform_block.single_nested_st",
        "ruct_array.per_block_buffer_packed_instance_array");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001999,
        "KHR-GLES3.shaders.uniform_block.single_ne",
        "sted_struct_array.per_block_buffer_std140");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_002000,
        "KHR-GLES3.shaders.uniform_block.single_nested_st",
        "ruct_array.per_block_buffer_std140_instance_array");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_002001,
        "KHR-GLES3.shaders.uniform_block.single_nested_s",
        "truct_array.single_buffer_shared_instance_array");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_002002,
        "KHR-GLES3.shaders.uniform_block.single_nested_s",
        "truct_array.single_buffer_packed_instance_array");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_002003,
        "KHR-GLES3.shaders.uniform_block.single_nested_s",
        "truct_array.single_buffer_std140_instance_array");
