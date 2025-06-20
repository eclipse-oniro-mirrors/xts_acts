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

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003227,
    "KHR-GL42.shaders.uniform_block.single_nested_struct.per_block_buffer_shared");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003228,
    "KHR-GL42.shaders.uniform_block.single_nested_struct.per_block_buffer_shared_instance_array");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003229,
    "KHR-GL42.shaders.uniform_block.single_nested_struct.per_block_buffer_packed");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003230,
    "KHR-GL42.shaders.uniform_block.single_nested_struct.per_block_buffer_packed_instance_array");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003231,
    "KHR-GL42.shaders.uniform_block.single_nested_struct.per_block_buffer_std140");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003232,
    "KHR-GL42.shaders.uniform_block.single_nested_struct.per_block_buffer_std140_instance_array");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003233,
    "KHR-GL42.shaders.uniform_block.single_nested_struct.single_buffer_shared_instance_array");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003234,
    "KHR-GL42.shaders.uniform_block.single_nested_struct.single_buffer_packed_instance_array");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003235,
    "KHR-GL42.shaders.uniform_block.single_nested_struct.single_buffer_std140_instance_array");
