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
#include "../Gl44masterBaseFunc.h"
#include "../ActsGl44master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_003236,
    "KHR-GL44.shaders.uniform_block.single_nested_struct_array.per_block_buffer_shared");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_003237,
    "KHR-GL44.shaders.uniform_block.single_nested_struct_array.per_block_buffer_shared_instance_array");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_003238,
    "KHR-GL44.shaders.uniform_block.single_nested_struct_array.per_block_buffer_packed");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_003239,
    "KHR-GL44.shaders.uniform_block.single_nested_struct_array.per_block_buffer_packed_instance_array");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_003240,
    "KHR-GL44.shaders.uniform_block.single_nested_struct_array.per_block_buffer_std140");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_003241,
    "KHR-GL44.shaders.uniform_block.single_nested_struct_array.per_block_buffer_std140_instance_array");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_003242,
    "KHR-GL44.shaders.uniform_block.single_nested_struct_array.single_buffer_shared_instance_array");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_003243,
    "KHR-GL44.shaders.uniform_block.single_nested_struct_array.single_buffer_packed_instance_array");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_003244,
    "KHR-GL44.shaders.uniform_block.single_nested_struct_array.single_buffer_std140_instance_array");
