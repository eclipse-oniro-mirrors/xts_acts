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
#include "../Gl42masterBaseFunc.h"
#include "../ActsGl42master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003218,
    "KHR-GL42.shaders.uniform_block.single_struct_array.per_block_buffer_shared");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003219,
    "KHR-GL42.shaders.uniform_block.single_struct_array.per_block_buffer_shared_instance_array");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003220,
    "KHR-GL42.shaders.uniform_block.single_struct_array.per_block_buffer_packed");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003221,
    "KHR-GL42.shaders.uniform_block.single_struct_array.per_block_buffer_packed_instance_array");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003222,
    "KHR-GL42.shaders.uniform_block.single_struct_array.per_block_buffer_std140");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003223,
    "KHR-GL42.shaders.uniform_block.single_struct_array.per_block_buffer_std140_instance_array");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003224,
    "KHR-GL42.shaders.uniform_block.single_struct_array.single_buffer_shared_instance_array");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003225,
    "KHR-GL42.shaders.uniform_block.single_struct_array.single_buffer_packed_instance_array");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003226,
    "KHR-GL42.shaders.uniform_block.single_struct_array.single_buffer_std140_instance_array");
